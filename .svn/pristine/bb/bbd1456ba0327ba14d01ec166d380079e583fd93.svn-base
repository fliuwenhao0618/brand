package edu.zzuli.brand.service;

import org.springframework.stereotype.Service;

import edu.zzuli.brand.mapper.UserMapper;
import edu.zzuli.brand.pojo.po.Admin;
import edu.zzuli.brand.pojo.po.User;
import edu.zzuli.brand.service.impl.AdminException;
import edu.zzuli.brand.service.impl.UserException;

/**
 * 
* @ClassName: UserService 
* @Description: TODO(userService接口) 
* @author 赵一航
* @date 2017年10月15日 下午4:55:27 
*
 */
public interface UserService {
	
	public void register(User user) throws UserException;//校验用户和邮箱是否以及被注册

	public User login(User user) throws UserException;//登录密码校验和用户名的校验

	public User finndUserInfo(String uid);//根据用户uid查询用户信息

	public Admin adminLogin(Admin form) throws AdminException;//管理员登录

	

	public void addAdminInfo(Admin admin) throws AdminException;

	public void modify_info(User user);//修改信息

	public void modify_password(User user);//修改密码
	
}
