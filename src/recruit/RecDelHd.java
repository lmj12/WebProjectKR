package recruit;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.jobseeker.JobSeekerException;
@Controller
public class RecDelHd implements RecruitHandler {
	@Resource
	public RecruitDBBean recDao;
	@Override
	@RequestMapping("/recDel")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecruitException {
		String pageNum = request.getParameter("pageNum");
		
		int recId = Integer.parseInt(request.getParameter("recId"));
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("recId", recId);
		recDao.recDelPos(recId);
		int result = recDao.recDel(recId);
		
		request.setAttribute("result", result);
		
		
		
		return new ModelAndView("/recruit/recDel");
	}
	
	@RequestMapping(value = "ajaxgongoDELinADM") 
	@ResponseBody
	public int ajaxProcess(HttpServletRequest request, HttpServletResponse response) throws JobSeekerException {
		String recId1 = request.getParameter("recId");
		int recId = Integer.parseInt(request.getParameter("recId1"));
		
		return recDao.recDel( recId );
	}

}
