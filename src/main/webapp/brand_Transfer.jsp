<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>知孚IP</title>
	<link href="css/brand_Transfer.css" rel="stylesheet" type="text/css" />
  <link href="images/index/ICO32.ico" rel="shortcut icon" type="image/x-icon" />
  <script src="js/jquery.min.js"></script>
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
    function trustme(e){
        var nodes=document.getElementsByClassName("choice"); 
        nodes.x=0;
        for(var i=0 ;i<nodes.length;i++)
        {
            nodes[i].style.backgroundColor="#f5f3f4";
            nodes[i].childNodes[1].style.backgroundPosition="0 -17px";   
        }
        e.style.backgroundColor="red";
        e.childNodes[1].style.backgroundPosition="0 0";                                          
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
        			<span class="active">&nbsp &nbsp用户： ${sessionScope.user_session.username}<a href="${pageContext.request.contextPath}/logut.action">退出</a></apan>
        		</c:otherwise>
        	</c:choose>
        </ul>
        <ul class="detail right">
        	<li><a href="${pageContext.request.contextPath}/finndUserInfo.action">个人信息</a></li>
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
      <li><a href="brand_Wanted.jsp">商标购买</a></li>
      <li><a href="${pageContext.request.contextPath}/insertDemand.action">商标注册</a></li>
      <li><a href="brand_Query.jsp">商标查询</a></li>
      <li><a href="${pageContext.request.contextPath}/sort.action">商标分类</a></li>
      <li><a href="${pageContext.request.contextPath}/toIndex.action">版权专利</a></li>

    </ul>
  </div>
  <!--分割线-->
  <div id="Parting line" style="width:100%; height:0; border:1px solid #eb0e1f; margin:0 auto;"></div>
  <!--中间内容-->
  <div id="content" >
    <div class="content_bg">  
        <div class="bg_left">
            
            <div class="bg_left_bottom">
                <div class="ifbottom_left">
                    <ul class="list">
                        <li>热门标签:</li>
                        <li style="height:165px;">商标分类:</li>
                        <li>组合类型:</li>
                        <li>适用项目:</li>
                        <li>所属地方:</li>
                        <li style="border-bottom:none">其他条件:</li>
                    </ul>
                </div>
                <div class="ifbottom_right">
                        <ul class="list">
                            <li>
                                <ul class="list_nav">
                                    <li><a href="${ctx}/queryByremen.action?bname=男装">男装</a></li>
                                    <li><a href="${ctx}/queryByremen.action?bname=女装">女装</a></li>
                                    <li><a href="${ctx}/queryByremen.action?bname=童装">童装</a></li>
                                    <li><a href="${ctx}/queryByremen.action?bname=家具">家具</a></li>
                                    <li><a href="${ctx}/queryByremen.action?bname=化妆品">化妆品</a></li>
                                    <li><a href="${ctx}/queryByremen.action?bname=牙膏">牙膏</a></li>
                                    <li><a href="${ctx}/queryByremen.action?bname=钱包">钱包(钱夹)</a></li>
                                    <li><a href="${ctx}/queryByremen.action?bname=眼镜">眼镜</a></li>
                                    <li><a href="${ctx}/queryByremen.action?bname=白酒">白酒</a></li>
                                    <li><a href="${ctx}/queryByremen.action?bname=茶">茶</a></li>
                                    <li><a href="${ctx}/queryByremen.action?bname=餐厅">餐厅</a></li>
                                </ul>
                            </li>
                            <li style="height:171px;">
                                <table class="direction_table">
                                    <tr>
                                        <td><a href="#" name="cid">01类-化工原料</a></td>
                                        <td><a href="#" name="cid">02类-颜料油漆</a></td>
                                        <td><a href="#" name="cid">03类-日化用品</a></td>
                                        <td><a href="#" name="cid">04类-燃料油脂</a></td>
                                        <td><a href="#" name="cid">05类-医药用品</a></td>
                                        <td><a href="#" name="cid">06类-金属材料</a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" name="cid">07类-机械设备</a></td>
                                        <td><a href="#" name="cid">08类-手工器械</a></td>
                                        <td><a href="#" name="cid">09类-科学仪器</a></td>
                                        <td><a href="#" name="cid">10类-医疗器械</a></td>
                                        <td><a href="#" name="cid">11类-灯具空调</a></td>
                                        <td><a href="#" name="cid">12类-运输工具</a></td>
                                    </tr>
                                    <tr>                                                   
                                        <td><a href="#" name="cid">13类-军火烟火</a></td>
                                        <td><a href="#" name="cid">14类-珠宝钟表</a></td>
                                        <td><a href="#" name="cid">15类-<span>乐器</span></a></td>
                                        <td><a href="#" name="cid">16类-办公用品</a></td>
                                        <td><a href="#" name="cid">17类-橡胶制品</a></td>
                                        <td><a href="#" name="cid">18类-皮革皮具</a></td>
                                    </tr>
                                </table>
                                <div class="show_listhot">
                                    <div style="color:red">热门大类:</div>
                                    <div>服装(25)</div>
                                    <div>化妆品(3)</div>
                                    <div>食品(29)</div>
                                    <div>电子产品</div>
                                    <div>家具(20)</div>
                                </div>
                            </li>
                            <li><ul class="list_nav">
                                <li><a href="${ctx}/queryByremen.action?bname=中文" name="portfolio">中文</a></li>
                                <li><a href="${ctx}/queryByremen.action?bname=英文" name="portfolio">英文</a></li>
                                <li><a href="${ctx}/queryByremen.action?bname=中文英文" name="portfolio">中文+英文</a></li>
                                <li><a href="${ctx}/queryByremen.action?bname=图形" name="portfolio">图形</a></li>
                                <li><a href="${ctx}/queryByremen.action?bname=中文图形" name="portfolio">中文+图形</a></li>
                                <li><a href="${ctx}/queryByremen.action?bname=组合" name="portfolio">组合</a></li>
                                <li><a href="${ctx}/queryByremen.action?bname=数字" name="portfolio">数字</a></li>
                                <li><a href="${ctx}/queryByremen.action?bname=拼音" name="portfolio">拼音</a></li>
                                <li><a href="#${ctx}/queryByremen.action?bname=英文图形" name="portfolio">英文+图形</a></li>
                                <li><a href="${ctx}/queryByremen.action?bname=中文拼音" name="portfolio">中文+拼音</a></li>
                            </ul></li>
                            <li><ul class="list_nav" id="j05">
                                <li id="j006"><a href="${ctx}/queryByremen.action?cid=1">洗发水</a></li>
                                <li><a href="${ctx}/queryByremen.action?bname=洗发水" name="application">洗发水</a></li>
                                <li><a href="${ctx}/queryByremen.action?bname=机动车" name="application">机动车</a></li>
                                <li><a href="${ctx}/queryByremen.action?bname=大衣" name="application">大衣</a></li>
                                <li><a href="${ctx}/queryByremen.action?bname=树木" name="application">树木</a></li>
                                <li><a href="${ctx}/queryByremen.action?bname=洗面奶" name="application">洗面奶</a></li>
                            </ul></li>
                            <li><ul class="list_nav">
                                <li><a href="${ctx}/queryByremen.action?bname=国内" name="local">国内</a></li>
                                <li><a href="${ctx}/queryByremen.action?bname=美国" name="local">美国</a></li>
                                <li><a href="${ctx}/queryByremen.action?bname=洗发水" name="local">国内</a></li>
                                <li><a href="${ctx}/queryByremen.action?bname=洗发水" name="local">国内</a></li>
                                <li><a href="${ctx}/queryByremen.action?bname=洗发水" name="local">国内</a></li>
                                <li><a href="${ctx}/queryByremen.action?bname=洗发水" name="local">国内</a></li>
                                <li><a href="${ctx}/queryByremen.action?bname=洗发水" name="local">国内</a></li>
                                <li><a href="${ctx}/queryByremen.action?bname=洗发水" name="local">国内</a></li>
                            </ul></li>
                            <li style="border-bottom:none"><ul class="list_nav">
                                <li>字符长度不限</li>
                                <li>下证时间不限</li>
                                <li>商标区域不限</li>
                            </ul></li>
                        </ul>
                    </div>
            </div>
        </div>  
        <div class="bg_right">
            <div class="bg_right_top">
                <p style="color:white;font-size:20px;position:relative;top:30px;text-align:center;">最快三分钟为您找到卖家</p>
                <div class="show_area"><a href="${pageContext.request.contextPath}/items/toWanted.action">我要购买商标</a></div>
            </div>
            <div class="bg_right_bottom">
                <div class="purchase_showlist">
                    <div class="plist">
                        <div class="plist_top">
                            <div style="height:20px;width:80px;background-color:red;float:left;color:#fff; line-height:20px;">10分钟前</div>
                            <div style=" height:0px;width:0px;border-left:10px solid red;float:left; border-top: 5px solid transparent; border-bottom: 5px solid transparent;position:relative;top:5px;"></div>
                             <div style="float:left;height:24px;width:32px; margin-left:10px;" >C#</div>
                             <div style="float:left;height:24px; width:137px;">以<span style="color:#eb0e1f">￥12345.00元</span>买</div>
                        </div>
                        <div class="plist_bottom">[29类]初典-这里是文字文字</div>
                    </div>
                    <div class="plist">
                            <div class="plist_top">
                                <div style="height:20px;width:80px;background-color:red;float:left;color:#fff; line-height:20px;">10分钟前</div>
                                <div style=" height:0px;width:0px;border-left:10px solid red;float:left; border-top: 5px solid transparent; border-bottom: 5px solid transparent;position:relative;top:5px;"></div>
                                 <div style="float:left;height:24px;width:32px; margin-left:10px;" >C#</div>
                                 <div style="float:left;height:24px; width:137px;">以<span style="color:#eb0e1f">￥12345.00元</span>买</div>
                            </div>
                            <div class="plist_bottom">[29类]初典-这里是文字文字</div>
                    </div>
                    <div class="plist">
                            <div class="plist_top">
                                <div style="height:20px;width:80px;background-color:red;float:left;color:#fff; line-height:20px;">10分钟前</div>
                                <div style=" height:0px;width:0px;border-left:10px solid red;float:left; border-top: 5px solid transparent; border-bottom: 5px solid transparent;position:relative;top:5px;"></div>
                                 <div style="float:left;height:24px;width:32px; margin-left:10px;" >C#</div>
                                 <div style="float:left;height:24px; width:137px;">以<span style="color:#eb0e1f">￥12345.00元</span>买</div>
                            </div>
                            <div class="plist_bottom">[29类]初典-这里是文字文字</div>
                    </div>
                    <div class="plist">
                            <div class="plist_top">
                                <div style="height:20px;width:80px;background-color:red;float:left;color:#fff; line-height:20px;">10分钟前</div>
                                <div style=" height:0px;width:0px;border-left:10px solid red;float:left; border-top: 5px solid transparent; border-bottom: 5px solid transparent;position:relative;top:5px;"></div>
                                 <div style="float:left;height:24px;width:32px; margin-left:10px;" >C#</div>
                                 <div style="float:left;height:24px; width:137px;">以<span style="color:#eb0e1f">￥12345.00元</span>买</div>
                            </div>
                            <div class="plist_bottom">[29类]初典-这里是文字文字</div>
                    </div>
                    <div class="plist">
                            <div class="plist_top">
                                <div style="height:20px;width:80px;background-color:red;float:left;color:#fff; line-height:20px;">10分钟前</div>
                                <div style=" height:0px;width:0px;border-left:10px solid red;float:left; border-top: 5px solid transparent; border-bottom: 5px solid transparent;position:relative;top:5px;"></div>
                                 <div style="float:left;height:24px;width:32px; margin-left:10px;" >C#</div>
                                 <div style="float:left;height:24px; width:137px;">以<span style="color:#eb0e1f">￥12345.00元</span>买</div>
                            </div>
                            <div class="plist_bottom">[29类]初典-这里是文字文字</div>
                    </div>
                    <div class="plist">
                            <div class="plist_top">
                                <div style="height:20px;width:80px;background-color:red;float:left;color:#fff; line-height:20px;">10分钟前</div>
                                <div style=" height:0px;width:0px;border-left:10px solid red;float:left; border-top: 5px solid transparent; border-bottom: 5px solid transparent;position:relative;top:5px;"></div>
                                 <div style="float:left;height:24px;width:32px; margin-left:10px;" >C#</div>
                                 <div style="float:left;height:24px; width:137px;">以<span style="color:#eb0e1f">￥12345.00元</span>买</div>
                            </div>
                            <div class="plist_bottom">[29类]初典-这里是文字文字</div>
                    </div>
                </div>
            </div>
        </div>  
        <div class="bg_bottom">
            <div class="choice" onclick="trustme(this)">综合排序<div class="imgs"></div></div>
            <div class="choice" onclick="trustme(this)">价格<div class="imgs"></div></div>
            <div class="choice" onclick="trustme(this)">下证时间<div class="imgs"></div></div>
            <div class="choice" onclick="trustme(this)">字符数量<div class="imgs"></div></div>
        </div>
        <div class="bg_bottom_right"></div> 
        <div class="content_middle">
            <div class="content_middle_left"  id="content_middle_left" style="display:none;" onmouseover="showall()" onmouseout="hideall()">
                <div class="content_middle_top" >
                    <ul class="content_info" id="n">
                        <li id="n1"  onmouseover="ShowDiv(this)" onmouseout="ClearDiv(this)">
                            <h2 class="content_title"><a href="#">服装鞋帽（25类）</a></h2>
                            <ul class="content_infos">
                                <li ><a href="#">男装</a></li>
                                <li><a href="#">女装</a></li>
                                <li><a href="#">童装</a></li>
                                <li><a href="#">裤子</a></li>
                                <li><a href="#">鞋袜</a></li>
                            </ul>
                        </li>
                        <li id="n2" onmouseover="ShowDiv(this)" onmouseout="ClearDiv(this)">
                            <h2 class="content_title"><a href="#">日化用品（3类）</a></h2>
                            <ul class="content_infos">
                                <li><a href="#">香皂</a></li>
                            <li><a href="#">洗面奶</a></li>
                            <li style="width:70px;"><a href="#" >美容面膜</a></li>
                            <li><a href="#">洗发水</a></li>                          
                            </ul>
                        </li>
                    <li id="n3" onmouseover="ShowDiv(this)" onmouseout="ClearDiv(this)">
                        <h2 class="content_title"><a href="#">酒精饮品（30类）</a></h2>
                        <ul class="content_infos">
                            <li><a href="#">白酒</a></li>
                            <li><a href="#">鸡尾酒</a></li>
                            <li><a href="#">蜂蜜酒</a></li>
                            <li style="width:70px;"><a href="#">酒精饮品</a></li>
                        </ul>
                    </li>
                    <li id="n4" onmouseover="ShowDiv(this)" onmouseout="ClearDiv(this)">
                        <h2 class="content_title"><a href="#">食品（9类）</a></h2>
                        <ul class="content_infos">
                            <li><a href="#">肉</a></li>
                            <li><a href="#">牛奶</a></li>
                            <li><a href="#">奶粉</a></li>
                            <li><a href="#">食用油</a></li>
                            <li><a href="#">坚果</a></li>
                        </ul>
                    </li>
                    <li id="n5" onmouseover="ShowDiv(this)" onmouseout="ClearDiv(this)">
                        <h2 class="content_title"><a href="#">方便食品（20类）</a></h2>
                        <ul class="content_infos">
                            <li><a href="#">咖啡</a></li>
                            <li><a href="#">面包</a></li>
                            <li><a href="#">饼干</a></li>
                            <li><a href="#">蜂蜜</a></li>
                            <li><a href="#">蛋糕</a></li>
                        </ul>
                    </li>
                    <li id="n6" onmouseover="ShowDiv(this)" onmouseout="ClearDiv(this)"> 
                        <h2 class="content_title"><a href="#">家具用品</a></h2>
                        <ul class="content_infos">
                            <li><a href="#">床</a></li>
                            <li><a href="#">茶几</a></li>
                            <li><a href="#">沙发</a></li>
                            <li><a href="#">座椅</a></li>
                            <li><a href="#">床垫</a></li>
                        </ul>
                    </li>
                    <li id="n7" onmouseover="ShowDiv(this)" onmouseout="ClearDiv(this)"> 
                        <h2 class="content_title"><a href="#">医药用品</a></h2>
                        <ul class="content_infos">
                            <li><a href="#">减肥药</a></li>
                            <li><a href="#">维他命</a></li>
                            <li><a href="#">药酒</a></li>
                        </ul>
                    </li>
                    </ul>
                </div>
                <div class="content_middle_bottom"><a href="brand_Transfer.html"><img title="精品商标转让" src="images/index/content_bottom.jpg" alt="more"/></a></div>
            </div>
            <!--Js展示内容开始--><!--style="display:none"-->
            <div class="content_middle_top_show" id="N" style="display:none">
                <div id="N1" class="N1" style="display:none" onmouseover="ShowDiv(this)" onmouseout="ClearDiv(this)">
                    <ul>     
                        <p>衣物</p>                     
                       
                        <li><a href="${ctx}/queryByremen.action?bname=男装">男装</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=女装">女装</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=裤子">裤子</a><span>|</span></li>
                       
                    </ul>
                    <ul>     
                        <p>婴儿纺织用品</p>                     
                        <li><a href="${ctx}/queryByremen.action?bname=婴儿裤">婴儿裤</a><span>|</span></li>
                      
                        <li><a href="${ctx}/queryByremen.action?bname=非纸质围">非纸质围</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=婴儿睡袋">婴儿睡袋</a></li>
                    </ul>
                     <ul>     
                        <p>鞋</p>                     
                        <li><a href="${ctx}/queryByremen.action?bname=运动鞋">运动鞋</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=凉鞋">凉鞋</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=拖鞋">拖鞋</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=雨鞋">雨鞋</a><span>|</span></li>
                       
                    </ul>
                    <ul>     
                        <p>帽</p>                     
                        <li><a href="${ctx}/queryByremen.action?bname=男帽">男帽</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=女帽">女帽</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=儿童帽">儿童帽</a><span>|</span></li>
                       
                    </ul>
                    <ul>     
                        <p>袜</p>                     
                        <li><a href="${ctx}/queryByremen.action?bname=长袜">长袜</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=短袜">短袜</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=丝袜">丝袜</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=袜裤">袜裤</a></li>
                    </ul>
                    <ul>     
                        <p>特殊用鞋</p>                     
                        <li><a href="${ctx}/queryByremen.action?bname=爬山鞋">爬山鞋</a><span>|</span></li>
                        
                        <li><a href="${ctx}/queryByremen.action?bname=滑雪靴">滑雪靴</a><span>|</span></li>
                       
                    </ul>
                </div>
                <div id="N2" class="N2" style="display:none" onmouseover="ShowDiv(this)" onmouseout="ClearDiv(this)">
                    <ul>     
                        <p>洗洁用品</p>                     
                        <li><a href="${ctx}/queryByremen.action?bname=香皂">香皂</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=洗面奶">洗面奶</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=浴液">浴液</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=婴儿睡袋">护发素</a><span>|</span></li>
                       
                    </ul>
                    <ul>     
                        <p>洗洁去渍制剂</p>                     
                        <li><a href="${ctx}/queryByremen.action?bname=去污剂">去污剂</a><span>|</span></li>
                       
                        <li><a href="${ctx}/queryByremen.action?bname=清洁制剂">清洁制剂</a><span>|</span></li>
                        
                    </ul>
                   
                </div>
                <div id="N3" class="N3" style="display:none" onmouseover="ShowDiv(this)" onmouseout="ClearDiv(this)">
                    <ul>     
                        <p>含酒精的饮料</p>                     
                        <li><a href="${ctx}/queryByremen.action?bname=烧酒">烧酒</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=葡萄酒">葡萄酒</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=清酒">清酒</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=米酒">米酒</a><span>|</span></li>
                      
                    </ul>                        
                </div>
                <div id="N4" class="N4" style="display:none" onmouseover="ShowDiv(this)" onmouseout="ClearDiv(this)">
                    <ul>     
                        <p>肉类</p>                     
                        <li><a href="${ctx}/queryByremen.action?bname=肉">肉</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=肉干">肉干</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=猪肉">猪肉</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=肉冻">肉冻</a><span>|</span></li>
                       
                    </ul>
                    <ul>     
                        <p>非活水产品</p>                     
                        <li><a href="${ctx}/queryByremen.action?bname=鱼">鱼(非活的)</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=鱼制食品">鱼制食品</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=虾">虾</a><span>|</span></li>
                      
                    </ul>
                    <ul>     
                        <p>奶及乳制品</p>                     
                        <li><a href="${ctx}/queryByremen.action?bname=牛奶">牛奶</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=豆奶">豆奶</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=奶油">奶油</a><span>|</span></li>
                      
                    </ul>
                   
                </div>
                <div id="N5"  class="N5" style="display:none" onmouseover="ShowDiv(this)" onmouseout="ClearDiv(this)">
                    <ul>     
                        <p>咖啡、可可</p>                     
                        <li><a href="${ctx}/queryByremen.action?bname=咖啡">咖啡</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=可可">可可</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=巧克力">巧克力</a><span>|</span></li>
                       
                    </ul>
                    <ul>     
                        <p>茶叶</p>                     
                        <li><a href="${ctx}/queryByremen.action?bname=茶">茶</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=冰茶">冰茶</a><span>|</span></li>
                       
                    </ul>
                     <ul>     
                        <p>糖</p>                     
                        <li><a href="${ctx}/queryByremen.action?bname=糖">糖</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=红糖">红糖</a><span>|</span></li>
                      
                    </ul>
                   
                </div>
                <div id="N6" class="N6" style="display:none" onmouseover="ShowDiv(this)" onmouseout="ClearDiv(this)">
                    <ul>     
                        <p>家具</p>                     
                        <li><a href="${ctx}/queryByremen.action?bname=文件柜">文件柜</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=婴儿摇床">婴儿摇床</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=床架">床架</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=椅子">椅子</a><span>|</span></li>
                      
                    </ul>
                    <ul>     
                        <p>非金属容器</p>                     
                        <li><a href="${ctx}/queryByremen.action?bname=葡萄酒用桶">葡萄酒用桶</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=鱼蓝">鱼蓝</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=非金属桶">非金属桶</a><span>|</span></li>
                       
                    </ul>
                     <ul>     
                        <p>镜子，画框及部件</p>                     
                        <li><a href="${ctx}/queryByremen.action?bname=镜子">镜子</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=手持镜子">手持镜子</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=相框边条">相框边条</a></li>
                    </ul>
                    
                </div>
                <div id="N7" class="N7" style="display:none" onmouseover="ShowDiv(this)" onmouseout="ClearDiv(this)">
                    <ul>     
                        <p>药品</p>                     
                        <li><a href="${ctx}/queryByremen.action?bname=消毒剂">消毒剂</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=卫生消毒剂">卫生消毒剂</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=放射性药品">放射性药品</a><span>|</span></li>
                      
                    </ul>
                    <ul>     
                        <p>营养品</p>                     
                        <li><a href="${ctx}/queryByremen.action?bname=医用营养品">医用营养品</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=医用营养饮料">医用营养饮料</a><span>|</span></li>
                        <li><a href="${ctx}/queryByremen.action?bname=婴儿食品">婴儿食品</a></li>
                    </ul>
                  
                </div>
            </div>
            <!--Js展示内容结束-->
        </div>  
    </div>
     
    <div class="table_show">
        <table>
            <tr>
             <c:forEach items="${pageQuery.beanList}" var="brand" varStatus="status" >
               <td>
                    <div class="all_show">
                        <a href="${ctx}/load.action?bid=${brand.bid}"><div class="all_top"><img src="/pic/${brand.image }" width="230" height="220"></div></a>
                        <div class="all_bottom">
                            <div class="up">
                                <div class="up_left">
                                    <p style="color:red;font-size:20px;">￥19800.00</p>
                                    <p>[第${brand.cid }类]${brand.bname }</p>
                                </div>
                                <div class="up_right">精品</div>                               
                            </div>
                            <div class="middle">  
                                <p style="color:#b1b1b3;">${brand.application }</p>                             
                            </div>
                            <div class="down">
                                <div class="down_left"><a href="http://wpa.qq.com/msgrd?v=3&uin=359003035&site=qq&menu=yes">立即购买</a></div>
                                <div class="down_right"><a  href="http://wpa.qq.com/msgrd?v=3&uin=359003035&site=qq&menu=yes">联系客服</a></div>
                            </div>
                        </div>
                    </div>
                </td>
                <c:if test="${status.count%5==0 }">
                   <tr>
                   </tr>
                </c:if>  
                   </c:forEach> 
            </tr>
           
            
              
        </table>
    </div>
   
    <div class="show_help">
        <div class="show_help_all">
            <div class="show_help_left">
            </div>
            <div class="show_help_right">
                <p><b>没有找到合适您的商标？</b></p>
                <div class="show_help_right_bottom">
                    <div style="float:left;"><b>立即联系</b></div>
                    <div class="online"><b><a href="http://wpa.qq.com/msgrd?v=3&uin=359003035&site=qq&menu=yes">在线客服</a></b></div>
                    <div style="float:left;"><b>或</b></div>
                    <div class="buy"><a href="brand_Wanted.jsp">发布购买信息</a></div>
                </div>         
            </div>
        </div>
    </div>
    <div class="page">
			<ul>

				<c:if test="${pageQuery.pc>1 }">
					<li class="number"><a  class="active"
						href="<c:url value='/listBypage.action?pc=${pageQuery.pc+1 }'/>">&laquo;</a></li>
				</c:if>
				<li  class="index"><a  href="<c:url value='/listBypage.action?pc=1'/>">首页</a></li>
				<c:if test="${pageQuery.pc>1 }">
					<li  class="next"><a
						href="<c:url value='/listBypage.action?pc=${pageQuery.pc-1 }'/>">上一页</a></li>

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
								href="<c:url value='/listBypage.action?pc=${i }'/>">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li class="number"><a href="<c:url value='/listBypage.action?pc=${i }'/>">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageQuery.pc<pageQuery.tp }">
					<li class="next"><a
						href="<c:url value='/listBypage.action?pc=${pageQuery.pc+1 }'/>">下一页</a></li>
				</c:if>
				<li class="finish"><a href="<c:url value='/listBypage.action?pc=${pageQuery.tp}'/>">尾页</a></li>
				<c:if test="${pageQuery.pc<pageQuery.tp }">
					<li class="number"><a
						href="<c:url value='/listBypage.action?pc=${pageQuery.pc+1 }'/>"></a></li>
				</c:if>
			</ul>
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
<script>
/*
//$('#j05').click(function(){
  //  $(this).parent().each(function () {//移除其余非点中状态
       // $.ajax({
            type: 'POST',
            url: queryByremen.action,
            data:{"application":"洗发剂"}

        });
    });

})*/

/*$('#j006').click(function(){
      alert(12);
        $.ajax({
            type: 'POST',
            url: "queryByremen.action",
            data:{"application":"树木"}

        });
   
})*/


</script>
</html>