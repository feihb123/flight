<%@page import="hbase.HBaseUtils"%>
<%@page import="java.util.List"%>
<%@page import="pojo.Flight"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- <link rel="stylesheet" type="text/css" href="css/demo.css" /> -->
  <link rel="stylesheet" type="text/css" href="css/style2.css" />
<title>航班数据</title>
<style type="text/css">
table.hovertable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333388;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}
table.hovertable th {
	background-color:#c3dde0;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}
table.hovertable tr {
	background-color:#d4e3e5;
}
table.hovertable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}
</style>

</head>
<body  background="images/background.jpg"
		style=" background-repeat:no-repeat ;
		background-size:100% 100%;
		background-attachment: fixed;">
<center>
	<h1 ><font  color = "#7297bd">航班数据</font></h1>
	<%
	String rowKey=(String)request.getAttribute("row");
	List<Flight> list=HBaseUtils.getFlight(rowKey); 
	
	int n=list.size();
	out.print("<table border='1px' class='hovertable' >");
	%>
	 <tr>
        <th>日期</th>
        <th>星期</th>
        <th>出发时间</th>
        <th>到达时间</th>
        <th>航班</th>
        <th>运行时间</th>
        <th>飞行时间</th>
        <th>起飞地</th>
        <th>目的地</th>
        <th>距离(英里)</th>
        <th>延误时间(分钟)</th>
        <th>状态</th>
        
     </tr>
	<% 
	for(int i=0;i<n;i++){
		out.print("<tr>");		
			out.print("<td>");
			out.print(list.get(i).getDate());
			out.print("</td>");		
			out.print("<td>");
			out.print(list.get(i).getWeek());
			out.print("</td>");		
			out.print("<td>");
			out.print(list.get(i).getDep());
			out.print("</td>");		
			out.print("<td>");
			out.print(list.get(i).getArr());
			out.print("</td>");		
			out.print("<td>");
			out.print(list.get(i).getFlight());
			out.print("</td>");		
			out.print("<td>");
			out.print(list.get(i).getAct());
			out.print("</td>");		
			out.print("<td>");
			out.print(list.get(i).getAir());
			out.print("</td>");		
			out.print("<td>");
			out.print(list.get(i).getOrigin());
			out.print("</td>");		
			out.print("<td>");
			out.print(list.get(i).getDest());
			out.print("</td>");		
			out.print("<td>");
			out.print(list.get(i).getDistance());
			out.print("</td>");	
			
			double num = list.get(i).getCarrier()+list.get(i).getWeather()+
					list.get(i).getNAS()+list.get(i).getSecurity()+
					list.get(i).getAircraft();
			out.print("<td>");
			out.print(num);
			out.print("</td>");	
			
			out.print("<td>");
			if(list.get(i).getCancelled()==0){
				out.print("正常");
			}else{
				out.print("取消:");
			}
			
			if(list.get(i).getCancelled()!=0){
			
			switch(list.get(i).getCode()){
			case "A":out.print("运营商原因");break;
			case "B":out.print("天气原因");break;
			case "C":out.print("NAS原因");break;
			case "D":out.print("安全原因");break;
			default :out.print("未知原因");
			}
			
				
			}
		out.print("</td>");			
		out.print("</tr>");
	}
	out.print("</table>");
	%>
	 <p>
      <a href="#" class="a_demo_two"  id="recomm">
       	推荐航班
      </a>
    
     </p>
	</center>
	<script type="text/javascript">
	function getParam() {
		/* 用途: 接收地直栏参数 取id=1 根据ID的值 */
		urlinfo=window.location.href; //获取当前页面的url
		len=urlinfo.length;//获取url的长度
		offset=urlinfo.indexOf("=");//设置参数字符串开始的位置
		var name=urlinfo.substr(offset,len);//取出参数字符串 这里会获得类似“id=1”这样的字符串
		return name;
		}
	document.getElementById("recomm").href='RecommServlet?origin'+getParam();
	</script>
</body>
</html>