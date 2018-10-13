package member.jobseeker;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import member.jobprov.JobProvDataBean;
import mybatis.SqlMapClient;

public class JobSeekerDBBean {
   private SqlSession session = SqlMapClient.getSession();
   
   public int jbskReg(JobSeekerDataBean jbskDto) { // 임시매개변수. 필요시 변경할것.
      return session.insert("Jbs.jbskReg", jbskDto); // 에러막기위한 임시 리턴. 필요없으면 지울것.
   }
   public int check( String jbskId ) {
      return session.selectOne("Jbs.checkId", jbskId);    
   }
   
   public JobSeekerDataBean jbskLgn(String jbskId, String jbskPasswd) { // 임시매개변수. 필요시 변경할것.
      JobSeekerDataBean jbskDto = new JobSeekerDataBean();
      if(check(jbskId)>0) {
         // 아이디가 있다
         JobSeekerDataBean checkdto = jbskGet(jbskId);
         if( jbskPasswd.equals( checkdto.getJbskPasswd() ) ) {
            //비밀번호 같다
            jbskDto = checkdto;
         } 
      }
      return jbskDto;
   }
   
   
   public JobSeekerDataBean jbskGet(String jbskId) { // 임시매개변수. 필요시 변경할것.
      return session.selectOne("Jbs.jbskGet", jbskId); // 에러막기위한 임시 리턴. 필요없으면 지울것.
   }
   
   public int jbskMod(JobSeekerDataBean jbskDto) { // 임시매개변수. 필요시 변경할것.
      return session.update("Jbs.jbskMod", jbskDto);// 에러막기위한 임시 리턴. 필요없으면 지울것.
   }
   
   public int jbskDel(String jbskId) { // 임시매개변수. 필요시 변경할것.
      return session.delete("Jbs.jbskDel", jbskId);   // 에러막기위한 임시 리턴. 필요없으면 지울것.
   }
   
   public List<JobSeekerDataBean> jbskGet2() { // 구직자  리스트 가져오기
		return session.selectList("Jbs.jbskGet2"); 
	}
}