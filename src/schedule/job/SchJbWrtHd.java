package schedule.job;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class SchJbWrtHd implements ScheduelJobHandler {
	@Resource
	private ScheduleJobDBBean schJbDao;
	@Override
	@RequestMapping("/schJbWrt")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		String json = request.getParameter("json");//넘긴데이터 String으로 받음.

		try {
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject)parser.parse(json);	//String을 JsonObject로 변환.
			
			int schId = ((Long)jsonObj.get("schId")).intValue();	//Json에서 SchId꺼냄.
			for(int i=1; i<jsonObj.size(); i++) {	//홀개수 체크하기위한 i for문
				String index = Integer.toString(i);
				JSONArray array = (JSONArray) jsonObj.get(index);
				for(int j=0; j<array.size(); j++) { 	//선택된 i번째 홀의 job수가 몇개인지 체크하기위한 j for문
					 ScdJbDataBean scdJbDto = new ScdJbDataBean();
					 String posId = (String) array.get(j);
					 scdJbDto.setHallNum(i);
					 scdJbDto.setposId(posId);
					 scdJbDto.setSchId(schId);
					 schJbDao.schJbWrt(scdJbDto);// i*j번 만큼 insert를 하게됨. 리소스 낭비가 지죤임..
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return new ModelAndView("main");
	}
	
	@RequestMapping(value = "ajaxSchJbWrt", produces="application/json") 
	@ResponseBody
	public int ajaxProcess(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		int schId = Integer.parseInt(request.getParameter("schId"));
		int hallNum = Integer.parseInt(request.getParameter("hallNum"));
		
		ScdJbDataBean schJbDto = new ScdJbDataBean();
		schJbDto.setHallNum(hallNum);
		schJbDto.setSchId(schId);
		schJbDto.setposId("1");
		
		return schJbDao.schJbWrt(schJbDto);
	}
	
	@RequestMapping(value = "ajaxSchHallWrt", produces="application/json") 
	@ResponseBody
	public int ajaxProcess2(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		int schId = Integer.parseInt(request.getParameter("schId"));
		int hallNum = Integer.parseInt(request.getParameter("hallNum"));
		
		ScdJbDataBean schJbDto = new ScdJbDataBean();
		schJbDto.setHallNum(hallNum);
		schJbDto.setSchId(schId);
		schJbDto.setposId("1");
		int rst = 0;
		for (int i=0; i<5; i++) {
			rst = schJbDao.schJbWrt(schJbDto);
		}
		
		return rst;
	}

}
