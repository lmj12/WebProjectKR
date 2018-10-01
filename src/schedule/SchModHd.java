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
public class SchModHd implements ScheduleHandler {
	@Resource
	private ScheduleDBBean schDao;
	@Override
	@RequestMapping("/schMod") 
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws SchException {	//리다이렉트용 메소드
		int schId = Integer.parseInt(request.getParameter("schId"));
		ScheduleDataBean schDto = schDao.schGet(schId);
		Timestamp stime = schDto.getSchstartTime();
		LocalDateTime st = stime.toLocalDateTime();
		request.setAttribute("year", st.getYear());
		request.setAttribute("month", st.getMonthValue());
		request.setAttribute("date", st.getDayOfMonth());
		switch(st.getDayOfWeek().getValue()) {
			case 1 :
				request.setAttribute("day", "월");
				break;
			case 2 :
				request.setAttribute("day", "화");
				break;
			case 3 :
				request.setAttribute("day", "수");
				break;
			case 4 :
				request.setAttribute("day", "목");
				break;
			case 5 :
				request.setAttribute("day", "금");
				break;
			case 6 :
				request.setAttribute("day", "토");
				break;
			case 7 :
				request.setAttribute("day", "일");
				break;
		}
		Long s = stime.getTime();
		Timestamp etime = schDto.getSchendTime();
		Long e = etime.getTime();
		String content = schDto.getSchContent();
		
		request.setAttribute("content", content);
		request.setAttribute("stime", s);
		request.setAttribute("etime", e);
		request.setAttribute("schId", schId);
		return new ModelAndView("schedule/schMod");
	}
	
	@RequestMapping("/schModCon") 
	public ModelAndView process2(HttpServletRequest request, HttpServletResponse response) throws SchException {	//수정처리용 메소드
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		
		int schId = Integer.parseInt(request.getParameter("schId"));
		
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
		schDto.setSchId(schId);
		schDto.setSchContent(request.getParameter("schContent"));
		schDto.setSchstartTime(schstartTime);
		schDto.setSchendTime(schendTime);

		schDao.schMod(schDto); // DB로 처리.
		
		
		return new ModelAndView("main");
	}

}
