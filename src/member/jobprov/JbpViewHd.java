package member.jobprov;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class JbpViewHd implements JobProvHandler {

	@Override
	@RequestMapping("/jbpView")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JbpException {
		String login = request.getParameter("login");
		if(login.equals("정보수정")) {
			//modifyProhandler
			JobProvDataBean jbtDto = new JobProvDataBean();
			jbtDto.setJobpPasswd(( request.getParameter( "jobpPasswd" ) ));
			
			String jobpId = (String) request.getSession().getAttribute( "memid" );
			// 전화번호
			jbtDto.setJobpTel(request.getParameter("jobpTel"));
			
			JobProvDataBean jbpDto = (JobProvDataBean) request.getAttribute( "jbpDto" );
			JobProvDBBean jbpDao = new JobProvDBBean();
			
			int result = jbpDao.jobpMod( jbpDto );
			
		
			request.setAttribute( "result", result );
			
			
			
			request.setAttribute( "jbpDto", jbpDto );
		}else if(login.equals("회원탈퇴")) {
			//deleteProhandler		
			String id = (String) request.getSession().getAttribute( "memid" );
			String passwd = request.getParameter( "passwd" );
			
			JobProvDBBean jbpDao = new JobProvDBBean();
			
			int resultCheck =jbpDao.jobpLgn( id, passwd );

			request.setAttribute( "resultCheck", resultCheck );
			
			if( resultCheck == 1 ) {
				int result = jbpDao.jobpDel( id );
				request.setAttribute( "result", result );
			}
		}
		
		String jobpId = request.getParameter( "jobpId" );
		String jobpPasswd = request.getParameter( "jobpPasswd" );
		JobProvDBBean jbpDao = new JobProvDBBean();
		
		int result = jbpDao.jobpLgn( jobpId, jobpPasswd );

		request.setAttribute( "result", result );
		request.setAttribute( "jobpId", jobpId );
		
		
		// TODO Auto-generated method stub
		return new ModelAndView("/Jbp/jbpView");
	}

}
