package reccareer;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import schedule.job.SchJbException;
@Controller
public class RecCrrApplyHd implements RecruitCareerHandler {

	@Override
	@RequestMapping("/reccrrApply")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecCrrException {
		return null;	//얘도 깡통일듯.
	}
	
	@RequestMapping(value = "ajaxRecCrrApply", produces="application/json") 
	@ResponseBody
	public String ajaxProcess(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		
		String schs=""; 
		
		return schs;
	}

}
