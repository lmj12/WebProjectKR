package schedule;

import java.io.UnsupportedEncodingException;
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
	@RequestMapping("/schWrt") // TODO : 수정필요한 경로.
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws SchException {
		
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	
		Timestamp schstartTime;
		Timestamp schendTime;
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		int date = Integer.parseInt(request.getParameter("date"));
		
		int sthour = Integer.parseInt(request.getParameter("schstartTime").substring(0, 2));
		int stmin = Integer.parseInt(request.getParameter("schstartTime").substring(3,5));
		
		int edhour = Integer.parseInt(request.getParameter("schendTime").substring(0, 2));
		int edmin = Integer.parseInt(request.getParameter("schendTime").substring(3,5));
		
		LocalDateTime loc = LocalDateTime.of(year, month, date, sthour, stmin);
		schstartTime = Timestamp.valueOf(loc);
	
		loc = LocalDateTime.of(year, month, date, edhour, edmin);
		schendTime = Timestamp.valueOf(loc);
	
		// 받은 시간을 처리해서 타임스탬프 형태로 변환하는 과정.
		
		ScheduleDataBean schDto = new ScheduleDataBean();
		schDto.setJobpId(request.getParameter("jobpId"));
		schDto.setJobpName(request.getParameter("jobpName"));
		schDto.setSchContent(request.getParameter("schContent"));
		schDto.setSchstartTime(schstartTime);
		schDto.setSchendTime(schendTime);
		
		
		int rst = schDao.schWrt(schDto); // DB로 처리.
		
		request.setAttribute("rst", rst);
		
		int schId = schDao.schGetId(schDto);
		
		request.setAttribute("schId", schId);
		return new ModelAndView("schedule/schJbWrt"); 
	}

}
