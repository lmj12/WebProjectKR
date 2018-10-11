package board;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import recruit.RecruitDBBean;
@Controller
public class BoardModHd implements BoardHandler {
	@Resource
	public BoardDBBean boardDao;
	
	@Override
	@RequestMapping("/boardMod")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws BoardException {
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		if(request.getParameter("modify")==null) {
			
			
			
			String pageNum = request.getParameter( "pageNum" );
			String boardId = ( request.getParameter( "boardId" ) );
		
		
			//request.setAttribute( "num", num );
			
			request.setAttribute( "pageNum", pageNum );
			
			
				BoardDataBean boardDto =boardDao.boardGet( boardId );
				request.setAttribute( "boardDto", boardDto );
				
				return new ModelAndView("/board/boardMod");
			
		}else {
			
		
			
			BoardDataBean boardDto = new BoardDataBean();
			boardDto.setBoardContent(request.getParameter("boardContent"));
			boardDto.setBoardId((request.getParameter("boardId")));
			//boardDto.setBoardParentId(Integer.parseInt(request.getParameter("boardParentId")));
			boardDto.setBoardregdate( new Timestamp( System.currentTimeMillis() ));
			//boardDto.setBoardStatus(Integer.parseInt(request.getParameter("boardStatus")));
			//boardDto.setUserId(request.getParameter("userId"));
			
			String pageNum = request.getParameter( "pageNum" );
		
			int result = boardDao.boardMod( boardDto );	
		
			request.setAttribute( "result", result );
			request.setAttribute( "pageNum", pageNum );
			
			return new ModelAndView("/board/boardMod");
			
		}
		
		
		
		
		
	}

}
