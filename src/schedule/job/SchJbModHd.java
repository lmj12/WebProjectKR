package schedule.job;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SchJbModHd implements ScheduelJobHandler {
	@Resource
	private ScheduleJobDBBean schJbDao;
	@Override
	@RequestMapping("/schJbMod")	//빈깡통.할일없음.
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		return null;
	}
	
	@RequestMapping(value = "ajaxSchJbMod", produces="application/json") 
	@ResponseBody
	public int ajaxProcess(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		String posId = request.getParameter("sel");
		int schjbId = Integer.parseInt(request.getParameter("schjbId"));
		
		ScdJbDataBean schJbDto = new ScdJbDataBean();
		schJbDto.setposId(posId);
		schJbDto.setSchjbId(schjbId);
		
		return schJbDao.schJbMod(schJbDto);
		
	}

}
