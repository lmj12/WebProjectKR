package member.jobprov;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class JbpLgnHd implements JobProvHandler {

	@Override
	@RequestMapping("/jbpLgn")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JbpException {
		String jobpId = request.getParameter( "jobpId" );
		String jobpPasswd = request.getParameter( "jobpPasswd" );
		int result = -1;
		JobProvDBBean jbpDao = new JobProvDBBean(); 
		JobProvDataBean jobpdto = jbpDao.jobpLgn( jobpId, jobpPasswd );
		String jobpcn = jobpdto.getJobpCn();
		if (jobpcn==null || jobpcn.equals("")) {
			result = 0;
		} else {
			result = 1;
		}
		
		request.setAttribute( "result", result );
		request.setAttribute( "jobpId", jobpId);
		request.setAttribute("jobpCn", jobpcn);
		request.setAttribute("memtype", 2);  // 구직자 : 1, 구인자 : 2 , 관리자 :3 
		// TODO : 구인자 로그인 핸들러
		return new ModelAndView("/Jbp/jbpLgnPro");
	
	}

}
