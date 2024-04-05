package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.Dao;
import dto.Dto;



@WebServlet("/SaveUser")
@MultipartConfig(maxFileSize = 10*1024*1024)
public class Signup extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		if(!req.getParameter("button").equals("cancel"))
		{
			
			if(!req.getParameter("Name").isEmpty() && !req.getParameter("Email").isEmpty() && !req.getParameter("Contact").isEmpty() && !req.getParameter("Password").isEmpty())
			{
				
			
			Dao dao = new Dao();
			
			int id=1;
			try {
				id += Dao.setUserId();
			} 
			catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			String name = req.getParameter("Name");
			String email = req.getParameter("Email");
			Long contact = Long.parseLong(req.getParameter("Contact"));
			String password = req.getParameter("Password");
			
			Part imagepart = req.getPart("Image");
			byte[] imagebyte = imagepart.getInputStream().readAllBytes();
			
			Dto user = new Dto(id, name, email, contact, password, imagebyte);
			
			
			
			try 
			{
				int res = dao.saveUser(user);
			if(res>0)
			{
				resp.sendRedirect("Signin.jsp");
			}
			else
			{
				resp.sendRedirect("Signup.jsp");
			}
			
			}
			
			catch (ClassNotFoundException | SQLException e) 
			{
				e.printStackTrace();
			}
			}
			else
			{
				req.setAttribute("msg", "All Fields are Mandotary");
				req.getRequestDispatcher("Signup.jsp").include(req, resp);
			}
		}
		else
		{
			resp.sendRedirect("index.jsp");
		}
				
	}
}
