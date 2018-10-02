package move;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IptCrrMove implements MoveHandler {

	@Override
//	@RequestMapping("/iptCrr")
	// 필요가 없는 듯
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws MoveException {
		// TODO : move 입력경력사항 List 기본
		return new ModelAndView("iptCrr/iptCrr");
	}
}