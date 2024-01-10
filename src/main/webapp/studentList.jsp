<%@page import="java.util.List"%>
<%@page import="com.pojo.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Student</title>

<% List<Student> slist = (List<Student>)session.getAttribute("slist"); %>

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


/*Table Design*/



.section{
	 margin: 10px;
}
.section h1{
	font-size: 40px;
	color: #144272;
	margin-bottom: 10px;
	font-weight: bold;
}
.section form .search{
	outline: none;
	border: none;
	font-size: 18px;
	padding: 10px 20px 10px 10px;
	background-color: #a5b8cc;	
	border-radius: 10px;
	margin-bottom: 10px;	
} 
.section form .search::placeholder{
	
	color: #144272;
	
}
.section form .search:focus{
	color: #144272;
}

.section form .btn{
	font-size: 17px;
	margin-left: 10px;
	outline: none;
	border: none;
	padding: 10px 20px;
	background-color: #144272;	
	border-radius: 8px;
	margin-bottom: 10px;	
	color: white;
	cursor: pointer;
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
			<li><a href="adminPanal.jsp">Admin Panel</a></li>
		</ul>
	</nav>

	<!--  <div class="profile">
		<i class="fa-solid fa-user"></i>
		<h1>Admin</h1>
	</div>-->


	<div class="section" align="center" border="2px">

			<h1>ALL STUDENT DETAILS</h1>
	
			<form action="StudentServlet" method="get" enctype="multipart/form-data" style="display: flex; flex-direction: row; justify-content: center; align-items: flex-start;">
				<input type="hidden" name="action" value="searchStudent">
		
				<input type="text" name="searchName" placeholder="search student by name...." class="search">
				<input type="submit" value="Search" class="btn">
			</form>

			<table>

				<tr>
					<th>ID</th>
					<th>NAME</th>
					<th>PROFILE</th>
					<th>CONTACT</th>
					<th>EMAIL</th>
					<th>USERNAME</th>				
					<th>DELETE</th>
				</tr>

				<% for (Student s : slist) { %>
				<tr>
					<td><%= s.getId() %></td>
					<td><%= s.getName() %></td>
					<td><img style="width: 60px; height:100px;" src="Resources\\images\\<%=s.getImage()%>"></td>
					<td><%= s.getContact() %></td>
					<td><%= s.getEmail() %></td>
					<td><%= s.getUsername()%></td>
					<td><a href="StudentServlet?action=delete&&id=<%=s.getId()%>"><i class="fa-solid fa-trash"></i></a></td>
			
				</tr>

				<% }%>
			</table>
	</div>

	<!-- 
	<div class="ball1"></div>
	<div class="ball2"></div>
	 -->

</body>
<script src="https://kit.fontawesome.com/8d9f07e2a1.js" crossorigin="anonymous"></script>
</html>