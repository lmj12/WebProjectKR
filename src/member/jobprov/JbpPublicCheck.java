package member.jobprov;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JbpPublicCheck {
	@RequestMapping(value = "jbpPublicCheck")
	@ResponseBody
	public String ajaxProcess(HttpServletRequest request, HttpServletResponse response) throws JbpException {
		// TODO 공공데이터 API 콜 핸들러
		BufferedReader br = null;
		String wkpl_nm = request.getParameter("wkpl_nm");	// 업체명
		String encoded_nm = "";
		try {
			encoded_nm = URLEncoder.encode(wkpl_nm, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String bzowr_rgst_no = request.getParameter("bzowr_rgst_no");	// 업체 사업자등록번호
		String serviceKey = "zHRNYJ97QejMrVzKWNS6Hmc8j9Gd8oJ7p4LKd3MfUsTbmSI%2F2v3inaBqZm%2FTDmxvJPYg7gQ1QOEfbnPWE%2FRQvg%3D%3D";	// 서비스 키
		String urlstr = "http://apis.data.go.kr/B552015/NpsBplcInfoInqireService/getBassInfoSearch?_type=json" + 
				"&serviceKey=" + serviceKey +
				"&wkpl_nm=" + encoded_nm +
				"&bzowr_rgst_no=" + bzowr_rgst_no;	// URL
		String rst="";
		
		
		URL url;
		try {
			url = new URL(urlstr);
			System.out.println(url);
			HttpURLConnection urlconnect = (HttpURLConnection) url.openConnection();
			urlconnect.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnect.getInputStream(), "UTF-8"));
			rst = "";
			String line;
			while((line = br.readLine()) != null) {
				rst = rst + line.trim();
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		System.out.println(rst);
		return rst;
	}

}
