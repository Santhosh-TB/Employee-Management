package dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import dto.Dto;
import dto.TaskDto;

public class Dao 
{
	public static Connection getConnection() throws SQLException, ClassNotFoundException
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?user=root&password=4455");
		return con;
	}
	
	
	public static int saveUser(Dto user) throws ClassNotFoundException, SQLException 
	{
		Connection con = Dao.getConnection();
		
		PreparedStatement pst = con.prepareStatement("insert into user values(?,?,?,?,?,?)");
		
		pst.setInt(1, user.getUserid());
		pst.setString(2, user.getUsername());
		pst.setString(3, user.getUseremail());
		pst.setLong(4, user.getUsercontact());
		pst.setString(5, user.getUserpassword());
		
		pst.setBlob(6, new SerialBlob(user.getUserimage()));     // Converting our image Byte[] to Blob and sending
		
		int res = pst.executeUpdate();
		return res;	
	}
	
	
	public Dto findByEmail (String email) throws ClassNotFoundException, SQLException
	{
		Connection con = Dao.getConnection();
		PreparedStatement pst = con.prepareStatement("Select * from user where useremail = ?");
		pst.setString(1, email);
		
		ResultSet rs = pst.executeQuery();
		
		if(rs.next())
		{
			Dto u = new Dto();
			
			u.setUserid(rs.getInt(1));
			u.setUsername(rs.getString(2));
			u.setUseremail(rs.getString(3));
			u.setUsercontact(rs.getLong(4));
			u.setUserpassword(rs.getString(5));
			
			Blob imageBlob = rs.getBlob(6);
			byte[] image = imageBlob.getBytes(1, (int)imageBlob.length());
			
			u.setUserimage(image);
			
			return u;
		}
		else
		{
			return null;
		}
	
    }
	
	
	public int createTask(TaskDto task) throws ClassNotFoundException, SQLException
	{ 
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("insert into task values (?,?,?,?,?,?,?)");
		pst.setInt(1, task.getTaskid());
		pst.setString(2, task.getTasktitle());
		pst.setString(3, task.getTaskdescription());
		pst.setString(4, task.getTaskpriority());
		pst.setString(5, task.getTaskduedate());
		pst.setString(6, task.getTaskstatus());
		pst.setInt(7, task.getUserid());
		
		int res = pst.executeUpdate();
		return res;
	
	}	
	
	public List<TaskDto> getAllTasksByUserId(int userid) throws ClassNotFoundException, SQLException
	{ 
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("select * from task where userid = ?");
		pst.setInt(1, userid);
		
		ResultSet rs = pst.executeQuery();
		
		List<TaskDto> tasks = new ArrayList<>();
		
		while(rs.next())
		{
			TaskDto task = new TaskDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
			
			tasks.add(task);
					
		}
		
		return tasks;
	}	

}
