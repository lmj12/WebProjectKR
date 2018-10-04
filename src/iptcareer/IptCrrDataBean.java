package iptcareer;

import java.sql.Timestamp;

public class IptCrrDataBean {
	private int iptId;			// 입력경력 idno
	private String iptCompany;	// 업체명
	private String iptWh; 		// 근무지
	private Timestamp iptStart;	// 시작일시
	private Timestamp iptEnd;	// 종료일시
	private int posId;
	private String jbskId;
	private int iptPeriod;
	
	public int getIptId() {
		return iptId;
	}
	public void setIptId(int iptId) {
		this.iptId = iptId;
	}
	public String getIptCompany() {
		return iptCompany;
	}
	public void setIptCompany(String iptCompany) {
		this.iptCompany = iptCompany;
	}
	public String getIptWh() {
		return iptWh;
	}
	public void setIptWh(String iptWh) {
		this.iptWh = iptWh;
	}
	public Timestamp getIptStart() {
		return iptStart;
	}
	public void setIptStart(Timestamp iptStart) {
		this.iptStart = iptStart;
	}
	public Timestamp getIptEnd() {
		return iptEnd;
	}
	public void setIptEnd(Timestamp iptEnd) {
		this.iptEnd = iptEnd;
	}
	public int getPosId() {
		return posId;
	}
	public void setPosId(int posId) {
		this.posId = posId;
	}
	public String getJbskId() {
		return jbskId;
	}
	public void setJbskId(String jbskId) {
		this.jbskId = jbskId;
	}
	public int getIptPeriod() {
		return iptPeriod;
	}
	public void setIptPeriod(int iptPeriod) {
		this.iptPeriod = iptPeriod;
	}
	
}
