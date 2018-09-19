package schedule;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;
@Controller
public class SchCalanderHd implements ScheduleHandler {
	@Resource
	private ScheduleDBBean schDao;
	@Override
	@RequestMapping("schedule/schCalander") //요거 나중에 정리필요  TODO
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws SchException {
		String month = "";
		if(Integer.parseInt(request.getParameter("month"))<10) {
			month = "0" + request.getParameter("month");
		} else {
			month = request.getParameter("month");
		}
		String year = request.getParameter("year");
		Map<String, String> map = new HashMap<String , String>();
		map.put("m", month);
		map.put("y", year);
		List<ScheduleDataBean> schs = schDao.schCal(map);
		request.setAttribute("schs", schs);
		return new ModelAndView("/schedule/calanderex");
	}


}
