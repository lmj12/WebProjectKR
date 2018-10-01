package schedule;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SchViewHd implements ScheduleHandler {
	@Resource
	private ScheduleDBBean schDao;
	
	@Override
	@RequestMapping("/schView") 
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws SchException {
		request.setAttribute("year", request.getParameter("year"));
		request.setAttribute("month", request.getParameter("month"));
		request.setAttribute("date", request.getParameter("date"));
		request.setAttribute("day", request.getParameter("day"));
		
		String jobpId = request.getParameter("memId");
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"))+1;
		int date = Integer.parseInt(request.getParameter("date"));
		LocalDateTime loc = LocalDateTime.of(year, month, date, 0, 0);
		Timestamp stime = Timestamp.valueOf(loc);
		
		LocalDateTime eloc = LocalDateTime.of(year, month, date, 23, 59);
		Timestamp etime = Timestamp.valueOf(eloc);
		
		ScheduleDataBean schDto = new ScheduleDataBean();
		schDto.setJobpId(jobpId);
		schDto.setSchstartTime(stime);
		schDto.setSchendTime(etime);
		
		schDto = schDao.schGet(schDto);
		
		
		int schId = schDto.getSchId();
		String schContent = schDto.getSchContent();
		stime = schDto.getSchstartTime();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/HH/mm/ss");
		String st = sdf.format(new Date(stime.getTime()));
		
		etime = schDto.getSchendTime();
		String et = sdf.format(new Date(etime.getTime()));
		
		request.setAttribute("schId", schId);
		request.setAttribute("schContent", schContent);
		request.setAttribute("stime", st);
		request.setAttribute("etime", et);
		
		return new ModelAndView("schedule/schView"); 
		
	}
}
