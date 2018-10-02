package recruit;

import java.io.UnsupportedEncodingException;

import java.sql.Timestamp;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.jobprov.JobProvDBBean;
import member.jobprov.JobProvDataBean;


@Controller
public class RecWrtHd implements RecruitHandler {
	@Resource
	public RecruitDBBean recDao;
	@Resource
	public JobProvDBBean jbpDao;
	@Override
	@RequestMapping("/recWrt")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecruitException {
		try {
			request.setCharacterEncoding("utf-8");
		} catch ( UnsupportedEncodingException e ) {
			e.printStackTrace();
		}
		
		if(request.getParameter("write")== null) {
			//제목글인 경우
			int recId = 0;	//제목글 0 / 답변글 !0
			int recStatus = 0; //공고상태
			String reccontent = null;
			//String posPos = null;
			
			
		    String jobpId = (String) request.getSession().getAttribute("memid");
		    JobProvDataBean jbpDto = jbpDao.jobpGet(jobpId);
		    request.setAttribute("jbpDto", jbpDto);
			request.setAttribute("jobpId", jobpId);
			
			recId = recDao.recCnt()+1;
			
			
			
			RecruitDataBean recDto = new RecruitDataBean();
			request.setAttribute("recId", recId);
			request.setAttribute("recStatus", recStatus);
			request.setAttribute("reccontent", reccontent);
			//request.setAttribute("posPos", posPos);
			request.setAttribute("recDto", recDto);
			
			
			
			return new ModelAndView("/recruit/recWrt");
		}else {
			String jobpId = (String) request.getSession().getAttribute("memid");
			JobProvDataBean jbpDto = jbpDao.jobpGet(jobpId);
		    request.setAttribute("jbpDto", jbpDto);
			request.setAttribute("jobpId", jobpId);
			
			RecruitDataBean recruitDto = new RecruitDataBean();
			System.out.println(recruitDto.getJobpId());
			recruitDto.setJbpCn(request.getParameter("jbpCn"));
			recruitDto.setRecSite(request.getParameter("recSite"));
			recruitDto.setJbpBnp(request.getParameter("jbpBnp"));
			recruitDto.setJobpId(request.getParameter("jobpId"));
			recruitDto.setRecStatus(0);
			
			recruitDto.setReccontent(request.getParameter("reccontent"));
			//recruitDto.setRecId(Integer.parseInt(request.getParameter("recId")));
			
			 
			recruitDto.setRecStart( new Timestamp( System.currentTimeMillis() ));
	        Timestamp sysdate = new Timestamp( System.currentTimeMillis() );
	        String input = request.getParameter("recEnd").replace('T', ' ');
	       //System.out.println(input);
	      
	       java.util.Date date;
			try {				
				date = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(input);
				 Calendar cal = Calendar.getInstance();
			       cal.setTime(date);
			       cal.add(Calendar.SECOND, 10);
			       Date caltodate = cal.getTime();
			       //date.getTime()
				Timestamp timestamp = new Timestamp(caltodate.getTime());
			//System.out.println(timestamp);
				if(timestamp.before(sysdate)) {
					JOptionPane.showMessageDialog(null, "날짜형식이 잘못됬습니다.");
				}
				recruitDto.setRecEnd(timestamp);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		       		
			
			
			//recruitDto.setCrrCnt(Integer.parseInt(request.getParameter("crrCnt")));
		
			recruitDto.setPosPos(request.getParameter("posPos"));
			
			int result = recDao.recWrt( recruitDto );

			request.setAttribute( "result", result );
			
			
			return new ModelAndView("/recruit/recWrt");
		}
		
		
		}

}
