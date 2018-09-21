package member.jobseeker;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class JbskRegHd implements JobSeekerHandler {
	@Resource
	public JobSeekerDBBean jbskDao;
	
	@Override
	@RequestMapping("/jbskReg")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JobSeekerException {
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		JobSeekerDataBean jbskDto =  new JobSeekerDataBean();
		
		jbskDto.setJbskId(request.getParameter("jbskId"));
		jbskDto.setJbskName(request.getParameter("jbskName"));
		jbskDto.setJbskPasswd(request.getParameter("jbskPasswd"));
		jbskDto.setJbskGender(Integer.parseInt(request.getParameter("jbskGender")));
		jbskDto.setJbskEmail(request.getParameter("jbskEmail"));
		jbskDto.setJbskPic(request.getParameter("jbskPic"));
		jbskDto.setJbskTel(request.getParameter("jbskTel"));
		jbskDto.setJbskregdate( new Timestamp( System.currentTimeMillis() ) );
		jbskDto.setJbskBd( new Timestamp( System.currentTimeMillis() ) );
		
		int result = jbskDao.jbskReg( jbskDto );
		
		int rst = jbskDao.check("jbskId");
		request.setAttribute( "result", result );
		request.setAttribute("rst",	rst);
		
		
		// TODO Auto-generated method stub
		return new ModelAndView("register");
		
	}

}
