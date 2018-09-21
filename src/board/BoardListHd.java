package board;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class BoardListHd implements BoardHandler {
	@Resource
	public BoardDBBean boardDao;
	@Override
	@RequestMapping("/boardList")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws BoardException {

		List<BoardDataBean> articles = boardDao.boardList(  );
		request.setAttribute("articles", articles);
	
		
		
		
		return new ModelAndView("/board/boardList");
	}

}
