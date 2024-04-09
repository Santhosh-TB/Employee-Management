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
margin-left: 22%;
padding: 45px;
padding-left: 330px;
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
color: white;
background-color: blue;
}
#delete:hover{
background-color: red;
}
#edit:hover{
background-color: darkgreen;
}

#edit_user{
border-radius: 2pc;
padding: 10px;
text-decoration: none;
font-size: small;
font-weight: bold;
padding-left: 30px;
padding-right: 30px;

color: white;
background-color: black;
}
#edit_user:hover{
color: black;
background-color: white;
border-width: 2px;
border-style: solid;
border-color: black;
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

<h1 style="text-align: center; font-size: 50px; color: white; ">Welcome To The User Page</h1>
<br>

<% HttpSession ses = request.getSession(); 
  Dto user = (Dto)ses.getAttribute("Dto");
  int id = user.getUserid();
  String name = user.getUsername();
  String email = user.getUseremail();
  long contact = user.getUsercontact();
   %>

<% String image = new String(Base64.getEncoder().encode(user.getUserimage())); %>
<img alt="No Image" src="data:image/jpeg;base64,<%= image %>" width="220" height="282" style="float:left; margin-left: 25%; margin-top: 17px;">

<div>
<h1>Name: <%= name %> </h1>
<h3>UserID: <%= id %></h3>
<h3>Email: <%= email %></h3>
<h3>Contact: <%= contact %></h3>

<br>

<a id="edit_user" href="olduserdetails?userid=<%= id %>"> Edit</a>
</div>
<br> <br>

	<a href="AddTask.jsp" > Add Task </a> <br><br>
	
	
	<% List<TaskDto> tasks = (List)request.getAttribute("tasks"); %>



<% if (!tasks.isEmpty())
{ %>
<table>
<thead>
<tr>
<th>SI.No</th>
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
int count = 0;	
for(TaskDto task:tasks)
{ 
	if(count >= 1)
	{
		count++;
	}
	else
		{ 
		count = 1; 
		}
		%>
<tbody>
	<tr>
	<td> <%= count %></td>
	<td> <%= task.getTaskid() %></td>
	<td> <%= task.getTasktitle() %></td>
	<td> <%= task.getTaskdescription() %></td>
	<td> <%= task.getTaskpriority() %></td>
	<td> <%= task.getTaskduedate() %></td>
	<td> <%= task.getTaskstatus() %></td>
	
	<td> <a id="delete" href="delete?taskid=<%=task.getTaskid()%>"> Delete</a> </td>
	<td> <a id="edit" href="oldtaskdetails?taskid=<%=task.getTaskid()%>"> Edit</a> </td>
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