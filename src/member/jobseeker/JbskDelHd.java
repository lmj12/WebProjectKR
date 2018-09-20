package member.jobseeker;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.jobprov.JbpException;
import member.jobprov.JobProvDBBean;
import member.jobprov.Override;
import member.jobprov.String;
@Controller
public class JbskDelHd implements JobSeekerHandler {

	@Override
	@RequestMapping("/jbskDel")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JobSeekerException {
		String id = (String) request.getSession().getAttribute( "memid" );
	
		JobSeekerDBBean jbpDao = new JobSeekerDBBean();
		int result = jbskDao.jbskDel( id );
		request.setAttribute( "result", result );
	
		
		
		// TODO Auto-generated method stub
		return new ModelAndView("Jbsk/jbskDel");
	}
}
