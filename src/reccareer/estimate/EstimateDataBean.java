package reccareer.estimate;

import java.sql.Timestamp;

public class EstimateDataBean {
	private int estId;		//사후평가 아이디
	private int crrId;			//지원이력 id
	private int est1;			//사후평가항목 1 번 점수
	private int est2; 			//사훞여가항목 2번 점수
	private Timestamp estDate;	//평가일
	
	public int getEstId() {
		return estId;
	}
	public void setEstId(int estId) {
		this.estId = estId;
	}
	public int getCrrId() {
		return crrId;
	}
	public void setCrrId(int crrId) {
		this.crrId = crrId;
	}
	public int getEst1() {
		return est1;
	}
	public void setEst1(int est1) {
		this.est1 = est1;
	}
	public int getEst2() {
		return est2;
	}
	public void setEst2(int est2) {
		this.est2 = est2;
	}
	public Timestamp getEstDate() {
		return estDate;
	}
	public void setEstDate(Timestamp estDate) {
		this.estDate = estDate;
	}
	
	
	
}
