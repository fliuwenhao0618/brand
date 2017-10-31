<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>查询信息</title>
    <link href="admin/css/bg_index.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="bg_index">
        <div class="bg_top">
           <c:choose>
        		<c:when test="${admin_session.username eq null }">
        			<a href="${pageContext.request.contextPath}/admin/bg_login.jsp"><span>请登录</span></a>
        		</c:when>
        		
        		<c:otherwise>
        			<span>${admin_session.username}管理员 你好！</span>
        		</c:otherwise>
        	
        	</c:choose>

            <font>欢迎来到知孚IP后台管理页面</font>
        </div>
        <div class="bg_content">
            <ul class="bg_left">
              <li><a id="bg_blue">信息管理</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/bg_addadmin.jsp" id="bg_left_active">添加管理员</a></li>
                <li><a href="${pageContext.request.contextPath}/addPre.action" id="bg_left_active">添加信息</a></li>
                <li><a href="${pageContext.request.contextPath}/adminlist.action">查询信息</a></li>
                <li><a href="${pageContext.request.contextPath}/items/pshowItems.action">订单信息</a></li>
                <li><a href="${pageContext.request.contextPath}/adminQuit.action" id="bg_blue">退出登陆</a></li>
            </ul>
            
            <table class="bg_right">
                    <tr>
                        <th>序号</th>
                        <th>商品名称</th>
                        <th>价格</th>
                        <th>注册号</th>
                        <th>所属地</th>
                        <th>商标图片</th>
                        <th>组合类型</th>
                        <th>使用项目 </th>
                        <th>类别</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageQuery.beanList}" var="brand" varStatus="status" >
                <tr>
                    
                        <td>${status.index+1}</td>
                        <td>${brand.bname }</td>
                        <td>${brand.price }</td>
                        <td>${brand.number }</td>
                        <td>${brand.local }</td>
                        <td>${brand.image }</td>
                        <td>${brand.portfolio }</td>
                        <td>${brand.application }</td>
                        
                        <td>${brand.cid }</td>
                      
                        <td>
                            <a href="${pageContext.request.contextPath}/preEdit.action?bid=${brand.bid }">修改</a>
                            <a href="#">删除</a>
                        </td>
                        
                </tr>
                  </c:forEach> 
                </table> 
        </div>
      
             <div class="bg_page">
			<ul>

				<c:if test="${pageQuery.pc>1 }">
					<li class="number"><a
						href="<c:url value='/adminlist.action?pc=${pageQuery.pc+1 }'/>">&laquo;</a></li>
				</c:if>
				<li  class="index"><a  href="<c:url value='/adminlist.action?pc=1'/>">首页</a></li>
				<c:if test="${pageQuery.pc>1 }">
					<li  class="next"><a
						href="<c:url value='/adminlist.action?pc=${pageQuery.pc-1 }'/>">上一页</a></li>

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
								href="<c:url value='/adminlist.action?pc=${i }'/>">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li class="number"><a href="<c:url value='/adminlist.action?pc=${i }'/>">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageQuery.pc<pageQuery.tp }">
					<li class="next"><a
						href="<c:url value='/adminlist.action?pc=${pageQuery.pc+1 }'/>">下一页</a></li>
				</c:if>
				<li class="finish"><a href="<c:url value='/adminlist.action?pc=${pageQuery.tp}'/>">尾页</a></li>
				<c:if test="${pageQuery.pc<pageQuery.tp }">
					<li class="number"><a
						href="<c:url value='/adminlist.action?pc=${pageQuery.pc+1 }'/>"></a></li>
				</c:if>
			</ul>
	
</div>
    </div>
</body>
</html>