package recruit;


import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



import member.jobprov.JobProvDBBean;
import member.jobprov.JobProvDataBean;
@Controller
public class RecMyViewHd implements RecruitHandler {
	@Resource
	public RecruitDBBean recDao;
	@Resource
	public JobProvDBBean jbpDao;
	@Override
	@RequestMapping("/recMyView")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecruitException {
		int pageSize = 5;
		int pageBlock = 2;

		int count = 0;
		int start = 0;
		int end = 0;
		String pageNum = null;
		int currentPage = 0;
		int number = 0;
		
		int startPage = 0;
		int endPage = 0;
		int pageCount = 0;										
		
		
		String jobpId = (String) request.getSession().getAttribute("memid");
		
		try {
		count = recDao.recMyCnt(jobpId);	
		}catch(NullPointerException e) {
			e.printStackTrace();
		}
		
		
		//int recId = Integer.parseInt(request.getParameter("recId"));
		pageNum = request.getParameter("pageNum");
		if(pageNum==null || pageNum.equals("")){
			pageNum = "1";
		}	
		currentPage = Integer.parseInt(pageNum);
		pageCount = count/pageSize + (count % pageSize>0 ? 1:0 );
		if( currentPage > pageCount ) currentPage = pageCount;
			
		start = ( currentPage - 1 )*pageSize + 1;					// (5-1)*10 +1   =41
		end = start + pageSize - 1;									// 41+10-1		 =50
		if(end > count) end = count;
		
		number = count - (currentPage - 1) * pageSize;				//	50-(5-1)*10 
			
		startPage = (currentPage / pageBlock)*pageBlock+1;  		//(5/10)*10+1 = 1
		if(currentPage % pageBlock == 0) startPage-=pageBlock;
		endPage =startPage + pageBlock - 1;							//11+10-1	=20
		if(endPage > pageCount ) endPage = pageCount;
	
		request.setAttribute( "count", count );
		request.setAttribute( "pageNum", pageNum );
		request.setAttribute( "currentPage", currentPage );
		request.setAttribute( "number", number );
		request.setAttribute( "startPage", startPage );
		request.setAttribute( "endPage", endPage );
		request.setAttribute( "pageCount", pageCount );
		request.setAttribute( "pageBlock", pageBlock );
		//request.setAttribute("recId", recId);
		if( count > 0 ) {
			
			List <RecruitDataBean> articles = recDao.recMyList( jobpId );
			
			List <RecListDataBean> articleList = new ArrayList<RecListDataBean>();
			for(int i=0; i<articles.size(); i++) {
				RecListDataBean recList = new RecListDataBean();
				RecruitDataBean recDto = articles.get(i);
				SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd hh:mm");
				recDto.setStime(sf.format(recDto.getRecStart()));
				recDto.setEtime(sf.format(recDto.getRecEnd()));
				recList.setRecDto(recDto);
				
				int recId = recDto.getRecId();
				String jbpId = recDto.getJobpId();
				JobProvDataBean jbpDto= jbpDao.jobpGet(jbpId);
				recList.setJobpDto(jbpDto);
		
				List<RecruitDataBean> poss = recDao.recPosGet(recId);
				recList.setPoss(poss);
				articleList.add(recList);			
			}
			
			List<RecruitDataBean> lists = recDao.recMyListFin(jobpId);
			List<RecListDataBean> twoList = new ArrayList<RecListDataBean>();
			for(int i=0; i<lists.size(); i++) {
				RecListDataBean recList = new RecListDataBean();
				RecruitDataBean recDto = lists.get(i);
				SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd hh:mm");
				recDto.setStime(sf.format(recDto.getRecStart()));
				recDto.setEtime(sf.format(recDto.getRecEnd()));
				recList.setRecDto(recDto);
				
				int recId = recDto.getRecId();
				String jbpId = recDto.getJobpId();
				JobProvDataBean jbpDto= jbpDao.jobpGet(jbpId);
				recList.setJobpDto(jbpDto);
		
				List<RecruitDataBean> poss = recDao.recPosGet(recId);
				recList.setPoss(poss);
				twoList.add(recList);			
			}
			request.setAttribute("articleList", articleList);
			request.setAttribute("twoList", twoList);
			request.setAttribute("cnt", articles.size());
			
		}
     
		
		// TODO Auto-generated method stub
		return new ModelAndView("/recruit/recMyList");
	}
	

}
