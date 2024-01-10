<%@page import="com.dao.SubjectDao"%>
<%@page import="com.dao.ResultDao"%>
<%@page import="com.pojo.Subject"%>
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

<% 
	List<Result> rlist = (List<Result>)session.getAttribute("resultList"); 
	List<Subject> slist = new SubjectDao().getAllSubject();

%>

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

/* Sortingg */

form{
	position: absolute;
    right: 120px;
    
} 

.form1{
	top: 140px;
}
.form2{
	top: 212px;
}
.form3{
	top: 255px;
}



form h2{
	color: #144272;
}
form .sorting{
	display: flex;
	flex-direction: column;
	text-align: center;
}
form .sorting .btn{
	width: 170px;
	border: none;
	padding: 10px 20px;
	background-color: white;
	font-size: 17px;
	font-weight: bolder;
	outline: none;
	color: #144272;
	border-radius: 10px;
	transition: 0.1s;
	cursor: pointer;
}
.sorting .btn:hover{
	background-color: silver;
}
.sorting .btn:focus{
	color: #144272
}
.sorting .btn::placeholder{
	color: #144272
}


.sorting select{
	width: 170px;
	border: none;
	padding: 10px 20px;
	background-color: white;
	font-size: 17px;
	font-weight: bolder;
	outline: none;
	color: #144272;
	border-radius: 10px;
	transition: 0.1s;
	cursor: pointer;
}
.sorting select:hover{
	background-color: silver;
}

.sorting .submit{
	border: none;
	padding: 10px 20px;
	background-color: #144272;
	font-size: 14px;
	font-weight: bolder;
	outline: none;
	color: white;
	border-radius: 10px;
	transition: 0.1s;
	cursor: pointer;
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
	
	
	<div class="section" align="center" border="2px">

			<h1>RESULTS</h1>

			<form action="ResultServlet" method="post" class="form1" >
			<input type="hidden" name="action" value="sortByName">
				<h2>-----Sort By-----</h2>		
						
				<div class="sorting">
					<div>
						<input type="text" name="studentName" placeholder="Name" class="btn">
						<input type="submit" value=">" class="submit">
					</div>
				</div>		
			</form>

			<form action="ResultServlet" method="post" class="form2" >
			<input type="hidden" name="action" value="sortBySubject">
						
				<div class="sorting">
					<div>
						<select name="subject_id">
							<option value="0">Subject</option>
							<%for(Subject s: slist) {%>
								<option value="<%=s.getId()%>"><%=s.getSubject_name() %></option>
							<%} %>
						</select>
						<input type="submit" value=">" class="submit">
					</div>
			    </div>		
			</form>	
			
			<form action="ResultServlet" method="post" class="form3" >
			<input type="hidden" name="action" value="sortByResult">
						
				<div class="sorting">
					
						<div>
							<select name="Result">
								<option value="null">Result</option>
								<option value="pass">Pass</option>
								<option value="Fail" >Fail</option>
							</select>	
							<input type="submit" value=">" class="submit">
						</div>
			    </div>		
			</form>			

			<table>

				<tr>
					<th>ID</th>
					<th>STUDENT_NAME</th>
					<th>SUBJECT</th>
					<th>MARKS</th>
					<th>RESULT</th>
					<th>ATTEMPT_DATE</th>				
					<th>DELETE</th>
				</tr>

				<% for (Result r : rlist) { %>
				<tr>
					<td><%= r.getId() %></td>
					<td><%= r.getStudent_name() %></td>
					<td><%= r.getSubject_name() %></td>
					<td><%= r.getMarks() %></td>
					<td><%= r.getResult() %></td>
					<td><%= r.getAttempt_date() %></td>
					<td><a href="StudentServlet?action=delete&&id=<%=r.getId()%>"><i class="fa-solid fa-trash"></i></a></td>
			
				</tr>

				<% }%>
			</table>
	</div>
	
	


</body>
<script src="https://kit.fontawesome.com/8d9f07e2a1.js" crossorigin="anonymous"></script>
</html>