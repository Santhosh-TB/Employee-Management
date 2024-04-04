<%@page import="dto.TaskDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Task Update Form</title>

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
	button{
	padding: 10px;
	padding-left: 30px;
	padding-right:30px;
	margin-left: 170px;
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

<h1 style="padding-left: 100px">Task Update Form</h1> <br></br>

<form action="updatetask" method="post">

Task Description: &nbsp;&nbsp; <input type="text" name="taskdescription"><br><br>
Task Priority: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" value="Low" name="taskpriority"> Low
<input type="radio" value="Medium" name="taskpriority"> Medium
<input type="radio" value="High" name="taskpriority"> High  <br><br>
Task Due-date: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="date" name="taskduedate"><br><br>

Task Status: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" value="Pending" name="taskstatus"> Pending
<input type="radio" value="Almost" name="taskstatus"> Almost
<input type="radio" value="Completed" name="taskstatus"> Completed  <br><br><br>

<button>Submit</button>

</form>

</div>	

</body>
</html>