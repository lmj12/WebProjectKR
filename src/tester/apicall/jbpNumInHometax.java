package tester.apicall;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.jobprov.JbpException;
import member.jobprov.JobProvHandler;

public class jbpNumInHometax  implements JobProvHandler {
		@Override
		@RequestMapping("/openAPIViewHometax")
		public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JbpException {
			JbpApiCallHd call = new JbpApiCallHd();
			String jbpName = request.getParameter("jbpName");
			String jbpNumber = request.getParameter("jbpNumber");
			String result = null;
			
			
			result = call.jobpOpenApi(jbpName, jbpNumber);
			
			
			
			request.setAttribute("result", result);
			request.setAttribute("jbpName", jbpName);
			request.setAttribute("jbpNumber", jbpNumber);
			return new ModelAndView("APItest/openAPIView");
		}

		public String jobpOpenApi(String jbpName, String jbpNumber){
			BufferedReader br = null;
			String apiResult = null;
			String line = null;
			String urlstr = "http://apis.data.go.kr/B552015/NpsBplcInfoInqireService/getBassInfoSearch?"
					+ "serviceKey=zHRNYJ97QejMrVzKWNS6Hmc8j9Gd8oJ7p4LKd3MfUsTbmSI%2F2v3inaBqZm%2FTDmxvJPYg7gQ1QOEfbnPWE%2FRQvg%3D%3D"
					+ "&wkpl_nm="+jbpName
					+ "&bzowr_rgst_no="+jbpNumber
					+ "&pageSize=1";
			
			try {
				URL url = new URL(urlstr);
				HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
				// TODO : 임시로 GET 방식 설정해 놓음
				urlconnection.setRequestMethod("GET");
				br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
				while( (line = br.readLine()) != null ){
					if(apiResult == null || apiResult.equals("")){
						apiResult = line + "\n";
					} else {
						apiResult = apiResult + line + "\n";
					}
				}
			} catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return apiResult;
		}
}