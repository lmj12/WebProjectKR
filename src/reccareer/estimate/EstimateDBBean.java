package reccareer.estimate;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class EstimateDBBean {
private SqlSession session = SqlMapClient.getSession();
	
	public int estWrt(EstimateDataBean estDto) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public EstimateDataBean estGet(int estId) { // 임시매개변수. 필요시 변경할것.
		EstimateDataBean estDto = new EstimateDataBean();
		return estDto; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public List<EstimateDataBean> estList(String jbskId) { // 임시매개변수. 필요시 변경할것.
		List<EstimateDataBean> ests = new ArrayList<EstimateDataBean>();
		return ests; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	

}
