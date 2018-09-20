package resume;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class ResumeViewHd implements ResumeHandler {

	@Override
	@RequestMapping("/resumeView")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws ResumeException {
		// TODO : 이력서 View 핸들러
		return null;
	}

}
