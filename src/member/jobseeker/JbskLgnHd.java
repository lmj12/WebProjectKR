package member.jobseeker;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.jobseeker.JobSeekerException;
import member.jobseeker.JobSeekerDBBean;


@Controller
public class JbskLgnHd implements JobSeekerHandler {
	@Resource
	public JobSeekerDBBean jbskDao;
	
	@Override
	@RequestMapping("/jbskLgn")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JobSeekerException{
		String jbskId = request.getParameter( "jbskId" );
		String jbskPasswd = request.getParameter( "jbskPasswd" );

		
		int result = jbskDao.jbskLgn( jbskId, jbskPasswd );
		
		request.setAttribute( "result", result );
		request.setAttribute( "jbskId", jbskId);

		return new ModelAndView("/Jbp/jbskLgnPro");
	
	}
}
