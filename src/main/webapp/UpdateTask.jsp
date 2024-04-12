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
		margin-top: 130px;
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

<%TaskDto task = (TaskDto)request.getAttribute("task"); %>

<h1 style="padding-left: 100px">Task Update Form</h1> <br></br>

<form action="updatetask?taskid=<%=task.getTaskid()%>" method="post">

Task ID: &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="number" disabled="disabled" name="taskid" value="<%= task.getTaskid() %>"><br><br>
Task Title: &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="tasktitle"  disabled="disabled" value="<%= task.getTasktitle()%>"><br><br>
Task Description: &nbsp;&nbsp;&nbsp; <input type="text" placeholder="Enter Task Description"  name="taskdescription"  value="<%= task.getTaskdescription() %>"><br><br>

Task Due-date: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="date" name="taskduedate" value="<%= task.getTaskduedate() %>"><br><br>


<%if(task.getTaskstatus().equals("Pending"))
{ %>

Task Status:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <select name="taskstatus" >
<option value="Pending" selected="selected">Pending</option>
<option value="Almost" >Almost</option>
<option value="Completed" >Completed</option> 
</select> <br><br><br>

<% } 
else if(task.getTaskstatus().equals("Almost"))
{
%>

Task Status:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <select name="taskstatus">
<option value="Pending" >Pending</option>
<option value="Almost" selected="selected">Almost</option>
<option value="Completed">Completed</option>
</select> <br><br><br>


<% }
else
{
%>
Task Status:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <select name="taskstatus">
<option value="Pending"  >Pending</option>
<option value="Almost" >Almost</option>
<option value="Completed" selected="selected">Completed</option>
</select> <br><br><br>
<%} %>


<section style="margin-left: 85px;">
<button name="button">Submit</button> &nbsp;&nbsp;&nbsp;&nbsp;
<button name="button" value="cancel">cancel</button> <br> 

</section>

</form>

</div>	

</body>
</html>