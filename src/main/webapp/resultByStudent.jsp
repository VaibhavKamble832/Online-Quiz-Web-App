<%@page import="com.pojo.Result"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;800&family=Varela+Round&display=swap"
	rel="stylesheet">
<head>
<meta charset="ISO-8859-1">
<title>Student Result</title>

<% List<Result> rlist = (List<Result>)session.getAttribute("resultListByStudent"); %>

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

/*Table Design*/

.section{
	 margin: 10px;
}
.section h1{
	font-size: 50px;
	color: #144272;
	margin-bottom: 20px;
}
.section table{
	border-collapse: collapse;
}

th, td{
	text-align: left;
	padding: 10px;
	border: 2px solid #144272;
}

th{
	background-color: #144272;
	color: white;
	border: 2px solid #092e54;
	
	
}
td{
	color: #092e54;
}

.fa-trash{
	color: #C70039;
}


 .ball1{
		 position: absolute;
    	 width: 100%;
    	 height: 100%;
    	 top: 0;
     	 left: 0;
   	   	 clip-path: circle(217px at right 375px);
    	 background-color: #144272;
	 }
     .ball2{
		 position: absolute;
    	 width: 100%;
    	 height: 100%;
    	 top: 0;
     	 left: 0;
   	   	 clip-path: circle(380px at left 701px);
    	 background-color: #144272;
	 } 




</style>


</head>
<body>

	<nav>
		<h1>
			<a href="home.jsp">QuiZy</a>
		</h1>
		<ul>
			<li><a href="studentProfile.jsp">Home</a></li>
		</ul>
	</nav>
	
	
	<div class="section" align="center" border="2px">

			<h1>YOUR RESULTS</h1>

			<table>

				<tr>
					<th>SUBJECT</th>
					<th>MARKS</th>
					<th>RESULT</th>
					<th>ATTEMPT_DATE</th>				
				</tr>

				<% for (Result r : rlist) { %>
				<tr>
					<td><%= r.getSubject_name() %></td>
					<td><%= r.getMarks() %></td>
					<td><%= r.getResult() %></td>
					<td><%= r.getAttempt_date() %></td>
			
				</tr>

				<% }%>
			</table>
	</div>
	
	<div class="ball1"></div>
	<div class="ball2"></div>
	


</body>
<script src="https://kit.fontawesome.com/8d9f07e2a1.js" crossorigin="anonymous"></script>
</html>