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

@WebServlet("/updateuser")
@MultipartConfig(maxFileSize = 10*1024*1024)
public class UpdateUser extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		Dto u = (Dto)req.getSession().getAttribute("Dto");
		int userid = u.getUserid();
		String password = u.getUserpassword();
		
		Dao dao = new Dao();
		
		if(!req.getParameter("button").equals("cancel"))
		{
			String userpassword = req.getParameter("Password");
			
		       String username = req.getParameter("Name");
		
		       String useremail = req.getParameter("Email");
		       Long usercontact = Long.parseLong(req.getParameter("Contact"));
		
		       Part imagepart = req.getPart("Image");
		       byte[] imagebyte = imagepart.getInputStream().readAllBytes();
		
		
		
		Dto user = new Dto(userid, username, useremail, usercontact, userpassword, imagebyte);
		
if(userpassword.equals(password))
	{
				
		try                                                     // can't use throws becoz servlets can't handle sql exception
		{
			int res = dao.updateUser(user);
		if(res>0)
		{
			Dto updateuser = dao.findByEmail(useremail);		
			req.getSession().setAttribute("Dto", updateuser);
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
				Dto olduserdetails = null;
				try {
					olduserdetails = dao.findUserById(userid);
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				req.setAttribute("olduserdetails", olduserdetails);
				req.setAttribute("msg", "Invalid Password");
				
				req.getRequestDispatcher("UpdateUser.jsp").include(req, resp);
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

