package schedule;



import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
@Controller
public class SchCalanderHd implements ScheduleHandler {
	@Resource
	private ScheduleDBBean schDao;
	@Override
	@RequestMapping("schedule/schCalander") // TODO : 얘는 schWrt나 schView로 보내주는 핸들러. 나중에 주소정리필요.
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws SchException {
		request.setAttribute("year", request.getParameter("year"));
		request.setAttribute("month", request.getParameter("month"));
		request.setAttribute("date", request.getParameter("date"));
		request.setAttribute("day", request.getParameter("day"));
		int len = Integer.parseInt(request.getParameter("len"));
		if (len < 3) {
			return new ModelAndView("schedule/schWrt"); // 길이가 2이하, 즉 스케줄이 없으면 스케줄 만드는 페이지로 이동
		} else {
			return new ModelAndView("schedule/schView"); // 길이가 2초과, 즉 스케줄이 존재하면 스케줄 보는 페이지로 이동.
		}
	}
	
	@RequestMapping(value = "schedule/ajaxCalander", produces="application/json") // TODO : 요거 나중에 정리필요  
	@ResponseBody
	public String ajaxprocess(HttpServletRequest request, HttpServletResponse response) throws SchException {
		String month = "";
		String tmonth = "";
		int mon = Integer.parseInt(request.getParameter("month"));
		int nmon = mon +1;
		String year = request.getParameter("year");
		String tyear = request.getParameter("year");
		if(mon<9) {  //mon이 1~8일때
			month = "0" + mon;
			tmonth = "0" + nmon;
		} else if (mon<10) { // mon이 9일때
			month = "0" + mon;
			tmonth = Integer.toString(nmon);
		} else if(mon<12){ // 10,11,12일때
			month = request.getParameter("month");
			tmonth = Integer.toString(nmon);
		} else {
			month = request.getParameter("month");
			tmonth = "01";
			tyear = Integer.toString(Integer.parseInt(tyear)+1);
		}
		
		Map<String, String> map = new HashMap<String , String>();
		map.put("m", month);
		map.put("y", year);
		map.put("tm", tmonth);
		map.put("ty", tyear);
		List<ScheduleDataBean> rst = schDao.schCal(map);
		
		ObjectMapper mapper = new ObjectMapper(); 
		
		String schs=""; 
		try { 
			schs = mapper.writeValueAsString(rst);
			
		} catch (IOException e) { 
			e.printStackTrace(); 
		}
		
		return schs;
	}


}
