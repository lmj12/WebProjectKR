package iptcareer;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.jobseeker.JobSeekerDBBean;
import member.jobseeker.JobSeekerDataBean;
@Controller
public class IptCrrHd implements InputCareerHandler {

	@Resource
	private IptCrrDBBean iptCrrDao;					// 입력경력사항 DBBean
	@Resource
	private JobSeekerDBBean jbskDao;
	
	@Override
	@RequestMapping("/iptCrr")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws IptCrrException {
		// TODO : 입력경력사항 종합화면
		String jbskId = (String) request.getSession().getAttribute("memid");
		int iptListCnt = iptCrrDao.iptCheck(jbskId);
		JobSeekerDataBean jbskDto = jbskDao.jbskGet(jbskId);
		request.setAttribute("iptListCnt", iptListCnt);	
		
			///////////////// 구직자 기본정보 사항 관련 /////////////////
			request.setAttribute("jbskDto", jbskDto);
			String address = jbskDto.getJbskAdd1()+" "+jbskDto.getJbskAdd2()+" "+jbskDto.getJbskAdd3();
			request.setAttribute("jbskAddress", address);					// 주소
			
			///////////////// 구직자 recCrr 관련 /////////////////
			
			///////////////// 구직자 iptCrr 관련 /////////////////
			// TODO : 자바에서 Date 관련 TimeStamp 로 처리하기 
			List<IptCrrDataBean> iptDtoList = iptCrrDao.iptList(jbskId);
			request.setAttribute("iptDtoList", iptDtoList);
			
		return new ModelAndView("iptCrr/iptCrr");
	}
}