package dto;

import java.time.LocalDate;

public class TaskDto 
{
	private int taskid;
	private String tasktitle;
	private String taskdescription;
	private String taskpriority;
	private String taskduedate;
	private String taskstatus;
	private String taskc_date;
	private int userid;
	
	
	
	
	public TaskDto(int taskid, String tasktitle, String taskdescription, String taskpriority, String taskduedate,
			String taskstatus, String taskc_date, int userid) {
		this.taskid = taskid;
		this.tasktitle = tasktitle;
		this.taskdescription = taskdescription;
		this.taskpriority = taskpriority;
		this.taskduedate = taskduedate;
		this.taskstatus = taskstatus;
		this.taskc_date = taskc_date;
		this.userid = userid;
	}
	
	
	public TaskDto(String taskdescription, String taskpriority, String taskduedate,
			String taskstatus, String taskc_date, int taskid) {
		this.taskdescription = taskdescription;
		this.taskpriority = taskpriority;
		this.taskduedate = taskduedate;
		this.taskstatus = taskstatus;
		this.taskc_date = taskc_date;
		this.taskid = taskid;
	}
	
	
	public int getTaskid() {
		return taskid;
	}
	public void setTaskid(int taskid) {
		this.taskid = taskid;
	}
	public String getTasktitle() {
		return tasktitle;
	}
	public void setTasktitle(String tasktitle) {
		this.tasktitle = tasktitle;
	}
	public String getTaskdescription() {
		return taskdescription;
	}
	public void setTaskdescription(String taskdescription) {
		this.taskdescription = taskdescription;
	}
	public String getTaskpriority() {
		return taskpriority;
	}
	public void setTaskpriority(String taskpriority) {
		this.taskpriority = taskpriority;
	}
	public String getTaskduedate() {
		return taskduedate;
	}
	public void setTaskduedate(String taskduedate) {
		this.taskduedate = taskduedate;
	}
	public String getTaskstatus() {
		return taskstatus;
	}
	public void setTaskstatus(String taskstatus) {
		this.taskstatus = taskstatus;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getTaskc_date() {
		return taskc_date;
	}


	public void setTaskc_date(String taskc_date) {
		this.taskc_date = taskc_date;
	}
	
	
	

}
