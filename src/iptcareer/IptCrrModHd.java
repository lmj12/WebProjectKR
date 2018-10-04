package iptcareer;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class IptCrrModHd implements InputCareerHandler {

	@Resource
	private IptCrrDBBean iptDao;
	
	@Override
	@RequestMapping("/iptCrrMod")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws IptCrrException {
		// TODO : 입력경력사항 변경 체크 및 수정
		IptCrrDataBean iptCrrDto = new IptCrrDataBean();
		iptCrrDto.setIptId(Integer.parseInt(request.getParameter("iptId")));
		iptCrrDto.setIptCompany(request.getParameter("iptCompany"));
		iptCrrDto.setIptWh(request.getParameter("iptWh"));
		Timestamp startDate = Timestamp.valueOf(request.getParameter("iptStart"));
		Timestamp endDate = Timestamp.valueOf(request.getParameter("iptEnd"));
		iptCrrDto.setIptStart(startDate);
		iptCrrDto.setIptEnd(endDate);
		iptCrrDto.setPosId(Integer.parseInt(request.getParameter("posId")));
		iptCrrDto.setJbskId(request.getParameter("jbskId"));
		iptCrrDto.setIptPeriod(Integer.parseInt(request.getParameter("iptPeriod")));
		
		int modCheckResult = iptDao.iptModCheck(iptCrrDto);
		request.setAttribute("modCheckResult", modCheckResult);
		
		return new ModelAndView("iptCrr/iptCrr");
	}

}
