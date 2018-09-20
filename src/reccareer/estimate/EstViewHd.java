package reccareer.estimate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class EstViewHd implements EstimateHandler {

	@Override
	@RequestMapping("/estView")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws EstException {
		// TODO : 사후평가 View 핸들러
		return null;
	}

}
