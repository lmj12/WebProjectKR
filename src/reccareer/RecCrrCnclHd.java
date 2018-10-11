package reccareer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import schedule.job.SchJbException;
@Controller
public class RecCrrCnclHd implements RecruitCareerHandler {
	@Resource
	private RecCrrDBBean recCrrDao;
	@Override
	@RequestMapping("/recCrrCncl")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecCrrException {
		return null;
	}
	
	@RequestMapping(value = "ajaxRecCrrCncl", produces="application/json") 
	@ResponseBody
	public int ajaxProcess(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		int recId = Integer.parseInt(request.getParameter("recId"));
		String jbskId = request.getParameter("jbskId");
		
		RecCrrDataBean recCrrDto = new RecCrrDataBean();
		recCrrDto.setRecId(recId);
		recCrrDto.setJbskId(jbskId);
		
		int rst = recCrrDao.recCrrCncl(recCrrDto);
		return rst;	// 데이터가 존재할시 rst 리턴. 삭제 성공시 1 아니면 0
	}
	
	@RequestMapping(value = "ajaxRecCrrCk", produces="application/json") 
	@ResponseBody
	public int ajaxProcess2(HttpServletRequest request, HttpServletResponse response) throws SchJbException {	//현재 지원한 직무를 확인해주는 메소드.
		int recId = Integer.parseInt(request.getParameter("recId"));
		String jbskId = request.getParameter("jbskId");
		
		RecCrrDataBean recCrrDto = new RecCrrDataBean();
		recCrrDto.setRecId(recId);
		recCrrDto.setJbskId(jbskId);
		
		int cnt = recCrrDao.appCk(recCrrDto);//이미 지원한 사용자인지 확인하는 메소드.
		if(cnt == 1) {
			recCrrDto = recCrrDao.recCrrGetById(recCrrDto);
			return recCrrDto.getPosId();	//  이미 지원한 공고의 경우 현재 지원한 직무 리턴.
		} else {
			return 0;	//지원하지않은경우 0리턴
		}
	}
	
	@RequestMapping(value = "ajaxRecCrrMod", produces="application/json")
	@ResponseBody
	public int ajaxProcess3(HttpServletRequest request, HttpServletResponse response) throws SchJbException {//수정메소드
		int recId = Integer.parseInt(request.getParameter("recId"));
		int posId = Integer.parseInt(request.getParameter("posId"));
		String jbskId = request.getParameter("jbskId");
		
		RecCrrDataBean recCrrDto = new RecCrrDataBean();
		recCrrDto.setRecId(recId);
		recCrrDto.setPosId(posId);
		recCrrDto.setJbskId(jbskId);
		
		return recCrrDao.recCrrMod(recCrrDto);
	}
}
