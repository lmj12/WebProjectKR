package member.jobprov;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class JbpModHd implements JobProvHandler {

	@Override
	@RequestMapping("/jbpMod")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JbpException {
				
		JobProvDataBean jbpDto = new JobProvDataBean();
		jbpDto.setJobpPasswd( request.getParameter( "jobpPasswd" ) );
		
		// 전화번호
	
		String jobpTel = request.getParameter( "jobpTel" );
		jbpDto.setJobpTel(jobpTel);

		jbpDto.setJobpId( (String) request.getSession().getAttribute( "memid" ) ); 
		JobProvDBBean jbpDao = new JobProvDBBean();
		
		int result = jbpDao.jobpMod( jbpDto );
		request.setAttribute( "result", result );	
		

		return new ModelAndView("/Jbp/jbpView");
	}

}
