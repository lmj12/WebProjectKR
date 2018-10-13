package member.jobprov;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import board.BoardDataBean;
import member.jobseeker.JobSeekerDataBean;
import schedule.job.SchJbException;
@Controller
public class JbpViewHd implements JobProvHandler {
	@Resource
	private JobProvDBBean jbpDao; 
	@Override
	@RequestMapping("/jbpView")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JbpException {
		
			String jobpId = (String) request.getSession().getAttribute( "memid" );
			JobProvDataBean jbpDto = jbpDao.jobpGet(jobpId);
			
			
			request.setAttribute("jbpDto", jbpDto);
			
			return new ModelAndView("/Jbp/jbpMod");
		
	}
	
	@RequestMapping(value = "ajaxJobpGet") 
	@ResponseBody
	public String ajaxProcess2(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		
		List<JobProvDataBean> rst = jbpDao.jobpGet2();
		
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
