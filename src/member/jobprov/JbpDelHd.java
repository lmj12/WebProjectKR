package member.jobprov;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.jobseeker.JobSeekerException;
@Controller
public class JbpDelHd implements JobProvHandler {
	@Resource
	private JobProvDBBean jbpDao;
	@Override
	@RequestMapping("/jbpDel")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JbpException {
		String id = (String) request.getSession().getAttribute( "memid" );
	
		int result = jbpDao.jobpDel( id );
		request.setAttribute( "result", result );
	
		
		
		// TODO Auto-generated method stub
		return new ModelAndView("Jbp/jbpDel");
	}
	
	@RequestMapping(value = "ajaxjobpDelinADM") 
	@ResponseBody
	public int ajaxProcess(HttpServletRequest request, HttpServletResponse response) throws JbpException {
		String jobpId = request.getParameter("jobpId");
		return jbpDao.jobpDel( jobpId );
	}

}
