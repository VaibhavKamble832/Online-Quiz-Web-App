<%@page import="com.pojo.Questions"%>
<%@page import="java.util.List"%>
<%@page import="com.pojo.Subject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Questions</title>
</head>
<body>

<% List<Questions> qlist = (List<Questions>)session.getAttribute("qlist"); %>

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

/*Profile Design*/

.profile{
	margin: 20px 50px;
	display: flex;
}
.profile .fa-user{
	color: white;
	font-size: 25px;
	border: 2px solid #144272;
	padding: 5px;
	border-radius: 50%;
	background-color: #144272; 
}
.profile h1{
	color: #144272;
	margin-left: 10px;
}

/*Main Card Design*/

.section{
	 margin: 20px;
}
.section h1{
	font-size: 50px;
	color: #144272;
	margin-bottom: 50px;
}
.section .btn a{
	text-decoration: none;
	color: white;
	background-color: #144272;
	padding: 8px 20px;
	border-radius: 15px;
	display: -webkit-inline-box;
	margin-bottom: 30px;  
}

.section table{
	border-collapse: collapse;
	
}

th, td{
	text-align: left;
	padding: 10px 20px;
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
.fa-pen-to-square{
	color: #557C55;
}


</style>



</head>
<body>

<nav>
		<h1>
			<a href="home.jsp">QuiZy</a>
		</h1>
		<ul>
			<li><a href="adminPanal.jsp">Admin Panel</a></li>
		</ul>
	</nav>

	<!-- <div class="profile">
		<i class="fa-solid fa-user"></i>
		<h1>Admin</h1>
	</div> -->
	<div class="section" align="center" border="2px">
		
		<h1>All Questions</h1>
			
			<h2 class="btn"><a href="QuestionServlet?action=add">Add Questions +</a></h2>

			<table>
				<tr>
					<th>ID</th>
					<th>Question</th>
					<th>Option 1</th>
					<th>Option 2</th>
					<th>Option 3</th>
					<th>Option 4</th>
					<th>Answer</th>
					<th>Subject</th>
					<th>Delete</th>
					<th>Edit</th>
				</tr>
				
				<% for(Questions q : qlist) {%>
					<tr>
						<td><%=q.getId() %></td>
						<td><%=q.getQuestion()%></td>
						<td><%=q.getOpt1()%></td>
						<td><%=q.getOpt2()%></td>
						<td><%=q.getOpt3()%></td>
						<td><%=q.getOpt4()%></td>
						<td><%=q.getAns()%></td>
						<td><%=q.getSubject_name()%></td>
						<td><a href="QuestionServlet?action=deleteQuestion&&id=<%=q.getId()%>"><i class="fa-solid fa-trash"></i></a></td>
						<td><a href="QuestionServlet?action=editQuestion&&id=<%=q.getId()%>"><i class="fa-solid fa-pen-to-square"></i></a></td>
					</tr>
				<%} %>
				
			</table>
		
		
	</div>
	
	

</body>
<script src="https://kit.fontawesome.com/8d9f07e2a1.js" crossorigin="anonymous"></script>
</html>