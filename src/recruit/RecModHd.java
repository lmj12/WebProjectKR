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
		if(request.getParameter("recMod")==null) {
			String pageNum = request.getParameter( "pageNum" );
			int recId = Integer.parseInt( request.getParameter( "recId" ) );
			int recStatus = 0; //공고상태	
			request.setAttribute( "pageNum", pageNum );
					
			RecruitDataBean recDto =recDao.recGet( recId );
			request.setAttribute( "recDto", recDto );
			request.setAttribute("recStatus", recStatus);
			
			JobProvDataBean jbpDto = jbpDao.jobpGet(recDto.getJobpId());
			request.setAttribute("jbpDto", jbpDto);
			return new ModelAndView("/recruit/recMod");
			
		}else {
			try {
				request.setCharacterEncoding( "utf-8" );
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			RecruitDataBean recDto = new RecruitDataBean();
			
			recDto.setPosPos(request.getParameter("posPos"));
			recDto.setReccontent(request.getParameter("reccontent"));
			
			Timestamp sysdate = new Timestamp( System.currentTimeMillis() );
			String input = request.getParameter("recEnd").replace('T', ' ');
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
				recDto.setRecEnd(timestamp);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			
			recDto.setRecSite(request.getParameter("recSite"));
			recDto.setRecStart(new Timestamp( System.currentTimeMillis() ));
			
			
			String pageNum = request.getParameter( "pageNum" );
			
			int result = recDao.recMod( recDto );	
		
			request.setAttribute( "result", result );
			request.setAttribute( "pageNum", pageNum );
			
			return new ModelAndView("/board/boardMod");
			
			
			
		}
		
		
		
		
	}

}
