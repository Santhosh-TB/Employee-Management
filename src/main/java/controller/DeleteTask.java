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

@WebServlet("/delete")

public class DeleteTask extends HttpServlet
{
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int taskid = Integer.parseInt(req.getParameter("taskid"));
		
		
		Dao dao = new Dao();
		
		try 
		{
	
			HttpSession ses = req.getSession();
			Dto u = (Dto)ses.getAttribute("Dto");
			
			
			if(u != null)
			{
				TaskDto taskdetails = dao.findTaskById(taskid);
				
				if(taskdetails.getUserid() == u.getUserid())
				{
					dao.deleteTask(taskid);
					req.setAttribute("tasks", dao.getAllTasksByUserId(u.getUserid()));
					
					req.getRequestDispatcher("home.jsp").include(req, resp);
				}
				else
				{  
                    req.setAttribute("tasks", dao.getAllTasksByUserId(u.getUserid()));					
					req.getRequestDispatcher("home.jsp").include(req, resp);
				}
			}
			else
			{
				resp.sendRedirect("Signin.jsp");
			}
		
		}
		
		catch (ClassNotFoundException | SQLException e) 
		{
			e.printStackTrace();
		}
	}
}
