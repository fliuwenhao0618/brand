package edu.zzuli.brand.controller;



import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;


import java.io.UnsupportedEncodingException;
import java.util.List;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import edu.zzuli.brand.pojo.po.Brand;
import edu.zzuli.brand.pojo.po.Category;
import edu.zzuli.brand.pojo.po.Items;
import edu.zzuli.brand.pojo.vo.BrandVo;
import edu.zzuli.brand.pojo.vo.PageBean;
import edu.zzuli.brand.pojo.po.Brand;
import edu.zzuli.brand.service.BrandService;
import edu.zzuli.brand.service.CategoryService;
import edu.zzuli.brand.service.ItemsService;





/**
 * 商标controller
 * @author 刘文豪，马明旭
 *
 */

@Controller
public class BrandController {

	
	@Resource
	private BrandService brandService;
	@Resource
	private CategoryService categoryService;
	@Resource
	private ItemsService itemsService;
	@Value("${PIC_PATH}")
	private String PIC_PATH;
	
	@RequestMapping("list.action")
    public String list(Model model,HttpServletRequest request) throws Exception{
		
		List<Brand> brandList = brandService.selectByExample(null);
		model.addAttribute("brandList", brandList);
		return "brand_Transfer.jsp";

	}
	
	/**
	 * 转跳到后台index页面
	 * @param request
	 * @param model
	 * @return
	 */

	/**
	 * 分页查询方法
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */

	@RequestMapping("listBypage.action")
	public String listBypage(Model model,HttpServletRequest request) throws Exception{
		
		 //查询列表的总数
		BrandVo brandVo = new BrandVo();
	    int total = brandService.findBrandCount(brandVo);
		int pc = getPc(request);
	    PageBean<Brand> pageQuery = new PageBean<Brand>();
	    
	    pageQuery.setPs(5);
	    pageQuery.setPc(pc);
	    pageQuery.setTr(total);
	    brandVo.setPageBean(pageQuery);
	    List<Brand> pb = brandService.findByPage(brandVo);
	    pageQuery.setBeanList(pb);
    	model.addAttribute("pageQuery", pageQuery);
    	return "brand_Transfer.jsp";
	}

	@RequestMapping("/toIndex.action")
	public String toIndex(HttpServletRequest request, Model model){
		List<Brand> brands=brandService.selectBrands();
		model.addAttribute("brands", brands);
		List<Brand> c1=brandService.selectBrandsByCid("01");//服饰鞋帽
		List<Brand> c2=brandService.selectBrandsByCid("03");//日化用品
		List<Brand> c3=brandService.selectBrandsByCid("09");//电子产品
		List<Brand> c4=brandService.selectBrandsByCid("07");//食品
		List<Brand> c5=brandService.selectBrandsByCid("02");//家居用品
		List<Brand> c6=brandService.selectBrandsByCid("05");//医药用品
		model.addAttribute("c1",c1);
		model.addAttribute("c2",c2);
		model.addAttribute("c3",c3);
		model.addAttribute("c4",c4);
		model.addAttribute("c5",c5);
		model.addAttribute("c6",c6);
		return "/index.jsp";

	}

	
	   /**
	    * 获取当前页码
	    * @param request
	    * @return
	    */
	   public int getPc(HttpServletRequest request){
	    	String value = request.getParameter("pc");
	    	if(value == null || value.trim().isEmpty()){
	    		return 1;
	    	}
	    	return Integer.parseInt(value);
	    }
	   @RequestMapping("query.action")
	    public String query(String bname,Model model,HttpServletRequest request) throws Exception{
			
		   BrandVo brandVo = new BrandVo();
		    int total = brandService.findBrandCount(brandVo);
			int pc = getPc(request);
		    PageBean<Brand> pageQuery = new PageBean<Brand>();
		    
		    pageQuery.setPs(4);
		    pageQuery.setPc(pc);
		    pageQuery.setTr(total);
		    brandVo.setPageBean(pageQuery);
		    List<Brand> pb = brandService.query(bname);
		    pageQuery.setBeanList(pb);
	    	model.addAttribute("pageQuery", pageQuery);
	    	return "brand_Transfer.jsp";

		}
	   @RequestMapping("queryBrand.action")
	    public String queryBrand(String bname,Model model,HttpServletRequest request) throws Exception{
			
		    BrandVo brandVo = new BrandVo();
		    int total = brandService.findBrandCount(brandVo);
			int pc = getPc(request);
		    PageBean<Brand> pageQuery = new PageBean<Brand>();
		    
		    pageQuery.setPs(4);
		    pageQuery.setPc(pc);
		    pageQuery.setTr(total);
		    brandVo.setPageBean(pageQuery);
		    List<Brand> pb = brandService.query(bname);
		    pageQuery.setBeanList(pb);
	    	model.addAttribute("pageQuery", pageQuery);
	    	return "brand_Transfer.jsp";

		}
	   
