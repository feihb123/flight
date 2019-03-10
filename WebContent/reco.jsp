<%@page import="org.jruby.ast.VAliasNode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="hbase.HBaseUtils"%>
<%@page import="java.util.List"%>
<%@page import="pojo.Flight"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

     <title>推荐航班</title>

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
        <div class="overlay"></div>
          <div class="container">
               <div class="row">

                    <div class="col-md-12 col-sm-12">
                         <div class="home-info">
                              <h1>当日航班推荐</h1>
                              <!-- You can change the date time in init.js file -->
                              <ul class="countdown">
                                 <%
                                 //获取url中参数
                                 HttpServletRequest httpRequest=(HttpServletRequest)request;
                                 String str = httpRequest.getQueryString();
                                 String [] strs=str.split("=");
                                 String rowKey=strs[1];
                                 List<Flight> list=HBaseUtils.getFlight(rowKey); 
                                 Flight v=new Flight();
                                 v.setAct(9999);
                                 v.setAir(9999);
                                 
                                 Flight time=new Flight();
                                 time.setAct(9999);
                                 time.setAir(9999);
                                 
                                 for(Flight value:list){
                                	 /* if(v.getFlight()==null){
                                		 v=value;
                                		 time=value;
                                	 } */
                                	 if(value.getCancelled()==0&&value.getAct()<time.getAct()){
                                		 time=value;
                                	 }
                                	 
                                	 if(value.getCancelled()==0&&value.getAir()<v.getAir()){
                                		 v=value;
                                	 }
                                 }
                                
                                
                                		 
                                 
                                 %> 
                                 <img alt="50" src="images/plane.png">
                                 <br>
                                   <li>
                                   
                                        <span class="days"><%out.print(v.getFlight());%></span>
                                        <h3><%out.print("飞行速度: "+String.format("%.2f", v.getDistance()/v.getAir())+" 英里/分钟");%></h3>
                                   </li>
                                   <br>
                                   <li>
                                        <span class="hours"><%out.print(time.getFlight()); %></span>
                                        <h3><%out.print("运行时间："+time.getAct()+" 分钟"); %></h3>
                                   </li>
                                 <a href="javascript:history.back(-1)" class="btn btn-primary btn-block"  id="recomm">
       								返回上页
      							 </a>
                              </ul>
                              
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