package member.jobprov;

import java.sql.Timestamp;

public class JobProvDataBean {
	private String jobpId;
	private String jobpPasswd;
	private Timestamp jobpRegdate;
	private String jobpBno; 
	private String jobpCn;
	
	public String getJobpId() {
		return jobpId;
	}
	public void setJobpId(String jobpId) {
		this.jobpId = jobpId;
	}
	public String getJobpPasswd() {
		return jobpPasswd;
	}
	public void setJobpPasswd(String jobpPasswd) {
		this.jobpPasswd = jobpPasswd;
	}
	public Timestamp getJobpRegdate() {
		return jobpRegdate;
	}
	public void setJobpRegdate(Timestamp jobpRegdate) {
		this.jobpRegdate = jobpRegdate;
	}
	public String getJobpBno() {
		return jobpBno;
	}
	public void setJobpBno(String jobpBno) {
		this.jobpBno = jobpBno;
	}
	public String getJobpCn() {
		return jobpCn;
	}
	public void setJobpCn(String jobpCn) {
		this.jobpCn = jobpCn;
	}
	
	

}
