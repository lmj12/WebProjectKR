package recruit;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import java.sql.Timestamp;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			
		    String jobpId = (String) request.getSession().getAttribute("memid");
		    JobProvDataBean jbpDto = jbpDao.jobpGet(jobpId);
		    request.setAttribute("jbpDto", jbpDto);
			request.setAttribute("jobpId", jobpId);
			
			
			RecruitDataBean recDto = new RecruitDataBean();				
			request.setAttribute("recStatus", recStatus);
			request.setAttribute("reccontent", reccontent);
			
			request.setAttribute("recDto", recDto);			
					
			return new ModelAndView("/recruit/recWrt");
		}else {
			String jobpId = (String) request.getSession().getAttribute("memid");
			JobProvDataBean jbpDto = jbpDao.jobpGet(jobpId);
		    request.setAttribute("jbpDto", jbpDto);
			request.setAttribute("jobpId", jobpId);
			
			
			RecruitDataBean recruitDto = new RecruitDataBean();
			
			recruitDto.setRecSite(request.getParameter("recSite"));
			
			recruitDto.setJobpId(request.getParameter("jobpId"));
			recruitDto.setRecStatus(0);
			recruitDto.setRecReadCnt(0);
			recruitDto.setReccontent(request.getParameter("reccontent"));
			
			
			 
			recruitDto.setRecStart( new Timestamp( System.currentTimeMillis() ));
	        Timestamp sysdate = new Timestamp( System.currentTimeMillis() );
	        String input = request.getParameter("recEnd").replace('T', ' ');
	       
	        java.util.Date date;
			try {				
				 date = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(input);
				 Calendar cal = Calendar.getInstance();
			       cal.setTime(date);
			       cal.add(Calendar.SECOND, 10);
			       Date caltodate = cal.getTime();
			      
				Timestamp timestamp = new Timestamp(caltodate.getTime());
			
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
		       		
			
			int result = recDao.recWrt( recruitDto );
			if (result==1) {
				
				String pos = request.getParameter("id");
				String array[] = (pos.split(","));		
				System.out.println(recruitDto.getRecStart());
				System.out.println(recruitDto.getJobpId());
				int recId = recDao.recGetId(recruitDto);
				for(int i=0; i<array.length; i++) {				
				
					int posId = Integer.parseInt(array[i]);
					
					Map <String, Integer > map = new HashMap<String, Integer>();
					map.put("recId", recId);
					map.put("posId", posId);
					recDao.recPos(map);
	
			
				}
			}	
			request.setAttribute( "result", result );
			
			
			return new ModelAndView("/recruit/recWrt");
		}
		
		
		}

}
