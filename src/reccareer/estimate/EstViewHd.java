package reccareer.estimate;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class EstViewHd implements EstimateHandler {
	@Resource
	private EstimateDBBean estDao;
	@Override
	@RequestMapping("/estView")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws EstException {
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		int recCrrId = Integer.parseInt(request.getParameter("recCrrId"));
		String jbskId = request.getParameter("jbskId");
		String jbskName = request.getParameter("jbskName");
		int jbskGender = Integer.parseInt(request.getParameter("jbskGender"));
		int posId = Integer.parseInt(request.getParameter("posId"));
		String jbskPic = request.getParameter("jbskPic");
		String recId = request.getParameter("recId");
		int estId = Integer.parseInt(request.getParameter("estId"));
		
		if(estId>0) {
			EstimateDataBean estDto = estDao.estGet(estId);
			request.setAttribute("performance", estDto.getPerformance());
			request.setAttribute("ontime", estDto.getOntime());
			request.setAttribute("attitude", estDto.getAttitude());
		}
		
		request.setAttribute("recCrrId", recCrrId);
		request.setAttribute("jbskId", jbskId);
		request.setAttribute("jbskName", jbskName);
		request.setAttribute("jbskGender", jbskGender);
		request.setAttribute("posId", posId);
		request.setAttribute("jbskPic", jbskPic);
		request.setAttribute("recId", recId);
		request.setAttribute("estId", estId);
		
		return new ModelAndView("estimate/estimateView");
	}

}
