package recruit;


import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.jobprov.JobProvDBBean;
import member.jobprov.JobProvDataBean;
import reccareer.RecCrrDBBean;


@Controller
public class RecViewHd implements RecruitHandler {
	@Resource
	public RecruitDBBean recDao;
	@Resource
	public RecCrrDBBean recCrrDao;
	@Resource
	public JobProvDBBean jbpDao;
	@RequestMapping("/recView")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecruitException {
		String pageNum = request.getParameter( "pageNum" );
	
		int recId = Integer.parseInt(request.getParameter("recId"));
	
		RecruitDataBean recDto = recDao.recGet( recId );
		String jbpId = recDto.getJobpId();
		JobProvDataBean jbpDto= jbpDao.jobpGet(jbpId);
		request.setAttribute("jbpDto", jbpDto);
		List<RecruitDataBean> recruitDto = recDao.recPosGet(recId);
		SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		recDto.setStime(sf.format(recDto.getRecStart()));
		recDto.setEtime(sf.format(recDto.getRecEnd()));
		//지원자수 체크
		int crrCnt= recCrrDao.countApp(recId);
		recDto.setCrrCnt(crrCnt);
		
		
		request.setAttribute( "pageNum", pageNum );
		request.setAttribute( "recDto", recDto );
		request.setAttribute("recruitDto", recruitDto);
		//조회수 늘리는 거
		recDao.addCount(recId);
		
		
		
		// TODO Auto-generated method stub
		return new ModelAndView("/recruit/recView");
	}

}
