package schdule.job;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class SchJbWrtHd implements ScheduelJobHandler {

	@Override
	@RequestMapping("/schJbWrt")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		// TODO Auto-generated method stub
		return null;
	}

}
