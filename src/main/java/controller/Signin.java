package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.Dto;
import dto.TaskDto;

@WebServlet("/userlogin")
public class Signin extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		if(!req.getParameter("button").equals("cancel"))
		{
			
		String email = req.getParameter("Email");
		String password = req.getParameter("Password");
		
		Dao dao = new Dao();
		
		try 
		{
			Dto u = dao.findByEmail(email);
			if(u!=null)
			{
				if(u.getUserpassword().equals(password))
				{
					List<TaskDto> tasks = dao.getAllTasksByUserId(u.getUserid());
					req.setAttribute("tasks", tasks);
					
					req.getSession().setAttribute("Dto", u);
					req.getRequestDispatcher("home.jsp").include(req, resp);
				}
				else
				{
					req.setAttribute("msg", "Invalid Password");
					req.getRequestDispatcher("Signin.jsp").include(req, resp);
				}
			}
			else
			{
				req.setAttribute("msg", "Invalid E-Mail/Password");
				req.getRequestDispatcher("Signin.jsp").include(req, resp);
			}
			
		}
		catch (ClassNotFoundException | SQLException e) 
		{
			e.printStackTrace();
		}	
			
		
		}
		else
		{
			resp.sendRedirect("index.jsp");
		}
	}
}
