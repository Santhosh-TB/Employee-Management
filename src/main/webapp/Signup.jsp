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
	h1,form{
		text-align: center;
	}
	#img{
	margin-left: 70px;
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
background: rgb(29,253,32);
background: linear-gradient(90deg, rgba(0,227,254,1) 22%, rgba(29,253,32,1) 100%);
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
	<h1>Registration Form</h1> <br></br>
	
	<form action="SaveUser" method="post" enctype="multipart/form-data">
		UserID: &nbsp; &nbsp;<input type="text" name="Id"> <br><br>
		Name: &nbsp; &nbsp; &nbsp;<input type="text" name="Name"> <br><br>
		Email: &nbsp; &nbsp; &nbsp;<input type="text" name="Email"> <br><br>
		Contact: &nbsp; &nbsp; <input type="text" name="Contact"> <br><br>
		Password: &nbsp; <input type="text" name="Password"> <br><br>
		
		<p id="img"> Image: &nbsp;&nbsp;&nbsp; <input type="file" name="Image">
		</p> <br>
		
		
		<button>Register</button>
	</from>
	</div>

</body>
</html>