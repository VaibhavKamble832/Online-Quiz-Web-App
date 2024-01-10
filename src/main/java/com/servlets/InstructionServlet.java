package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.InstructionDao;
import com.pojo.Instructions;
import com.pojo.Student;


@WebServlet("/InstructionServlet")
public class InstructionServlet extends HttpServlet {
	
	Instructions instructions = new Instructions();
	InstructionDao instructionDao = new InstructionDao();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("do get");
	
		
		HttpSession session = request.getSession();
		String action = request.getParameter("action");

		if(action!=null && action.equals("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			boolean b = instructionDao.deleteInstructions(id);
			if(b) {
				response.sendRedirect("InstructionServlet");
			}
			else {
				response.sendRedirect("Instructions.jsp");	
			}
			
		}
		else if(action!=null && action.equals("edit")) {
			int id = Integer.parseInt(request.getParameter("id"));
			Instructions instructions = instructionDao.getInstructionById(id);
			session.setAttribute("instructions", instructions);
			response.sendRedirect("editInstruction.jsp");
		}
		else if(action!=null && action.equals("quizIntro")) {
			List<Instructions> ilist = instructionDao.getAllInstructions();
			session.setAttribute("ilist", ilist);
			response.sendRedirect("quizIntro.jsp");		
		}
		else {			
			List<Instructions> ilist = instructionDao.getAllInstructions();
			session.setAttribute("ilist", ilist);
			response.sendRedirect("Instructions.jsp");		
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("do post");
		PrintWriter out = response.getWriter();
	
		String action = request.getParameter("action");
		String instruction = request.getParameter("instruction");
		instructions.setInstruction(instruction);
		
		
		if(action!=null && action.equals("addInstruction")) {
			boolean b = instructionDao.addInstruction(instructions);
			
			if(b) {
				response.setContentType("text/html");
				out.print("<h3 style='color:green; position:absolute; right:100px; top:100px; font-size:24px'>Successfully Added...</h3>");
				
				RequestDispatcher rd = request.getRequestDispatcher("Instructions.jsp");
				rd.include(request, response);
				doGet(request, response);
			}
			else {
				response.setContentType("text/html");
				out.print("<h3 style='color:red; position:absolute; right:40%; top:18%; font-size:20px'>Failed to Add...</h3>");
				
				RequestDispatcher rd = request.getRequestDispatcher("Instructions.jsp");
				rd.include(request, response);
			}
		
		}
		
		else if(action!=null && action.equals("editInstruction")){
			int id = Integer.parseInt(request.getParameter("id"));
			instructions.setId(id);
			
			boolean b = instructionDao.editInstruction(instructions);
			if(b) {
				response.setContentType("text/html");
				out.print("<h3 style='color:green; position:absolute; right:100px; top:100px; font-size:24px'>Successfully Added...</h3>");
				
				RequestDispatcher rd = request.getRequestDispatcher("Instructions.jsp");
				rd.include(request, response);
				doGet(request, response);
			}
			else {
				response.setContentType("text/html");
				out.print("<h3 style='color:red; position:absolute; right:40%; top:18%; font-size:20px'>Failed to Add...</h3>");
				
				RequestDispatcher rd = request.getRequestDispatcher("Instructions.jsp");
				rd.include(request, response);
			}
		}
		
	}

}
