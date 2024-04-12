package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import dto.Dto;
import dto.TaskDto;

@WebServlet("/updatetask")
public class UpdateTask extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		Dto user = (Dto)req.getSession().getAttribute("Dto");
		int userid = user.getUserid();
		
		Dao dao = new Dao();
		
		if(!req.getParameter("button").equals("cancel"))
		{
		int taskid = Integer.parseInt(req.getParameter("taskid"));
		
		String taskdescription = req.getParameter("taskdescription");
		String taskpriority ;
		String taskduedate = req.getParameter("taskduedate");
		String taskstatus = req.getParameter("taskstatus");
		
		
		LocalDate today = LocalDate.now();
		LocalDate duedate = LocalDate.parse(taskduedate);
		
		long diff = ChronoUnit.DAYS.between(today,duedate);
		
		if(diff <= 3)
			taskpriority = "High";
		else if(diff >= 4 && diff <= 7)
			taskpriority = "Medium";
		else
			taskpriority = "Low";
		
		TaskDto task;
		if(req.getParameter("taskstatus").equals("Completed"))
		{
			String tdy = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
			task = new TaskDto (taskdescription, taskpriority, taskduedate, taskstatus, tdy, taskid);
		}
		else 
		{
			task = new TaskDto (taskdescription, taskpriority, taskduedate, taskstatus, null, taskid);
		}
			
		
		
		try                                                     // can't use throws becoz servlets can't handle sql exception
		{
			int res = dao.updateTask(task);
		if(res>0)
		{
			req.setAttribute("tasks", dao.getAllTasksByUserId(userid));
			
			req.getRequestDispatcher("home.jsp").include(req, resp);
		}
		else
		{
			resp.getWriter().println("Failed");
		}
		
		}
		
		catch (ClassNotFoundException | SQLException e) 
		{
			e.printStackTrace();
		}
		
	}
		else
		{
            try 
            {
				req.setAttribute("tasks", dao.getAllTasksByUserId(userid));
			} 
            catch (ClassNotFoundException | SQLException e) 
            {
				e.printStackTrace();
			}
			
			req.getRequestDispatcher("home.jsp").include(req, resp);
		}
		
	}

}
