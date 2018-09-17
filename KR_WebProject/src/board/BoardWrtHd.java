package board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class BoardWrtHd implements BoardHandler {

	@Override
	@RequestMapping("/boardWrt")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws BoardException {
		return null;
	}

}
