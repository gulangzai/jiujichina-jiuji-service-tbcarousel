<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.ccthanking.framework.common.User"%>
<%@ page import="com.ccthanking.framework.common.rest.handle.servlet.RestContext" %>
<%@ page import="com.ccthanking.framework.Constants"%>
<%@ include file="/jsp/framework/common/taglibs.jsp"%> 
<%@ taglib uri="/tld/base.tld" prefix="app"%>
<%
	User user = RestContext.getCurrentUser();
	String user_uid = "";
	String username = "";
	if(user!=null){
		user_uid = user.getIdCard();
		username = user.getName();
	}else{
		response.sendRedirect("/"+Constants.APP_NAME);
		return;
	}
	String PROJECT_UID = request.getParameter("PROJECT_UID");
	String ${tableKey} = request.getParameter("${tableKey}");  
%>

<style>
.page-content {
    background-color: #fff;
    position: relative;
    margin: 0;
    padding:3px 0px 0px 3px;
}
</style>
<!-- Modal -->
<div class="modal-dialog width-60 height-auto">
  <div class="modal-content" >
   <div class="widget-header widget-header-large">
   		<div class="widget-toolbar">
			<a href="#" data-action="close" data-dismiss="modal">
				<i class="ace-icon fa fa-times"></i>
				</a>
		</div>
    	<h3 id="myModalLabel" class="blue bigger">查看${table.desc}</h3>
  </div>
  <div class="modal-body">
      <form id="${table.name}DetailForm">
          <input  type="hidden" name="${tableKey}" operation="=" fieldname="${tableKey}" value="<%=${tableKey}%>"/>    
       <!--   <input  type="hidden" name="PROJECT_UID" operation="=" fieldname="PROJECT_UID" value="<%=PROJECT_UID%>"/>    -->
      </form>
      
 	  <form method="post" role="form" class="form-horizontal"  id="execute_${table.name}Detail" > 
 	      <!-- 获取 项目 的 uid -->    	
      	  <input id="XCROJECT_UID" type="hidden" name="ROJECT_UID" fieldname="PROJECT_UID"  /> 
	  	  <input type="hidden" id="target_uid" fieldname="target_uid"  /> 
				
		   <#if  fields?exists>
		    <#list fields  as field>
		        <#if  field.comment !="" && field.column_key!="PRI">
		       <div class="form-group" >
		  			<label class="col-sm-2 control-label no-padding-right" >
						${field.comment}：<span class="required-indicator">*</span>
					</label>
					<div class="col-sm-10">
					 <input value="" id="${field.name}" datatype="*" nullmsg="请填写${field.comment}"    placeholder="请填写${field.comment}" type="text"  fieldname="${field.name}" class="col-xs-11 col-sm-11"/>
					</div>
			   </div>
			   </#if>
		    </#list>
		  </#if> 
			
		  
            <div class="form-group">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">
				        附件：&nbsp;
				</label> 
				<div class="col-sm-9">
					<span style="margin:4px auto;" class="btn  btn-white btn-default btn-round " onclick="selectFile(this);" file_type="${file_type}" >
						<i class="ace-icon fa fa-cloud-upload bigger-100"></i>
							附件上传
					</span>
						<form class="form-inline"  id="queryForm1" width="100%"
					   role="form" style="border:solid 1px #ddd;height:50px;line-height:50px;vertical-align:middle;"></form>
					<table  role="presentation" class="table table-striped">
						<tbody onlyView="true" showType="width:120px;height:120px;quanxian:true;heightss:160px;heights:40px;del:true;attr:multi;preview:false" class="files showFileTab" data-toggle="modal-gallery" data-target="#modal-gallery"  file_type="${file_type}" fjlb="media"></tbody>
					</table>
				</div>
			</div>
     </form>
     
	</div>

  <div class="modal-footer"> 
       <button id="btnClose${table.name}detail"  class="btn btn-2 btn-sms pull-right  btn-round" data-dismiss="modal" aria-hidden="true">关闭</button>
  </div>
</div>
</div>
<div id="XMZK-XMMC" class="modal"></div>
<#noparse>
<jsp:include page="/jsp/file_upload/fileupload_util.jsp" flush="true" />
<%@ include file="/jsp/framework/common/basic_scripts.jsp"%> 
<script src="${pageContext.request.contextPath }/assets/js/jquery-ui.custom.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/sys_resources/js/common/Form2Json.js"> </script>
<script type="text/javascript"> 
var validform;
var controllernameUrl="${pageContext.request.contextPath}/";
</#noparse>	
 controllernameUrl=controllernameUrl+'${controllerName}';

var scripts =[null];
ace.load_ajax_scripts(scripts, function() { 
	 DatePicker.datepicker(".REPORT_DATE1"); 
     DatePicker.datepicker(".REPORT_DATE2");   
}); 


//点击保存按钮
$(function() {	 
	   setFormValues(); 
});

function setFormValues(){
	var data = combineQuery.getQueryCombineData(${table.name}DetailForm,null,null);
	var data1={msg:data};
	$.ajax({
		url : controllernameUrl+"?query",
		data : data1,
		cache : false,
		async :	false,
		dataType : "json",  
		type : 'post',
		success : function(response) {
			var resultobj = defaultJson.dealResultJson(response.msg); 
			$("#execute_${table.name}Detail").setFormValues(resultobj);
			queryFileData('${table.name}',resultobj.${table.name}); 
		}
	});
}

function selectFile(obj){
	var targetUid = $('#target_uid').val();
	var file_type = $(obj).attr('file_type');
	setFileData("${table.name}","${tableKey}",targetUid,file_type);
    document.getElementById("fileupload_btn").click();	 
}
function _reload(){
	jQuery("#grid_table").jqGrid().trigger("reloadGrid");
}
</script>