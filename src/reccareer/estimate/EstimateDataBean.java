package reccareer.estimate;

import java.sql.Timestamp;

public class EstimateDataBean {
	private int estId;		//사후평가 아이디
	private int recCrrId;			//지원이력 id
	private int performance;			//사후평가항목 1 번 점수
	private int ontime; 			//사훞여가항목 2번 점수
	private int attitude;
	private Timestamp estDate;	//평가일
	private String jbskId;
	private String jbskName;
	
	public int getEstId() {
		return estId;
	}
	public void setEstId(int estId) {
		this.estId = estId;
	}
	public int getRecCrrId() {
		return recCrrId;
	}
	public void setRecCrrId(int recCrrId) {
		this.recCrrId = recCrrId;
	}
	public int getPerformance() {
		return performance;
	}
	public void setPerformance(int performance) {
		this.performance = performance;
	}
	public int getOntime() {
		return ontime;
	}
	public void setOntime(int ontime) {
		this.ontime = ontime;
	}
	public int getAttitude() {
		return attitude;
	}
	public void setAttitude(int attitude) {
		this.attitude = attitude;
	}
	public Timestamp getEstDate() {
		return estDate;
	}
	public void setEstDate(Timestamp estDate) {
		this.estDate = estDate;
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
	
	
}
