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
				
		
		JobProvDataBean jbtDto = new JobProvDataBean();
		jbtDto.setJobpPasswd(( request.getParameter( "jobpPasswd" ) ));
		
		
		// 전화번호
		jbtDto.setJobpTel(request.getParameter("jobpTel"));
		
		JobProvDataBean jbpDto = (JobProvDataBean) request.getAttribute( "jbpDto" );
		JobProvDBBean jbpDao = new JobProvDBBean();
		
		int result = jbpDao.jobpMod( jbpDto );
		
	
		request.setAttribute( "result", result );
		
		jbtDto.setJobpId((String) request.getSession().getAttribute( "memid" ));
		
		request.setAttribute( "jbpDto", jbpDto );
		return new ModelAndView("/Jbp/jbpView");
	}

}
