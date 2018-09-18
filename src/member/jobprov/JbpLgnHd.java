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

		JobProvDBBean jbpDao = new JobProvDBBean();
		int result = jbpDao.jobpLgn( jobpId, jobpPasswd );

		request.setAttribute( "result", result );
		request.setAttribute( "jobpId", jobpId);
		
		
		
		// TODO Auto-generated method stub
		return new ModelAndView("/Jbp/jbpLgnPro");
	}

}
