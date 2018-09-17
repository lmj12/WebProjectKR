package reccareer;

import member.jobseeker.JobSeekerDataBean;

public class RecCrrDataBean {
	private int recCrrId;
	private int recId;
	private String posPos;
	private JobSeekerDataBean jbskDto;
	private int recCrrSta;
	
	public int getRecCrrId() {
		return recCrrId;
	}
	public void setRecCrrId(int recCrrId) {
		this.recCrrId = recCrrId;
	}
	public int getRecId() {
		return recId;
	}
	public void setRecId(int recId) {
		this.recId = recId;
	}
	public String getPosPos() {
		return posPos;
	}
	public void setPosPos(String posPos) {
		this.posPos = posPos;
	}
	public JobSeekerDataBean getJbskDto() {
		return jbskDto;
	}
	public void setJbskDto(JobSeekerDataBean jbskDto) {
		this.jbskDto = jbskDto;
	}
	public int getRecCrrSta() {
		return recCrrSta;
	}
	public void setRecCrrSta(int recCrrSta) {
		this.recCrrSta = recCrrSta;
	}
	
	
}
