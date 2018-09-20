package member.jobseeker;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class JbskRegHd implements JobSeekerHandler {

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
		jbskDto.setJbskGender(request.getParameter("jbskGender"));
		jbskDto.setJbskEmail(request.getParameter("jbskEmail"));
		jbskDto.setJbskPic(request.getParameter("jbskPic"));
		jbskDto.setJbskTel(request.getParameter("jbskTel"));
		jbpDto.setJbskregdate( new Timestamp( System.currentTimeMillis() ) );
		jbpDto.setJbskBd( new Timestamp( System.currentTimeMillis() ) );
		
	}

}
