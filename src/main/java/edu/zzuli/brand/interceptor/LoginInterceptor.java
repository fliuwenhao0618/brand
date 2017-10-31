package edu.zzuli.brand.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import edu.zzuli.brand.pojo.po.User;
/**
 * 拦截器
 * @author 刘文豪
 *
 */
public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//获取请求的url
				String url = request.getRequestURI();
				//判断session
				User user=(User) request.getSession().getAttribute("user_session");
				
			
				//判断url是否是公开 地址（）
				//一般地址配置配置文件中
				//这里对不公开地址是登陆提交的地址
				if(url.indexOf("showFavorites.action")>=0 && null == user ){
					//如果进行收藏夹
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				}
				
			
				
				//执行这里表示用户身份需要认证，跳转登陆页面
				
				
				//return false表示拦截，不向下执行
				//return true表示放行
				return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
