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
public class RecCrrApplyHd implements RecruitCareerHandler {
	@Resource
	private RecCrrDBBean recCrrDao;
	@Override
	@RequestMapping("/reccrrApply")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecCrrException {
		return null;	//얘도 깡통일듯.
	}
	
	@RequestMapping(value = "ajaxRecCrrApply", produces="application/json") 
	@ResponseBody
	public int ajaxProcess(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		int recId = Integer.parseInt(request.getParameter("recId"));
		int posId = Integer.parseInt(request.getParameter("posId"));
		String jbskId = request.getParameter("jbskId");
		
		RecCrrDataBean recCrrDto = new RecCrrDataBean();
		recCrrDto.setRecId(recId);
		recCrrDto.setPosId(posId);
		recCrrDto.setJbskId(jbskId);
		
		int cnt = recCrrDao.appCk(recCrrDto);//이미 지원한 사용자인지 확인하는 메소드.
		if(cnt == 0) {
			int rst = recCrrDao.recCrrApply(recCrrDto);	//	지원 미열람은 0, 열람은 1, 확정은 2, 탈락은3(?) <- 탈락은 필요없을지도.
			return rst;	// 성공시 1 리턴.
		} else {
			return 2;	//이미 지원한 공고일경우 2 리턴.
		}
	}

}
