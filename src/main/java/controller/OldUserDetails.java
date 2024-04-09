package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.Dto;


@WebServlet("/olduserdetails")

public class OldUserDetails extends HttpServlet
{


	protected void doGet (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int userid = Integer.parseInt(req.getParameter("userid"));		
		
		Dao dao = new Dao();

		try 
		{
			Dto olduserdetails = dao.findUserById(userid);
			req.setAttribute("olduserdetails", olduserdetails);
			
			req.getRequestDispatcher("UpdateUser.jsp").include(req, resp);
		}
		catch (ClassNotFoundException | SQLException e) 
		{
			
			e.printStackTrace();
		}
		
		
	}
}
