package com.servlets;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.StudentDao;
import com.mysql.cj.Session;
import com.pojo.Student;

@MultipartConfig
@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	Student student = new Student();
	StudentDao studentDao = new StudentDao();


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("do get");
		PrintWriter out = response.getWriter();


		HttpSession session = request.getSession();
		String action = request.getParameter("action");

		if(action!=null && action.equals("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			boolean b = studentDao.deleteStudent(id);
			if(b) {
				response.sendRedirect("StudentServlet");
			}
			else {
				response.sendRedirect("StudentServlet");
			}
		}
		if(action!=null && action.equals("editProfile")) {
			int id = Integer.parseInt(request.getParameter("id"));
			Student student = studentDao.getStudentById(id);
			session.setAttribute("student", student);
			response.sendRedirect("editStudentProfile.jsp");
			
		}
		else if(action!=null && action.equals("searchStudent")) {
			String searchName = request.getParameter("searchName");
			List<Student> searchList = studentDao.searchStudentsByName(searchName);
			session.setAttribute("slist", searchList);
			response.sendRedirect("studentList.jsp");
			
		}
		
		else {			
			List<Student> slist = studentDao.getAllStudent();
			session.setAttribute("slist", slist);
//			System.out.println(slist);
			response.sendRedirect("studentList.jsp");
		}




	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("do post");

		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		Part file = request.getPart("image");
		String imageFileName = file.getSubmittedFileName();

		String uploadPath = "C:\\Users\\vaibh\\InternArmy_WorkSpace\\QuizApplication\\src\\main\\webapp\\Resources\\images\\"+imageFileName;

		try {
			FileOutputStream fos = new FileOutputStream(uploadPath);
			InputStream is = file.getInputStream();

			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();


			String action = request.getParameter("action");
			String name = request.getParameter("name");
			String contact = request.getParameter("contact");
			String email = request.getParameter("email");
			String username = request.getParameter("username");
			String password = request.getParameter("password");

			student.setName(name); student.setContact(contact);
			student.setEmail(email); student.setUsername(username); 
			student.setPassword(password); student.setImage(imageFileName);


			if(action!=null && action.equals("register")) {
				boolean b = studentDao.addStudent(student);

				if(b) {
					response.setContentType("text/html");
					out.print("<h3 style='color:green; position:absolute; right:100px; top:100px; font-size:24px'>Successfully Registered...</h3>");

					RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
					rd.include(request, response);
				}
				else {
					response.setContentType("text/html");
					out.print("<h3 style='color:red; position:absolute; right:100px; top:100px; font-size:14px'>Registraion Failed...</h3>");

					RequestDispatcher rd = request.getRequestDispatcher("studentregister.html");
					rd.include(request, response);
				}

			}
			else if(action!=null && action.equals("editStudent")) {
				int id = Integer.parseInt(request.getParameter("id"));
				student.setId(id);
				
				boolean b = studentDao.updateStudent(student);

				if(b) {
					response.setContentType("text/html");
					out.print("<h3 style='color:green; position:absolute; right:100px; top:100px; font-size:24px'>Profile Edited Successfully...</h3>");

					RequestDispatcher rd = request.getRequestDispatcher("studentProfile.jsp");
					rd.include(request, response);
				}
				else {
					response.setContentType("text/html");
					out.print("<h3 style='color:red; position:absolute; right:100px; top:100px; font-size:14px'>Failed to Edit Profile...</h3>");

					RequestDispatcher rd = request.getRequestDispatcher("studentProfile.jsp");
					rd.include(request, response);
				}

			}
			
			
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
