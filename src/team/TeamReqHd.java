package team;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import schedule.job.SchJbException;
@Controller
public class TeamReqHd implements TeamHandler {
	@Resource
	private TeamDBBean teamDao;
	@Override
	@RequestMapping("/teamReq")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws TeamException {
		return null;
	}
	@RequestMapping(value = "ajaxTeamReq") 
	@ResponseBody
	public int ajaxProcess(HttpServletRequest request, HttpServletResponse response) throws SchJbException {

		String jbskId = request.getParameter("jbskId");
		
		if( teamDao.jbskCk(jbskId)==0) {	//	다른팀에 가입되어 있는지 여부 체크.
			int teamId = Integer.parseInt(request.getParameter("teamId"));
			TeamDataBean teamDto = new TeamDataBean();
			
			teamDto.setTeamId(teamId);
			teamDto.setJbskId(jbskId);
			
			int rst = teamDao.teamReq(teamDto);
			
			return rst;
		} else {
			return -1;
		}
	}
	
	@RequestMapping(value = "ajaxReqList") 
	@ResponseBody
	public String ajaxProcess2(HttpServletRequest request, HttpServletResponse response) throws SchJbException {

		
		int teamId = Integer.parseInt(request.getParameter("teamId"));
		
		List <TeamDataBean> reqList = teamDao.reqList(teamId);
		
		ObjectMapper mapper = new ObjectMapper();
		
		String rl=""; 
		try { 
			rl = mapper.writeValueAsString(reqList);
			
		} catch (IOException e) { 
			e.printStackTrace(); 
		}
		
		return rl;
	}
}
