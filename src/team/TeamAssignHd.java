package team;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import schedule.job.SchJbException;
@Controller
public class TeamAssignHd implements TeamHandler {
	@Resource
	private TeamDBBean teamDao;
	@Override
	@RequestMapping("/teamAssign")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws TeamException {
		// TODO Auto-generated method stub
		return null;
	}
	
	@RequestMapping(value = "ajaxTeamAssign") 
	@ResponseBody
	public int ajaxProcess(HttpServletRequest request, HttpServletResponse response) throws SchJbException {

		String jbskId = request.getParameter("jbskId");
		int teamId = Integer.parseInt(request.getParameter("teamId"));
		
		 
		if(teamDao.getMemCount(teamId)<15) {
			TeamDataBean teamDto = new TeamDataBean();
			
			teamDto.setTeamId(teamId);
			teamDto.setJbskId(jbskId);
			
			int rst = teamDao.teamAssign(teamDto);
			
			return rst;
		} else {
			return -1;
		}
		
	}

}
