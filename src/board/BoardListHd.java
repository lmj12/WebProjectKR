package board;

import java.io.IOException;
import java.text.SimpleDateFormat;
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

import schedule.job.SchJbException;
import team.TeamDataBean;


@Controller
public class BoardListHd implements BoardHandler {
	@Resource
	public BoardDBBean boardDao;
	@Override
	@RequestMapping("/boardList")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws BoardException {
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
		
		String userId = (String) request.getSession().getAttribute("memid");
		count = boardDao.userSelCnt(userId);	
		
		
		
		String boardId = request.getParameter("boardId");
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
		request.setAttribute("boardId", boardId);
		if( count > 0 ) {			
			Map <String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("boarduserId", userId);
			List<BoardDataBean> articles = boardDao.boardGetFin(map);
			for(int i=0; i<articles.size(); i++) {
			BoardDataBean boardDto = articles.get(i);
			SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			boardDto.setStime(sf.format(boardDto.getBoardregdate()));
			}
			request.setAttribute( "articles", articles );
			
		
		}
		
		
		
		return new ModelAndView("/board/boardList");
	}
	
	@RequestMapping("/notice")
	public ModelAndView process1(HttpServletRequest request, HttpServletResponse response) throws BoardException {
		List<BoardDataBean> articles = boardDao.notGet();
		for(int i=0; i<articles.size(); i++) {
			BoardDataBean boardDto = articles.get(i);
			SimpleDateFormat sd = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			boardDto.setStime(sd.format(boardDto.getBoardregdate()));
			String id = boardDto.getBoardId();
			String num = id.split("_")[1];			
			boardDto.setNum(num);
		}
		request.setAttribute("articles", articles);
		return new ModelAndView("/board/notice");
	}
	
	@RequestMapping(value = "ajaxAdmBoard") 
	@ResponseBody
	public String ajaxProcess(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		
		List<BoardDataBean> rst = boardDao.getAdm();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		for(int i=0; i<rst.size(); i++) {
			rst.get(i).setBoardregTime(sdf.format(rst.get(i).getBoardregdate()));
		}
		ObjectMapper mapper = new ObjectMapper(); 
		
		String atcs=""; 
		try { 
			atcs = mapper.writeValueAsString(rst);
			
		} catch (IOException e) { 
			e.printStackTrace(); 
		}
		
		return atcs;
		
	}
	
	@RequestMapping(value = "ajaxAdmBoard2") 
	@ResponseBody
	public String ajaxProcess2(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		
		List<BoardDataBean> rst = boardDao.getAdm2();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		for(int i=0; i<rst.size(); i++) {
			rst.get(i).setBoardregTime(sdf.format(rst.get(i).getBoardregdate()));
		}
		ObjectMapper mapper = new ObjectMapper(); 
		
		String sin=""; 
		try { 
			sin = mapper.writeValueAsString(rst);
			
		} catch (IOException e) { 
			e.printStackTrace(); 
		}
		
		return sin;
		
	}

}
