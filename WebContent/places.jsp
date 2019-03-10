<%@page import="servlet.DesServlet"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page import="hbase.HBaseUtils"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>航班系统</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    
    
    <link href="./Places_files/css" rel="stylesheet">

    <link rel="stylesheet" href="./Places_files/bootstrap.css">
    <link rel="stylesheet" href="./Places_files/animate.css">
    <link rel="stylesheet" href="./Places_files/ionicons.min.css">
    
    <link rel="stylesheet" href="./Places_files/owl.carousel.min.css">
    
    <link rel="stylesheet" href="./Places_files/flaticon.css">

    <link rel="stylesheet" href="./Places_files/bootstrap-datepicker.css">
    <link rel="stylesheet" href="./Places_files/font-awesome.min.css">

    <link rel="stylesheet" href="./Places_files/select2.css">
    

    <link rel="stylesheet" href="./Places_files/helpers.css">
    <link rel="stylesheet" href="./Places_files/style.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	
  </head>
  <body data-spy="scroll" data-target="#probootstrap-navbar" data-offset="200">
    
    
    
    <section class="probootstrap-cover overflow-hidden relative" style="background-image: url('Places_files/img_0.jpg');" id="section-home">
      <div class="overlay"></div>
      <div class="container">
        <div class="row align-items-center">
          <div class="col-md">
            <h2 class="heading mb-2 display-4 font-light probootstrap-animate fadeInUp probootstrap-animated">查询飞机航线</h2>
             
          <p class="lead mb-5 probootstrap-animate fadeInUp probootstrap-animated">
            </p>
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              <a href="all.html" role="button" class="btn btn-primary p-3 mr-3 pl-5 pr-5 text-uppercase d-lg-inline d-md-inline d-sm-block d-block mb-3">年度航班分析</a> 
            
            </p>

              

            </p>
            <p></p>
          </div> 
          <div class="col-md probootstrap-animate fadeInUp probootstrap-animated">
         <form action="FlightServlet" class="probootstrap-form">
          <div class="form-group">
                <div class="row mb-3">
                  <div class="col-md">
                    <div class="form-group">
                      <label for="id_label_single">始发地</label>
					
                      <label for="id_label_single" style="width: 100%;">
                        <select name="origin" class="js-example-basic-single js-states form-control select2-hidden-accessible"
                        onchange="check()" id="id_label_single" style="width: 100%;" data-select2-id="id_label_single" tabindex="-1" aria-hidden="true">
					<%
					List<String> list=HBaseUtils.getAirport();
					Iterator it = list.iterator();
					while (it.hasNext())
					{
					%>
					<option><%=it.next()%></option>
					
					<%
					}
					%>
                         
                         
                        </select>
                      </label>


                    </div>
                  </div>
                  <div class="col-md">
                    <div class="form-group">
                      <label for="id_label_single2">目的地</label>
                      <div class="probootstrap_select-wrap">
                        <label for="id_label_single2" style="width: 100%;">
                        <select name="dest" class="js-example-basic-single js-states form-control select2-hidden-accessible" id="id_label_single2" style="width: 100%;" data-select2-id="id_label_single2" tabindex="-1" aria-hidden="true">
                          <%
						//String des=HBaseUtils.getDesAirport(request.getParameter("des"));
						//Iterator it2 = list.iterator();
						//while (it2.hasNext())
						//{
						%>
						<option><%//out.print(des);=it2.next()%></option>
						
						<%
						//}
						%>
                        </select>
                      </label>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- END row -->
                <div class="row mb-5">
                  <div class="col-md">
                    <div class="form-group">
                      <label for="probootstrap-date-departure">航班时间(仅有2008年数据)</label>
                      <div class="probootstrap-date-wrap">
                        <span class="icon ion-calendar"></span> 
                        <input type="text" name="date" value="1/1/2008" id="probootstrap-date-departure.." class="form-control" placeholder="">
                      </div>
                    </div>
                  </div>
                 <!--  <div class="col-md">
                    <div class="form-group">
                      <label for="probootstrap-date-arrival">到达时间</label>
                      <div class="probootstrap-date-wrap">
                        <span class="icon ion-calendar"></span> 
                        <input type="text" id="probootstrap-date-arrival" class="form-control" placeholder="">
                      </div>
                    </div>
                  </div> -->
                </div>
                <!-- END row -->
                    <input type="submit" value="提交" class="btn btn-primary btn-block">
                  </form>
                  </div>
                </div>
              </div>
            
          </div>
        </div>
      </div>
    
    </section>
    <!-- END section -->
    

    <section class="probootstrap_section" id="section-city-guides">
      <div class="container">
        <div class="row text-center mb-5 probootstrap-animate fadeInUp probootstrap-animated">
          <div class="col-md-12">
            <h2 class="display-4 border-bottom probootstrap-section-heading">最佳旅游景点</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-3 col-md-6 probootstrap-animate mb-3 fadeInUp probootstrap-animated">
            <a href="#" class="probootstrap-thumbnail">
              <img src="./Places_files/img_1.jpg" alt="Free Template by ProBootstrap.com" class="img-fluid">
              <div class="probootstrap-text">
                <h3>Buena</h3>
              </div>
            </a>
          </div>
          <div class="col-lg-3 col-md-6 probootstrap-animate mb-3 fadeInUp probootstrap-animated">
            <a href="#" class="probootstrap-thumbnail">
              <img src="./Places_files/img_2.jpg" alt="Free Template by ProBootstrap.com" class="img-fluid">
              <h3>Road</h3>
            </a>
          </div>
          <div class="col-lg-3 col-md-6 probootstrap-animate mb-3 fadeInUp probootstrap-animated">
            <a href="#" class="probootstrap-thumbnail">
              <img src="./Places_files/img_3.jpg" alt="Free Template by ProBootstrap.com" class="img-fluid">
              <h3>Australia</h3>
            </a>
          </div>
          <div class="col-lg-3 col-md-6 probootstrap-animate mb-3 fadeInUp probootstrap-animated">
            <a href="#" class="probootstrap-thumbnail">
              <img src="./Places_files/img_4.jpg" alt="Free Template by ProBootstrap.com" class="img-fluid">
              <h3>Japan</h3>
            </a>
          </div>
        </div>
      </div>
    </section>
    

   
   <script>
	var xmlhttp;
	function check(){
	
	  var name = document.getElementById("id_label_single").value;
	  var url = "/flight/DesServlet?origin="+name;
	 
	  xmlhttp =new XMLHttpRequest();
	  xmlhttp.onreadystatechange=checkResult; //响应函数
	  xmlhttp.open("GET",url,true);   //设置访问的页面
	  xmlhttp.send(null);  //执行访问
	}
	 
	function checkResult(){
	  if (xmlhttp.readyState==4 && xmlhttp.status==200){
	   // document.getElementById('id_label_single2').options=xmlhttp.responseText;
	 // alert(xmlhttp.responseText);
	 // var res=JSON.parse(xmlhttp.responseText);  
	  var res = $.parseJSON(xmlhttp.responseText);//把后台传回的json数据解析
		var option;
		$.each(res,function(i,n){//循环，i为下标从0开始，n为集合中对应的第i个对象
			console.log(n);
			option += "<option value='"+n+"'>"+n+"</option>"
		});
		$("#id_label_single2").html(option);

	  }
	  }
	
	</script>
	
