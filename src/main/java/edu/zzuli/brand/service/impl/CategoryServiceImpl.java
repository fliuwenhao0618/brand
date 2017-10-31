package edu.zzuli.brand.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;

import edu.zzuli.brand.mapper.CategoryMapper;
import edu.zzuli.brand.mapper.CategoryMapperCustom;
import edu.zzuli.brand.pojo.po.Category;
import edu.zzuli.brand.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {

	
	@Resource
	private CategoryMapper categoryMapper;
	
	@Resource
	private CategoryMapperCustom categoryMapperCustom;


	/**
	 * 查询
	 */
	public Category sortClass(Category category) {
		
		return categoryMapper.selectByCnumberOrCname(category);
	}


	@Override
	public List<Category> findAll() {
		return categoryMapper.findAll();
	}
	
}
