package edu.zzuli.brand.service;




import java.util.List;

import edu.zzuli.brand.pojo.po.Category;


public interface CategoryService {
	
	
	public  Category sortClass(Category category);
	public List<Category> findAll();//查询所有的分类

}
