package schedule;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class SchWrtHd implements ScheduleHandler {
	@Resource
	private ScheduleDBBean schDao;
	@Override
	@RequestMapping("schedule/schWrt") // TODO : 수정필요한 경로.
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws SchException {
		
		Timestamp schstartTime;
		Timestamp schendTime;
		
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		int day = Integer.parseInt(request.getParameter("day"));
		
		int sthour = Integer.parseInt(request.getParameter("schstartTime").substring(0, 2));
		int stmin = Integer.parseInt(request.getParameter("schstartTime").substring(3,5));
		String sttype = request.getParameter("schstartTime").substring(6);
		
		int edhour = Integer.parseInt(request.getParameter("schendTime").substring(0, 2));
		int edmin = Integer.parseInt(request.getParameter("schendTime").substring(3,5));
		String edtype = request.getParameter("schendTime").substring(6);
		
		if(sttype.equals("AM")) {
			LocalDateTime loc = LocalDateTime.of(year, month, day, sthour, stmin);
			schstartTime = Timestamp.valueOf(loc);
		} else {
			LocalDateTime loc = LocalDateTime.of(year, month, day, sthour+12, stmin);
			schstartTime = Timestamp.valueOf(loc);
		}
		
		if(edtype.equals("AM")) {
			LocalDateTime loc = LocalDateTime.of(year, month, day, edhour, edmin);
			schendTime = Timestamp.valueOf(loc);
		} else {
			LocalDateTime loc = LocalDateTime.of(year, month, day, edhour+12, edmin);
			schendTime = Timestamp.valueOf(loc);
		}
		// 받은 시간을 처리해서 타임스탬프 형태로 변환하는 과정.
		
		ScheduleDataBean schDto = new ScheduleDataBean();
		schDto.setJobpId(request.getParameter("jobpId"));
		schDto.setJobpName(request.getParameter("jobpName"));
		schDto.setSchContent(request.getParameter("schContent"));
		schDto.setSchstartTime(schstartTime);
		schDto.setSchendTime(schendTime);
		
		int rst = schDao.schWrt(schDto); // DB로 처리.
		
		request.setAttribute("rst", rst);
		
		
		return new ModelAndView("schedule/schJbWrt"); 
	}

}
