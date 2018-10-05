package iptcareer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class IptCrrDelHd implements InputCareerHandler {

	@Resource
	private IptCrrDBBean iptDao;
	
	@Override
	@RequestMapping("/iptCrrDel")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws IptCrrException {
		// TODO : 입력경력삭제
		
		int delResult = iptDao.iptDel( Integer.parseInt( request.getParameter("iptId") ) );
		request.setAttribute("delResult", delResult);
		
		return new ModelAndView("iptCrr/iptCrr");
	}

}
