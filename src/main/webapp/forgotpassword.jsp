<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot-Password</title>

<style>

body{
		background-image: url("orange cup.jpg");
background-repeat: no-repeat;
background-size: cover;
	}
div{
		width: 450px;
		margin-left: 500px;
		margin-top: 190px;
		background-color: white;
		padding: 25px;
		border-radius: 2pc;
	}
h1,form{
		text-align: center;
	}
button{
border-style: none;
text-decoration: none;
padding: 10px;
border-style: none;
border-radius: 2pc;
padding-left: 20px;
padding-right: 20px;
background-color: blue;
color: white;
font-weight: bold;
}
button:hover{
transform: scale(1.5, 1.5);
transition: 0.5s;
}

section{

text-align: left;
padding-left: 70px;
}


</style>


</head>



<body>

<div>
	<h1>Forgot Password Form</h1> <br></br>
	
	<form action="forgot" method="post">
		
		<section>
		E-mail: &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" placeholder="E-Mail" name="Email"> <br><br>
		
		Contact No.: &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" placeholder="Contact No." name="Contact"> <br><br>
	
		New Password: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" placeholder="New Password" name="New Password"> <br><br>
		
		Conform Password: &nbsp; <input type="password" placeholder="Conform Password" name="Conform Password"> <br><br><br>
		</section>
		
		<button name="button">SignIn</button> &nbsp;&nbsp;&nbsp;&nbsp;
		<button name="button" value="cancel">cancel</button>
		
		<% String msg = (String)request.getAttribute("msg"); 
		if(msg != null)
		{ %>
			<h4 style="color: red;"><%= msg %></h4>
			
		<% }%>

		
	</from>
	</div>
	
<script type="text/javascript">


</script>

</body>
</html>