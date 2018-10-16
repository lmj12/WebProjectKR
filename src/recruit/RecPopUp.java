package recruit;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.jobprov.JobProvDBBean;
import member.jobprov.JobProvDataBean;
import schedule.job.SchJbException;
@Controller
public class RecPopUp implements RecruitHandler {
	@Resource
	public RecruitDBBean recDao;
	@Resource
	public JobProvDBBean jbpDao;
	@Override
	@RequestMapping("popRec")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws RecruitException {
		long time = (Long) request.getSession().getAttribute("time");
		String searchSite = (String) request.getSession().getAttribute("search");
		Timestamp recStart = new Timestamp(time);
		
		RecruitDataBean recDto = new RecruitDataBean();
		recDto.setRecStart(recStart);
		recDto.setSearchSite(searchSite);
		
		List<RecruitDataBean> articles = recDao.getPoprec(recDto);
		
		List <RecListDataBean> articleList = new ArrayList<RecListDataBean>();
		for(int i=0; i<articles.size(); i++) {
			RecListDataBean recList = new RecListDataBean();
			System.out.println(i);
			recDto = articles.get(i);
			SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			recDto.setStime(sf.format(recDto.getRecStart()));
			recDto.setEtime(sf.format(recDto.getRecEnd()));
			recList.setRecDto(recDto);
			
			int recId = recDto.getRecId();
			String jbpId = recDto.getJobpId();
			JobProvDataBean jbpDto= jbpDao.jobpGet(jbpId);
			recList.setJobpDto(jbpDto);
	
			List<RecruitDataBean> poss = recDao.recPosGet(recId);
			recList.setPoss(poss);
			articleList.add(recList);
		}
		request.getSession().setAttribute("popCk", 0);
		request.setAttribute("articleList", articleList);
		request.setAttribute("count", articleList.size());
		
		return new ModelAndView("/recruit/recPop");
	}
	
	@RequestMapping(value = "ajaxPopUp", produces="application/json") 
	@ResponseBody
	public int ajaxProcess(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		long time = (Long) request.getSession().getAttribute("time");
		String searchSite = (String) request.getSession().getAttribute("search");
		
		Timestamp recStart = new Timestamp(time);
		
		
		RecruitDataBean recDto = new RecruitDataBean();
		recDto.setRecStart(recStart);
		recDto.setSearchSite(searchSite);
		
		int rst = recDao.getPopCk(recDto);
		if(rst>0) {
			request.getSession().setAttribute("popCk", 1);
			request.getSession().setAttribute("popNum", rst);
		}
		
		request.getSession().setAttribute("time", System.currentTimeMillis());
		
		
		return rst;
	}
}
