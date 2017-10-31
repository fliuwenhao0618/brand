package edu.zzuli.brand.service.impl;

import java.util.List;

import javax.annotation.Resource;


import edu.zzuli.brand.mapper.ChcategoryMapperCustom;
import edu.zzuli.brand.pojo.po.Chcategory;
import edu.zzuli.brand.service.ChcategoryService;

public class ChcagegoryServiceImpl implements ChcategoryService{
	@Resource
	private ChcategoryMapperCustom chcategoryMapperCustom;
    
	@Override
	public List<Chcategory> selectByCid(String cid) {
		
		return chcategoryMapperCustom.selectByCid(cid);
	}
	
	
}
