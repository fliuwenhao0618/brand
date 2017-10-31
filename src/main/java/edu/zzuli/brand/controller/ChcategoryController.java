package edu.zzuli.brand.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.zzuli.brand.pojo.po.Brand;
import edu.zzuli.brand.service.BrandService;
import edu.zzuli.brand.service.ChcategoryService;

/**
 * 分类下的子类
 * @author 刘文豪
 *
 */
@Controller
public class ChcategoryController {
      
	@Resource
	private ChcategoryService chcategoryService;
	
	@RequestMapping("queryChcategory.action")
    public String queryChcategory(String cid,Model model,HttpServletRequest request) throws Exception{
		
		chcategoryService.selectByCid(cid);
		return "index.jsp";

	}
}
