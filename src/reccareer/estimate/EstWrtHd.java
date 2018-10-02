package reccareer.estimate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class EstWrtHd implements EstimateHandler {

	@Override
	@RequestMapping("/estWrt")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws EstException {
		// TODO 지원이력 ID를 받아서 리퀘스트에 넣는 절차 필요.
		return new ModelAndView("estimate/estimateForm");
	}

}
