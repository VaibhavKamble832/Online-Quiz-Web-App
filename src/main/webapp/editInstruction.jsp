<%@page import="com.pojo.Instructions"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Instructions</title>

<% Instructions i = (Instructions)session.getAttribute("instructions"); %>

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

/*Main Design*/

.card{
	position: absolute;
 	top: 50%;
  	left: 50%;
  	transform: translate(-50%, -50%);
}
.card h1{
	color: #144272;
	font-size: 50px;
	margin-bottom: 20px;
}
.card form {
    display: flex;
    width: 360px;
    height: 250px;
    background-color: #144272;
    border-radius: 45px;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin-left: 53px;
}
.card form input{
	padding: 15px 35px;
	border: none;
	outline: none;
	border-radius: 10px;
	color: #144272;
	font-size: 15px;
	margin-bottom: 30px;
}
.card form .btn{
	font-size: 15px;
	padding: 10px 35px;
	cursor: pointer;
	margin-bottom: 20px;
	transition: 0.4s;
}
.card form .btn:hover{
	box-shadow: 5px 5px 8px 0 lightslategrey;
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

	<div class="profile">
		<i class="fa-solid fa-user"></i>
		<h1>Admin</h1>
	</div>


	<div class="card">
		
		<h1>Update Instruction Here</h1>		
		
		<form action="InstructionServlet" method="post">
			
			<input type="hidden" name="action" value="editInstruction">
			
			<input type="text" name="id" value="<%=i.getId() %>" required="required">
			<input type="text" name="instruction" value="<%=i.getInstruction() %>" required="required">
			<input type="submit" value="Add" class="btn">
			
		</form>
	
	</div>

	<div class="ball1"></div>
	<div class="ball2"></div>


</body>
<script src="https://kit.fontawesome.com/8d9f07e2a1.js" crossorigin="anonymous"></script>

</html>