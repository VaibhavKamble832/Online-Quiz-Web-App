<%@page import="com.pojo.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Student profile</title>


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
 		 position: absolute;
 		 top: 50%;
  		 left: 50%;
  		 transform: translate(-50%, -50%);
	} 
	.regCard{
		display: flex;
    	width: 600px;
    	height: 400px;
    	background-color: #144272;
    	border-radius: 45px;
    	flex-direction: column;
    	justify-content: center;
    	align-items: center;
    	margin-left: 53px;
	} 
	.regCard h1{
		font-size: 33px;
		font-weight: bold;
		color: white;
		text-align: center;
		padding: 20px 0;
	}
	.regCard form{
		text-align: center;
	}
	.regCard form input{
		padding: 12px 23px;
		margin:12px;
		text-align: left;
		border: none;
		outline: none;
		color: #144272;
		font-size: 15px;
		border-radius: 10px;
		margin-bottom: 15px;
	}
	
	input[type="file"]{
    	color: white;
	}
	
	.regCard .btn{
		font-size: 20px;
		padding: 10px 25px;
		cursor: pointer;
		margin-bottom: 20px;
		transition: 0.4s;
	}
	.regCard .btn:hover{
		box-shadow: 5px 5px 8px 0 lightslategrey;
	}

	.ball1{
		 position: absolute;
    	 width: 100%;
    	 height: 100%;
    	 top: 0;
     	 left: 0;
   	   	 clip-path: circle(170px at right 610px);
    	 background-color: #144272;
	 }
     .ball2{
		 position: absolute;
    	 width: 100%;
    	 height: 100%;
    	 top: 0;
     	 left: 0;
   	   	 clip-path: circle(300px at left 400px);
    	 background-color: #144272;
	 }
	

</style>


</head>

<% Student student = (Student)session.getAttribute("student"); %>

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
			<div class="regCard">
				<h1>Edit Profile</h1>
				
				<form action="StudentServlet" method="post" enctype="multipart/form-data">
					
					<input type="hidden" name="action" value="editStudent">
					<input type="hidden" name="id" value="<%=student.getId() %>">
					
					<div>
						<input type="text" name="name" value="<%=student.getName() %>" required="required" >
						<input type="text" name="contact" value="<%=student.getContact() %>"  required="required">
					</div>
		    		<div>
						<input type="text" name="email" value="<%=student.getEmail() %>" required="required">
						<input type="text" name="username" value="<%=student.getUsername() %>" required="required">
					</div>
					<div>
						<input type="text" name="password" value="<%=student.getPassword() %>" required="required">
						<input type="file" name="image" required="required" style="    margin: 0px 12px 0px 14px; width: 229px; background-color: white; padding: 10px 4px;">
					</div>
					<input type="submit" value="Register" class="btn">
					
				</form>
					
				
			</div>
			
		</section>

	<div class="ball1"></div>
	<div class="ball2"></div>
	


</body>
</html>