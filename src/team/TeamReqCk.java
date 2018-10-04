package team;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class TeamReqCk implements TeamHandler {
	@Resource
	private TeamDBBean teamDao;
	@Override
	@RequestMapping("teamReqCk")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws TeamException {
		String jbskId = (String) request.getSession().getAttribute("memid");
		
		System.out.println(jbskId);
		List<TeamDataBean> reqTeams = teamDao.ckReq(jbskId);
		
		ObjectMapper mapper = new ObjectMapper(); 
		
		String tl=""; 
		try { 
			tl = mapper.writeValueAsString(reqTeams);
			
		} catch (IOException e) { 
			e.printStackTrace(); 
		}
		
		request.setAttribute("reqTeams", tl);
		
		return new ModelAndView("team/teamReqCk");
	}

}
