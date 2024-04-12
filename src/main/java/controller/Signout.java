package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/signout")
public class Signout extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
		HttpSession ses = req.getSession(false);
		ses.invalidate();
		
		req.setAttribute("msg", "SignOut Successfully.....");
		req.getRequestDispatcher("Signin.jsp").include(req, resp);
		
	}

}
