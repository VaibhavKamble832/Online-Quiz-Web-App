<%@page import="com.dao.StudentDao"%>
<%@page import="com.pojo.Student"%>
<%@page import="com.dao.QuestionDao"%>
<%@page import="com.pojo.Questions"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>


<HTML>
    <HEAD>
        <TITLE>Examination </TITLE>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link 
		href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;800&family=Varela+Round&display=swap"
		rel="stylesheet">

	<style >
		
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
nav h1 a:hover{
	color: white;
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
	color: white;
}
		
	
	</style>	

      <script>
      <%
      String clock = request.getParameter("clock");
      if(clock == null)
    	  clock = "100";
      %>
      var minutes = 2; // Set initial minutes
      var seconds = 0; // Set initial seconds

      function timer() {
        var displayMinutes = minutes < 10 ? "0" + minutes : minutes;
        var displaySeconds = seconds < 10 ? "0" + seconds : seconds;

        document.forma.clock.value = displayMinutes + ":" + displaySeconds;

        if (minutes === 0 && seconds === 0) {
          document.forma.clock.value = "Time Over";
          formb.submit();
        } else {
          if (seconds === 0) {
            minutes--;
            seconds = 59;
          } else {
            seconds--;
          }
          setTimeout(timer, 1000);
        }
      }

      // Start the timer when the page loads
      timer();
    </script>


<%  String student_id = request.getParameter("student_id"); 
	Student student = new StudentDao().getStudentById(Integer.parseInt(student_id));
	session.setAttribute("student", student);
	
%>
	

    </HEAD>
    <BODY onload="timer()">
    
    	<nav>
		<h1>
			<a href="#">QuiZy</a>
		</h1>
		<ul>
			<li><a href="studentProfile.jsp">Home</a></li>
		</ul>
</nav>
    	
    
        <form name="forma" action="<%=request.getRequestURL()%>">

     <font  style="color: #144272; font-size: 40px; margin-left: 40%; font-weight: bold;">Time Left - <input size="4" name="clock" id="fno" value="<%=clock%>" style="color: #144272; border: none; font-weight: bold" readonly></font>
  
    </form>
    
    <form action="Result.jsp" name="formb">
 
    <table class="table table-hover">
    <thead>
<tr class="table-warning" >
 <th style="background-color: #144272; color: White;">s no.</th>
 <th style="background-color: #144272; color: White;">Question</th>
 <th style="background-color: #144272; color: White;">Option A </th>
 <th style="background-color: #144272; color: White;">Option B </th>
 <th style="background-color: #144272; color: White;">Option C </th>
 <th style="background-color: #144272; color: White;">Option D </th>
</tr>
</thead>
<tr>

<%
   int i = 1;
  
   int radioname = 0;
   int id = Integer.parseInt((request.getParameter("Qbysubject_id")));
   List<Questions> allQuestions = new QuestionDao().getAllQuestionsBySubject(id);
  for(Questions q : allQuestions)
  {   
%> <%=i%> <%  
  
  %>
    
   <tr>
  <td><%=i++%></td>
  <td><%=q.getQuestion() %></td>
  <td><input type="radio" value="<%=q.getOpt1()%>" name="<%=radioname%>"><%=q.getOpt1()%></td>
  <td><input type="radio" value="<%=q.getOpt2()%>" name="<%=radioname%>"><%=q.getOpt2()%></td>
  <td><input type="radio" value="<%=q.getOpt3()%>" name="<%=radioname%>"><%=q.getOpt3()%></td>
  <td><input type="radio" value="<%=q.getOpt4()%>" name="<%=radioname%>"><%=q.getOpt4()%></td>
      <input type="hidden" name="subject_id" value="<%=id%>">
  
  
  </tr>

<input type="radio" value="e" name="<%=radioname %>" checked="checked" name=<%=radioname %>>
 
  <%
  radioname++;
  }
  %>
  </table>
  <center><input class="btn btn-outline-success btn-lg" type="submit" value="submit"></center>
 
  </form>
  
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
   
</BODY>
</HTML>