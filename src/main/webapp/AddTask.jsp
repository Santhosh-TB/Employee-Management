<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Task Form</title>

<style>
body{
background-image: url("orange cup.jpg");
background-repeat: no-repeat;
background-size: cover;
	}
	div{
		width: 450px;
		margin-left: 500px;
		margin-top: 150px;
		background-color: white;
		padding: 25px;
		border-radius: 2pc;
	}
	form{
	margin-left: 25px;
	}
	button{
	padding: 10px;
	padding-left: 30px;
	padding-right:30px;
	border-style: none;
	border-radius: 2pc;
background-color: blue;
color: white;
font-weight: bold;
	}
	button:hover{
transform: scale(1.5, 1.5);
transition: 0.5s;
}
</style>

</head>


<body>

<div>

<h1 style="padding-left: 150px">Task Form</h1> <br></br>
<form action="addtask" method="post">

Task Title: &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" placeholder="Enter Task Title" name="tasktitle"><br><br>
Task Description: &nbsp;&nbsp; <input type="text" placeholder="Enter Task Description" name="taskdescription"><br><br>

Task Due-date: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="date" name="taskduedate"><br>

<h6 style="color: red;">Disclamier: <br>TaskTitle Can't be Modified Once Submitted <br> Task ID automatically generated and Can't Modified</h6> <br>

<section style="margin-left: 90px;">

<button name="button">Submit</button> &nbsp;&nbsp;&nbsp;&nbsp;
<button name="button" value="cancel">cancel</button> <br> 

</section>

</form>

</div>	

</body>
</html>