<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sing-In</title>

<style>

body{
		background: rgb(29,56,253);
background: linear-gradient(90deg, rgba(29,56,253,1) 1%, rgba(254,0,133,1) 100%);
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
color: Black;
padding: 10px;
border-style: none;
border-radius: 2pc;
padding-left: 20px;
padding-right: 20px;
background: rgb(29,56,253);
background: linear-gradient(90deg, rgba(254,0,133,1) 1%, rgba(29,56,253,1) 100%);
font-weight: bold;
}
button:hover{
transform: scale(1.5, 1.5);
transition: 0.5s;
color: white;
}

</style>


</head>



<body>

<div>
	<h1>Sign-In Form</h1> <br></br>
	
	<form action="userlogin" method="post">
		
		E-mail: &nbsp; &nbsp; &nbsp; <input type="text" name="Email"> <br><br>
	
		Password: &nbsp; <input type="text" name="Password"> <br><br><br>
		
		<button>SignIn</button>
		<% String msg = (String)request.getAttribute("msg"); 
		if(msg != null)
		{ %>
			<h4><%= msg %></h4>
		<% }%>

		
	</from>
	</div>

</body>
</html>