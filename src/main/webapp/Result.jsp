<%--Document   : Result--%>

<%@page import="com.pojo.Student"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.QuestionDao"%>
<%@page import="com.pojo.Questions"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;800&family=Varela+Round&display=swap"
	rel="stylesheet">
<title>Result</title>


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



</style>


<% 	Student student = (Student)session.getAttribute("student"); %>


</head>
<body>
<%
String[] dbans = new String[100];
int subjectid = Integer.parseInt((request.getParameter("subject_id")));
List<Questions> allQuestions = new QuestionDao().getAllQuestionsBySubject(subjectid);
int i = 0;
int score = 0;
String result = "pass";
int size = allQuestions.size();
for(Questions e : allQuestions){
	
	dbans[i] = e.getAns();
	  i++;
}
String[] userans = new String[100];
for(int j = 0 ; j < size ; j++)
{
	userans[j] = request.getParameter(Integer.toString(j));
}
int correctanswer=0;
int unattempted = 0;
int wronganswer=0;
for(int k = 0 ; k< size;k++)
{
	if(userans[k].equals(dbans[k]))
	{
		correctanswer++;
		score = score+2;
	}
	else if(userans[k].equals("e"))
	{
		unattempted++;
	}
	else
	{
		
		wronganswer++;
	}
}
int attemped = size - unattempted;

	if(score>=7){
		result="pass";
	}
	else{
		result="Fail";
	}
%>

<nav>
		<h1>
			<a href="#">QuiZy</a>
		</h1>
		<ul>
			<li><a href="studentProfile.jsp">Home</a></li>
		</ul>
</nav>



<form action="ResultServlet" method="post">

<table class="table table-hover">
  <thead>
    <tr class="table-warning">
      <th style="background-color: #B4D4FF;" colspan="3" scope="col"><center><pre><h4 style="font-size: 45px; ">Your Result</h4></pre></center></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td style="font-weight: bold;">Total no. of Questions</td>
      <td><%=size %></td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td style="font-weight: bold;">Number Of Questions Attempted</td>
      <td><%=attemped %></td>
    </tr>
    <tr>
      <th  scope="row">3</th>
      <td style="font-weight: bold;" >Number of Correct Answers</td>
      <td ><h4><font color="green"><%=correctanswer %></h4></font></td>
    </tr>
     <tr>
      <th  scope="row">4</th>
      <td style="font-weight: bold;">Number of Wrong Answers</td>
      <td ><font color="red"><h4><%=attemped-correctanswer %></h4></font></td>
    </tr>
  </tbody>
</table>

<div style="display: flex; justify-content: space-evenly;">


<h3 style="text-align: center; color: #144272; ">Score: <span style="font-size: 40px;"><%=score%></span>/20 </h3>

<%if(result.equals("pass")) {%>
	<h3 style="text-align: center; color: #144272; ">Result: <span style="font-size: 40px; color: green;"><%=result %></span> </h3>
<%} else{%>
	<h3 style="text-align: center; color: #144272; ">Result: <span style="font-size: 40px; color: red;"><%=result %></span> </h3>
<%} %>

</div>


<input type="hidden" name="action" value="addResult">

<input type="hidden" name="student_name" value="<%=student.getName()%>">
<input type="hidden" name="subject_id" value="<%=subjectid%>">
<input type="hidden" name="marks" value="<%=score%>/20">
<input type="hidden" name="result" value="<%=result%>">

<center>
<input  type="submit" value="Exit" class="btn btn-outline-danger btn-lg">
</center>

</form>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>
