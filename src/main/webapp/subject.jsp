<%@page import="com.pojo.Student"%>
<%@page import="com.pojo.Subject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Subject List</title>

<% List<Subject> slist = (List<Subject>)session.getAttribute("slist"); 
   Student student = (Student)session.getAttribute("student");
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

.ball1{
		 position: absolute;
    	 width: 100%;
    	 height: 100%;
    	 top: 0;
     	 left: 0;
   	   	 clip-path: circle(217px at right 310px);
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
		<%if(student!=null) {%>
			<li><a href="home.jsp">Home</a></li>
		<%} else{%>
			<li><a href="adminPanal.jsp">Admin Panal</a></li>
		</ul>
		<%} %>
</nav>

<%if(student==null) {%>
	<!-- <div class="profile">
		<i class="fa-solid fa-user"></i>
		<h1>Admin</h1>
	</div> -->
<%} %>	
	
	<div class="section" align="center" border="2px">
		
		<%if(student!=null) {%>
			<h1>Select Subject TO Attempt Quiz</h1>
		<%}else{ %>
			<h1>All Subjects</h1>
			<h2 class="btn"><a href="addSubject.html">Add Subject +</a></h2>
		<%} %>

			<table>
				<tr>
					<th>Sr.No</th>
					<th>Subject</th>
				 <%if(student!=null) {%>
					<th>Attempt Quiz</th>
				 <%}else{ %>	
					<th>Delete</th>
					<th>Edit</th>
					<th>Add Question</th>
				 <%} %>	
				</tr>
				
				<% for(Subject s : slist) {%>
					<tr>
						<td><%=s.getId() %></td>
						<td><%=s.getSubject_name() %></td>
						<%if(student!=null) {%>
							<td><a href="InstructionServlet?action=quizIntro">Quiz</a></td>
						<%}else{ %>
							<td><a href="SubjectServlet?action=deleteSubject&&id=<%=s.getId()%>"><i class="fa-solid fa-trash"></i></a></td>
							<td><a href="SubjectServlet?action=editSubject&&id=<%=s.getId()%>"><i class="fa-solid fa-pen-to-square"></i></a></td>
							<td><a href="QuestionServlet?action=add"><i class="fa-solid fa-plus"></i></a></td>
						<%} %>
					</tr>
				<%} %>
				
			</table>
		
		
	</div>
	
	<div class="ball1"></div>
	<div class="ball2"></div>
	

</body>
<script src="https://kit.fontawesome.com/8d9f07e2a1.js" crossorigin="anonymous"></script>
</html>