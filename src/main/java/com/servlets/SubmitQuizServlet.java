package com.servlets;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SubmitQuizServlet")
public class SubmitQuizServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// Simulating correct answers; in a real scenario, fetch these from the database
        String[] correctAnswers = { "A", "B", "C", "D" };
        
        int score = 0;

        // Retrieve selected answers for each question
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            String[] paramValues = request.getParameterValues(paramName);
            if (paramValues != null && paramValues.length > 0) {
                String selectedAnswer = paramValues[0];
                int questionIndex = Integer.parseInt(paramName.substring(paramName.lastIndexOf('_') + 1)) - 1;
                
                if (correctAnswers.length > questionIndex && selectedAnswer.equals(correctAnswers[questionIndex])) {
                    score++;
                }
            }
        }

        // Store the score in session or a database table for the user
        // For demonstration, just printing the score
        System.out.println("Score: " + score);
		
	}

	
}
