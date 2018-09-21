package board;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class BoardDBBean {
	private SqlSession session = SqlMapClient.getSession();
	
	public int boardWrt(BoardDataBean boardDto) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int boardMod(BoardDataBean boardDto) {// 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int boardDel(int boardId) {// 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public BoardDataBean boardGet(int boardId) {// 임시매개변수. 필요시 변경할것.
		BoardDataBean boardDto = new BoardDataBean();
		return boardDto; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public List<BoardDataBean> boardList() {// 임시매개변수. 필요시 변경할것.
		List <BoardDataBean> boards = new ArrayList<BoardDataBean>();
		return session.selectList("Board.boardList"); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
}
