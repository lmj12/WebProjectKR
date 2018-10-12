package reccareer;

import java.text.SimpleDateFormat;
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
		
		for(int i=0; i<recCrrlists.size(); i++) {
			RecCrrDataBean recCrrDto = recCrrlists.get(i);
			SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd hh:mm");
			recCrrDto.setStime(sf.format(recCrrDto.getRecEnd()));
		}
		
		
		List<RecCrrDataBean> recCrrPrevlists = recCrrDao.recCrrMyPrevList(jbskId);
		request.setAttribute("recCrrPrevlists", recCrrPrevlists);
		
		for(int i=0; i<recCrrPrevlists.size(); i++) {
			RecCrrDataBean recCrrDto = recCrrPrevlists.get(i);
			SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd hh:mm");
			recCrrDto.setStime(sf.format(recCrrDto.getRecEnd()));
		}
		
		
		return new ModelAndView("/recCrr/recCrrMy");
	}

}
