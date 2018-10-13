package schedule.job;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
@Controller
public class SchJbViewHd implements ScheduelJobHandler {
	@Resource
	private ScheduleJobDBBean schjbDao;
	@Override
	@RequestMapping("/schJbView")	//	얘도 쓸일이 없는디?';;
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		// TODO Auto-generated method stub
		return null;
	}
	
	@RequestMapping(value = "ajaxSchJbView", produces="application/json") 
	@ResponseBody
	public String ajaxProcess(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		int schId = Integer.parseInt(request.getParameter("schId"));
		
		List<ScdJbDataBean> rst = schjbDao.schJbList(schId);
		ObjectMapper mapper = new ObjectMapper(); 
		String schjbs=""; 
		try { 
			schjbs = mapper.writeValueAsString(rst);
			
		} catch (IOException e) { 
			e.printStackTrace(); 
		}
	
		return schjbs;
	}
	
	@RequestMapping(value = "ajaxSchJbRec", produces="application/json") 
	@ResponseBody
	public String ajaxProcess2(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		int schId = Integer.parseInt(request.getParameter("schId"));
		
		List<Integer> rst = schjbDao.schJbRec(schId);
		ObjectMapper mapper = new ObjectMapper(); 
		String schjbs=""; 
		try { 
			schjbs = mapper.writeValueAsString(rst);
			
		} catch (IOException e) { 
			e.printStackTrace(); 
		}
	
		return schjbs;
	}

}
