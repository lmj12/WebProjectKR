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
	
}
