package reccareer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RecCrrViewDetailHd implements RecruitCareerHandler {
	@Resource
	private RecCrrDBBean recCrrDao;
	@Override
	@RequestMapping("/recCrrDetail")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecCrrException {
		int recId = Integer.parseInt(request.getParameter("recId"));
		String jbskId = request.getParameter("jbskId");
		
		RecCrrDataBean recCrrDto = new RecCrrDataBean();
		recCrrDto.setRecId(recId);
		recCrrDto.setJbskId(jbskId);
		
		recCrrDto = recCrrDao.recCrrGetById(recCrrDto);
		
		request.setAttribute("recCrrDto", recCrrDto);
		
		return new ModelAndView("recCrr/recDetailView");
	}

}
