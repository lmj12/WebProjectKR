package move;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class LogoutHd implements MoveHandler {

	@Override
	@RequestMapping("/logout")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws MoveException {
		request.getSession().removeAttribute( "memid" );
		// TODO : logout/로그아웃핸들러
		return new ModelAndView("main");
	}

}
