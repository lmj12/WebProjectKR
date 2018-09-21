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
public class JbskViewHd implements JobSeekerHandler {
	@Resource
	private JobSeekerDBBean jbskDao; 
	@Override
	@RequestMapping("/jbskView") 
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JbskException {
		
			String jbskId = (String) request.getSession().getAttribute( "memid" );
			JobSeekerDataBean jbpDto = jbskDao.jbskGet(jbskId);
			
			
			request.setAttribute("jbskDto", jbskDto);
			
			return new ModelAndView("/Jbs/jbskMod");
		
	}

}
