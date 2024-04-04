package controller;

import java.io.IOException;
import java.sql.SQLException;

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
		String taskdescription = req.getParameter("taskdescription");
		String taskpriority = req.getParameter("taskpriority");
		String taskduedate = req.getParameter("taskduedate");
		String taskstatus = req.getParameter("taskstatus");
		
		
		Dto user = (Dto)req.getSession().getAttribute("Dto");
		int userid = user.getUserid();
		
		TaskDto task = new TaskDto (taskdescription, taskpriority, taskduedate, taskstatus, userid);
		
		Dao dao = new Dao();
		try                                                     // can't use throws becoz servlets can't handle sql exception
		{
			int res = dao.updateTask(task);
		if(res>0)
		{
			HttpSession ses = req.getSession();
			Dto u = (Dto)ses.getAttribute("Dto");
			
			req.setAttribute("tasks", dao.getAllTasksByUserId(u.getUserid()));
			
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

}
