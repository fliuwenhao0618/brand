package edu.zzuli.brand.service;

import java.util.List;


import edu.zzuli.brand.pojo.po.Items;

import edu.zzuli.brand.pojo.vo.ItemsVo;

public interface ItemsService {

	boolean insert(Items item)throws Exception;

	List<Items> selectItems()throws Exception;

	int updateStatus(Items record)throws Exception;

	int deleteByIid(String iid)throws Exception;

	int findItemsCount(ItemsVo itemsVo);

	List<Items> findByPage(ItemsVo itemsVo);

}
