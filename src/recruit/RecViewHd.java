package recruit;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class RecViewHd implements RecruitHandler {
	@Resource
	public RecruitDBBean recDao;
	@RequestMapping("/recView")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecruitException {
		String pageNum = request.getParameter( "pageNum" );
		//String number = request.getParameter( "number" );
		int recId = Integer.parseInt(request.getParameter("recId"));
		//System.out.println(recId);
		RecruitDataBean recDto = recDao.recGet( recId );
		
		RecruitDataBean recruitDto = recDao.recPosGet(recId);

		//request.setAttribute( "number", number );
		request.setAttribute( "pageNum", pageNum );
		request.setAttribute( "recDto", recDto );
		//request.setAttribute("recId", recId);
		
		
		
		// TODO Auto-generated method stub
		return new ModelAndView("/recruit/recView");
	}

}
