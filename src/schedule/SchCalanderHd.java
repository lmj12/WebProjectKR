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
	@RequestMapping("schCalander") //요거 나중에 정리필요  TODO
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws SchException {

		String month = "";
		if(Integer.parseInt(request.getParameter("month"))<10) {
			month = "0" + request.getParameter("month");
		} else {
			month = request.getParameter("month");
		}
		String year = request.getParameter("year");
		Map<String, String> map = new HashMap<String , String>();
		map.put("m", month);
		map.put("y", year);
		List<ScheduleDataBean> schs = schDao.schCal(map);
		request.setAttribute("schs", schs);
		return new ModelAndView("schedule/calanderex");
	}
	
	@RequestMapping(value = "schedule/schCalander", produces="application/json") //요거 나중에 정리필요  TODO
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
