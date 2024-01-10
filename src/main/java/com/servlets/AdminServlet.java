package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("do get");
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("do post");

		PrintWriter out = response.getWriter();

		String username = "IamAdmin";
		String password = "admin123";
		
		String inputUsername = request.getParameter("username");
		String inputPassword = request.getParameter("password");
		
		if(inputUsername.equals(username) && inputPassword.equals(password)) {
			RequestDispatcher rd = request.getRequestDispatcher("adminPanal.jsp");
			rd.include(request, response);
		}
		else {
			response.setContentType("text/html");
			out.print("<h3 style='color:red; position:absolute; right:37.5%; top:18%; font-size:20px'>Incorrect Admin Username or Password</h3>");

			RequestDispatcher rd = request.getRequestDispatcher("adminlogin.html");
			rd.include(request, response);

		}
		
	}

}
