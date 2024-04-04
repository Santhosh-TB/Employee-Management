<%@page import="dto.TaskDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Base64"%>
<%@page import="dto.Dto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome User | Home</title>

<style>
body{
background-image: url("orange cup.jpg");
background-repeat: no-repeat;
background-size: cover;
}
div{
border-radius: 25px;
width: 400px;
margin-left: 15%;
padding: 22px;
padding-left: 80px;
background-color: white;
}
a{
border-radius: 2pc;
padding: 10px;
text-decoration: none;
font-size: larger;
font-weight: bold;
padding-left: 40px;
padding-right: 40px;

color: black;
background-color: white;
}
a:hover{
transition: 0.5s;
transform: scale(1.2, 1.2);
color: white;
background-color: black;
}
#delete:hover{
transition: 0.5s;
transform: scale(1.2, 1.2);
background-color: red;
}
#edit:hover{
transition: 0.5s;
transform: scale(1.2, 1.2);
background-color: darkgreen;
}

table,th,td {
	border: 2px solid black;
	border-collapse: collapse;
	padding: 10px;
	text-align:center;
	letter-spacing: 2px;
	background-color: white;
}
th{
padding-left: 40px;
padding-right: 40px;
background-color: #009878;
font-size:large;
color: white;
}
</style>


</head>

<body>

<h1 style="text-align: center; font-size: 50px; ">Welcome To The User Page</h1>
<br>

<% HttpSession ses = request.getSession(); 
  Dto user = (Dto)ses.getAttribute("Dto");
  int id = user.getUserid();
  String name = user.getUsername();
  String email = user.getUseremail();
  long contact = user.getUsercontact();
   %>

<% String image = new String(Base64.getEncoder().encode(user.getUserimage())); %>
<img alt="No Image" src="data:image/jpeg;base64,<%= image %>" width="220" height="250" style="float:left">

<div>
<h1>Name: <%= name %> </h1>
<h3>UserID: <%= id %></h3>
<h3>Email: <%= email %></h3>
<h3>Contact: <%= contact %></h3>
</div>
<br> <br>

	<a href="AddTask.jsp" > Add Task </a> <br><br>
	
	
	<% List<TaskDto> tasks = (List)request.getAttribute("tasks"); %>



<% if (!tasks.isEmpty())
{ %>
<table>
<thead>
<tr>
<th>ID</th>
<th>Title</th>
<th>Description</th>
<th>Priority</th>
<th>Due-date</th>
<th>Status</th>
<th colspan="2">Update</th>
</tr>
</thead>
<% 
for(TaskDto task:tasks)
{ %>


<tbody>
	<tr>
	<td> <%= task.getTaskid() %></td>
	<td> <%= task.getTasktitle() %></td>
	<td> <%= task.getTaskdescription() %></td>
	<td> <%= task.getTaskpriority() %></td>
	<td> <%= task.getTaskduedate() %></td>
	<td> <%= task.getTaskstatus() %></td>
	
	<td> <a id="delete" href="delete?taskid=<%=task.getTaskid()%>"> Delete</a> </td>
	<td> <a id="edit" href="##"> Edit</a> </td>
    </tr>
    
    <%
    } }
else
{%>
	
	<h1 style="color: red">Currently No Tasks Available :-( </h1>
<% }
%>
</tbody>
</table>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>