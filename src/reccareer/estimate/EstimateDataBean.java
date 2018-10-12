 package reccareer.estimate;

public class EstimateDataBean {
	private int estId;		//사후평가 아이디
	private int performance;			
	private int ontime; 			
	private int attitude;
	private int recCrrId;			//지원이력 id
	private int recId;
	private int posId;
	private int recCrrSta;
	private String jbskId;
	private String jbskName;
	private int jbskGender;
	private String jbskPic;
	
	public int getEstId() {
		return estId;
	}
	public void setEstId(int estId) {
		this.estId = estId;
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
	public int getPosId() {
		return posId;
	}
	public void setPosId(int posId) {
		this.posId = posId;
	}
	public int getRecCrrSta() {
		return recCrrSta;
	}
	public void setRecCrrSta(int recCrrSta) {
		this.recCrrSta = recCrrSta;
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
	public String getJbskPic() {
		return jbskPic;
	}
	public void setJbskPic(String jbskPic) {
		this.jbskPic = jbskPic;
	}
	
}
