package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.TaskDto;


@WebServlet("/oldtaskdetails")

public class OldTaskDetails extends HttpServlet
{


	protected void doGet (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int taskid = Integer.parseInt(req.getParameter("taskid"));		
		
		Dao dao = new Dao();

		try 
		{
			TaskDto task = dao.findTaskById(taskid);
			req.setAttribute("task", task);
			
			req.getRequestDispatcher("UpdateTask.jsp").include(req, resp);
		}
		catch (ClassNotFoundException | SQLException e) 
		{
			
			e.printStackTrace();
		}
		
		
	}
}
