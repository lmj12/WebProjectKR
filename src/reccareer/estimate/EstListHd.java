package reccareer.estimate;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class EstListHd implements EstimateHandler {
	@Resource
	private EstimateDBBean estDao;
	@Override
	@RequestMapping("/estList")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws EstException {
		int recId = Integer.parseInt(request.getParameter("recId"));
		List<EstimateDataBean> lists = estDao.estList(recId);
		int size = lists.size();
		request.setAttribute("size", size);
		request.setAttribute("lists", lists);
		return new ModelAndView("estimate/estimateList");
	}

}
