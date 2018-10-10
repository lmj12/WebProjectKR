package mybatis;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import board.BoardDBBean;
import iptcareer.IptCrrDBBean;
import member.admin.AdminDBBean;
import member.jobprov.JobProvDBBean;
import member.jobseeker.JobSeekerDBBean;
import move.MoveDBBean;
import reccareer.RecCrrDBBean;
import reccareer.estimate.EstimateDBBean;
import recruit.RecruitDBBean;
import schedule.ScheduleDBBean;
import schedule.job.ScheduleJobDBBean;
import team.TeamDBBean;

@Configuration
public class CreateBean {
	
	@Bean
	public ViewResolver viewResolver() {
		UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
	
	
	@Bean
	public BoardDBBean boardDao() {
		BoardDBBean boardDao = new BoardDBBean();
		return boardDao;
	}
	
	@Bean
	public IptCrrDBBean iptCrrDao() {
		IptCrrDBBean iptCrrDao = new IptCrrDBBean();
		return iptCrrDao;
	}
	
	
	@Bean
	public AdminDBBean admDao() {
		AdminDBBean admDao = new AdminDBBean();
		return admDao;
	}
	
	@Bean
	public JobProvDBBean jbpDao() {
		JobProvDBBean jbpDao = new JobProvDBBean();
		return jbpDao;
	}
	
	@Bean
	public JobSeekerDBBean jbskDao() {
		JobSeekerDBBean jbskDao = new JobSeekerDBBean();
		return jbskDao;
	}
	
	@Bean
	public MoveDBBean moveDao() {
		MoveDBBean moveDao = new MoveDBBean();
		return moveDao;
	}
	
	@Bean
	public RecCrrDBBean recCrrDao() {
		RecCrrDBBean recCrrDao = new RecCrrDBBean();
		return recCrrDao;
	}
	
	@Bean
	public EstimateDBBean estDao() {
		EstimateDBBean estDao = new EstimateDBBean();
		return estDao;
	}
	
	@Bean
	public RecruitDBBean recDao() {
		RecruitDBBean recDao = new RecruitDBBean();
		return recDao;
	}
	
	@Bean
	public ScheduleJobDBBean schJbDao() {
		ScheduleJobDBBean schJbDao = new ScheduleJobDBBean();
		return schJbDao;
	}
	
	@Bean
	public ScheduleDBBean schDao() {
		ScheduleDBBean schDao = new ScheduleDBBean();
		return schDao;
	}
	
	@Bean
	public TeamDBBean teamDao() {
		TeamDBBean teamDao = new TeamDBBean();
		return teamDao;
	}

}