package edu.zzuli.brand.service.impl;


import javax.annotation.Resource;

import edu.zzuli.brand.mapper.AdminMapper;
import edu.zzuli.brand.mapper.UserMapper;
import edu.zzuli.brand.mapper.UserMapperCustom;
import edu.zzuli.brand.pojo.po.Admin;
import edu.zzuli.brand.pojo.po.User;
import edu.zzuli.brand.service.UserService;
/**
 * 
* @ClassName: UserServiceImpl 
* @Description: TODO(UserService实现类，注册和登录业务层) 
* @author 赵一航
* @date 2017年10月15日 下午4:57:19 
*
 */

public class UserServiceImpl implements UserService{
	@Resource
	private UserMapper userMapper;
	
	@Resource
	private UserMapperCustom userMapperCustom;
	
	@Resource
	private AdminMapper adminMapper;
	
	/**
	 * 校验用户信息是否已经注册
	 * @throws UserException 
	 */
	public void register(User user) throws UserException {
		String username = user.getUsername();
		User user2 = userMapper.selectByUsername(username);
		
		//校验用户名是否已经注册
		if(user2!=null)
			throw new UserException("用户名已经被注册");
		
		//信息正确插入数据
		userMapper.insert(user);
	}
	/**
	 * 校验用户名和密码是否正确
	 */
	public User login(User form) throws UserException {
	
		//查询用户名是否存在
		String username = form.getUsername();
		User user = userMapper.selectByUsername(username);
		
		if(user == null)
			throw new UserException("用户名不存在");
		
		/*
		 * 判断密码是否正确
		 *  如果不同抛出异常
		 */
		if(!user.getPassword().equals(form.getPassword()))
			throw new UserException("密码错误");
		return user;
	}

	/**
	 * 根据用户uid查询
	 */
	public User finndUserInfo(String uid) {
		
		return userMapper.selectByPrimaryKey(uid);
	}
	
	
	
	
	public Admin adminLogin(Admin form) throws AdminException {
		//查询用户名是否存在
		String username = form.getUsername();
		Admin admin = adminMapper.selectByName(username);
		
		if(admin == null)
			throw new AdminException("用户名不存在");
		
		/*
		 * 判断密码是否正确
		 *  如果不同抛出异常
		 */
		if(!admin.getPassword().equals(form.getPassword()))
			throw new AdminException("密码错误");
		return admin;
	}
	
	
	
	
	
	/**
	 * 用户添加
	 */
	public void addAdminInfo(Admin form) throws AdminException {
		String username = form.getUsername();
		Admin admin2 = adminMapper.selectByName(username);
		
		//校验用户名是否已经注册
		if(admin2!=null)
			throw new AdminException("用户名已经被注册");
		
		//信息正确插入数据
		adminMapper.insert(form);
	}
	
	
	
	
	
	
	/**
	 * 修改信息
	 */
	public void modify_info(User user) {
		userMapper.updateByName(user);
	}
	
	
	
	/**
	 * 修改密码
	 */
	public void modify_password(User user) {
	
		userMapper.ByNameUpdatePassword(user);
	}


}
