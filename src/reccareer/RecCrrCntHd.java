package reccareer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class RecCrrCntHd implements RecruitCareerHandler {

	@Override
	@RequestMapping("/recCrrCnt")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecCrrException {
		// TODO : 공고 지원자숫자 반환 핸들러
		return null;
	}

}
