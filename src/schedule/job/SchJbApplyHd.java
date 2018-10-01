package schedule.job;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class SchJbApplyHd implements ScheduelJobHandler {
	@Resource
	private ScheduleJobDBBean schjbDao;
	@Override
	@RequestMapping("/schJbApply")	//얘는 쓸일이 없는디?;;
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		return null;
	}
	
	@RequestMapping(value = "ajaxSchJbApply") 
	@ResponseBody
	public int ajaxProcess(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		int schjbId = Integer.parseInt(request.getParameter("schjbId"));
		String jbskId = request.getParameter("jbskId");
		Map<String, Object> map = new HashMap<String , Object>();
		map.put("schjbId", schjbId);
		map.put("jbskId", jbskId);
		schjbDao.schJbApply(map);
		return schjbId;
	}

}
