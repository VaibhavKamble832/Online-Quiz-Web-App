<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*  ,javax.servlet.*,javax.servlet.http.*" 
 %> 
   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
     pageEncoding="ISO-8859-1"%>
  <!DOCTYPE HTML>
    <HTML>
   <head>
  <meta charset="ISO-8859-1">
       <link rel="stylesheet" 
       href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
       integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" 
    crossorigin="anonymous">
    <link rel="stylesheet" href="bstyle.css" type="text/css">
    <title>Insert title here</title>
   </head>
  <body>
  <%            
	String no_question =request.getParameter("no_question");
	String subject_id=request.getParameter("Qbysubject_id");
   %>
       <br><br>
      <div class="container">
<div class="row">
    <div class="col-6">
        <h3>QuiZy</h3>
    </div>
    <div class="col-6">
        <h3>Total no. of questions: <%=no_question %></h3>
    </div>
</div>
<br>

 
 <form method="post" action="your_url">
   <% 
   
     Class.forName("com.mysql.jdbc.Driver");
     Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizapp","root","");
 
     
     Statement st=con.createStatement();
     String sql="select q.id, q.question_name, q.opt1, q.opt2, q.opt3, q.opt4, q.ans, s.subject_name as Subject from questions q inner join subjects s on s.id = q.subject_id where subject_id="+subject_id;
     ResultSet rs=st.executeQuery(sql);
    while(rs.next()){
    	
    		String question =rs.getString("question_name");
    	    String option_a =rs.getString("opt1");
    	    String option_b =rs.getString("opt2");
    	    String option_c =rs.getString("opt3");
    	    String option_d =rs.getString("opt4");
    	    String correct_option =rs.getString("ans"); 	
    	    
    	    
            
    %>
    <div class="row">
        <div class="col-6">
            <h4><%=question %></h4>
        </div>
        <div class="col-6">
            <h4>    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;(&emsp;)
            </h4>
        </div>
    </div>  
    <br>
 
        <div class="row">
            <div class="col-6">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="inlineRadioOptions_" value="A">
                  <label class="form-check-label" for="inlineRadio1">A. <%=option_a %></label>
                </div>
            </div>
            <div class="col-6">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="inlineRadioOptions_" value="B">
                  <label class="form-check-label" for="inlineRadio1">B. <%=option_b %></label>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-6">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="inlineRadioOptions_"  value="C">
                  <label class="form-check-label" for="inlineRadio1">C. <%=option_c %></label>
                </div>
            </div>
            <div class="col-6">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="inlineRadioOptions_"  value="D">
                  <label class="form-check-label" for="inlineRadio1">D. <%=option_d %></label>
                </div>
            </div>
        </div>
        <br>
        <hr>
     <%} %>

    //added button
    <input type="submit" value="Submit">
    </form> 
   </div>
    <br>

     <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384- 
     DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"> 
   </script>
     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" 
      crossorigin="anonymous"></script>
       <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" 
    integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" 
    crossorigin="anonymous"></script>
    
    
     </body>
      </html>










<%-- 

<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.QuestionDao"%>
<%@page import="com.pojo.Questions"%>
<%@page import="java.util.List"%>
<%@page import="com.pojo.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attempt Quiz</title>

<% Student s = (Student)session.getAttribute("student"); %>

<% List<Questions> qlist = (List<Questions>)session.getAttribute("qlist"); %> 

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

 .quiz-container {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 8px;
    background-color: #f9f9f9;
  }
  
  h1 {
    text-align: center;
  }
  
  .question {
    margin-bottom: 20px;
  }
  
  .options {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 10px;
    margin: 20px 0; 
  }
  
  
  
  /*label {
    display: block;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    cursor: pointer;
  }
  
  input[type="radio"] {
    display: none;
  }
  
  input[type="radio"]:checked + label{
    background-color: blue;
    color: #fff;
  }*/

</style>

</head>
<body>


	<nav>
		<h1>
			<a href="home.jsp">QuiZy</a>
		</h1>
		<ul>
			<li><a href="#">Exit Quiz</a></li>
		</ul>
	</nav>
	
	
  <section>
	
		<div class="quiz-container">
 			<h1>QuiZy</h1>
 		
	 <%for(Questions q:qlist) {%>
 		<div class="question">
    		<p><%=q.getQuestion() %></p>
    	</div>	

    	<div class="options" id="options">
      	<label class="option">
        	<input type="radio" name="option" value="<%=q.getOpt1()%>" /><%=q.getOpt1()%>
      	</label>
      	<label class="option">
        	<input type="radio" name="option" value="<%=q.getOpt2()%>" /><%=q.getOpt2()%>
     	</label>
      	<label class="option">
        	<input type="radio" name="option" value="<%=q.getOpt3()%>" /><%=q.getOpt3()%>
      	</label>
      	<label class="option">
       		<input type="radio" name="option" value="<%=q.getOpt4()%>" /><%=q.getOpt4()%>
      	</label>
    </div>
    <%} %>
    <button onclick="submitQuiz()">Submit</button>
  </div>
 
		
	</section> 

	
</body>
<script src="https://kit.fontawesome.com/8d9f07e2a1.js" crossorigin="anonymous"></script>
</html>

--%>