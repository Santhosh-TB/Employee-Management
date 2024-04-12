package controller;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

import dao.Dao;
import dto.TaskDto;

public class BackGroundTask extends Thread
{
	private volatile boolean isRunning = true;

	@Override
	public void run() 
	{
		while(isRunning)
		{
			Dao dao = new Dao();
			
			try 
			{
				List<TaskDto> tasks = dao.getAllTasks();
				for(TaskDto task:tasks)
				{
					LocalDate today = LocalDate.now();
					LocalDate duedate = LocalDate.parse(task.getTaskduedate());
					
					long diff = ChronoUnit.DAYS.between(today,duedate);
					
					if(diff <= 3)
						dao.updatePriority("High", task.getTaskid());
					else if(diff >= 4 && diff <= 7)
						dao.updatePriority("Medium", task.getTaskid());
					else
						dao.updatePriority("Low", task.getTaskid());	
				}
			} 
			catch (ClassNotFoundException | SQLException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			try 
			{
				Thread.sleep(1000);
			}
			catch (InterruptedException e)
			{
				e.printStackTrace();
			}
			
		}
	}
	
	public void stopTask()
	{
		isRunning = false;
	}
}
