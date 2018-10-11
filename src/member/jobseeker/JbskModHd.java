package member.jobseeker;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import member.jobseeker.JobSeekerException;
import member.jobseeker.JobSeekerDBBean;
import member.jobseeker.JobSeekerDataBean;

@Controller
public class JbskModHd implements JobSeekerHandler {

	@Resource
	public JobSeekerDBBean jbskDao;
	
	@Override
	//@RequestMapping("/jbskMod")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JobSeekerException {
		return null;
		
	}
	
	@RequestMapping("/jbskMod")
	public ModelAndView process2(MultipartHttpServletRequest mre,HttpServletRequest request, HttpServletResponse response) throws JobSeekerException {
		try {
			mre.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		

		JobSeekerDataBean jbskDto = new JobSeekerDataBean();
		jbskDto.setJbskPasswd( request.getParameter( "jbskPasswd" ) );
		
		// String test = request.getParameter("test"); // jsp text name mapping
        MultipartFile mf = mre.getFile("jbskPic"); // jsp file name mapping
        String uploadPath = "";
         
        String path = "C:\\"+"image\\"; // 파일 업로드 경로
             
        String original = mf.getOriginalFilename(); // 업로드하는 파일 name
             
        System.out.println("!!!!!!!!!!"+original);  // file original name
        System.out.println("!!!!!!!!!!"+mf.getSize());// file size
             
        uploadPath = path+original; // 파일 업로드 경로 + 파일 이름
         
         
        try {
            mf.transferTo(new File(uploadPath)); // 파일을 위에 지정 경로로 업로드
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		
		String compemail="";
		String ema1 = mre.getParameter("jbskEmail1");
		String ema2 = mre.getParameter("jbskEmail2");
 		if(ema1.contains("@") || (ema2=="직접입력")) {
			compemail = mre.getParameter("jbskEmail1");
		}else {
			compemail = ema1+"@"+ema2;
		}
 		
 		jbskDto.setJbskId( (String) request.getSession().getAttribute( "memid" ) ); 
		JobSeekerDBBean jbskDao = new JobSeekerDBBean();
		
		jbskDto.setJbskPasswd(mre.getParameter("jbskPasswd"));
		jbskDto.setJbskGender(Integer.parseInt(mre.getParameter("jbskGender")));
		jbskDto.setJbskEmail(compemail);
		jbskDto.setJbskPic(uploadPath);
		jbskDto.setJbskAdd1(mre.getParameter("jbAddress"));
		jbskDto.setJbskAdd2(mre.getParameter("rdAddress"));
		jbskDto.setJbskAdd3(mre.getParameter("zipcode"));
		jbskDto.setJbskTel(mre.getParameter("jbskTel"));
		jbskDto.setJbskinfotype(Integer.parseInt(mre.getParameter("jbskinfotype")));
		
		
		
		
		int result = jbskDao.jbskMod( jbskDto );
		request.setAttribute( "result", result );	
		

		return new ModelAndView("/Jbs/jbskView");
	}
}
