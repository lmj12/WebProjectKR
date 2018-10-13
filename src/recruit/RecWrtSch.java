package recruit;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RecWrtSch implements RecruitHandler{
	@Override
	@RequestMapping("/schRec")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecruitException {
		try {
			request.setCharacterEncoding("utf-8");
		} catch ( UnsupportedEncodingException e ) {
			e.printStackTrace();
		}
		int schId = Integer.parseInt(request.getParameter("schId"));
		int st = Integer.parseInt(request.getParameter("st"));
		String pos = request.getParameter("pos");
		
		request.setAttribute("schId", schId);
		request.setAttribute("st", st);
		request.setAttribute("pos", pos);
		return new ModelAndView("recruit/recSch");
	}
}
