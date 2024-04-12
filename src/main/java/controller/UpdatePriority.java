package controller;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class UpdatePriority implements ServletContextListener
{
	private BackGroundTask bgt;
	
	@Override
	public void contextInitialized(ServletContextEvent sce) 
	{
		bgt = new BackGroundTask();
		bgt.start();
		
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) 
	{
		if(bgt != null)
		{
			bgt.stopTask();
		}
	}

}
