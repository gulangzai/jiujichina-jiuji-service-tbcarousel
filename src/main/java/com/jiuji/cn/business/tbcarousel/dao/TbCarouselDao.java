package com.jiuji.cn.business.tbcarousel.dao;
 

import java.util.List;

import com.lanbao.base.Page;
import com.lanbao.base.PageData;
import com.lanbao.dao.BaseDao;
import com.lanbao.mybatis.MyBatisBaseDao;

public interface TbCarouselDao extends  BaseDao{

	List<PageData> queryAll() throws Exception;

	

}