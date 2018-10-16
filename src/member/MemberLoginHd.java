package member;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.admin.AdminDBBean;
import member.admin.AdminDataBean;
import member.jobprov.JobProvDBBean;
import member.jobprov.JobProvDataBean;
import member.jobseeker.JobSeekerDBBean;
import member.jobseeker.JobSeekerDataBean;
import team.TeamDBBean;
import team.TeamDataBean;

@Controller
public class MemberLoginHd implements MemberHandler {
	@Resource
	private JobProvDBBean jbpDao;
	@Resource
	public JobSeekerDBBean jbskDao;
	@Resource
	AdminDBBean admDao;
	@Resource
	private TeamDBBean teamDao;
	
	@Override
	@RequestMapping("/memberLogin")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws MemberException {
		// TODO : Member 로그인 통합 컨트롤 핸들러
		// memType : 구직자 : 1, 구인자 : 2 , 관리자 :3 
		int result;
		switch ( request.getParameter("radio-stacked") ) {
		case "jbp":
			String jobpId = request.getParameter( "id" );
			String jobpPasswd = request.getParameter( "passwd" );
			result = -1;
			JobProvDataBean jobpdto = jbpDao.jobpLgn( jobpId, jobpPasswd );
			String jobpcn = jobpdto.getJobpCn();
			if (jobpcn==null || jobpcn.equals("")) {
				result = 0;
			} else {
				result = 1;
				int teamId = teamDao.getTeamId(jobpId);
				request.setAttribute("teamId", teamId);
			}
			request.setAttribute( "result", result );
			request.setAttribute( "jobpId", jobpId);
			request.setAttribute("jobpCn", jobpcn);
			request.setAttribute("memtype", 2); 
			return new ModelAndView("Jbp/jbpLgnPro");

		case "jbsk":
			String jbskId = request.getParameter( "id" );
			String jbskPasswd = request.getParameter( "passwd" );
			result = -1;
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
			String search = jbskdto.getJbskAdd2() + " " + jbskdto.getJbskAdd3();
			request.setAttribute("search", search);
			request.setAttribute("time", time);
			request.setAttribute("teamId", teamId);
			request.setAttribute("teamReq", teamReq);
			request.setAttribute( "result", result );
			request.setAttribute( "jbskId", jbskId);
			request.setAttribute("jbskName", jbskName);
			request.setAttribute("memtype", 1);   
			return new ModelAndView("Jbs/jbskLgnPro");
		case "adm":
			String admId = request.getParameter( "id" );
			String admPasswd = request.getParameter( "passwd" );
			
			AdminDataBean admDto = new AdminDataBean();
			admDto.setAdminId(admId);
			admDto.setAdminPasswd(admPasswd);
			
			result = -1;
			admDto = admDao.adminLgn( admDto );
			
			try {
				if(admDto.getAdminId().equals("") || admDto.getAdminId()==null) {
					result = 0;
				} else {
					result = 1;
				}
			} catch(NullPointerException e){
				result = 0;
			}
			request.setAttribute("result", result);
			request.setAttribute( "admId", admId);
			request.setAttribute("memtype", 3);   
			return new ModelAndView("admin/admLgnPro");
		default:
			return new ModelAndView("main");
		}
	}
}
