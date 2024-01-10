package com.servlets;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.SubjectDao;
import com.pojo.Subject;

@WebServlet("/SubjectServlet")
public class SubjectServlet extends HttpServlet {

	Subject subject = new Subject();
	SubjectDao subjectDao = new SubjectDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String action = request.getParameter("action");

		if(action!=null && action.equals("deleteSubject")) {
			int id = Integer.parseInt(request.getParameter("id"));
			boolean b = subjectDao.deleteSubject(id);
			if(b) {
				response.sendRedirect("SubjectServlet");
			}
			else {
				response.sendRedirect("subject.jsp");

			}
		}
		else if(action!=null && action.equals("editSubject")) {
			int id = Integer.parseInt(request.getParameter("id"));
			Subject subject = subjectDao.getSubjectById(id);
			session.setAttribute("subject", subject);
			response.sendRedirect("editSubject.jsp");
		}

		else {

			List<Subject> slist = subjectDao.getAllSubject();
			session.setAttribute("slist", slist);
			response.sendRedirect("subject.jsp");			
		}




	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();

			String action = request.getParameter("action");
			String subject_name = request.getParameter("subject_name");
			subject.setSubject_name(subject_name);


			if(action!=null&& action.equals("addSubject")) {

				boolean b = subjectDao.addSubject(subject);
				if(b) {
					response.sendRedirect("SubjectServlet");
				}
				else {
					response.sendRedirect("subject.jsp");
				}
			}

			else if(action!=null && action.equals("editSubject")) {

				int id = Integer.parseInt(request.getParameter("id"));
				subject.setId(id);

				boolean b = subjectDao.updateSubject(subject);
				if(b) {
					response.sendRedirect("SubjectServlet");
				}
				else {
					response.sendRedirect("subject.jsp");				
				}
			}

	}

}
