package recruit;

import java.sql.Timestamp;

public class RecruitDataBean {
	private int recId;
	private Timestamp recStart;
	private Timestamp recEnd;
	private String reccontent;
	private String recSite;
	private int recReadCnt;
	private int recStatus;
	private String jobpId;
	private String jbpBnp;
	private String jbpCn; // companyName
	private String posPos;	//직무 포지션
	private int crrCnt;	//지원자 숫자
	
	
	public int getRecId() {
		return recId;
	}
	public void setRecId(int recId) {
		this.recId = recId;
	}
	public Timestamp getRecStart() {
		return recStart;
	}
	public void setRecStart(Timestamp recStart) {
		this.recStart = recStart;
	}
	public Timestamp getRecEnd() {
		return recEnd;
	}
	public void setRecEnd(Timestamp recEnd) {
		this.recEnd = recEnd;
	}
	public String getReccontent() {
		return reccontent;
	}
	public void setReccontent(String reccontent) {
		this.reccontent = reccontent;
	}
	public String getRecSite() {
		return recSite;
	}
	public void setRecSite(String recSite) {
		this.recSite = recSite;
	}
	public int getRecReadCnt() {
		return recReadCnt;
	}
	public void setRecReadCnt(int recReadCnt) {
		this.recReadCnt = recReadCnt;
	}
	public int getRecStatus() {
		return recStatus;
	}
	public void setRecStatus(int recStatus) {
		this.recStatus = recStatus;
	}
	public String getJobpId() {
		return jobpId;
	}
	public void setJobpId(String jobpId) {
		this.jobpId = jobpId;
	}
	public String getJbpBnp() {
		return jbpBnp;
	}
	public void setJbpBnp(String jbpBnp) {
		this.jbpBnp = jbpBnp;
	}
	public String getJbpCn() {
		return jbpCn;
	}
	public void setJbpCn(String jbpCn) {
		this.jbpCn = jbpCn;
	}
	public String getPosPos() {
		return posPos;
	}
	public void setPosPos(String posPos) {
		this.posPos = posPos;
	}
	public int getCrrCnt() {
		return crrCnt;
	}
	public void setCrrCnt(int crrCnt) {
		this.crrCnt = crrCnt;
	}
	
	
	
	
	
}
