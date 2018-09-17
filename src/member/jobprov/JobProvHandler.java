package member.jobprov;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface JobProvHandler {
	public ModelAndView process( HttpServletRequest request, HttpServletResponse response )	
			throws JbpException;
}
