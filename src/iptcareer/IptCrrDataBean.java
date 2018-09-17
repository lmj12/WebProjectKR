package iptcareer;

import java.sql.Timestamp;

public class IptCrrDataBean {
	private int iptId;
	private String iptCompany;
	private String iptWh; // 근무지
	private Timestamp iptStart;
	private Timestamp iptEnd;
	private String iptPos;
	
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
	public String getIptPos() {
		return iptPos;
	}
	public void setIptPos(String iptPos) {
		this.iptPos = iptPos;
	}
	
}
