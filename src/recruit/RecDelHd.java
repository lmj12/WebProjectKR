package recruit;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class RecDelHd implements RecruitHandler {
	@Resource
	public RecruitDBBean recDao;
	@Override
	@RequestMapping("/recDel")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecruitException {
		String pageNum = request.getParameter("pageNum");
		
		int recId = Integer.parseInt(request.getParameter("recId"));
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("recId", recId);
		
		int result = recDao.recDel(recId);
		
		request.setAttribute("result", result);
		
		
		
		return new ModelAndView("/recruit/recDel");
	}

}
