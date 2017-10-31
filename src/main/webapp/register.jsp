<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>知孚IP</title>
	<link href="css/register.css" rel="stylesheet" type="text/css" />
  <link href="images/index/ICO32.ico" rel="shortcut icon" type="image/x-icon" />
</head>

<body>
	<div id="top">
    <div class="text">
    		<ul class="log left">
        	<li style="padding:0;">欢迎来到知孚IP！</li>
      <c:choose>
        		<c:when test="${sessionScope.user_session eq null}">
        			 <li><a class="active" href="/brand1/login.jsp">请登录</a></li>
        		</c:when>
        		<c:otherwise>
        			<span class="active">&nbsp &nbsp用户： ${sessionScope.user_session.username} <a href="${ctx}/logut.action">退出</a></apan>
        			
        		</c:otherwise>
       </c:choose>
         
        	
          <li><a href="/brand1/register.jsp">免费注册</a></li>
        </ul>
        <ul class="detail right">
        	<li><a href="${pageContext.request.contextPath}/finndUserInfo.action">个人信息</a></li>
          <li><a href="${pageContext.request.contextPath}/pshowFavorites.action">收藏夹</a></li>
          <li>服务热线：<span class="active">000-000-0000</span></li>
        </ul>
      </div>
  </div>
  <!--注册-->
  <div id="register">
  	<img src="images/index/LOGO.gif" title="LOGO" alt="知孚IP" />
    <span>用户注册</span>
    <span><a href="${pageContext.request.contextPath }/toIndex.action">返回首页</a></span>
  </div>
  <!--中间内容-->
  <p style="color: red; font-weight: 900">${message }</p>
  <div id="content">
  	<div class="picture">
      <form action="${pageContext.request.contextPath }/register.action" method="post">
      	<ul>
          <li>
          	<p style="color: red; font-weight: 900">${errors.username}</p>
          	<input name="username" type="text" placeholder="请输入用户名" value="${user.username}"/>
          	<span>6-18个字符</span>
          </li>
          
          
          <li>
          	 <p style="color: red; font-weight: 900">${errors.password }</p>
         	 <input name="password" type="password" placeholder="设定登录密码" value="${user.password}"/>
         	 <span>6-16个字符，区分大小写</span>
          </li>
          
          
         <li>
         	<p style="color: red; font-weight: 900">${errors.confirm }</p>
         	<input name="confirm" type="password" placeholder="再次输入密码" />
         </li>
         <span>再次确认</span>
        
        
          <li>
          	<input name="tel" type="text" placeholder="请输入手机号" value="${user.tel }"/>
          	<span>忘记密码时，可以通过该手机号码快速找回密码</span>
          </li>
          
          <li>
          	<input name="qq" type="text" placeholder="请输入QQ号" value="${user.qq }"/>
          	<span>请确保您的QQ号码没有错误！</span>
          </li>
          
          
          
          <li>
            <p style="color: red; font-weight: 900">${errors.email }</p>
          	<input name="email" type="text" placeholder="请输入邮箱" value="${user.email }"/>
          	<span>请确保您的邮箱没有错误！</span>
          </li>
         
          
          
          <li>
          	<p style="color: red; font-weight: 900">${errors.code }</p>
          	<input style="width:200px; margin-right:40px;" name="code" type="text" placeholder="请输入验证码">
          </li>
          
          <li>
          	<img  src="/brand1/image.action" style="width:140px; height:40px; background:red; display:inline-block" / >
          </li>
          <span>请填写图片中的字符，不区分大小写</span>
          <li><input type="submit" value="立即注册"/></li>      
          <p>已有账号？<a href="login.html">立即登录>>></a></p>
        </ul>
      </form>
    </div>
  </div>
  <!--底部-->
  <div id="botoom">
  	<div class="relatives">
    	<a href="#">关于我们</a> |
      <a href="#">联系我们</a> |
      <a href="#">问题反馈</a> |
      <a href="#">友情链接</a>
    </div>
  </div>
</body>
</html>