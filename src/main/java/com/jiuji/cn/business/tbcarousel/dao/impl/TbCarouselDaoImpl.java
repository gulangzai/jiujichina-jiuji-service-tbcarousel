package com.jiuji.cn.business.tbcarousel.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.jiuji.cn.business.tbcarousel.dao.TbCarouselDao;
import com.lanbao.base.PageData;
import com.lanbao.dao.BaseDao;
import com.lanbao.dao.impl.BaseDaoImpl;
import com.lanbao.mybatis.MyBatisBaseDao;
import com.lanbao.mybatis.impl.MyBatisBaseDaoImpl; 

@Component
public class TbCarouselDaoImpl extends  BaseDaoImpl implements TbCarouselDao{

	@Override
	public List<PageData> queryAll() throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) mb_findForList("TbCarouselMapper.queryAll",null);
	}

}
