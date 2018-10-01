package member.jobseeker;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.jobseeker.JobSeekerException;
import member.jobprov.JobProvDBBean;
import member.jobprov.JobProvDataBean;
import member.jobseeker.JobSeekerDBBean;


@Controller
public class JbskLgnHd implements JobSeekerHandler {
	@Resource
	public JobSeekerDBBean jbskDao;
	
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
		
		
		
		request.setAttribute( "result", result );
		request.setAttribute( "jbskId", jbskId);
		request.setAttribute("memtype", 1);  // 구직자 : 1, 구인자 : 2 , 관리자 :3 

		return new ModelAndView("/Jbs/jbskLgnPro");
	
	}
}
