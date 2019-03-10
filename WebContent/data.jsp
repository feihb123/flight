<%@page import="org.jruby.ast.VAliasNode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="hbase.HBaseUtils"%>
<%@page import="java.util.List"%>
<%@page import="pojo.Flight"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

     <title>航班数据</title>

     <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=Edge">
     <meta name="description" content="">
     <meta name="keywords" content="">
     <meta name="team" content="">
     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

     <link rel="stylesheet" href="css/bootstrap.min.css">
     <link rel="stylesheet" href="css/vegas.min.css">
     <link rel="stylesheet" href="css/font-awesome.min.css">

     <!-- MAIN CSS -->
     <link rel="stylesheet" href="css/templatemo-style.css">
<style type="text/css">
table.hovertable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333388;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
	opacity: 0.9; 
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
<link rel="stylesheet" type="text/css" href="css/style2.css" />
</head>
<body>

     <!-- PRE LOADER -->
     <section class="preloader">
          <div class="spinner">

               <span class="spinner-rotate"></span>
               
          </div>
     </section>


     <!-- GRID LINE -->
    <section class="grid">
         <div class="container">
            <div class="row">

              <div class="col-md-2 col-sm-2">
                <div class="grid-line"></div>
              </div>
              <div class="col-md-2 col-sm-2">
                <div class="grid-line"></div>
              </div>
              <div class="col-md-2 col-sm-2">
                <div class="grid-line"></div>
              </div>
              <div class="col-md-2 col-sm-2">
                <div class="grid-line"></div>
              </div>
              <div class="col-md-2 col-sm-2">
                <div class="grid-line"></div>
              </div>

            </div>
         </div>
    </section>


    <div class="menu-bg"></div>
    <div class="menu-burger">☰</div>

    <div class="menu-items">
       <div class="container">
         <div class="row">
           <div class="col-md-offset-2 col-md-4 col-sm-6">
            <h1>Navigations</h1>
             <ul class="menu">
                <li><a href="#">Home</a></li>
                <li><a href="#">Our Studio</a></li>
                <li><a href="#">Journal</a></li>
                <li><a href="#">Start a project</a></li>
                <li><a href="#">Email Us</a></li>
            </ul>
           </div>

           <div class="col-md-4 col-sm-6">
             <address>
               <h1>Our Studio</h1>
               <p>1234 New Street View, <br> Kumasi, Ghana</p>
               
             </address>
           </div> 

           <div class="col-md-12 col-sm-12">
             <ul class="social-icon">
              <li class="line"></li>
               <li><a href="#" class="fa fa-facebook"></a></li>
               <li><a href="#" class="fa fa-twitter"></a></li>
               <li><a href="#" class="fa fa-google"></a></li>
               <li><a href="#" class="fa fa-instagram"></a></li>
             </ul>
           </div>
         </div>
       </div>
    </div><div class="tlinks">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>


     <!-- HOME -->
     <section id="home">
       
           <div class="container"> 
               <div class="row">

                    <div class="col-md-12 col-sm-12">
                         <div class="home-info">
                              
   <h1  ><font size="10" >航班数据</font></h1>
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
      <a href="#" class="btn btn-primary btn-block"  id="recomm">
       	推荐航班
      </a>
      
      <a href="javascript:history.back(-1)" class="btn btn-primary btn-block"  id="recomm">
       	返回上页
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
                              
                              
                              </div>
                         </div>
                    </div>

               </div>
          </div>
     </section>

     <!-- SCRIPTS -->
     <script src="js/jquery.js"></script>
     <script src="js/bootstrap.min.js"></script>
     <script src="js/vegas.min.js"></script>
     <script src="js/countdown.js"></script>
     <script src="js/init.js"></script>
     <script src="js/custom.js"></script>

</body>
</html>