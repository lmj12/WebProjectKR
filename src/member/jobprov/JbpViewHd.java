package member.jobprov;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class JbpViewHd implements JobProvHandler {
	@Resource
	private JobProvDBBean jbpDao; 
	@Override
	@RequestMapping("/jbpView")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JbpException {
		
			String jobpId = (String) request.getSession().getAttribute( "memid" );
			JobProvDataBean jbpDto = jbpDao.jobpGet(jobpId);
			
			
			request.setAttribute("jbpDto", jbpDto);
			
			return new ModelAndView("/Jbp/jbpMod");
		
	}

}
