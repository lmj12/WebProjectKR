package reccareer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import iptcareer.IptCrrDBBean;
import iptcareer.IptCrrDataBean;

@Controller
public class RecCrrViewDetailHd implements RecruitCareerHandler {
	@Resource
	private RecCrrDBBean recCrrDao;
	@Resource
	private IptCrrDBBean iptDao;
	@Override
	@RequestMapping("/recCrrDetail")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecCrrException {
		int recId = Integer.parseInt(request.getParameter("recId"));
		String jbskId = request.getParameter("jbskId");
		
		RecCrrDataBean recCrrDto = new RecCrrDataBean();
		recCrrDto.setRecId(recId);
		recCrrDto.setJbskId(jbskId);
			
		recCrrDto = recCrrDao.recCrrGetById(recCrrDto);
		request.setAttribute("recCrrDto", recCrrDto);
		
		if(recCrrDto.getRecCrrSta()==0) {	//	만약 개인정보의 상태가 0, 즉 미확인 상태였다면.
			int recCrrId = recCrrDto.getRecCrrId();
			Map<String, Integer> map = new HashMap<String,Integer>();
			map.put("recCrrSta", 1);
			map.put("recCrrId", recCrrId);
			recCrrDao.recCrrCng(map);//상태변경을 위한 메소드. 조회상태로 바꿔야하니 상태 1로 변경해야함.
		}
		
		List<IptCrrDataBean> iptLists = iptDao.iptList(jbskId);	//	입력경력 받아오는 메소드
		int iptSize = iptLists.size();
		request.setAttribute("iptSize", iptSize);	//	입력경력칸 만들까 말까 인지시켜주는 변수.
		request.setAttribute("iptLists", iptLists);
		
		//TODO 수정중
		
		return new ModelAndView("recCrr/recDetailView");
	}

}
