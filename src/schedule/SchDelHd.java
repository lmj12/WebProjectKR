package schedule;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class SchDelHd implements ScheduleHandler {
	@Resource
	private ScheduleDBBean schDao;
	@Override
	@RequestMapping("/schDel")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws SchException {
		int schId = Integer.parseInt(request.getParameter("schId"));
		request.setAttribute("rst", schDao.schDel(schId));
		return null;
	}

}
