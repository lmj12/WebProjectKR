package move;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import schedule.ScheduleDBBean;
@Controller
public class ToCalHd implements MoveHandler {
	@Resource
	private ScheduleDBBean schDao;
	@Override
	@RequestMapping("/tocal")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws MoveException {
		int memType = (int) request.getSession().getAttribute("memType");
		if (memType==1) {
			String jbskId = (String) request.getSession().getAttribute("memid");
			request.getSession().setAttribute("jobpId", schDao.getJbpId(jbskId)); 	// 세션에 jobpId넣기.
		}
		
		return new ModelAndView("schedule/calander");
	}

}
