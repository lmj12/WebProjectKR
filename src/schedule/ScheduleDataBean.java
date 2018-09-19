package schedule;

import java.sql.Timestamp;

public class ScheduleDataBean {
	private int schId;
	private Timestamp schstartTime; 
	private Timestamp schendTime;
	private String jobpId;
	private String jobpName;
	private String schContent;
	
	public int getSchId() {
		return schId;
	}
	public void setSchId(int schId) {
		this.schId = schId;
	}
	public Timestamp getSchstartTime() {
		return schstartTime;
	}
	public void setSchstartTime(Timestamp schstartTime) {
		this.schstartTime = schstartTime;
	}
	public Timestamp getSchendTime() {
		return schendTime;
	}
	public void setSchendTime(Timestamp schendTime) {
		this.schendTime = schendTime;
	}
	public String getJobpId() {
		return jobpId;
	}
	public void setJobpId(String jobpId) {
		this.jobpId = jobpId;
	}
	public String getJobpName() {
		return jobpName;
	}
	public void setJobpName(String jobpName) {
		this.jobpName = jobpName;
	}
	public String getSchContent() {
		return schContent;
	}
	public void setSchContent(String schContent) {
		this.schContent = schContent;
	}
	
}
