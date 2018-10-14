package member.jobseeker;

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

import member.jobseeker.JobSeekerException;
import schedule.job.SchJbException;
import member.jobprov.JobProvDataBean;
import member.jobseeker.JobSeekerDBBean;
import member.jobseeker.JobSeekerDataBean;

@Controller
public class JbskViewHd implements JobSeekerHandler {
	@Resource
	private JobSeekerDBBean jbskDao; 
	@Override
	@RequestMapping("/jbskView") 
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JobSeekerException {
		
			String jbskId = (String) request.getSession().getAttribute( "memid" );
			JobSeekerDataBean jbskDto = jbskDao.jbskGet(jbskId);
			
			
			request.setAttribute("jbskDto", jbskDto);
			
			return new ModelAndView("/Jbs/jbskMod");
		
	}
	
	@RequestMapping(value = "ajaxJbskGet") 
	@ResponseBody
	public String ajaxProcess(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		List<JobSeekerDataBean> rst = jbskDao.jbskGet2();
		
		ObjectMapper mapper = new ObjectMapper(); 
		
		String sin=""; 
		try { 
			sin = mapper.writeValueAsString(rst);
			
		} catch (IOException e) { 
			e.printStackTrace(); 
		}
		
		return sin;
	}
	
	
	@RequestMapping(value = "ajaxRsmSearch") 
	@ResponseBody
	public String ajaxProcess2(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		
		//TODO 수정중.
		int gender = Integer.parseInt(request.getParameter("gender"));
		String pos = request.getParameter("position");
		String place = request.getParameter("place");
		
		
		String query = "select * from KR where "; 
		String [] poss = pos.split(",");
		String quePos = "AND";
		for(int i =0; i<poss.length; i++) {
			quePos += " ";
		}
		
		
		
		
		String queAdd = "";
		String []ad = place.split(" ");
		
		if(ad[0].equals("서울") || ad[0].equals("대전") || ad[0].equals("대구") || ad[0].equals("부산") || ad[0].equals("울산") || ad[0].equals("광주") || ad[0].equals("인천") || ad[0].equals("세종특별자치시")){
			queAdd = "jbskAdd2 = " +  ad[0] + " AND jbskAdd3 = " + ad[1];
		} else {
			queAdd = "jbskAdd2 = " +  ad[1] + " AND jbskAdd3 = " + ad[2];
		}
		String queGen = " AND jbskGender=" + gender;
		
		
		
		
		
		List<JobSeekerDataBean> rst = jbskDao.jbskGet2();
		
		ObjectMapper mapper = new ObjectMapper(); 
		
		String sin=""; 
		try { 
			sin = mapper.writeValueAsString(rst);
			
		} catch (IOException e) { 
			e.printStackTrace(); 
		}
		
		return sin;
	}
	
}
