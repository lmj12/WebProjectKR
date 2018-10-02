package iptcareer;

import java.sql.Timestamp;
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
		String jbskId = "aaa";	// FIXME : setSession 에 있는 아이디 아이디 임시로 주입
		int iptListCnt = iptCrrDao.iptCheck(jbskId);
		JobSeekerDataBean jbskDto = jbskDao.jbskGet(jbskId);
		
		if(iptListCnt == 0){
			request.setAttribute("iptListCnt", iptListCnt);	// 입력한 내용 없을 때
		} else {
			request.setAttribute("iptListCnt", iptListCnt);	// 입력한 내용 있을 때
			
			///////////////// 구직자 기본정보 사항 관련 /////////////////
			request.setAttribute("jbskName", jbskDto.getJbskName());		// 이름
			request.setAttribute("jbskBd", jbskDto.getJbskBd());			// 생년월일
			request.setAttribute("jbskGender", jbskDto.getJbskGender());	// 성별
			request.setAttribute("jbskTel", jbskDto.getJbskTel());			// 연락처
			String address = jbskDto.getJbskAdd1()+jbskDto.getJbskAdd2()+jbskDto.getJbskAdd3();
			request.setAttribute("jbskAddress", address);					// 주소
			
			///////////////// 구직자 recCrr 관련 /////////////////
			
			///////////////// 구직자 iptCrr 관련 /////////////////
			// TODO : 자바에서 Date 관련 TimeStamp 로 처리하기 
			List<IptCrrDataBean> iptDtoList = iptCrrDao.iptList(jbskId);
			request.setAttribute("iptDtoList", iptDtoList);
		}
		return new ModelAndView("iptCrr/iptCrr");
	}
}