	   @RequestMapping("queryByremen.action")
	    public String queryByremen(String bname,String cid,String portfolio,String application,
	    	String local,Model model,HttpServletRequest request) throws Exception{

		   String ubname = null;
		   String ucid = null;
		   String uportfolio = null;
		   String uapplication = null;
		   String ulocal = null;
		  if(bname != null && bname.length() != 0){
			  ubname = new String(bname.getBytes("ISO8859-1"),"UTF-8");
		  }else if(cid != null && cid.length() != 0){
			  ucid = new String(cid.getBytes("ISO8859-1"),"UTF-8");
		  }
           else if(portfolio != null && portfolio.length() != 0){
        	   uportfolio = new String(portfolio.getBytes("ISO8859-1"),"UTF-8");
		  }
		  else if(application != null && application.length() != 0){
			  uapplication = new String(application.getBytes("ISO8859-1"),"UTF-8");
			
		  }else if(local != null && local.length() != 0){
			  ulocal = new String(local.getBytes("ISO8859-1"),"UTF-8");
		  }
		  	  
		    BrandVo brandVo = new BrandVo();
		    int total = brandService.findBrandCount(brandVo);
			int pc = getPc(request);
		    PageBean<Brand> pageQuery = new PageBean<Brand>();
		    
		    pageQuery.setPs(4);
		    pageQuery.setPc(pc);
		    pageQuery.setTr(total);
		    brandVo.setPageBean(pageQuery);
		    List<Brand> pb = null;
		    if(bname != null && bname.length() != 0){
		    	pb = brandService.queryByremen(ubname);
		    }
		    if(cid != null && cid.length() != 0){
		    	pb = brandService.queryByremen(ucid);
		    }
		    if(portfolio != null && portfolio.length() != 0){
		    	pb = brandService.queryByremen(uportfolio);
		    }
		    if(application != null && application.length() != 0){
		    	pb = brandService.queryByremen(uapplication);
		    }
		    if(local != null && local.length() != 0){
		    	pb = brandService.queryByremen(ulocal);
		    }
		   
		    pageQuery.setBeanList(pb);
	    	model.addAttribute("pageQuery", pageQuery);
	    	return "brand_Transfer.jsp";

		}
	   
	   @RequestMapping("load.action")
		public String load(Model model,String bid){
			Brand brand = brandService.selectByPrimaryKey(bid);
		    model.addAttribute("brand", brand);
			return "details.jsp";
		}
	   /**
		 *跳转到细节显示页面details.jsp
		 * @param request
		 * @param model
		 * @return
		 */
		@RequestMapping("/toDetails.action")
		public String toDetails(HttpServletRequest request, Model model){
			String bid=request.getParameter("bid");
			Brand brand = brandService.selectBrandByBid(bid);
			model.addAttribute("brand", brand);
			return "/details.jsp";
		}
		
		@RequestMapping("/findByApplication.action")
		public String findByApplication(HttpServletRequest request, Model model) throws UnsupportedEncodingException{
			String application = request.getParameter("application");
			application=new String(application.getBytes("ISO8859-1"),"utf-8");
			System.out.println(application);
			List<Brand> brands = brandService.findByApplication(application);
			
			return null;
		}
	   
		/////////////////////////////////////////////////////////////
	   /////////////////////////////////////////////////////////////////后台方法
	   
