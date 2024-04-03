<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
body{
background: rgb(237,253,29);
background: linear-gradient(90deg, rgba(237,253,29,1) 1%, rgba(0,9,254,1) 100%);
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
	background: rgb(237,253,29);
background: linear-gradient(90deg, rgba(0,9,254,1) 1%, rgba(237,253,29,1) 100%);
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

<h1 style="padding-left: 150px">Task Form</h1> <br></br>
<form action="addtask" method="post">

Task ID: &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="taskid"><br><br>
Task Title: &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="tasktitle"><br><br>
Task Description: &nbsp;&nbsp; <input type="text" name="taskdescription"><br><br>
Task Priority: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" value="low" name="taskpriority"> Low
<input type="radio" value="medium" name="taskpriority"> Medium
<input type="radio" value="high" name="taskpriority"> High  <br><br>
Task Duedate: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="date" name="taskduedate"><br><br><br>

<button>Submit</button>

</form>

</div>	

</body>
</html>