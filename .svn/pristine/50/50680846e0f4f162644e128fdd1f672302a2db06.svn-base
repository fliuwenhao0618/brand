package edu.zzuli.brand.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.zzuli.brand.pojo.po.Admin;
import edu.zzuli.brand.pojo.po.User;
import edu.zzuli.brand.service.CategoryService;
import edu.zzuli.brand.service.UserService;
import edu.zzuli.brand.service.impl.AdminException;
import edu.zzuli.brand.service.impl.UserException;


/**
 * 用户controller
 * 赵一航
 *
 */
@Controller
public class UserController {
	
	@Resource
	private UserService userService;
	@Resource
	private CategoryService categoryService;
	
	
	
	/**
	 * 
	* @Title: register 
	* @Description: TODO(注册方法) 
	* @param request
	* @param model
	* @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	@RequestMapping(value="/register.action")
	public String register(HttpServletRequest request,HttpSession session,
			String confirm,User user, Model model){
		//1.封装表单
		//2.补全uid
		
		user.setUid(UUID.randomUUID().toString());
		//校验
		Map<String,String> errors  = new HashMap<String,String>();
		//检验用户名
		String username = user.getUsername();
		
		if(username==null || username.trim().isEmpty()){
			errors.put("username","用户名不能为空！");
		}
		
		//校验密码
		String password = user.getPassword();
		if(password==null || password.trim().isEmpty()){
			errors.put("password", "密码不能为空！");
		}else if(password.length()<6 || password.length()>16){
			errors.put("password", "密码长度必须为6~16");
		}
		
		//重复密码校验
		if(!confirm.equals(password))
			errors.put("confirm", "请保持一致");
		
		
		//校验邮箱
		String email = user.getEmail();
		if(email == null || email.trim().isEmpty()) {
			errors.put("email", "Email不能为空！");
		} else if(!email.matches("\\w+@\\w+\\.\\w+")) {
			errors.put("email", "Email格式错误！");
		}
		
		/*
		 * 校验验证码是否输入正确
		 */
		  
		//1.得到session域中的
		String session_code = (String)request.getSession().getAttribute("session_vcode");
		
		//2.得到表单信息
		String code = user.getCode();
		if(!code.equalsIgnoreCase(session_code))
			errors.put("code", "验证码不匹配");
		
		/*
		 * 判断是否存在错误信息
		 */
		if(errors.size()>0){
			//保存错误消息
			model.addAttribute("errors", errors);
			
			//保存表单信息
			model.addAttribute("user",user);
			return "register.jsp";
		}
		
		/*
		 * 调用UserService
		 */
		try {
			userService.register(user);
		} catch (UserException e) {
			/*
			 * 1.保存异常信息
			 * 2.保存user表单，进行回显
			 * 3.转发到注册页面从新注册
			 */
			model.addAttribute("message",e.getMessage());
			model.addAttribute("user",user);
			return "register.jsp";
		}
		
