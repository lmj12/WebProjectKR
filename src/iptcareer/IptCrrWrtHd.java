package iptcareer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class IptCrrWrtHd implements InputCareerHandler {

	@Override
	@RequestMapping("/iptCrrWrtPro")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws IptCrrException {
		// TODO : 입력경력사항 writer
		// 1. 로그인한 세션에서 아이디 받기
		// 2. (유효성검사) 로그인한 아이디가 jbsk 맞는지 확인
		// 3. jbsk가 아니면 false 페이지로 보내기 
		//		, 맞으면 받은 아이디를 iptCrrWrt.jsp 로 넘겨줌
		
		return new ModelAndView("iptCrr/iptCrr");
	}

}
