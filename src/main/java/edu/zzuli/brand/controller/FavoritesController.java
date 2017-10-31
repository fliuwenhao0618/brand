package edu.zzuli.brand.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.zzuli.brand.pojo.po.Brand;
import edu.zzuli.brand.pojo.po.Favorites;
import edu.zzuli.brand.pojo.po.User;
import edu.zzuli.brand.pojo.vo.FavoritesVo;
import edu.zzuli.brand.pojo.vo.PageBean;
import edu.zzuli.brand.service.BrandService;
import edu.zzuli.brand.service.FavoritesService;

/**
 * 收藏夹controller
 * @author 马明旭，刘文豪
 *
 */
@Controller
public class FavoritesController {
	
	private static final String FAVORITES_SUCCESS = "收藏成功";

	private static final String LOGIN = "请先登录";
	@Resource
	private FavoritesService favoritesService;
	@Resource
	private BrandService brandService;
	/**
	 * 添加收藏夹
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/insertFavorites")
	public String insertFavorites(String bid,HttpServletRequest request,HttpSession session,Model model) throws Exception{
//		User user=(User) request.getSession().getAttribute("user_session");
//		if(null == user){
//			//return "login.jsp";
//			return LOGIN;
//		}
//		Brand brand=brandService.selectBrandByBid(bid);
//		Favorites favorite = new Favorites();
//		favorite.setFid(bid);
//		favorite.setBname(brand.getBname());
//		favorite.setStatus(brand.getPrice());
//		favorite.setApplication(brand.getApplication());
//		favorite.setImage(brand.getImage());
//		favorite.setCid(brand.getCid());
//		
//		
//		favorite.setUid(user.getUid());
//		int result = favoritesService.insert(favorite);
//		if(0 != result){
//			return FAVORITES_SUCCESS;
//		}
//		return  FAVORITES_SUCCESS;
//		//return "toDetails.action?bid="+bid;
		User user=(User) request.getSession().getAttribute("user_session");
		if(null == user){
			return "login.jsp";
		}
		Brand brand=brandService.selectBrandByBid(bid);
		Favorites favorite = new Favorites();
		favorite.setFid(bid);
		favorite.setBname(brand.getBname());
		favorite.setStatus(brand.getPrice());
		favorite.setApplication(brand.getApplication());
		favorite.setImage(brand.getImage());
		favorite.setCid(brand.getCid());
		favorite.setUid(user.getUid());
		int result = favoritesService.insert(favorite);
		
		return "toDetails.action?bid="+bid;
	}
	/**
	 * 显示收藏夹
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/showFavorites.action")
	public String showFavorites(HttpServletRequest request,Model model) throws Exception{
		User user=(User) request.getSession().getAttribute("user_session");
		List<Favorites> list=favoritesService.findByUid(user.getUid());
		model.addAttribute("list", list);
		return "favorites.jsp";
	}
	@RequestMapping("/pshowFavorites.action")
	public String pshowFavorites(HttpServletRequest request,Model model) throws Exception{
//		User user=(User) request.getSession().getAttribute("user_session");
//		List<Favorites> list=favoritesService.findByUid(user.getUid());
//		model.addAttribute("list", list);
//		return "favorites.jsp";
		 //查询列表的总数
		FavoritesVo favoritesVo = new FavoritesVo();
	    int total = favoritesService.findFavoritesCount(favoritesVo);
		int pc = getPc(request);
	    PageBean<Favorites> pageQuery = new PageBean<Favorites>();
	    
	    pageQuery.setPs(5);
	    pageQuery.setPc(pc);
	    pageQuery.setTr(total);
	    favoritesVo.setPageBean(pageQuery);
	    User user=(User) request.getSession().getAttribute("user_session");
	    favoritesVo.setUser(user.getUid());
		//List<Favorites> list=favoritesService.findByUid(user.getUid());
	    List<Favorites> pb = favoritesService.findByPage(favoritesVo);
	    pageQuery.setBeanList(pb);
    	model.addAttribute("pageQuery", pageQuery);
    	return "favorites.jsp";
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
	
	@RequestMapping("/removeFavorites.action")
	public String removeFavorites(HttpServletRequest request,Model model) throws Exception{
		String fid=request.getParameter("fid");
		int result = favoritesService.removeByFid(fid);
		
		return "showFavorites.action";
	}
}
