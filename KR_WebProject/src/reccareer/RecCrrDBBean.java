package reccareer;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class RecCrrDBBean {
	private SqlSession session = SqlMapClient.getSession();
	
	public int recCrrApply(RecCrrDataBean recCrrDto) {// 임시매개변수. 필요시 변경할것.
		int rst =0;
		return rst;// 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int recCrrCncl(int recCrrId) {// 임시매개변수. 필요시 변경할것.
		int rst =0;
		return rst;// 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public RecCrrDataBean recCrrGet(int recCrrId) {// 임시매개변수. 필요시 변경할것.
		RecCrrDataBean recCrrDto = new RecCrrDataBean();
		return recCrrDto;// 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public List<RecCrrDataBean> recCrrMyList(String jbskId) {// 임시매개변수. 필요시 변경할것.
		List <RecCrrDataBean> recCrrs = new ArrayList<RecCrrDataBean>();
		return recCrrs;// 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int recCrrCnt(int recCrrId) {// 임시매개변수. 필요시 변경할것.
		int rst =0;
		return rst;// 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public void recCrrCng(int recCrrId) {// 임시매개변수. 필요시 변경할것.
	
	}

	public List<RecCrrDataBean> recCrrApplyList(int recId) {// 임시매개변수. 필요시 변경할것.
		List <RecCrrDataBean> applys = new ArrayList<RecCrrDataBean>();
		return applys;// 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
}
