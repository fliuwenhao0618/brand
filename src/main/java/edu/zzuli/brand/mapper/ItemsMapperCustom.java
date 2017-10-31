package edu.zzuli.brand.mapper;

import java.util.List;

import edu.zzuli.brand.pojo.po.Items;
import edu.zzuli.brand.pojo.vo.ItemsVo;

public interface ItemsMapperCustom {

	int udpateStatus(Items record)throws Exception;

	public int findItemsCount(ItemsVo itemsVo);

	public List<Items> findByPage(ItemsVo itemsVo) ;

}
