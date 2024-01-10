<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
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
       
       
     section{
		 position: absolute;
 		 top: 50%;
  		 left: 50%;
  		 transform: translate(-50%, -50%);
	 }  
	 
	 section h1{
		 color: #144272;
		 text-align: center;
		 font-size: 80px;
		 font-weight: bolder;
		 margin-bottom: 60px;
	 }
     
     section h2{
		 text-align: center;
	 } 
	 section h2 a{
		 color: white;
		 background-color: #144272;
		 text-decoration: none;
		 padding: 15px 15px;
		 border-radius: 15px;
		 transition: 0.3s;
	 }
	 section h2 a:hover{
		 padding: 15px 28px;
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
			<li><a href="home.jsp" class="active">Home</a></li>
			<li><a href="studentregister.html">Register</a></li>
			<li><a href="login.jsp">Log In</a></li>
		</ul>
	</nav>
	
	<section>
			<h1>Welcome to Online<br>Quiz Application</h1>
			
			<h2><a href="login.jsp">| Attempt Quiz |</a></h2>
	</section>
	
	<div class="ball1"></div>
	<div class="ball2"></div>
	
	
</body>
</html>