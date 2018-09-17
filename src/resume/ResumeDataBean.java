package resume;

import member.jobseeker.JobSeekerDataBean;

public class ResumeDataBean {
	private int rsmId;
	private String rsmText;
	private JobSeekerDataBean jbskDto; 
	
	public int getRsmId() {
		return rsmId;
	}
	public void setRsmId(int rsmId) {
		this.rsmId = rsmId;
	}
	public String getRsmText() {
		return rsmText;
	}
	public void setRsmText(String rsmText) {
		this.rsmText = rsmText;
	}
	public JobSeekerDataBean getJbskDto() {
		return jbskDto;
	}
	public void setJbskDto(JobSeekerDataBean jbskDto) {
		this.jbskDto = jbskDto;
	}

	
}
