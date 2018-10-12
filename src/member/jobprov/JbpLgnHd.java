package member.jobprov;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import team.TeamDBBean;
@Controller
public class JbpLgnHd implements JobProvHandler {
	@Resource
	private JobProvDBBean jbpDao;
	@Resource
	private TeamDBBean teamDao;
	@Override
	@RequestMapping("/jbpLgn")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JbpException {
		String jobpId = request.getParameter( "id" );
		String jobpPasswd = request.getParameter( "passwd" );
		int result = -1;
		JobProvDataBean jobpdto = jbpDao.jobpLgn( jobpId, jobpPasswd );
		String jobpcn = jobpdto.getJobpCn();
		if (jobpcn==null || jobpcn.equals("")) {
			result = 0;
		} else {
			result = 1;
			
		}
		int teamId = teamDao.getTeamId(jobpId);
		
		request.setAttribute("teamId", teamId);
		request.setAttribute( "result", result );
		request.setAttribute( "jobpId", jobpId);
		request.setAttribute("jobpCn", jobpcn);
		request.setAttribute("memtype", 2);  // 구직자 : 1, 구인자 : 2 , 관리자 :3 
		return new ModelAndView("/Jbp/jbpLgnPro");
	}

}
