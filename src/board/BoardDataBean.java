package board;

import java.sql.Timestamp;



public class BoardDataBean {
	private String boardId;
	private Timestamp boardregdate;
	private String boardregTime;
	private String boardTitle;
	private String boardContent;
	private int boardStatus;
	private int boardParentId;
	private String boarduserId;
	private String stime;
	

	
	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String boardId) {
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
		return boarduserId;
	}
	public void setUserId(String userId) {
		this.boarduserId = userId;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoarduserId() {
		return boarduserId;
	}
	public void setBoarduserId(String boarduserId) {
		this.boarduserId = boarduserId;
	}
	public String getBoardregTime() {
		return boardregTime;
	}
	public void setBoardregTime(String boardregTime) {
		this.boardregTime = boardregTime;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}

	
	
}
