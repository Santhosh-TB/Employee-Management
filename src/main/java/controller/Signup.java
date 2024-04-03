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
		int id = Integer.parseInt(req.getParameter("Id"));
		String name = req.getParameter("Name");
		String email = req.getParameter("Email");
		Long contact = Long.parseLong(req.getParameter("Contact"));
		String password = req.getParameter("Password");
		
		Part imagepart = req.getPart("Image");
		byte[] imagebyte = imagepart.getInputStream().readAllBytes();
		
		Dto user = new Dto(id, name, email, contact, password, imagebyte);
		
		Dao dao = new Dao();
		
		try 
		{
			int res = dao.saveUser(user);
		if(res>0)
		{
			resp.sendRedirect("Singin.jsp");
		}
		else
		{
			resp.sendRedirect("Singup.jsp");
		}
		
		}
		
		catch (ClassNotFoundException | SQLException e) 
		{
			e.printStackTrace();
		}
				
	}
}
