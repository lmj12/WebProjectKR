package reccareer;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class RecCrrMyViewHd implements RecruitCareerHandler {
	@Resource
	private RecCrrDBBean recCrrDao;
	@Override
	@RequestMapping("/recCrrMy")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecCrrException {
		String jbskId = (String) request.getSession().getAttribute("memid");
		
		List<RecCrrDataBean> recCrrlists = recCrrDao.recCrrMyList(jbskId);
		request.setAttribute("recCrrlists", recCrrlists);
		
		List<RecCrrDataBean> recCrrPrevlists = recCrrDao.recCrrMyPrevList(jbskId);
		request.setAttribute("recCrrPrevlists", recCrrPrevlists);
		
		return new ModelAndView("/recCrr/recCrrMy");
	}

}
