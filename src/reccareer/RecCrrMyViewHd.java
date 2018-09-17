package reccareer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class RecCrrMyViewHd implements RecruitCareerHandler {

	@Override
	@RequestMapping("/recCrrMyView")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecCrrException {
		return null;
	}

}
