package member.jobseeker;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.jobseeker.JobSeekerException;
import member.jobseeker.JobSeekerDBBean;
import member.jobseeker.JobSeekerDataBean;

@Controller
public class JbskModHd implements JobSeekerHandler {

	@Resource
	public JobSeekerDBBean jbskDao;
	
	@Override
	@RequestMapping("/jbskMod")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JobSeekerException {
				
		JobSeekerDataBean jbskDto = new JobSeekerDataBean();
		jbskDto.setJbskPasswd( request.getParameter( "jbskPasswd" ) );
		
		// 전화번호
	
		String jbskTel = request.getParameter( "jbskTel" );
		jbskDto.setJbskTel(jbskTel);

		jbskDto.setJbskId( (String) request.getSession().getAttribute( "memid" ) ); 
		JobSeekerDBBean jbskDao = new JobSeekerDBBean();
		
		int result = jbskDao.jbskMod( jbskDto );
		request.setAttribute( "result", result );	
		

		return new ModelAndView("/Jbs/jbskView");
	}
}
