package move;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class MypageHd implements MoveHandler{
	@Override
	@RequestMapping("/mypage")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws MoveException {
		// TODO Auto-generated method stub
		return new ModelAndView("mypage");
	}
}
