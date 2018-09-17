package team;

import member.jobprov.JobProvDataBean;
import member.jobseeker.JobSeekerDataBean;

public class TeamDataBean {
	private int teamId;
	private int tmStatus; // 승인상태
	private JobProvDataBean jbpDto;
	private JobSeekerDataBean jbskDto;
	
	public int getTeamId() {
		return teamId;
	}
	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}
	public int getTmStatus() {
		return tmStatus;
	}
	public void setTmStatus(int tmStatus) {
		this.tmStatus = tmStatus;
	}
	public JobProvDataBean getJbpDto() {
		return jbpDto;
	}
	public void setJbpDto(JobProvDataBean jbpDto) {
		this.jbpDto = jbpDto;
	}
	public JobSeekerDataBean getJbskDto() {
		return jbskDto;
	}
	public void setJbskDto(JobSeekerDataBean jbskDto) {
		this.jbskDto = jbskDto;
	}
	
	

	
}
