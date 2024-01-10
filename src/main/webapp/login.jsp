<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<% String loginMsg = (String)request.getAttribute("loginMsg"); %>

<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;800&family=Varela+Round&display=swap" rel="stylesheet">


<style>
	*{
		margin: 0;
    	padding: 0;
  		box-sizing: border-box;
    	font-family: 'Varela Round', sans-serif;
	 }
	 
	 
	 nav{
		background-color: #144272; 
		display: flex;
		justify-content: space-between;
		padding: 23px;
	 } 
	 nav h1 a{
		 font-size: 30px;
		 color: white;
		 margin-left: 35px;
		 text-decoration: none;
	 }
	 nav ul{
		 display: flex;
	 }
     nav ul li{
		 list-style: none;
	 }   
     nav ul li a{
		 font-size: 25px;
		 color: white;
		 text-decoration: none;
		 margin-right: 30px;
		 padding: 6px 0;
		 transition: 0.7s;
	 }  
     .active, nav ul li a:hover{
		 border-bottom: 2px solid white;
	 }  
       
     /* Login card design*/ 
     
     section{
 		 position: absolute;
 		 top: 50%;
  		 left: 50%;
  		 transform: translate(-50%, -50%);
	 
	 
	 
	 .loginCard	{
	 	width: 345px;
	 	height: 360px;
	 	background-color: #144272;
	 	border-radius: 45px;
	 }
	 .loginCard h1{
	 	font-size: 33px;
	 	font-weight: bold;
	 	color: white;
	 	text-align: center;
	 	padding: 20px 0;
	 }
	 .loginCard form{
		text-align: center;
	 }
	 .loginCard select{
	 	padding: 12px 58px;
    	margin: 12px;
    	text-align: left;
    	border: none;
    	outline: none;
    	color: #144272;
    	font-size: 17px;
    	border-radius: 10px;
	 }
	 	
	 .loginCard form input{
	 	padding: 12px 23px;
	 	margin: 12px;
	 	text-align: left;
	 	border: none;
	 	outline: none;
	 	color: #144272;
	 	font-size: 15px;
	 	border-radius: 10px;
	 }
	 .loginCard .btn{
	 	padding: 10px 23px;
	 	cursor: pointer;
	 	margin-bottom: 20px;
	 	transition: 0.4s;
	 }
	 .loginCard a{
	 	color: white;
	 	font-weight: lighter;
	 }	
	 .loginCard .btn:hover{
		box-shadow: 5px 5px 8px 0 lightslategrey;
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
		<h1><a href="home.jsp">QuiZy</a></h1>
		<ul>
			<li><a href="home.jsp">Home</a></li>
			<li><a href="login.jsp" class="active">Log In</a></li>
		</ul>
	</nav>
	
	<section>
		
		<div class="errorMsg">
			<% if(loginMsg!=null) {%>
				<h2 style="color: red; text-align: center;" ><%=loginMsg %></h2>
			<%} %>
		</div>

			<div class="loginCard">
					
					<h1>LOGIN</h1>
					<form action="LoginServlet" method="post">
					
						<select name="userType">
							<option>Login as...</option>
							<option value="admin">Admin</option>
							<option value="student">Student</option>
						</select>
						
						<input type="email" name="email" placeholder=":Email" required="required"> <br>
						<input type="password" name="password" placeholder=":Password" required="required"> <br>
						<input class="btn" type="submit" value="LOGIN"> <br>
						
						
					</form>
			</div>
			
	</section>
	
	
	<div class="ball1"></div>
	<div class="ball2"></div>


</body>
</html>