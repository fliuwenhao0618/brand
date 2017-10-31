package edu.zzuli.brand.service.impl;

import javax.annotation.Resource;


import edu.zzuli.brand.mapper.DemandMapper;
import edu.zzuli.brand.pojo.po.Demand;
import edu.zzuli.brand.service.DemandService;

public class DemandServiceImpl implements DemandService {
    
	@Resource
	private DemandMapper demandMapper;
	@Override
	public int insert(Demand record) {
		
		return demandMapper.insert(record);
	}
   
}
