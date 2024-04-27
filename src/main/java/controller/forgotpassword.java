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

@WebServlet("/forgot")
public class forgotpassword extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		if(!req.getParameter("button").equals("cancel"))
		{
			if(!req.getParameter("Email").equals("") && !req.getParameter("Contact").equals(""))
			{
				
				String email = req.getParameter("Email");
				long contact = Long.parseLong(req.getParameter("Contact"));
				String new_password = req.getParameter("New Password");
				String conform_password = req.getParameter("Conform Password");
				
				Dao dao = new Dao();
				
				try 
				{
					Dto u = dao.findByEmail(email);
					if(u!=null)
					{
						if(u.getUseremail().equals(email) && u.getUsercontact() == contact)
						{
							
							if(new_password.equals(conform_password))
							{
								int res = dao.updatePassword(u, conform_password);
								
								if(res>0)
								{	
									req.setAttribute("msg", "Password Changed SuccessFully............");
									req.getRequestDispatcher("Signin.jsp").include(req, resp);
								}
								else
								{
									resp.getWriter().println("Failed");
								}
							}
							else
							{
								req.setAttribute("msg", "New Password didn't match with Conform Password");
								req.getRequestDispatcher("forgotpassword.jsp").include(req, resp);
							}
						}
						else
						{
							req.setAttribute("msg", "Invalid Email/Contact");
							req.getRequestDispatcher("forgotpassword.jsp").include(req, resp);
						}
					}
					else
					{
						req.setAttribute("msg", "Invalid Details");
						req.getRequestDispatcher("forgotpassword.jsp").include(req, resp);
					}
					
				}
				catch (ClassNotFoundException | SQLException e) 
				{
					e.printStackTrace();
				}	
					
				
				}
			else
			{
				req.setAttribute("msg", "Invalid Details");
				req.getRequestDispatcher("forgotpassword.jsp").include(req, resp);
			}
				
			}
		
		else
		{
			resp.sendRedirect("Signin.jsp");
		}
		
		
		
		
	}
}
