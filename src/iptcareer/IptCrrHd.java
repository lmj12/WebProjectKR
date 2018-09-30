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
	private IptCrrDBBean iptCrr;					// 입력경력사항 DBBean
	
	@Override
	@RequestMapping("/iptCrr")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws IptCrrException {
		// TODO : 입력경력사항 종합화면
		
		String memid = "aaa";	// FIXME : setSession 된 아이디 아이디 임시
		int iptListCnt = iptCrr.iptCheck(memid);

		if(iptListCnt == 0){
			request.setAttribute("iptListCnt", iptListCnt);	// 입력한 내용 없을 때
		} else {
			request.setAttribute("iptListCnt", iptListCnt);	// 입력한 내용 있을 때
			
		}
		return new ModelAndView("iptCrr/iptCrr");
	}
}
