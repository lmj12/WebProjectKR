package member.jobseeker;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.jobseeker.JobSeekerException;
import team.TeamDBBean;
import team.TeamDataBean;
import member.jobprov.JobProvDBBean;
import member.jobprov.JobProvDataBean;
import member.jobseeker.JobSeekerDBBean;


@Controller
public class JbskLgnHd implements JobSeekerHandler {
	// FIXME : MemberLoginHd 에서 대신 처리
	@Resource
	public JobSeekerDBBean jbskDao;
	@Resource
	private TeamDBBean teamDao;
	@Override
	@RequestMapping("/jbskLgn")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JobSeekerException{
		String jbskId = request.getParameter( "id" );
		String jbskPasswd = request.getParameter( "passwd" );
		int result = -1;
		JobSeekerDBBean jbskDao = new JobSeekerDBBean(); 
		JobSeekerDataBean jbskdto = jbskDao.jbskLgn( jbskId, jbskPasswd );
		String jbskName = jbskdto.getJbskName();
		if (jbskName==null || jbskName.equals("")) {
			result = 0;
		} else {
			result = 1;
		}
		List<TeamDataBean> teamIds = teamDao.getTeamIdsk(jbskId);	//	1인값이 제일 먼저 나옴.
		int teamId=0;
		int teamReq=0;
		if(teamIds == null || teamIds.size() == 0) {
			
		} else {
			for (int i=0; i<teamIds.size(); i++) {
				if(teamIds.get(i).getTmStatus()==1) {
					teamId = teamIds.get(i).getTeamId();
				} else {
					teamReq=1;
				}
			}
		}
		long time = System.currentTimeMillis();
		
		request.setAttribute("time", time);
		request.setAttribute("teamId", teamId);
		request.setAttribute("teamReq", teamReq);
		request.setAttribute( "result", result );
		request.setAttribute( "jbskId", jbskId);
		request.setAttribute("jbskName", jbskName);
		request.setAttribute("memtype", 1);  // 구직자 : 1, 구인자 : 2 , 관리자 :3 

		return new ModelAndView("/Jbs/jbskLgnPro");
	
	}
}