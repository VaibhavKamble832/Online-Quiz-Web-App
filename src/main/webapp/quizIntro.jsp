<%@page import="com.dao.SubjectDao"%>
<%@page import="com.pojo.Subject"%>
<%@page import="com.pojo.Instructions"%>
<%@page import="java.util.List"%>
<%@page import="com.pojo.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quiz Intro</title>

<% Student student = (Student)session.getAttribute("student"); 
   List<Instructions> ilist = (List<Instructions>)session.getAttribute("ilist");
   List<Subject> slist = new SubjectDao().getAllSubject();
%>


<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;800&family=Varela+Round&display=swap" rel="stylesheet">

<style>

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Varela Round', sans-serif;
}

nav {
	background-color: #144272;
	display: flex;
	justify-content: space-between;
	padding: 23px;
}

nav h1 a {
	font-size: 30px;
	color: white;
	margin-left: 35px;
	text-decoration: none;
}

nav ul {
	display: flex;
}

nav ul li {
	list-style: none;
}

nav ul li a {
	font-size: 25px;
	color: white;
	text-decoration: none;
	margin-right: 30px;
	padding: 6px 0;
	transition: 0.7s;
}

.active, nav ul li a:hover {
	border-bottom: 2px solid white;
}

section{
	margin: 40px auto;
  	width: 45%;
	background-color: #144272;
	padding: 20px; 
	border-radius: 40px;
	
	
}
section h1{
	color: white;
	font-size: 40px;
	margin-bottom: 20px;
	padding: 10px;
	border-bottom: 2px solid white;
	
}
section h3{
	color: white;
	font-weight: lighter;
	margin-bottom: 25px;
	font-size: 25px;
}

section p{
	font-size: 20px;
	color: white;
	margin-bottom: 10px	
}
section .instr{
	margin-bottom: 35px;
}
section h2 input{
	color: #144272;
	text-decoration: none;
	background-color: white;
	text-align: right;
	padding: 6px 10px;
	border-radius: 10px;
	margin-left: 73%;
}

section select{
	 	padding: 12px 58px;
    	margin: 12px;
    	text-align: left;
    	border: none;
    	outline: none;
    	color: #144272;
    	font-size: 17px;
    	border-radius: 10px;
	 }

</style>

</head>
<body>

<nav>
		<h1>
			<a href="#">QuiZy</a>
		</h1>
		<ul>
			<li><a href="studentProfile.jsp">Home</a></li>
		</ul>
</nav>

<section>

<form action="QuizDemoo.jsp" method="get">

	<input type="hidden" name="action" value="startQuiz">
	<input type="hidden" name="student_id" value="<%=student.getId()%>">

	<h1>BEST OF LUCK <span style="margin-left: 20px"><%=student.getName() %></span></h1>
	
	<select name="Qbysubject_id">
		<option value="0">--Select Subject--</option>
		<%for(Subject s:slist) {%>
			<option value="<%=s.getId()%>"><%=s.getSubject_name() %></option>
		<%} %>
	</select>
	
	<h3>Read and follow the guidelines given below before attempting Quiz....</h3>
	
	<div class="instr">
		<% for(Instructions i:ilist) {%>
			<p>- <%=i.getInstruction() %></p>
		<%} %>
	</div>
	
	<h2><input type="submit" value="Start Quiz"></h2>
	
</form>
	
</section>




</body>
</html>