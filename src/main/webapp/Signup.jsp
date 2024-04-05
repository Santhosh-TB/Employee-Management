<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sing-Up</title>

<style>
	body{
		background-image: url("black phone.jpg");
background-repeat: no-repeat;
background-size: cover;
	}
	div{
		width: 450px;
		margin-left: 500px;
		margin-top: 130px;
		background-color: white;
		padding: 25px;
		border-radius: 2pc;
	}
	h1{
		text-align: center;
	}
	form{
	margin-left: 25px;
	}

button{
border-style: none;
text-decoration: none;
padding: 10px;
border-style: none;
border-radius: 2pc;
padding-left: 20px;
padding-right: 20px;
font-weight: bold;
background-color: blue;
color: white;
}
button:hover{
transform: scale(1.5, 1.5);
transition: 0.5s;
}
</style>

</head>

<body>

<div>
	<h1>Registration Form</h1> <br></br>
	
	<form action="SaveUser" method="post" enctype="multipart/form-data">
	
		Name: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<input type="text" name="Name" > <br><br>
		Email: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="text" name="Email" > <br><br>
		Contact: &nbsp; &nbsp; &nbsp; &nbsp; <input type="text" name="Contact" > <br><br>
		Password: &nbsp; &nbsp; &nbsp;<input type="text" name="Password"> <br><br>
		
		<p id="img"> Image: &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; <input type="file" name="Image">
		</p> <br>
		
		
		<section style="margin-left: 90px;">
		
		<button name="button">Register</button> &nbsp;&nbsp;&nbsp;&nbsp;
		<button name="button" value="cancel">cancel</button> <br> 
		
		</section>
		
		<% String msg = (String)request.getAttribute("msg"); 
		if(msg != null)
		{ %>
			<h4 style="color: red;"><%= msg %></h4>
		<% }%>
	</from>
	</div>

</body>
</html>