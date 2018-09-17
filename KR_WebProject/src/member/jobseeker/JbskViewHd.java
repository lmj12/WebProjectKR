package member.jobseeker;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class JbskViewHd implements JobSeekerHandler {

	@Override
	@RequestMapping("/jbskView")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JobSeekerException {
		// TODO Auto-generated method stub
		return null;
	}

}
