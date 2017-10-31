package edu.zzuli.brand.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
* @ClassName: VerifyCodeController 
* @Description: TODO(生成图片) 
* @author 赵一航
* @date 2017年10月15日 下午4:01:09 
*
 */
@Controller
public class VerifyCodeController {
	
	@RequestMapping(value="/image.action")
	public void image(HttpServletRequest request,HttpServletResponse response,Model model) throws IOException{
		VerifyCode vc = new VerifyCode();
		BufferedImage image = vc.getImage();
		System.out.println(vc.getText()+"0000000000000000000000000000000000000000");
		request.getSession().setAttribute("session_vcode", vc.getText());
		VerifyCode.output(image, response.getOutputStream());
	}

}
