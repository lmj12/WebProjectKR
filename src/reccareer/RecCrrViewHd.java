package reccareer;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class RecCrrViewHd implements RecruitCareerHandler {
	@Resource
	private RecCrrDBBean recCrrDao;
	@Override
	@RequestMapping("/recCrrView")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecCrrException {
		int recId = Integer.parseInt(request.getParameter("recId"));
		
		List<RecCrrDataBean> lists = recCrrDao.recCrrApplyList(recId);
		int size = lists.size();
		
		request.setAttribute("recId", recId);
		request.setAttribute("lists", lists);
		request.setAttribute("size", size);
		
		return new ModelAndView("/recCrr/recCrr");
	}

}
