<%@page import="dto.Dto"%>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User</title>

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

#password{
border-top-style: none;
border-left-style: none;
border-right-style: none;
border-bottom: 2px solid black;
}
#password:focus{
outline: none;
}
</style>

</head>

<body>

<div>

<%Dto olduser = (Dto)request.getAttribute("olduserdetails"); %>
	<h1>User Update Form</h1> <br></br>
	
	<form action="updateuser?Name=<%=olduser.getUsername()%>" method="post" enctype="multipart/form-data">
	
		Name: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<input type="text" name="Name" disabled="disabled" value="<%= olduser.getUsername() %>" > <br><br>
		Email: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="text" name="Email" placeholder="E-Mail" value="<%= olduser.getUseremail() %>"> <br><br>
		Contact: &nbsp; &nbsp; &nbsp; &nbsp; <input type="text" name="Contact" placeholder="Contact" value="<%= olduser.getUsercontact() %>">
		 <br><br>
	
		<p id="img"> Image: &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; <input type="file" name="Image" >  <p style="font-size: 12px; color: red">Please Upload your Picture**</p>
		</p> <br>
		
		Enter Password to Update Details: &nbsp; &nbsp;<input id="password" type="text" placeholder="Enter Your Password....." name="Password" > <br> <br> <br>
		
		<section style="margin-left: 90px;">
		
		<button name="button">Register</button> &nbsp;&nbsp;&nbsp;&nbsp;
		<button name="button" value="cancel">cancel</button> <br> 
		
		</section>
		
		<% String msg = (String)request.getAttribute("msg"); 
		if(msg != null)
		{ %>
			<h4 style="color: red; padding-left: 140px;"><%= msg %></h4>
			
			<p style="font-size: 12px; color: red;">
			Note: <br>
			Update Your Details Once Again and Give Correct Password to Proceed
			</p>
			
		<% }%>
		
		
	</from>
	</div>

</body>
</html>