package member.jobseeker;

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

import member.jobseeker.JobSeekerException;
import schedule.job.SchJbException;
import member.jobprov.JobProvDBBean;
import member.jobseeker.JobSeekerDBBean;

@Controller
public class JbskDelHd implements JobSeekerHandler {
	@Resource
	public JobSeekerDBBean jbskDao;
	@Override
	@RequestMapping("/jbskDel")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JobSeekerException {
		String id = (String) request.getSession().getAttribute( "memid" );
	
		JobSeekerDBBean jbskDao = new JobSeekerDBBean();
		int result = jbskDao.jbskDel( id );
		request.setAttribute( "result", result );
	
		
		
		// TODO Auto-generated method stub
		return new ModelAndView("Jbs/jbskDel");
	}
	
	@RequestMapping(value = "ajaxjbskDelinADM") 
	@ResponseBody
	public int ajaxProcess(HttpServletRequest request, HttpServletResponse response) throws JobSeekerException {
		String jbskId = request.getParameter("jbskId");
		return jbskDao.jbskDel( jbskId );
	}
}
