package schedule.job;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class SchJbDelHd implements ScheduelJobHandler {
	@Resource
	private ScheduleJobDBBean schJbDao;
	@Override
	@RequestMapping("/schJbDel")//깡통맨
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		return null;
	}
	
	@RequestMapping(value = "ajaxSchJbDel", produces="application/json") 
	@ResponseBody
	public int ajaxProcess(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		int schjbId = Integer.parseInt(request.getParameter("schjbId"));
		return schJbDao.schJbDel(schjbId);
	}
	
	@RequestMapping(value = "ajaxSchHallDel", produces="application/json") 
	@ResponseBody
	public int ajaxProcess2(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		int schId = Integer.parseInt(request.getParameter("schId"));
		int hallNum = Integer.parseInt(request.getParameter("hallNum"));
		
		ScdJbDataBean schJbDto = new ScdJbDataBean();
		schJbDto.setHallNum(hallNum);
		schJbDto.setSchId(schId);
		
		return schJbDao.schJbDelHall(schJbDto);
	}

}
