package recruit;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class RecStaCngHd implements RecruitHandler {
	@Resource
	public RecruitDBBean recDao;	
	@Override
	//@RequestMapping("/recStaCng")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecruitException {
		
	/*		int recId = Integer.parseInt(request.getParameter("recId"));
			//System.out.println(recId);
			String cng = request.getParameter("cng");
			int result = 0;
			if(cng.equals("1")) {
				System.out.println(cng);
				RecruitDataBean recDto = recDao.recGet(recId);
				recDto.setRecId(recId);
				recDto.setRecStatus(1);
				result = recDao.recStaCng(recDto);
			}else if(cng.equals("2")) {
				RecruitDataBean recDto = recDao.recGet(recId);
				recDto.setRecId(recId);
				recDto.setRecStatus(0);
				result = recDao.recStaCng(recDto);
			}
			request.setAttribute("result", result);
		*/
			
		return new ModelAndView("/recruit/recStaCng");
	}
	
	@RequestMapping(value = "ajaxRecStaCng", produces="application/json") 
	@ResponseBody
	public int ajaxprocess(HttpServletRequest request, HttpServletResponse response) throws RecruitException {
		
			int recId = Integer.parseInt(request.getParameter("recId"));
			//System.out.println(recId);
			String cng = request.getParameter("cng");
			int result = -1;
			if(cng.equals("1")) {
				System.out.println(cng);
				RecruitDataBean recDto = recDao.recGet(recId);
				recDto.setRecId(recId);
				recDto.setRecStatus(1);
				result = recDao.recStaCng(recDto);
				
			}else if(cng.equals("0")) {
				RecruitDataBean recDto = recDao.recGet(recId);
				recDto.setRecId(recId);
				recDto.setRecStatus(0);
				result = recDao.recStaCng(recDto);
				
			}
			
			if(result==1) { 
				return Integer.parseInt(cng);
			} else {
				return -1;
			}
			
		
	}
}
