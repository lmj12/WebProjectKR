package reccareer;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import schedule.job.SchJbException;
@Controller
public class RecCrrApplyHd implements RecruitCareerHandler {
	@Resource
	private RecCrrDBBean recCrrDao;
	@Override
	@RequestMapping("/reccrrApply")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecCrrException {
		return null;	//얘도 깡통일듯.
	}
	
	@RequestMapping(value = "ajaxRecCrrApply", produces="application/json") 
	@ResponseBody
	public String ajaxProcess(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		int recId = Integer.parseInt(request.getParameter("recId"));
		int posId = Integer.parseInt(request.getParameter("posId"));
		String jbskId = request.getParameter("jbskId");
		
		
		String schs=""; 
		return schs;
	}

}
