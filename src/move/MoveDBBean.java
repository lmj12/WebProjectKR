package move;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class MoveDBBean {
private SqlSession session = SqlMapClient.getSession();
	
	public void toMain() { // 임시매개변수. 필요시 변경할것.
		
	}
	
	public void toMyPage() { // 임시매개변수. 필요시 변경할것.
		
	}
}
