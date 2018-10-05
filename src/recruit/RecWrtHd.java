package recruit;

import java.io.IOException;
import java.io.PrintWriter;
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
			int recId=0;
			
			
			int recStatus = 0; //공고상태
			String reccontent = null;
			//String posPos = null;
			
			
		    String jobpId = (String) request.getSession().getAttribute("memid");
		    JobProvDataBean jbpDto = jbpDao.jobpGet(jobpId);
		    request.setAttribute("jbpDto", jbpDto);
			request.setAttribute("jobpId", jobpId);
			
			
			//System.out.println(recId);
			
			//System.out.println(new Date());
			
			RecruitDataBean recDto = new RecruitDataBean();
			
			System.out.println(recDto.getRecId());
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
			//System.out.println(recruitDto.getJobpId());
			//recruitDto.setJbpCn(request.getParameter("jbpCn"));
			recruitDto.setRecSite(request.getParameter("recSite"));
			//recruitDto.setJbpBnp(request.getParameter("jbpBnp"));
			recruitDto.setJobpId(request.getParameter("jobpId"));
			recruitDto.setRecStatus(0);
			recruitDto.setRecReadCnt(0);
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
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out;
					try {
						out = response.getWriter();
						out.println("<script>alert('이미 지난 날짜입니다.');return false;'");
						out.flush();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				recruitDto.setRecEnd(timestamp);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		       		
			//recruitDto.setRecId(Integer.parseInt(request.getParameter("recId")));
			
			int result = recDao.recWrt( recruitDto );
			
			RecruitDataBean recDto = new RecruitDataBean();
			recDto.setRecId(Integer.parseInt(request.getParameter("recId")));
			
			//recruitDto.setCrrCnt(Integer.parseInt(request.getParameter("crrCnt")));
			
			int posId = Integer.parseInt(request.getParameter("point"));
			recDto.setPosId(posId);
			
			request.setAttribute( "result", result );
			recDao.recPos(recDto);
			
			return new ModelAndView("/recruit/recWrt");
		}
		
		
		}

}
