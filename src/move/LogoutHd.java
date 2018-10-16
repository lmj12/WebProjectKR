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
		// TODO : logout/로그아웃핸들러
		if( request.getSession().getAttribute("memid") == null || request.getSession().getAttribute("memid").equals("") ){
			return new ModelAndView("main");
		} else {
			request.getSession().removeAttribute( "memid" );
			request.getSession().removeAttribute("memName");
			int memType = (Integer) request.getSession().getAttribute("memType");
			if(memType==2) {
				request.getSession().removeAttribute("teamId");
			} else if(memType==1) {
				request.getSession().removeAttribute("teamId");
				request.getSession().removeAttribute("teamReq");
				request.getSession().removeAttribute("time");
				request.getSession().removeAttribute("popCk");
				request.getSession().removeAttribute("popNum");
			} else if(memType==3) {
				
			}
			request.getSession().removeAttribute("memType");
			return new ModelAndView("main");
		}
	}
}
