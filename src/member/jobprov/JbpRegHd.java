package member.jobprov;



import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import team.TeamDBBean;
@Controller
public class JbpRegHd implements JobProvHandler {
	@Resource
	private JobProvDBBean jbpDao;
	@Resource
	private TeamDBBean teamDao;
	@Override
	@RequestMapping("/jbpReg")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JbpException {
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		JobProvDataBean jbpDto = new JobProvDataBean();
		
		jbpDto.setJobpId(request.getParameter("jobpId"));
		jbpDto.setJobpPasswd(request.getParameter("jobpPasswd"));
		
		// reg_date 
		jbpDto.setJobpRegdate( new Timestamp( System.currentTimeMillis() ) );
				
		jbpDto.setJobpBno(request.getParameter("jobpBno"));
		jbpDto.setJobpCn(request.getParameter("jobpCn"));
		
		
		// tel		
		jbpDto.setJobpTel(request.getParameter("jobpTel"));

		int result = jbpDao.jobpReg( jbpDto );
		
		int rst = jbpDao.check("jobpId");
		request.setAttribute( "result", result );
		request.setAttribute("rst",	rst);
		
		teamDao.makeTeam(request.getParameter("jobpId"));
		
		

		return new ModelAndView("/Jbp/registerJbp");
	}

}
