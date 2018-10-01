package member.jobseeker;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

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
		
		String compemail="";
		String ema1 = request.getParameter("jbskEmail1");
		String ema2 = request.getParameter("jbskEmail2");
 		if(ema1.contains("@") || (ema2=="직접입력")) {
			compemail = request.getParameter("jbskEmail1");
		}else {
			compemail = ema1+"@"+ema2;
		}
		
		String ad = request.getParameter("jbAddress");
		
		int year = Integer.parseInt(request.getParameter("jbskBd").split("-")[0]);
		int month = Integer.parseInt(request.getParameter("jbskBd").split("-")[1]);
		int day = Integer.parseInt(request.getParameter("jbskBd").split("-")[2]);
		
		LocalDateTime loc = LocalDateTime.of(year, month, day, 1 , 30);
		
		JobSeekerDataBean jbskDto =  new JobSeekerDataBean();
		
		jbskDto.setJbskId(request.getParameter("jbskId"));
		jbskDto.setJbskName(request.getParameter("jbskName"));
		jbskDto.setJbskPasswd(request.getParameter("jbskPasswd"));
		jbskDto.setJbskGender(Integer.parseInt(request.getParameter("jbskGender")));
		jbskDto.setJbskEmail(compemail);
		jbskDto.setJbskPic(request.getParameter("jbskPic"));
		jbskDto.setJbskAdd1(ad.split(" ")[0]);
		jbskDto.setJbskAdd2(ad.split(" ")[1]);
		jbskDto.setJbskAdd3(ad.split(" ")[2]);
		jbskDto.setJbskTel(request.getParameter("jbskTel"));
		jbskDto.setJbskregdate( new Timestamp( System.currentTimeMillis() ) );
		jbskDto.setJbskBd(Timestamp.valueOf(loc));
		jbskDto.setJbskinfotype(Integer.parseInt(request.getParameter("jbskinfotype")));
		
		int result = jbskDao.jbskReg( jbskDto );
		
		int rst = jbskDao.check("jbskId");
		request.setAttribute( "result", result );
		request.setAttribute("rst",	rst);
		
		
		// TODO Auto-generated method stub
		return new ModelAndView("register");
		
	}

}
