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
	@RequestMapping("schCalander") 
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws SchException {
		request.setAttribute("year", request.getParameter("year"));
		request.setAttribute("month", request.getParameter("month"));
		request.setAttribute("date", request.getParameter("date"));
		request.setAttribute("day", request.getParameter("day"));
		
		return new ModelAndView("schedule/schWrt"); 
		
	}
	
	@RequestMapping(value = "ajaxCalander", produces="application/json") 
	@ResponseBody
	public String ajaxprocess(HttpServletRequest request, HttpServletResponse response) throws SchException {
		int memType = Integer.parseInt(request.getParameter("memType"));
		
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
			
			if(memType==2) {	
				map.put("jobpId", request.getParameter("memId"));
			} else if (memType==1) {
				String jbskId = request.getParameter("memId");
				//TODO : 팀 만들어진걸로 팀의 주인인 jbpId를 가져오는걸 해야함.
			}
			
			
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
