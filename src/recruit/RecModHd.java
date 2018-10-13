package recruit;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.BoardDataBean;
import member.jobprov.JobProvDBBean;
import member.jobprov.JobProvDataBean;
@Controller
public class RecModHd implements RecruitHandler {
	@Resource
	public RecruitDBBean recDao;
	@Resource
	public JobProvDBBean jbpDao;
	@Override
	@RequestMapping("/recMod")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecruitException {
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		if(request.getParameter("write")==null) {
			String pageNum = request.getParameter( "pageNum" );
			int recId = Integer.parseInt( request.getParameter( "recId" ) );
			int recStatus = 0; //공고상태	
			request.setAttribute( "pageNum", pageNum );
					
			RecruitDataBean recDto =recDao.recGet( recId );
			request.setAttribute( "recDto", recDto );
			request.setAttribute("recStatus", recStatus);
			
			List<RecruitDataBean> recruitDto = recDao.recPosGet(recId);
			request.setAttribute("recruitDto", recruitDto);
			
			JobProvDataBean jbpDto = jbpDao.jobpGet(recDto.getJobpId());
			request.setAttribute("jbpDto", jbpDto);
			return new ModelAndView("/recruit/recMod");
			
		}else {
			
			
			RecruitDataBean recDto = new RecruitDataBean();
		
			recDto.setReccontent(request.getParameter("reccontent"));
			
			String endStr = request.getParameter("End");
			String endTime = request.getParameter("EndTime");
					
			
			String time = (endStr + ' ' +endTime);
			String real = "MM/dd/yyyy HH:mm";
			
			
			
			SimpleDateFormat endtm = new SimpleDateFormat(real);
			Date timeD;
			
			try {
				
				timeD = endtm.parse(time);				
				
				Timestamp endDate = new Timestamp(timeD.getTime());
				
				recDto.setRecEnd(endDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			
			
			
			recDto.setRecSite(request.getParameter("recSite"));
			recDto.setRecStart(new Timestamp( System.currentTimeMillis() ));
			
			recDto.setRecId(Integer.parseInt(request.getParameter("recId")));
			String pageNum = request.getParameter( "pageNum" );
			
			int result = recDao.recMod( recDto );	
			if (result==1) {				
				int recId = Integer.parseInt(request.getParameter("recId"));
				recDao.recDelPos(recId);
				
				int rst = recDto.getPosId();
				
				String post = request.getParameter("id");
				
				String arr[] = (post.split(","));	
				
				for(int i=0; i<arr.length; i++) {				
				
					int reposId = Integer.parseInt(arr[i]);
					
					Map <String, Integer > map = new HashMap<String, Integer>();
					map.put("recId", recId);
					map.put("posId", reposId);
					
					recDao.recPos(map);
	
			
				}
			}	
			request.setAttribute( "result", result );
			request.setAttribute( "pageNum", pageNum );
			
			return new ModelAndView("/recruit/recMod");
			
			
			
		}
		
		
		
		
	}
	
}
