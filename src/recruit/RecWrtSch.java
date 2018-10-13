package recruit;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.jobprov.JobProvDBBean;
import member.jobprov.JobProvDataBean;

@Controller
public class RecWrtSch implements RecruitHandler{
	@Resource
	public JobProvDBBean jbpDao;
	@Override
	@RequestMapping("/schRec")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecruitException {
		try {
			request.setCharacterEncoding("utf-8");
		} catch ( UnsupportedEncodingException e ) {
			e.printStackTrace();
		}
		int schId = Integer.parseInt(request.getParameter("schId"));
		Long st = Long.parseLong(request.getParameter("st"));
		String pos = request.getParameter("pos");
		
		request.setAttribute("schId", schId);
		request.setAttribute("st", st);
		request.setAttribute("pos", pos);
		
		String jobpId = (String) request.getSession().getAttribute("memid");
	    JobProvDataBean jbpDto = jbpDao.jobpGet(jobpId);
	    request.setAttribute("jbpDto", jbpDto);
		request.setAttribute("jobpId", jobpId);
		
		return new ModelAndView("recruit/recSch");
	}
}
