<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>知孚IP</title>
	<link href="css/favorites.css" rel="stylesheet" type="text/css" />
  <link href="img/ICO32.ico" rel="shortcut icon" type="image/x-icon" />
  <script type="text/javascript">
    var click01;
    function ShowDiv(e){
        click01=new String(e.id);
        var Func=click01.toUpperCase();
        document.getElementById(Func).style.display="block";
        document.getElementById("N").style.display="block";
        document.getElementById("content_middle_left").style.display="block";
    }
    function ClearDiv(e){
        click01=new String(e.id);
        var Func=click01.toUpperCase();
        document.getElementById(Func).style.display="none";
        document.getElementById("N").style.display="none";
        document.getElementById("content_middle_left").style.display="none";
    }
    function showall(){
        document.getElementById("content_middle_left").style.display="block";
    }
    function hideall(){
        document.getElementById("content_middle_left").style.display="none";
    }
	
    </script>
</head>

<body>
	<!--头部-->
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
        		<li><a href="${pageContext.request.contextPath}/finndUserInfo.action">个人信息</a><li>
          <li><a href="${pageContext.request.contextPath}/pshowFavorites.action">收藏夹</a></li>
          <li>服务热线：<span class="active">000-000-0000</span></li>
        </ul>
      </div>
  </div>
  <!--搜索-->
  <div id="search">
  	<img src="images/index/LOGO.gif" title="知孚IP" alt="LOGO" />
    <form action="${pageContext.request.contextPath}/query.action" method="post">
    	<input class="text" type="text" name="bname" placeholder="请输入商标名称或编号" /><input class="submit" type="submit" name="提交按钮" value="搜索" />
    </form>
    <div class="hot">
    	<a href="${ctx}/queryByremen.action?bname=家具服装">家具服装</a> |
      <a href="${ctx}/queryByremen.action?bname=日化用品">日化用品</a> |
      <a href="${ctx}/queryByremen.action?bname=办公用品">办公用品</a> |
      <a href="${ctx}/queryByremen.action?bname=健身医疗">健身医疗</a> |
      <a href="${ctx}/queryByremen.action?bname=食品">食品</a> |
      <a href="${ctx}/queryByremen.action?bname=教育">教育</a>
      <a href="${pageContext.request.contextPath}/sort.action">更多>></a>
    </div>
  </div>
  <!--导航-->
  <div id="nav">
  	<div class="list">
    	<a href="#"><p>商标主题</p></a>
    </div>
    <ul>
      <li><a class="active" href="${pageContext.request.contextPath}/toIndex.action">首页</a></li>
      <li><a href="${pageContext.request.contextPath}/listBypage.action">精品商标转让</a></li>
      <li><a href="${pageContext.request.contextPath}/items/toWanted.action">商标购买</a></li>
      <li><a href="${pageContext.request.contextPath}/insertDemand.action">商标注册</a></li>
      <li><a href="brand_Query.jsp">商标查询</a></li>
      <li><a href="${pageContext.request.contextPath}/sort.action">商标分类</a></li>
      <li><a href="${pageContext.request.contextPath}/toIndex.action">版权专利</a></li>

    </ul>
  </div>
  <!--分割线-->
  <div id="Parting line" style="width:100%; height:0; border:1px solid #eb0e1f; margin:0 auto;"></div>
  <!--中间内容-->
  <!--商品收藏夹-->
  <div id="collect">
      <p>当前位置>>收藏夹</p>
      <ul class="choose">
           <c:forEach items="${pageQuery.beanList}" var="list"  >
            	<li>
                <div class="box">
                    <input type="checkbox" name="" />
                    <img alt="logo_pic" src="/pic/${list.image}" width="150" height="150"/>
                </div>
                <div class="left">  
                        <dl>
                            <dt></dt>
                            <dd>名称：<span>${list.bname }</span></dd>
                            <dd>类别：<span>${list.application }</span></dd>
                            <dd>价格：<span>${list.status }</span></dd>
                            <dd>适用项目：<span>${list.cid }</span></dd>
                        </dl>
                    </div>
                    
                    <div class="right">
                        <a href="${pageContext.request.contextPath}/removeFavorites.action?fid=${list.fid}">取消关注</a><br/><br/>
                        <a href=""></a>
                    </div>
            </li>
            </c:forEach>
      </ul>
      <div class="page">
          <div class="paget">
              <div class="bg_page">
			<ul>

				<c:if test="${pageQuery.pc>1 }">
					<li class="number"><a
						href="<c:url value='/pshowFavorites.action?pc=${pageQuery.pc+1 }'/>">&laquo;</a></li>
				</c:if>
				<li  class="index"><a  href="<c:url value='/pshowFavorites.action?pc=1'/>">首页</a></li>
				<c:if test="${pageQuery.pc>1 }">
					<li  class="next"><a
						href="<c:url value='/pshowFavorites.action?pc=${pageQuery.pc-1 }'/>">上一页</a></li>

				</c:if>
				<%-- 计算begin、end --%>
				<c:choose>
					<%-- 如果总页数不足10页，那么把所有的页数都显示出来！ --%>
					<c:when test="${pageQuery.tp <= 10 }">
						<c:set var="begin" value="1" />
						<c:set var="end" value="${pageQuery.tp }" />
					</c:when>
					<c:otherwise>
						<%-- 当总页数>10时，通过公式计算出begin和end --%>
						<c:set var="begin" value="${pageQuery.pc-5 }" />
						<c:set var="end" value="${pageQuery.pc+4 }" />
						<%-- 头溢出 --%>
						<c:if test="${begin < 1 }">
							<c:set var="begin" value="1" />
							<c:set var="end" value="10" />
						</c:if>
						<%-- 尾溢出 --%>
						<c:if test="${end > pageQuery.tp }">
							<c:set var="begin" value="${pageQuery.tp - 9 }" />
							<c:set var="end" value="${pageQuery.tp }" />
						</c:if>
					</c:otherwise>
				</c:choose>
				<%-- 循环遍历页码列表 --%>
				<c:forEach var="i" begin="${begin }" end="${end }">

					<c:choose>
						<c:when test="${i eq pageQuery.pc }">
							<li class="number"><a
								href="<c:url value='/pshowFavorites.action?pc=${i }'/>">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li class="number"><a href="<c:url value='/pshowFavorites.action?pc=${i }'/>">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageQuery.pc<pageQuery.tp }">
					<li class="next"><a
						href="<c:url value='/pshowFavorites.action?pc=${pageQuery.pc+1 }'/>">下一页</a></li>
				</c:if>
				<li class="finish"><a href="<c:url value='/pshowFavorites.action?pc=${pageQuery.tp}'/>">尾页</a></li>
				<c:if test="${pageQuery.pc<pageQuery.tp }">
					<li class="number"><a
						href="<c:url value='/pshowFavorites.action?pc=${pageQuery.pc+1 }'/>"></a></li>
				</c:if>
			</ul>
	
