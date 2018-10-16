package recruit;

import java.io.UnsupportedEncodingException;

import java.sql.Timestamp;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			try {//스케줄에서 넘어온 경우.
				int schId = Integer.parseInt(request.getParameter("schId"));
			} catch (NumberFormatException e){
				
			}		
			
			int recStatus = 0; //공고상태
			String reccontent = null;			
			
		    String jobpId = (String) request.getSession().getAttribute("memid");
		    JobProvDataBean jbpDto = jbpDao.jobpGet(jobpId);
		    request.setAttribute("jbpDto", jbpDto);
			request.setAttribute("jobpId", jobpId);
					
			return new ModelAndView("/recruit/recWrt");
		}else {
			RecruitDataBean recruitDto = new RecruitDataBean();
			try {//스케줄에서 넘어온 경우.
				int schId = Integer.parseInt(request.getParameter("schId"));
				recruitDto.setSchId(schId);
			} catch (NumberFormatException e){
				
			}
			
			String jobpId = (String) request.getSession().getAttribute("memid");
			JobProvDataBean jbpDto = jbpDao.jobpGet(jobpId);
		    request.setAttribute("jbpDto", jbpDto);
			request.setAttribute("jobpId", jobpId);
			
			
		
			
			recruitDto.setRecSite(request.getParameter("recSite"));
			String [] ad = request.getParameter("recSite").split(" ");
			if(ad[0].equals("서울") || ad[0].equals("대전") || ad[0].equals("대구") || ad[0].equals("부산") || ad[0].equals("울산") || ad[0].equals("광주") || ad[0].equals("인천") || ad[0].equals("세종특별자치시")){
				recruitDto.setSearchSite(ad[0] +" " +  ad[1]);
			} else {
				recruitDto.setSearchSite(ad[1] +" "+ ad[2]);
			}
			
			
			recruitDto.setJobpId(request.getParameter("jobpId"));
			recruitDto.setRecStatus(0);
			recruitDto.setRecReadCnt(0);
			recruitDto.setReccontent(request.getParameter("reccontent"));
			
		
	        recruitDto.setRecStart( new Timestamp( System.currentTimeMillis() ));
	       
	       
	        String endStr = request.getParameter("recEnd");
			String endTime = request.getParameter("recEndTime");
			String time = (endStr + ' ' +endTime);
			String real = "MM/dd/yyyy HH:mm";
			
			SimpleDateFormat endtm = new SimpleDateFormat(real);
			Date timeD;
			
			try {
				
				timeD = endtm.parse(time);				
				Timestamp endDate = new Timestamp(timeD.getTime());
				
				recruitDto.setRecEnd(endDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			int result = recDao.recWrt( recruitDto );
			if (result==1) {
				
				String pos = request.getParameter("id");
				String array[] = (pos.split(","));		
			
				int recId = recruitDto.getRecId();
			
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
