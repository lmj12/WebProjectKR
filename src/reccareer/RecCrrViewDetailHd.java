package reccareer;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import iptcareer.IptCrrDBBean;
import iptcareer.IptCrrDataBean;
import schedule.job.SchJbException;

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
		CareerDataBean crrDto = recCrrDao.getCrr(jbskId);
		
		List<IptCrrDataBean> iptLists = iptDao.iptList(jbskId);	//	입력경력 받아오는 메소드
		int iptSize = iptLists.size();
		request.setAttribute("iptSize", iptSize);	//	입력경력칸 만들까 말까 인지시켜주는 변수.
		request.setAttribute("iptLists", iptLists);
		request.setAttribute("crrDto", crrDto);		//경력사항 뱉어줌.
		
		
		return new ModelAndView("recCrr/recDetailView");
	}
	
	@RequestMapping("/rsmDetail")
	public ModelAndView process2(HttpServletRequest request, HttpServletResponse response) throws RecCrrException {
		String jbskId = request.getParameter("jbskId");
		
		CareerDataBean crrDto = recCrrDao.getCrr(jbskId);
		
		List<IptCrrDataBean> iptLists = iptDao.iptList(jbskId);	//	입력경력 받아오는 메소드
		int iptSize = iptLists.size();
		request.setAttribute("iptSize", iptSize);	//	입력경력칸 만들까 말까 인지시켜주는 변수.
		request.setAttribute("iptLists", iptLists);
		request.setAttribute("crrDto", crrDto);		//경력사항 뱉어줌.
		
		return new ModelAndView("rsmDetail");
	}
	
	@RequestMapping(value = "ajaxRsmSearch") 
	@ResponseBody
	public String ajaxProcess(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		
		//TODO 수정중.
		int gender = 0;
		if(request.getParameter("gender") != null) {
			gender = Integer.parseInt(request.getParameter("gender"));
		} 
		String pos="not";
		String [] poss = {}; 
		if(request.getParameter("position") != "") {
			pos = request.getParameter("position");
			poss = pos.split(",");
		} 
		
		
		String place = "not";
		
		if(!request.getParameter("place").equals("")  && ! request.getParameter("place").equals("주소")) {
			System.out.println("기루룱");
			place = request.getParameter("place");
		}
		
	
		
		String queryHead = "select c.JBSKID,sum(reader) reader,sum(scan) scan,sum(sword) sword,sum(guide) guide,sum(guard) guard, j.JBSKNAME jbskname, j.JBSKTEL jbsktel, j.JBSKGENDER jbskgender, j.jbskBd jbskbd, j.JBSKADD2 jbskadd2, j.JBSKADD3 jbskadd3 from (select JBSKID,count(DECODE(POSID,1,1)) reader, count(DECODE(POSID,2,1)) scan, count(DECODE(POSID,3,1)) sword, count(DECODE(POSID,4,1)) guide, count(DECODE(POSID,5,1)) guard from KRSCHJOB j, KRSCHEDULE s where j.schId = s.schId AND JBSKID IS NOT NULL AND s.SCHSTARTTIME < SYSDATE GROUP BY JBSKID" 
						+ " UNION ALL "
						+	"select JBSKID,count(DECODE(POSID,1,1)) reader, count(DECODE(POSID,2,1)) scan, count(DECODE(POSID,3,1)) sword, count(DECODE(POSID,4,1)) guide, count(DECODE(POSID,5,1)) guard from KRRECCAREER c, KRRECRUIT r where c.RECID = r.RECID AND JBSKID IS NOT NULL  GROUP BY JBSKID) c, KRJOBSEEKER j where c.JBSKID = j.JBSKID "; 
		String queryTail = 	"GROUP BY c.JBSKID,JBSKNAME,jbsktel,jbskgender,jbskbd,jbskAdd2,jbskAdd3";
		

	
		String posBody ="";
		if(! pos.equals("not")) {
			if(poss[0].equals("6") || poss[0]==null) {
				
			} else {
				posBody += "AND (";
				for(int i =0; i<poss.length; i++) {
					if(i != (poss.length-1)) {
						if(poss[i].equals("1")){
							posBody += "reader > 0 OR ";
						} else if(poss[i].equals("2")){
							posBody += "scan > 0 OR ";
						} else if(poss[i].equals("3")){
							posBody += "sword > 0 OR ";
						} else if(poss[i].equals("4")){
							posBody += "guide > 0 OR ";
						} else if(poss[i].equals("5")){
							posBody += "guard > 0 OR ";
						}
					} else {
						if(poss[i].equals("1")){
							posBody += "reader > 0";
						} else if(poss[i].equals("2")){
							posBody += "scan > 0";
						} else if(poss[i].equals("3")){
							posBody += "sword > 0";
						} else if(poss[i].equals("4")){
							posBody += "guide > 0";
						} else if(poss[i].equals("5")){
							posBody += "guard > 0";
						}
					}
				}
				posBody += ") ";
			}
		}
		
		String genBody = "";
		if(gender!=0) {
			genBody += "AND j.JBSKGENDER = " + gender + " ";
		}
		
		String addBody = "";
		if(! place.equals("not")) {	//	값이 있을경우에만
			addBody += "AND ";
			String []ad = place.split(" ");
			
			if(ad[0].equals("서울") || ad[0].equals("대전") || ad[0].equals("대구") || ad[0].equals("부산") || ad[0].equals("울산") || ad[0].equals("광주") || ad[0].equals("인천") || ad[0].equals("세종특별자치시")){
				addBody += "jbskAdd2 = '" +  ad[0] + "' AND jbskAdd3 = '" + ad[1] + "' ";
			} else {
				addBody += "jbskAdd2 = '" +  ad[1] + "' AND jbskAdd3 = '" + ad[2] + "' ";
			}
		}
		
		String query = queryHead + posBody + genBody + addBody + queryTail;
		CareerDataBean crrDto = new CareerDataBean();
		crrDto.setQuery(query);
		
		
		List<CareerDataBean> rst = recCrrDao.search(crrDto);
		
		ObjectMapper mapper = new ObjectMapper(); 
		
		String user=""; 
		try { 
			user = mapper.writeValueAsString(rst);
			
		} catch (IOException e) { 
			e.printStackTrace(); 
		}

		return user;
	}

}
