package recruit;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import member.jobprov.JobProvDBBean;
import member.jobprov.JobProvDataBean;
import schedule.job.SchJbException;


@Controller
public class RecListHd implements RecruitHandler {
	@Resource
	public RecruitDBBean recDao;
	@Resource
	public JobProvDBBean jbpDao;
	@Override
	@RequestMapping("/recList")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecruitException {
		int pageSize = 5;
		int pageBlock = 2;

		
		
		String pageNum = null;
		int currentPage = 0;
		int number = 0;
		
		int startPage = 0;
		int endPage = 0;
		int pageCount = 0;										
		int start = 0;
		int end = 0;
		
		int count = 0;
		count = recDao.recCnt();	
		
		
		
		//
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
			List <RecruitDataBean> articles = recDao.recList(  );
			
			List <RecListDataBean> articleList = new ArrayList<RecListDataBean>();
			for(int i=0; i<articles.size(); i++) {
				RecListDataBean recList = new RecListDataBean();
				RecruitDataBean recDto = articles.get(i);
				SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
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
			
			request.setAttribute("articleList", articleList);
			
		
		
		
		}
	
		
		
		return new ModelAndView("/recruit/recList");
	}
	
	@RequestMapping(value = "ajaxAdmRec") 
	@ResponseBody
	public String ajaxProcess(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		
		List<RecruitDataBean> rst = recDao.getAdm();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		for(int i=0; i<rst.size(); i++) {
			rst.get(i).setStime(sdf.format(rst.get(i).getRecStart()));
			rst.get(i).setEtime(sdf.format(rst.get(i).getRecEnd()));
		}
		ObjectMapper mapper = new ObjectMapper(); 
		
		String recs=""; 
		try { 
			recs = mapper.writeValueAsString(rst);
			
		} catch (IOException e) { 
			e.printStackTrace(); 
		}
		
		return recs;
	}
}
