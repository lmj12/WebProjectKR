package member.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.jobprov.JobProvDataBean;

@Controller
public class AdminLgnHd implements AdminHandler {
	@Resource
	AdminDBBean admDao;
	@Override
	@RequestMapping("/admLgn")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws AdminException {
		String admId = request.getParameter( "id" );
		String admPasswd = request.getParameter( "passwd" );
		
		AdminDataBean admDto = new AdminDataBean();
		admDto.setAdminId(admId);
		admDto.setAdminPasswd(admPasswd);
		
		int rst = -1;
		admDto = admDao.adminLgn( admDto );
		
		try {
			if(admDto.getAdminId().equals("") || admDto.getAdminId()==null) {
				rst = 0;
			} else {
				rst = 1;
			}
		} catch(NullPointerException e){
			rst = 0;
		}
		request.setAttribute("rst", rst);
		request.setAttribute( "admId", admId);
		request.setAttribute("memtype", 3);  // 구직자 : 1, 구인자 : 2 , 관리자 :3 
		return new ModelAndView("/admin/admLgnPro");
	}

}
