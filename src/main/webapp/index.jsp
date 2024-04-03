<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Page</title>

<style>
body{
background: rgb(131,58,180);
background: linear-gradient(90deg, rgba(131,58,180,1) 0%, rgba(253,29,29,1) 0%, rgba(252,176,69,1) 100%);
}

a{
text-decoration: none;
color: Black;
padding: 10px;
border-style: none;
border-radius: 2pc;
padding-left: 20px;
padding-right: 20px;
background: rgb(131,58,180);
background: linear-gradient(90deg, rgba(131,58,180,1) 0%, rgba(253,29,29,1) 0%, rgba(252,176,69,1) 100%);
font-weight: bold;
}
button{
border-style: none;
background-color: white;
}
button:hover{
transform: scale(1.5, 1.5);
transition: 0.5s;
color: white;
}
div{
width: 350px;
padding: 50px;
background-color: white;
border-radius: 15px;
margin-left: 35%;
margin-top: 16%;
text-align: center;
}
</style>


</head>

<body>

<div>
<h1>Welcome to User Page</h1> <br>
<button> <a href="Signup.jsp"> Sign-Up </a> </button> &nbsp;&nbsp;&nbsp;
<button> <a href="Signin.jsp"> Sign-In </a> </button>

</div>

</body>
</html>