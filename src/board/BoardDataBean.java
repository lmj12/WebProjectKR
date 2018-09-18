package board;

import java.sql.Timestamp;

public class BoardDataBean {
	private int boardId;
	private Timestamp boardregdate;
	private String boardContent;
	private int boardStatus;
	private int boardParentId;
	private String userId;
	
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public Timestamp getBoardregdate() {
		return boardregdate;
	}
	public void setBoardregdate(Timestamp boardregdate) {
		this.boardregdate = boardregdate;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getBoardStatus() {
		return boardStatus;
	}
	public void setBoardStatus(int boardStatus) {
		this.boardStatus = boardStatus;
	}
	
	public int getBoardParentId() {
		return boardParentId;
	}
	public void setBoardParentId(int boardParentId) {
		this.boardParentId = boardParentId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
