package com.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ResultDao;
import com.dao.SubjectDao;
import com.pojo.Result;
import com.pojo.Subject;


@WebServlet("/ResultServlet")
public class ResultServlet extends HttpServlet {

	Result result = new Result();
	ResultDao resultDao = new ResultDao();
	SubjectDao subjectDao = new SubjectDao();


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String action = request.getParameter("action");

		if(action!=null && action.equals("resultByStudent")) {
			String name = request.getParameter("student_name");
			List<Result> resultListByStudent = resultDao.getResultByStudent(name);
			session.setAttribute("resultListByStudent", resultListByStudent);
			response.sendRedirect("resultByStudent.jsp");
		}

		else {
			List<Result> resultList = resultDao.getAllResult();
			List<Subject> subjecttList = subjectDao.getAllSubject();

			session.setAttribute("resultList", resultList);
			session.setAttribute("subjectList", subjecttList);

			response.sendRedirect("studentResult.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String action = request.getParameter("action");
		HttpSession session = request.getSession();

		if(action!=null && action.equals("addResult")) {

			String student_name = request.getParameter("student_name");
			int subject_id = Integer.parseInt(request.getParameter("subject_id"));
			String marks = request.getParameter("marks");
			String student_result = request.getParameter("result");

			result.setStudent_name(student_name);
			result.setSubject_id(subject_id);
			result.setMarks(marks);
			result.setResult(student_result);

			boolean b = resultDao.addResult(result);
			if(b) {
				response.sendRedirect("studentProfile.jsp");
			}
			else {
				response.sendRedirect("studentProfile.jsp");
			}
		}
		
		else if(action!=null && action.equals("sortByName")) {
			
			String name = request.getParameter("studentName");
			List<Result> resultListByStudent = resultDao.getResultByStudent(name);
			session.setAttribute("resultList", resultListByStudent);
			response.sendRedirect("studentResult.jsp");
			
		}
		
		else if(action!=null && action.equals("sortBySubject")) {
			
			int subjectId  = Integer.parseInt(request.getParameter("subject_id"));
			List<Result> resultListBySubject = resultDao.getResultBySubject(subjectId);
			session.setAttribute("resultList", resultListBySubject);
			response.sendRedirect("studentResult.jsp");
			
		}
		
		else if(action!=null && action.equals("sortByResult")) {
			
			String result = request.getParameter("Result");
			List<Result> resultListByResults = resultDao.getResultByResult(result);
			session.setAttribute("resultList", resultListByResults);
			response.sendRedirect("studentResult.jsp");
			
		}
		




	}

}
