package recruit;

import java.sql.Timestamp;

public class RecruitDataBean {
	private int recId;
	private Timestamp recStart;
	private Timestamp recEnd;
	private String recSite;
	private int recReadCnt;
	private int recStatus;
	private String jbpId;
	private String jbpBnp;
	private String jbpCn; // companyName
	private String posPos;	//직무 포지션
	private int crrCnt;	//지원자 숫자
	
	public int getrecId() {
		return recId;
	}
	public void setrecId(int recId) {
		this.recId = recId;
	}
	public Timestamp getrecStart() {
		return recStart;
	}
	public void setrecStart(Timestamp recStart) {
		this.recStart = recStart;
	}
	public Timestamp getrecEnd() {
		return recEnd;
	}
	public void setrecEnd(Timestamp recEnd) {
		this.recEnd = recEnd;
	}
	public String getrecsite() {
		return recSite;
	}
	public void setrecsite(String recSite) {
		this.recSite = recSite;
	}
	public int getrecReadCnt() {
		return recReadCnt;
	}
	public void setrecReadCnt(int recReadCnt) {
		this.recReadCnt = recReadCnt;
	}
	public int getrecStatus() {
		return recStatus;
	}
	public void setrecStatus(int recStatus) {
		this.recStatus = recStatus;
	}
	public String getJbpId() {
		return jbpId;
	}
	public void setJbpId(String jbpId) {
		this.jbpId = jbpId;
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
