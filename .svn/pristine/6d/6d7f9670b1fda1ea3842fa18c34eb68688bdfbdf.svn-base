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
 <title>订单信息</title>
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
            <li><a href="${pageContext.request.contextPath}/admin/bg_addadmin.jsp" id="bg_left_active">添加管理员</a></li>
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
                <th>商标用途</th>
                <th>预算</th>
                <th>分类</th>
                <th>类型</th>
                <th>详情</th>
                <th>联系人</th>
                <th>联系方式</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pageQuery.beanList}" var="item" varStatus="status" >
                    	
                    	<tr style="font-size: 15px;">
                        <td>1</td>
                        <td>${item.name }</td>
                        <td>${item.function }</td>
                        <td>${item.budget }</td><!-- 预算 -->
                        <td>${item.icategory }</td><!-- 分类 -->
                        <td>${item.iprotfolio }</td><!-- 类型 -->
                        <td>${item.content }</td>
                        <td>${item.linkman }</td>
                        <td>${item.tel }</td>
                        <td><!-- 状态 -->
                        	<c:if test="${item.status eq '0'}">等待处理</c:if>
                        	<c:if test="${item.status eq '1'}">已处理</c:if>
                        </td>
                        <td>
                            <a href="<%=basePath%>items/SellItem.action?iid=${item.iid}">售出</a>
                            <a href="<%=basePath%>items/deleteItem.action?iid=${item.iid}">删除</a>
                        </td>
                    </tr>
                    </c:forEach>
        </table>
    </div>
     <div class="bg_page">
			<ul>

				<c:if test="${pageQuery.pc>1 }">
					<li class="number"><a
						href="<c:url value='/pshowItems.action?pc=${pageQuery.pc+1 }'/>">&laquo;</a></li>
				</c:if>
				<li  class="index"><a  href="<c:url value='/pshowItems.action?pc=1'/>">首页</a></li>
				<c:if test="${pageQuery.pc>1 }">
					<li  class="next"><a
						href="<c:url value='/pshowItems.action?pc=${pageQuery.pc-1 }'/>">上一页</a></li>

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
								href="<c:url value='/pshowItems.action?pc=${i }'/>">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li class="number"><a href="<c:url value='/pshowItems.action?pc=${i }'/>">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageQuery.pc<pageQuery.tp }">
					<li class="next"><a
						href="<c:url value='/pshowItems.action?pc=${pageQuery.pc+1 }'/>">下一页</a></li>
				</c:if>
				<li class="finish"><a href="<c:url value='/pshowItems.action?pc=${pageQuery.tp}'/>">尾页</a></li>
				<c:if test="${pageQuery.pc<pageQuery.tp }">
					<li class="number"><a
						href="<c:url value='/pshowItems.action?pc=${pageQuery.pc+1 }'/>"></a></li>
				</c:if>
			</ul>
	
</div>
</div>
</body>
</html>