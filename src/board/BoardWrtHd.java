package board;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class BoardWrtHd implements BoardHandler {

	@Resource
	public BoardDBBean boardDao;
	@Override
	@RequestMapping("/boardWrt")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws BoardException {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch ( UnsupportedEncodingException e ) {
			e.printStackTrace();
		}
		//System.out.println(request.getParameter("boardContent"));
		if(request.getParameter("write")== null) {
			//제목글인 경우
			String boardId = 0 + "_" +1;	//제목글 0 / 답변글 !0
			int boardParentId = 0;
			String boardContent = null;
			
			
			if( request.getParameter("boardId") !=  null) {
				
				//답변글인 경우
				boardId = request.getParameter("boardId");
				boardParentId = Integer.parseInt(request.getParameter("boardParentId"));
				//System.out.println(boardParentId);
				boardContent = (request.getParameter("boardContent"));
			}
			
			request.setAttribute("boardId", boardId);
			request.setAttribute("boardContent", boardContent);
			request.setAttribute("boardParentId", boardParentId);
			
			BoardDataBean boardDto = new BoardDataBean();
			boardDto.setUserId((String) request.getSession().getAttribute( "memid" ));
			boardDto.setBoardStatus(1);
			request.setAttribute("boardDto", boardDto);
			
			
			return new ModelAndView("/board/boardWrt");
		}else {
			
			
			BoardDataBean boardDto = new BoardDataBean();
			
			boardDto.setBoardId(request.getParameter("boardId"));
			boardDto.setBoardContent(request.getParameter("boardContent"));
			//System.out.println(request.getParameter("boardId")+"/");
			boardDto.setBoardStatus(0);
			//boardDto.setBoardStatus(Integer.parseInt(request.getParameter("boardStatus")));
			
			
			boardDto.setBoardParentId(Integer.parseInt(request.getParameter("boardParentId")));
			
			
			boardDto.setUserId(request.getParameter("userId"));
			boardDto.setBoardregdate( new Timestamp( System.currentTimeMillis() ));
			
			
		
			BoardDBBean boardDao = new BoardDBBean();
			
			int result = boardDao.boardWrt( boardDto );

			request.setAttribute( "result", result );
			
			
			return new ModelAndView("/board/boardWrt");
		}
		
		
	
	}
}
		