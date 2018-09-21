package member.jobprov;



import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class JobProvDBBean {
private SqlSession session = SqlMapClient.getSession();
	
	public int jobpReg(JobProvDataBean jbpDto) { // 임시매개변수. 필요시 변경할것.
		return session.insert("Jbp.jobpReg", jbpDto); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int check( String jobpId ) {
		return session.selectOne("Jbp.checkId", jobpId); 	
	}
	
	public JobProvDataBean jobpLgn(String jobpId, String jobpPasswd) { // 임시매개변수. 필요시 변경할것.
		JobProvDataBean jbtDto = new JobProvDataBean();
		if(check(jobpId)>0) {
			// 아이디가 있다
			JobProvDataBean checkdto = jobpGet(jobpId);
			if( jobpPasswd.equals( checkdto.getJobpPasswd() ) ) {
				//비밀번호 같다
				jbtDto = checkdto;
			} 
		}
		return jbtDto;	
	}
	
	public JobProvDataBean jobpGet(String jbpId) { // 임시매개변수. 필요시 변경할것.
		return session.selectOne("Jbp.jobpGet", jbpId); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int jobpMod(JobProvDataBean jbpDto) { // 임시매개변수. 필요시 변경할것.
		return session.update("Jbp.jobpMod", jbpDto); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int jobpDel(String jbpId) { // 임시매개변수. 필요시 변경할것.
		return session.delete("Jbp.jobpDel", jbpId);			
		// 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
}
