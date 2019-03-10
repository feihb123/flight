package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;


import hbase.HBaseUtils;



@WebServlet("/DesServlet")
public class DesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> list=new ArrayList<>();
		
		String origin = request.getParameter("origin");
		System.out.println(origin);
		//String rowKey=origin;
		String des=HBaseUtils.getDesAirport(origin);
		String dess[]=des.split("/");
		for(String value:dess){
			list.add(value);
		}
		PrintWriter out = null;
		//System.out.println(des);
		//response.getWriter().write(JSON.toString(dess));
		out = response.getWriter();
		out.print(JSON.toJSONString(list));
		request.setAttribute("des", des);
		//System.out.println(rowKey);
		
		
		//request.getRequestDispatcher("data.jsp?rowKey="+rowKey).forward(request, response);
		
		//request.getRequestDispatcher("info.jsp?rowKey="+rowKey).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
