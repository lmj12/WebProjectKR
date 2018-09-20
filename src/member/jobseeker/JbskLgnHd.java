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
public class JbskLgnHd implements JobSeekerHandler {

	@Override
	@RequestMapping("/jbskLgn")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JbpException {
		String jbskId = request.getParameter( "jbskId" );
		String jbskPasswd = request.getParameter( "jbskPasswd" );

		JobSeekerDBBean jbskDao = new JobSeekerDBBean(); 
		int result = jbskDao.jbskLgn( jbskId, jbskPasswd );
		
		request.setAttribute( "result", result );
		request.setAttribute( "jbskId", jbskId);

		// TODO Auto-generated method stub
		return new ModelAndView("/Jbp/jbskLgnPro");
	
	}
}