		return "login.jsp";
	}
	
	
	/**
	* @Title: loging 
	* @Description: TODO(登录功能) 
	* @param user
	* @param model
	* @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	@RequestMapping(value="login.action")
	public String loging(HttpServletRequest request, User form, Model model){
		
		/*
		 * 1.调用userService完成登录
		 */
		try {
			User user = userService.login(form);
			request.getSession().setAttribute("user_session", user);
		} catch (UserException e) {
			model.addAttribute("user", form);
			model.addAttribute("message", e.getMessage());
			return "login.jsp";
		}
		return "redirect:/toIndex.action";
		
	}
	/**
	 * 用户退出方法
	 * 
	 */
	@RequestMapping(value="logut.action")
	public String logut(HttpSession session){
		session.invalidate();//清楚session
		return "redirect:/toIndex.action";
	}
	

	/**
	 * 回显用户个人信息
	 */
	@RequestMapping(value="finndUserInfo.action")
	public String finndUserInfo(Model model,HttpServletRequest request) throws Exception{
		
		User user=(User) request.getSession().getAttribute("user_session");
		if(null == user){
			return "login.jsp";
		}
		
		User user2 = userService.finndUserInfo(user.getUid());
		
		model.addAttribute("user", user2);
		
		return	"complete_Data.jsp";
	}
	
	
	/*
	 * 管理员登录
	 */
	@RequestMapping(value="/admin/adminLogin.action")
	public String adminLogin(Admin form,Model model,HttpServletRequest request){
		
		
		try {
			Admin admin = userService.adminLogin(form);
			request.getSession().setAttribute("admin_session", admin);
		} catch (AdminException e) {
			model.addAttribute("admin", form);
			model.addAttribute("message", e.getMessage());
			return "bg_login.jsp";
		}
		model.addAttribute("categoryList", categoryService.findAll());
		
		return "/admin/bg_index.jsp";
	}
	
	
	
	
	
	
	
	
	
	/*
	 * 添加管理员
	 */
	
	@RequestMapping(value="/admin/addAdmin.action")
	public String addAdmin(Admin admin,Model model,HttpServletRequest request){

		admin.setAid(UUID.randomUUID().toString());
		
		
		System.out.println(admin.toString());
		
		
		//校验
		Map<String,String> errors  = new HashMap<String,String>();
		//检验用户名
		String username = admin.getUsername();
		
		if(username==null || username.trim().isEmpty()){
			errors.put("username","用户名不能为空！");
		}else if(username.length()<3 || username.length()>16){
			errors.put("username", "用户名长度必须为3~16");
		}
		
		//校验密码
		String password = admin.getPassword();
		if(password==null || password.trim().isEmpty()){
			errors.put("password", "密码不能为空！");
		}else if(password.length()<3 || password.length()>16){
			errors.put("password", "密码长度必须为3~16");
		}
		
		if(errors.size()>0){
			//保存错误消息
			model.addAttribute("errors", errors);
			
			//保存表单信息
			model.addAttribute("admin",admin);
			return "/admin/bg_addadmin.jsp";
		}
		
		
		
		
		
		/* * 调用UserService*/
		 
		try {
			userService.addAdminInfo(admin);
		} catch (AdminException e) {
			
			/* * 1.保存异常信息
			 * 2.保存user表单，进行回显
			 * 3.转发到注册页面从新注册*/
			 
			model.addAttribute("message",e.getMessage());
			model.addAttribute("admin",admin);
			return "/admin/bg_addadmin.jsp";
		}
		
		model.addAttribute("admin",admin);
		return "/admin/bg_success.jsp";
	}
	
	
	
	
	
	/*
	 * 管理员退出
	 * 
	 */
	@RequestMapping(value="/adminQuit.action")
	public String adminQuit(HttpSession session){
		session.invalidate();//清楚session
		return "addPre.action";
	}
	
	
	
	
	@RequestMapping(value="/modify_info.action")
	public String modify_info(User user ,Model model,HttpServletRequest request){
		
		User new_user = (User) request.getSession().getAttribute("user_session");
		
		user.setUsername(new_user.getUsername());
		
		System.out.println(user.toString());
		
		userService.modify_info(user);
		
		model.addAttribute("message", "信息修改成功！");
		
		return "sucess.jsp";
	}
	
	
	@RequestMapping(value="/modify_password.action")
	public String modify_password(String pw1,String pw2,String pw3,Model model,HttpServletRequest request){
		
		User new_user = (User) request.getSession().getAttribute("user_session");
		
		Map<String,String> errors  = new HashMap<String,String>();
		
		String username = new_user.getUsername();
		String password = new_user.getPassword();
		
		if(!password.equals(pw1))
			errors.put("password","密码输入错误");
		
		if(!pw2.equals(pw3))
			errors.put("pw","两次密码不一致");
		
		if(pw2 == null)
			errors.put("pw","密码不能为空");
		
		if(errors.size()>0){
			//保存错误消息
			model.addAttribute("errors", errors);
			
			return "modify_Password.jsp";
		}
		
		User user = new User();
		
		user.setUsername(new_user.getUsername());
		user.setPassword(pw2);
		
		
		
		userService.modify_password(user);
		
		model.addAttribute("message", "密码修改成功！");
		
		return "sucess.jsp";
	}
	
}
