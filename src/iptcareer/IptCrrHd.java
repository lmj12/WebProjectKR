package iptcareer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class IptCrrHd implements InputCareerHandler {

	@Resource
	private IptCrrDBBean iptCrrDBBean;
	
	@Override
	@RequestMapping("/iptCrr")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws IptCrrException {
		// TODO : 입력경력사항 리스트
		
		// FIXME : setSession 된 아이디 아이디
		
		return new ModelAndView("");
	}

}
