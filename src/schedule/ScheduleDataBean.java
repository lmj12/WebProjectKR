package schedule;

import java.sql.Timestamp;

public class ScheduleDataBean {
	private int scdId;
	private Timestamp startTime;
	private Timestamp endTime;
	private String jbpId;
	private String jbpName;
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
		return jbpId;
	}
	public void setJbpId(String jbpId) {
		this.jbpId = jbpId;
	}
	public String getJbpName() {
		return jbpName;
	}
	public void setJbpName(String jbpName) {
		this.jbpName = jbpName;
	}
	public String getScdContent() {
		return scdContent;
	}
	public void setScdContent(String scdContent) {
		this.scdContent = scdContent;
	}
	
	
	
	
}
