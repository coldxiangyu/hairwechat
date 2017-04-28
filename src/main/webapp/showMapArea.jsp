<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
		#allmap{width:100%;height:500px;}
		p{margin-left:5px; font-size:14px;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=R46500oYHx3GOC5bGXkOishFAI4EbEA1"></script>
	<title>圆形区域搜索</title>
</head>

<%
	String p1 = request.getParameter("p1");
	String p2 = request.getParameter("p2");
	String p3 = request.getParameter("p3");
%>

<body>
	<div id="allmap"></div>
	<p>返回地图上圆形覆盖范围内的“<%=p3%>”检索结果，并展示在地图上</p>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");            // 创建Map实例
	var mPoint = new BMap.Point(<%=p1%>, <%=p2%>);  
	map.enableScrollWheelZoom();
	map.centerAndZoom(mPoint,15);

	var circle = new BMap.Circle(mPoint,1000,{fillColor:"blue", strokeWeight: 1 ,fillOpacity: 0.3, strokeOpacity: 0.3});
    map.addOverlay(circle);
    var local =  new BMap.LocalSearch(map, {renderOptions: {map: map, autoViewport: false}});  
    local.searchNearby('<%=p3%>',mPoint,1000);
</script>

