package member.jobprov;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JbpPublicCheck implements JobProvHandler {

	@Override
	@RequestMapping("/jbpPublicCheck")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JbpException {
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
		System.out.println(wkpl_nm);
		System.out.println(bzowr_rgst_no);
		String serviceKey = "zHRNYJ97QejMrVzKWNS6Hmc8j9Gd8oJ7p4LKd3MfUsTbmSI%2F2v3inaBqZm%2FTDmxvJPYg7gQ1QOEfbnPWE%2FRQvg%3D%3D";	// 서비스 키
		String urlstr = "http://apis.data.go.kr/B552015/NpsBplcInfoInqireService/getBassInfoSearch" + 
				"?serviceKey=" + serviceKey +
				"&wkpl_nm=" + encoded_nm +
				"&bzowr_rgst_no=" + bzowr_rgst_no;	// URL
		System.out.println(urlstr);
		
		
		URL url;
		try {
			url = new URL(urlstr);
			HttpURLConnection urlconnect = (HttpURLConnection) url.openConnection();
			urlconnect.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnect.getInputStream(), "UTF-8"));
			String result = "";
			String line;
			while((line = br.readLine()) != null) {
				result = result + line + "\n";
			}
			request.setAttribute("result", result);
			System.out.println(result);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
