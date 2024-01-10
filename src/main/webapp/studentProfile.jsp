<%@page import="com.pojo.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Profile</title>

<% Student s = (Student)session.getAttribute("student"); %>

<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;800&family=Varela+Round&display=swap" rel="stylesheet">


<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Varela Round', sans-serif;
}

/* NavBar */

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


/* Main Section */

section{
	text-align: center;
}

.profile {
	text-align: center;
	margin: 15px 0;
}

.profile img{
	width: 140px;
	height: 150px;
	border-radius: 50%;
	box-shadow: 14px 7px 7px silver;
	
}

.profile h1 {
	color: #144272;
	font-size: 35px;
}


.cards {
	display: grid;
	    grid-template-columns: 293px 311px;
	justify-content: center;
}
.cards h2{
	background-color: #144272;
	padding: 22px;
	margin: 40px;
	border-radius: 20px;
	text-align: center;
	transition: 0.2s;
}
.cards h2 a{	
	text-decoration: none;
	color: white;
	
}
.cards h2:hover{
	box-shadow: 15px 15px 20px silver;
}




</style>

</head>
<body>

	<nav>
		<h1>
			<a href="home.jsp">QuiZy</a>
		</h1>
		<ul>
			<li><a href="LoginServlet?action=logout">Log Out</a></li>
		</ul>
	</nav>


	<section>
		<div class="profile">
			<img src="Resources\\images\\<%=s.getImage()%>">
			<h1>Welcome <br> <span style="font-size:45px;"><%=s.getName() %></span> </h1>
		</div>
		
		<div class="cards">
			<h2><a href="InstructionServlet?action=quizIntro">Attempt Quiz</a></h2>
			<h2><a href="ResultServlet?action=resultByStudent&&student_name=<%=s.getName()%>">View Result</a></h2>
			<h2><a href="StudentServlet?action=editProfile&&id=<%=s.getId()%>">Edit Profile</a></h2>
		</div>
		
	</section>


</body>
<script src="https://kit.fontawesome.com/8d9f07e2a1.js" crossorigin="anonymous"></script>
</html>