		@RequestMapping("addPre.action")
		public String addPre(Model model) {
				
			/*
			 * 查询所有分类，保存到request，转发到add.jsp
			 * add.jsp中把所有的分类使用下拉列表显示在表单中
			 */
			model.addAttribute("categoryList", categoryService.findAll());
			
			return "/admin/bg_index.jsp";
		}
		@RequestMapping("upload.action")
		public String upload( MultipartFile items_pic,Brand brand,Model model,HttpServletRequest request) throws Exception{
			//原始名称
			String originalFilename = items_pic.getOriginalFilename();
		    //上传图片
	        if(items_pic!=null && originalFilename!=null && originalFilename.length()>0){
							
		  //存储图片的物理路径
			//String pic_path = "E:\\develop\\upload\\temp\\";
			 String pic_path = "/develop/upload/temp/";//linux路径下
			
			//新的图片名称
			String newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
			//新图片
			File newFile = new File(pic_path+newFileName);
			
			//将内存中的数据写入磁盘
			items_pic.transferTo(newFile);
			
			//将新图片名称写到itemsCustom中
		    brand.setBid(UUID.randomUUID().toString());
		    brand.setBname(brand.getBname());
		    brand.setCid(brand.getCid());
		    brand.setLocal(brand.getLocal());
		    brand.setPortfolio(brand.getPortfolio());
		    brand.setSimilar(brand.getSimilar());
		    brand.setApplication(brand.getApplication());
		    brand.setStarttime(brand.getStarttime());
		    brand.setEndtime(brand.getEndtime());
		    brand.setPrice(brand.getPrice());
		    brand.setImage(newFileName);
		    
		    brandService.insert(brand);
		}
	        return "showItems.action";
		}
		@RequestMapping("/showItems.action")
		public String showItems(HttpServletRequest request, Model model) throws Exception{
			List<Items> items=itemsService.selectItems();
			model.addAttribute("items", items);
			return "/admin/bg_items.jsp";
		}
		
		
		  @RequestMapping("adminlist.action")
		   public String adminlist(Model model,HttpServletRequest request) throws Exception{
			  //查询列表的总数
				BrandVo brandVo = new BrandVo();
			    int total = brandService.findBrandCount(brandVo);
				int pc = getPc(request);
			    PageBean<Brand> pageQuery = new PageBean<Brand>();
			    
			    pageQuery.setPs(5);
			    pageQuery.setPc(pc);
			    pageQuery.setTr(total);
			    brandVo.setPageBean(pageQuery);
			    List<Brand> pb = brandService.findByPage(brandVo);
			    pageQuery.setBeanList(pb);
		    	model.addAttribute("pageQuery", pageQuery);
		    	return "/admin/bg_select.jsp";
			}
			   
		   @RequestMapping("admindelete.action")
			public String admindelete(String bid,Model model,HttpServletRequest request) throws Exception
					 {
			
				brandService.deleteByPrimaryKey(bid);
				return "adminlist.action";
			}
		   @RequestMapping("preEdit.action")
		   public String preEdit(Model model,String bid)
					throws Exception{
								
				Brand brand = brandService.selectByPrimaryKey(bid);
				model.addAttribute("brand",brand);
				
				return "/admin/bg_change.jsp";
			}
		
		   @RequestMapping("adminEdit.action")
			public String adminEdit(MultipartFile items_pic,Model model,Brand brand,Category category) throws Exception {
				
			 //原始名称
				String originalFilename = items_pic.getOriginalFilename();
			    //上传图片
		        if(items_pic!=null && originalFilename!=null && originalFilename.length()>0){
								
			  //存储图片的物理路径
				//String pic_path = "E:\\develop\\upload\\temp\\";
		        String pic_path = "/develop/upload/temp/";//linux路径下
				
				//新的图片名称
				String newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
				//新图片
				File newFile = new File(pic_path+newFileName);
				
				//将内存中的数据写入磁盘
				items_pic.transferTo(newFile);
				
				//将新图片名称写到itemsCustom中
				 brand.setImage(newFileName);
			  
			    
			}
				//brandvo.setCategory(category);				
				 brandService.updateByPrimaryKey(brand);
				 return "adminlist.action";
   }
			 

	

}
