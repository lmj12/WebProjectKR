package recruit;

import java.util.List;

import member.jobprov.JobProvDataBean;

public class RecListDataBean {
	private RecruitDataBean recDto;
	private JobProvDataBean jobpDto;
	private List<RecruitDataBean> poss;
	
	public RecruitDataBean getRecDto() {
		return recDto;
	}
	public void setRecDto(RecruitDataBean recDto) {
		this.recDto = recDto;
	}
	public JobProvDataBean getJobpDto() {
		return jobpDto;
	}
	public void setJobpDto(JobProvDataBean jobpDto) {
		this.jobpDto = jobpDto;
	}
	public List<RecruitDataBean> getPoss() {
		return poss;
	}
	public void setPoss(List<RecruitDataBean> poss) {
		this.poss = poss;
	}
	
}
