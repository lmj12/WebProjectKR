package team;

import java.sql.Timestamp;

public class TeamDataBean {
	private int teamId;
	private String jbskId;
	private int tmStatus; // 승인상
	private String jbskName;
	private int jbskGender;
	private Timestamp jbskBd;
	private String jbskTel;
	
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
	public String getJbskId() {
		return jbskId;
	}
	public void setJbskId(String jbskId) {
		this.jbskId = jbskId;
	}
	public String getJbskName() {
		return jbskName;
	}
	public void setJbskName(String jbskName) {
		this.jbskName = jbskName;
	}
	public int getJbskGender() {
		return jbskGender;
	}
	public void setJbskGender(int jbskGender) {
		this.jbskGender = jbskGender;
	}
	public Timestamp getJbskBd() {
		return jbskBd;
	}
	public void setJbskBd(Timestamp jbskBd) {
		this.jbskBd = jbskBd;
	}
	public String getJbskTel() {
		return jbskTel;
	}
	public void setJbskTel(String jbskTel) {
		this.jbskTel = jbskTel;
	}
	
	
}
