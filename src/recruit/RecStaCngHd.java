package recruit;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class RecStaCngHd implements RecruitHandler {
	@Resource
	public RecruitDBBean recDao;
	@Override
	@RequestMapping("/recStaCng")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecruitException {
		int a = Integer.parseInt(request.getParameter("sta"));
		int recId = Integer.parseInt(request.getParameter("recId"));
		if(a ==1) {			
			RecruitDataBean recDto = recDao.recGet(recId);
			recDto.setRecStatus(1);
			recDao.recStaCng(recId);
		}
		
		return new ModelAndView("/recruit/recStaCng");
	}

}
