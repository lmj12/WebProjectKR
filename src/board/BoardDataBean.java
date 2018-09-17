package board;

public class BoardDataBean {
	private String boardId;
	private int board_num;
	private String boardContent;
	private int boardStatus;
	private String boardParentId;
	private String userId;
	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
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
	public String getBoardParentId() {
		return boardParentId;
	}
	public void setBoardParentId(String boardParentId) {
		this.boardParentId = boardParentId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