</div>
          </div>
          <div class="pageb">
               <!--   <input type="checkbox" name="" id="a"/>
              <div class="bottoml">
                <label for="a">全选</label>
              </div>
              <div class="bottomr">
                <a href="#">删除所选的全部商品</a>
              </div>
          </div>-->
      </div>
  </div>
<!--下方-->
<div id="footer">
  <ul class="upper">
    <li><span>品质服务</span><br />一对一，服务贴心周到</li>
    <li><span>全程跟踪</span><br />随时沟通客户，助力通过</li>
    <li><span>多平台保障</span><br />操作简单方便，应答快捷</li>
    <li><span>管理软件支持</span><br />随时随地，轻松管理</li>
  </ul>
  <div class="lower">
    <ul class="purchase">
      <p>购买指南</p><br />
      <li><a href="#">如何注册</a></li>
      <li><a href="#">购买流程</a></li>
      <li><a href="#">商品咨询</a></li>
    </ul>
    <ul class="right">
      <p>知识产权与知识</p><br />
      <li><a href="#">版权登记知识</a></li>
      <li><a href="#">专利申请知识</a></li>
      <li><a href="#">商标注册知识</a></li>
    </ul>
    <ul class="safety">
      <p>安全服务</p><br />
      <li><a href="#">如何设置密码</a></li>
      <li><a href="#">如何绑定账号</a></li>
      <li><a href="#">服务条款</a></li>
    </ul>
    <ul class="help">
      <p>帮助中心</p><br />
      <li><a href="#">在线业务办理</a></li>
      <li><a href="#">顾问信息展示</a></li>
      <li><a href="#">业务节点信息</a></li>
    </ul>
    <div class="service">
      <h1>免费服务热线</h1>
      <h2>17324913630 17324923630</h2>
      <h3><span>服务时间</span> 0:00-24:00 </h3>
    </div>
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