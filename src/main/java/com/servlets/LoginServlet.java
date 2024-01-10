package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.StudentDao;
import com.pojo.Student;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	Student student = new Student();
	StudentDao studentDao = new StudentDao();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("home.jsp");
		
		
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("do post");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String userType = request.getParameter("userType");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		if(userType!=null && userType.equals("admin")) {
			if(email!=null && password!=null && email.equals("admin123@gmail.com") && password.equals("admin123")) {
				session.setAttribute("admin", "admin");
				System.out.println("admin login");
				response.sendRedirect("adminPanal.jsp");
				
			}
			else{
				String loginMsg = "Invalid Email: '"+email+"' & Password: '"+password+"'...!";
				request.setAttribute("loginMsg", loginMsg);
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.include(request, response);
			}
		}
		else if(userType!=null && userType.equals("student")) {
			
			Student student = studentDao.loginStudent(email, password);
			
			if(student!=null) {
				System.out.println("student login");
				session.setAttribute("student", student);
				System.out.println(student);
				response.sendRedirect("studentProfile.jsp");
			}
			else {
				String loginMsg = "Invalid Email: '"+email+"' & Password: '"+password+"'...!";
				request.setAttribute("loginMsg", loginMsg);
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.include(request, response);
			}
		}
		else {
			response.setContentType("text/html");
			out.print("<h3 style='color:red; position:absolute; right:100px; top:100px; font-size:14px'>Login Failed...</h3>");

			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.include(request, response);
		}
	
	}

}