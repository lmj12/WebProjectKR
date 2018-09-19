package schedule;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class SchWrtHd implements ScheduleHandler {

	@Override
	@RequestMapping("/schWrt")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws SchException {
		// TODO Auto-generated method stub
		return null; 
	}

}
