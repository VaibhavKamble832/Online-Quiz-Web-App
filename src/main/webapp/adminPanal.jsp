<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panal</title>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;800&family=Varela+Round&display=swap"
	rel="stylesheet">


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

/*Section Desing*/
.profile {
	text-align: center;
	margin: 30px;
}

.profile .fa-user {
	color: white;
	background-color: #144272; font-size : 70px;
	border: 5px solid #144272;
	border-radius: 50%;
	padding: 15px;
	font-size: 70px;
}

.profile h1 {
	color: #144272;
	font-size: 50px;
}

.cards {
	justify-content: center;
	display: grid;
	grid-template-columns: 300px 300px 300px; 
	grid-rows-columns: 300px 300px 300px; 
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
			<i class="fa-solid fa-user"></i>
			<h1>Welcome ADMIN</h1>
		</div>

		<div class="cards">
			<h2><a href="StudentServlet">All Students</a></h2>
			<h2><a href="InstructionServlet">All Instructions</a></h2>
			<h2><a href="SubjectServlet">All Subject</a></h2>
			<h2><a href="QuestionServlet">All Question</a></h2>
			<h2><a href="ResultServlet">Results</a></h2>
		</div>
		
	</section>


</body>
<script src="https://kit.fontawesome.com/8d9f07e2a1.js" crossorigin="anonymous"></script>
</html>