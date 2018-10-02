package schedule;

import java.io.IOException;
import java.sql.Timestamp;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import schedule.job.SchJbException;
@Controller
public class SchPrevHd implements ScheduleHandler {
	@Resource
	private ScheduleDBBean schDao;	
	@Override
	@RequestMapping("/schPrev")//얘도깡통
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws SchException {
		return null; 
	}
	
	@RequestMapping(value = "ajaxSchPrev", produces="application/json") 
	@ResponseBody
	public String ajaxProcess(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		String jobpId = request.getParameter("jobpId");
		Timestamp stime = new Timestamp(Long.parseLong(request.getParameter("stime")));	//밀리세컨으로 넘어온 시간 타임스탬프로 변환.
		ScheduleDataBean schDto = new ScheduleDataBean();
		schDto.setJobpId(jobpId);
		schDto.setSchstartTime(stime);
		
		/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String st = sdf.format(stime);
		System.out.println(st);
		Map<String, String> map = new HashMap<String, String>(); 
		map.put("jobpId", jobpId);
		map.put("stime", st);*/
		
		schDto = schDao.schPrev(schDto);
		
		ObjectMapper mapper = new ObjectMapper(); 
		
		String schs=""; 
		try { 
			schs = mapper.writeValueAsString(schDto);
			
		} catch (IOException e) { 
			e.printStackTrace(); 
		}
		return schs;
	}

}
