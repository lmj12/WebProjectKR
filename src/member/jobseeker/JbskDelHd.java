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
public class JbskDelHd implements JobSeekerHandler {
	@Resource
	public JobSeekerDBBean jbskDao;
	@Override
	@RequestMapping("/jbskDel")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JobSeekerException {
		String id = (String) request.getSession().getAttribute( "memid" );
	
		
		int result = jbskDao.jbskDel( id );
		request.setAttribute( "result", result );
	
		
		
		// TODO Auto-generated method stub
		return new ModelAndView("Jbsk/jbskDel");
	}
}
