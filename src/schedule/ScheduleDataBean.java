package schedule;

import java.sql.Timestamp;

public class ScheduleDataBean {
	private int scdId;
	private Timestamp startTime;
	private Timestamp endTime;
	private String jobpId;
	private String jobpName;
	private String scdContent;
	
	public int getScdId() {
		return scdId;
	}
	public void setScdId(int scdId) {
		this.scdId = scdId;
	}
	public Timestamp getStartTime() {
		return startTime;
	}
	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	public String getJbpId() {
		return jobpId;
	}
	public void setJbpId(String jobpId) {
		this.jobpId = jobpId;
	}
	public String getJbpName() {
		return jobpName;
	}
	public void setJbpName(String jobpName) {
		this.jobpName = jobpName;
	}
	public String getScdContent() {
		return scdContent;
	}
	public void setScdContent(String scdContent) {
		this.scdContent = scdContent;
	}
	
	
	
	
}
