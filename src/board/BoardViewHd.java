package board;

import java.text.SimpleDateFormat;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class BoardViewHd implements BoardHandler {
	@Resource
	public BoardDBBean boardDao;
	@Override
	@RequestMapping("/boardView")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws BoardException {
		//int num = Integer.parseInt( request.getParameter( "num" ) );
		String pageNum = request.getParameter( "pageNum" );
		String number = request.getParameter( "number" );
		String boardId = (request.getParameter("boardId"));
		BoardDataBean boardDto = boardDao.boardGet( boardId );
		SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd hh:mm");
		boardDto.setStime(sf.format(boardDto.getBoardregdate()));
		
		request.setAttribute( "number", number );
		request.setAttribute( "pageNum", pageNum );
		request.setAttribute( "boardDto", boardDto );
						
		return new ModelAndView("/board/boardView");
	}
	
	@RequestMapping("/notView")
	public ModelAndView process1(HttpServletRequest request, HttpServletResponse response) throws BoardException {
		String boardId = (request.getParameter("boardId"));
		BoardDataBean boardDto = boardDao.boardGet( boardId );
		SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd hh:mm");
		boardDto.setStime(sf.format(boardDto.getBoardregdate()));
		
		String num = boardId.split("_")[1];			
		boardDto.setNum(num);
		request.setAttribute( "boardDto", boardDto );
		return new ModelAndView("/board/notView");		
	}
}