<script>
    $(function(){
        //按钮单击时执行
        $("#id_label_single3").change(function(){
        	//var html = '<option selected="selected" value="请先选出发地">请先选出发地</option>'; 
        	 var name = document.getElementById("id_label_single").value; 
              //Ajax调用处理
       $.ajax({
               type: "POST",                  	  
               url: "/flight/DesServlet?origin="+name,
               success: function(data){
            	   alert(data);
            	      var dataObj = data;
					con ="<option value=''>--请选择--</option>";
					/* $.each(JSON.parse(dataObj),function(i,dom){
						con += "<option value='"+dom.deptno+"'>"+dom.deptname+"</option>";
					}) */
					$(JSON.parse(dataObj)).each(function(){
						con += "<option value='"+this.deptno+"'>"+this.deptname+"</option>";
					})
            	       $("#id_label_single2").html(con);  //  绑定到页面
            }
             
         });
      });
    });
</script>
  <script src="./Places_files/jquery.min.js.下载"></script>
    
    <script src="./Places_files/popper.min.js.下载"></script>
    <script src="./Places_files/bootstrap.min.js.下载"></script>
    <script src="./Places_files/owl.carousel.min.js.下载"></script>
    
    <script src="./Places_files/bootstrap-datepicker.js.下载"></script>
    <script src="./Places_files/jquery.waypoints.min.js.下载"></script>
    <script src="./Places_files/jquery.easing.1.3.js.下载"></script>

    <script src="./Places_files/select2.min.js.下载"></script>

    <script src="./Places_files/main.js.下载"></script>
  
</body></html>