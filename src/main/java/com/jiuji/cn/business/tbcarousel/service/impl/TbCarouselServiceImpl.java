package com.jiuji.cn.business.tbcarousel.service.impl;

import java.util.Date;
import java.util.List; 
import javax.annotation.Resource; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service; 
import com.jiuji.cn.business.tbcarousel.dao.TbCarouselDao;
import com.jiuji.cn.business.tbcarousel.service.TbCarouselService;  
import com.jiuji.cn.business.tbcarousel.vo.TbCarousel;

import com.lanbao.base.Page;
import com.lanbao.base.PageData;
 

@Service("tbCarouselService")
public class TbCarouselServiceImpl implements TbCarouselService {

	@Autowired
	public TbCarouselDao tbCarouselDao;
	
	/*
	* save
	*/
	public int save(PageData pd)throws Exception{
	 //  tbCarouselDao.save("TbCarouselMapper.save", pd); 
	    Integer F_Carousel_UID = (Integer) pd.get("F_Carousel_UID"); 
		return F_Carousel_UID;
	}
	
	/*
	* delete
	*/
	public void delete(PageData pd)throws Exception{
		//tbCarouselDao.mb_delete("TbCarouselMapper.delete", pd);
	}
	
	/*
	*edit
	*/
	public void edit(PageData pd)throws Exception{
		//tbCarouselDao.mb_update("TbCarouselMapper.edit", pd);
	}
	
	/*
	*list
	*/
	public List<PageData> list(Page page)throws Exception{ 
		return  (List<PageData>)tbCarouselDao.mb_findForList("TbCarouselMapper.datalistPage", page);
	}
	
	public int datalistPageCount(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)tbCarouselDao.mb_findForObject("TbCarouselMapper.datalistPageCount", page); 
	} 
	
	/*
	*listAll
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return null; //(List<PageData>)tbCarouselDao.mb_findForList("TbCarouselMapper.listAll", pd);
	}
	
	/*
	*findById
	*/
	public PageData findById(PageData pd)throws Exception{
		return null; //(PageData)tbCarouselDao.mb_findForObject("TbCarouselMapper.findById", pd);
	}
	
	/*
	*deleteAll
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		//tbCarouselDao.mb_delete("TbCarouselMapper.deleteAll", ArrayDATA_IDS);
	}

	public List<PageData> findByClassId(Page page) throws Exception {
		// TODO Auto-generated method stub
		return null;//(List<PageData>)tbCarouselDao.mb_findForList("TbCarouselMapper.findByClassId", page);
	}

	public List<PageData> findNewHot(Page page) throws Exception {
		// TODO Auto-generated method stub
		return null;//(List<PageData>)tbCarouselDao.mb_findForList("TbCarouselMapper.findNewHot", page);
	}

	@Override
	public List<PageData> queryAll() throws Exception {
		// TODO Auto-generated method stub
		return tbCarouselDao.queryAll();
	}

	
}

