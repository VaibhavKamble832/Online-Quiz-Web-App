package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.QuestionDao;
import com.dao.SubjectDao;
import com.pojo.Questions;
import com.pojo.Subject;



@WebServlet("/QuestionServlet")
public class QuestionServlet extends HttpServlet {

	Questions questions = new Questions();
	QuestionDao questionDao = new QuestionDao();
	SubjectDao subjectDao = new SubjectDao();

	
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action = request.getParameter("action");
		HttpSession session = request.getSession();

		if (action!=null && action.equals("add")) {

			List<Subject> subjectList = subjectDao.getAllSubject();
			session.setAttribute("subjectList", subjectList);
			response.sendRedirect("addQuestion.jsp");

		}
		else if(action!=null && action.equals("deleteQuestion")) {
			int id = Integer.parseInt(request.getParameter("id"));
			boolean b = questionDao.deleteQuestion(id);
			if(b) {
				response.sendRedirect("QuestionServlet");
			}
			else {
				response.sendRedirect("questions.jsp");
			}
		}
		else if(action!=null && action.equals("editQuestion")) {
			int id = Integer.parseInt(request.getParameter("id"));
			Questions question = questionDao.getQuestionById(id);
			session.setAttribute("question", question);
			List<Subject> slist = subjectDao.getAllSubject();
			session.setAttribute("slist", slist);
			response.sendRedirect("editQuestion.jsp");

		}

		else if(action!=null && action.equals("startQuiz")) {
			int id = Integer.parseInt(request.getParameter("Qbysubject_id"));
			response.sendRedirect("attemptQuiz.jsp");
			
			}
		
		
		else {
			List<Questions> qlist = questionDao.getAllQuestions();
			session.setAttribute("qlist", qlist);
			response.sendRedirect("questions.jsp");

		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		String action = request.getParameter("action");		
		int subjectid = Integer.parseInt(request.getParameter("subject_id"));
		String question = request.getParameter("question");
		String opt1 = request.getParameter("opt1");
		String opt2 = request.getParameter("opt2");
		String opt3 = request.getParameter("opt3");
		String opt4 = request.getParameter("opt4");
		String answer = request.getParameter("ans");

		questions.setQuestion(question);  questions.setOpt1(opt1);
		questions.setOpt2(opt2);  questions.setOpt3(opt3);
		questions.setOpt4(opt4);  questions.setAns(answer);
		questions.setSubject_id(subjectid);

		if(action!=null && action.equals("addQuestion")) {
			boolean b = questionDao.addQuestion(questions);
			if(b) {
				response.sendRedirect("QuestionServlet");
			}
			else {
				response.sendRedirect("questions.jsp");
			}
		}

		else if(action!=null && action.equals("updateQuestion")) {
			int id = Integer.parseInt(request.getParameter("id"));
			questions.setId(id);

			boolean b = questionDao.updateQuestion(questions);
			if(b) {
				response.sendRedirect("QuestionServlet");
			}
			else {
				response.sendRedirect("questions.jsp");
			}
		}

	}

}
