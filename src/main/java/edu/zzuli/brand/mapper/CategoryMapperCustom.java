package edu.zzuli.brand.mapper;

import java.util.List;

import edu.zzuli.brand.pojo.po.Category;

public interface CategoryMapperCustom {
	
	List<Category> selectByCnumberOrCname(String info);//根据商品编号或者商品名称查询商品分类
}
