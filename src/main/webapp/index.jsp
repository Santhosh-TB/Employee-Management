<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Page</title>

<style>
body{
background-image: url("workspace-1280538_1280.jpg");
background-repeat: no-repeat;
background-size: cover;
}

a{
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
button{
border-style: none;
background-color: white;
}
button:hover{
transform: scale(1.5, 1.5);
transition: 0.5s;
}
div{
width: 350px;
padding: 50px;
background-color: white;
border-radius: 15px;
margin-left: 15%;
margin-top: 12%;
text-align: center;
}
</style>


</head>

<body>

<div>
<img src="avatar.png" style="height: 100px; width: 100px;">
<h1>Welcome to User Page</h1> <br>
<button> <a href="Signup.jsp"> Sign-Up </a> </button> &nbsp;&nbsp;&nbsp;
<button> <a href="Signin.jsp"> Sign-In </a> </button>

</div>

</body>
</html>