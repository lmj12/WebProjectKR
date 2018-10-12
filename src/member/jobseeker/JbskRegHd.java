package member.jobseeker;

import java.io.UnsupportedEncodingException;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

@Controller
public class JbskRegHd implements JobSeekerHandler {
	@Resource
	public JobSeekerDBBean jbskDao;
	
	@Override
	//@RequestMapping("/jbskReg")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JobSeekerException {
		return null;
		
	}
	
	@RequestMapping("/jbskReg")
	public ModelAndView process2(MultipartHttpServletRequest mre,HttpServletRequest request, HttpServletResponse response) throws JobSeekerException {
		try {
			mre.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		   
       // String test = request.getParameter("test"); // jsp text name mapping
        MultipartFile mf = mre.getFile("jbskPic"); // jsp file name mapping
        String uploadPath = "";
         
        String path = "C:\\"+"image\\"; // 파일 업로드 경로
             
        String original = mf.getOriginalFilename(); // 업로드하는 파일 name
             
        //System.out.println("!!!!!!!!!!"+original);  // file original name
        //System.out.println("!!!!!!!!!!"+mf.getSize());// file size
             
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
		
		int year = Integer.parseInt(mre.getParameter("jbskBd").split("-")[0]);
		int month = Integer.parseInt(mre.getParameter("jbskBd").split("-")[1]);
		int day = Integer.parseInt(mre.getParameter("jbskBd").split("-")[2]);
		
		LocalDateTime loc = LocalDateTime.of(year, month, day, 1 , 30);
		
		JobSeekerDataBean jbskDto =  new JobSeekerDataBean();
		
		jbskDto.setJbskId(mre.getParameter("jbskId"));
		jbskDto.setJbskName(mre.getParameter("jbskName"));
		jbskDto.setJbskPasswd(mre.getParameter("jbskPasswd"));
		jbskDto.setJbskGender(Integer.parseInt(mre.getParameter("jbskGender")));
		jbskDto.setJbskEmail(compemail);
		jbskDto.setJbskPic(uploadPath);
		jbskDto.setJbskAdd1(request.getParameter("jbAddress"));
		jbskDto.setJbskAdd2(request.getParameter("rdAddress"));
		jbskDto.setJbskAdd3(request.getParameter("zipcode"));
		jbskDto.setJbskTel(mre.getParameter("jbskTel"));
		jbskDto.setJbskregdate( new Timestamp( System.currentTimeMillis() ) );
		jbskDto.setJbskBd(Timestamp.valueOf(loc));
		jbskDto.setJbskinfotype(Integer.parseInt(mre.getParameter("jbskinfotype")));
		
		int result = jbskDao.jbskReg( jbskDto );
		
		int rst = jbskDao.check("jbskId");
		mre.setAttribute( "result", result );
		mre.setAttribute("rst",	rst);
		
		
		// TODO Auto-generated method stub
		return new ModelAndView("Jbs/registerJbsk");
		
	}

}

