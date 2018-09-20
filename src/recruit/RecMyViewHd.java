package recruit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class RecMyViewHd implements RecruitHandler {

	@Override
	@RequestMapping("/recMyView")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecruitException {
		// TODO : 구인자-내공고보기 핸들러
		return null;
	}

}
