package team;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class TeamReqHd implements TeamHandler {

	@Override
	@RequestMapping("/teamReq")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws TeamException {
		// TODO : 팀 제안 핸들러
		return null;
	}

}
