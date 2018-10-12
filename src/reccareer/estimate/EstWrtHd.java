package reccareer.estimate;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class EstWrtHd implements EstimateHandler {
	@Resource
	private EstimateDBBean estDao;
	@Override
	@RequestMapping("/estWrt")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws EstException {
		
		int recCrrId = Integer.parseInt(request.getParameter("recCrrId"));
		int performance = Integer.parseInt(request.getParameter("performance"));
		int ontime = Integer.parseInt(request.getParameter("ontime"));
		int attitude = Integer.parseInt(request.getParameter("attitude"));
		
		EstimateDataBean estDto = new EstimateDataBean();
		estDto.setRecCrrId(recCrrId);
		estDto.setPerformance(performance);
		estDto.setOntime(ontime);
		estDto.setAttitude(attitude);
		
		int rst = estDao.estWrt(estDto);
		
		request.setAttribute("rst", rst);
		request.setAttribute("recId", request.getParameter("recId"));
		
		return new ModelAndView("estimate/estWrtPro");
	}
	
	
	

}
