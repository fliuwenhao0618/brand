package edu.zzuli.brand.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.NumberUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.zzuli.brand.pojo.po.Category;
import edu.zzuli.brand.service.CategoryService;

/**
 * 分类controller
 * @author 赵一航
 *
 */

@Controller
public class CategoryController {
	
	@Resource
	private CategoryService categoryService;
	
	
	@RequestMapping(value="/sortClass.action")
	public String  sortClass(String info,Model model,HttpServletRequest request){
		
		/*
		 1.封装提供的表单
		    如果表单为空，则刷新原页面
		    如果表单不为空，
		    进入CategoryService调用mapper接口方法进行查询
		 2.查询完毕之后返回一个list<Category>
		 	跳转本页面刷新下面的分类
		 */
		//1.封装表单，model默认封装
		
		if(info == null || info.trim().isEmpty()){
			
			return "brand_Sort.jsp";
		}
		
		
		
		Category category = new Category();
		category.setCname(info);
		
		if(isNumeric(info)){
			category.setCnumber(Integer.valueOf(info).intValue());
		}else
			category.setCnumber(0);
		
		//调用方法查询
		Category categoryList = (Category) categoryService.sortClass(category);
		
		
		model.addAttribute("categoryList", categoryList);
		
		return "brand_Sort.jsp";
	}
	@RequestMapping(value="/sort.action")
	public String  sort(String info,Model model,HttpServletRequest request){
	
		/*
		 * 得到所有的信息
		 */
		List<Category> listCategory = categoryService.findAll();
		
//		for (Category category : listCategory) {
//			System.out.println(category.toString());
//		}
		
		model.addAttribute("listCategory", listCategory);
		
		return "brand_Sort.jsp";
	}
	
	/**
	 * 
	* @Title: isNumeric 
	* @Description: TODO(判断字符是否可以转化成数字) 
	* @param str
	* @return    设定文件 
	* @return boolean    返回类型 
	* @throws
	 */
	public static boolean isNumeric(String str){
		  for (int i = str.length();--i>=0;){   
		   if (!Character.isDigit(str.charAt(i))){
		    return false;
		   }
		  }
		  return true;
		 }
}
