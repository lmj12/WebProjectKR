package reccareer;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import schedule.job.SchJbException;
@Controller
public class RecCrrCngStaHd implements RecruitCareerHandler {
	@Resource
	private RecCrrDBBean recCrrDao;
	@Override
	@RequestMapping("/recCrrCng")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecCrrException {
		return null;
	}
	
	@RequestMapping(value = "ajaxRecCrrCngSta", produces="application/json") 
	@ResponseBody
	public int ajaxProcess(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		int recCrrId = Integer.parseInt(request.getParameter("recCrrId"));
		int status = Integer.parseInt(request.getParameter("status"));
		
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("recCrrSta", status);
		map.put("recCrrId", recCrrId);
		
		int rst = recCrrDao.recCrrCng(map);
		
		if(status == 2) {
			if(rst==1) {
				return 1;	//확정성공시 반환할 값.
			} else {
				return 2;	//확정 실패시 반환할 값.
			}
		} else if(status == 3) {
			if(rst==1) {
				return 3;	//탈락성공시 반환할 값.
			} else {
				return 4;	//탈락 실패시 반환할 값.
			}
		} else {
			return 5;	//	그밖에 예상외의 오류의 경우 반환값.
		}
		
	}

}
