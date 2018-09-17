package member.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminLgnHd implements AdminHandler {

	@Override
	@RequestMapping("/adminLgn")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws AdminException {
		// TODO Auto-generated method stub
		return null;
	}

}
