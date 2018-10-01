package board;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class BoardDelHd implements BoardHandler {
	@Resource
	public BoardDBBean boardDao;
	@Override
	@RequestMapping("/boardDel")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws BoardException {
		//int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
	
		String boardId = (request.getParameter("boardId"));
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("boardId", boardId);
		
		int result = boardDao.boardDel(boardId);
		
		request.setAttribute("result", result);
		
		
		
		return new ModelAndView("/board/boardDel");
	}

}
