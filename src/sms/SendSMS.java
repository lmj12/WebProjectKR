package sms;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import org.apache.http.client.CredentialsProvider;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.client.AuthCache;
import org.apache.http.HttpHost;
import org.apache.http.client.protocol.HttpClientContext;



/* XXX didn't use org.json to be simple
import org.json.JSONObject; 
*/
@Controller
public final class SendSMS {
	@RequestMapping(value = "ajaxSendSMS", produces="application/json") 
	@ResponseBody
	public int ajaxProcess(HttpServletRequest request, HttpServletResponse response)  {
		String tel = request.getParameter("tel");
		int authNum = Integer.parseInt(request.getParameter("authNum"));
		
		String content = "[WDKirin.com]본인확인 메시지입니다. 인증번호를 화면에 입력해주세요.";
		content = content + "[ " + authNum + " ]";
		int rst = -1;
		
		CredentialsProvider credsProvider = new BasicCredentialsProvider();
        credsProvider.setCredentials(									//인증받는거로 보임
            new AuthScope(Config.hostname, 443, AuthScope.ANY_REALM),
            new UsernamePasswordCredentials(Config.appid, Config.apikey)
        );
        
        AuthCache authCache = new BasicAuthCache();
        authCache.put(new HttpHost(Config.hostname, 443, "https"), new BasicScheme());
        
        HttpClientContext context = HttpClientContext.create();
        context.setCredentialsProvider(credsProvider);
        context.setAuthCache(authCache);

        DefaultHttpClient client = new DefaultHttpClient();
        
        try {
            HttpPost httpPost = new HttpPost(Config.url);
            httpPost.setHeader("Content-type", "application/json; charset=utf-8");
            String json = "{\"sender\":\""+Config.sender+"\",\"receivers\":[\""+tel+"\"],\"content\":\""+content+"\"}";

            StringEntity se = new StringEntity(json, "UTF-8");
            httpPost.setEntity(se);

            HttpResponse httpResponse = client.execute(httpPost, context);
            rst = httpResponse.getStatusLine().getStatusCode();

            /*InputStream inputStream = httpResponse.getEntity().getContent();
            if(inputStream != null) {
                BufferedReader bufferedReader = new BufferedReader( new InputStreamReader(inputStream));
                String line = "";
                while((line = bufferedReader.readLine()) != null)
                    System.out.println(line);
                inputStream.close();
            }*/
        } catch (Exception e) {
            System.err.println("Error: "+e.getLocalizedMessage());
        } finally {
            client.getConnectionManager().shutdown();
        }
        return rst;
	}
	
	
}