
package tester.apicall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.jobprov.JbpException;
import member.jobprov.JobProvHandler;

public class JbpNumCheck implements JobProvHandler {
	// 사업자등록번호 유효성검사

	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws JbpException {
		// TODO : 사업자등록번호 유효성검사 -> 사업자등록번호 파싱해서 검색 후 선택 
		String bizID = request.getParameter("jbpNumber");
		String msg = null;
		String checkNo = "137137135";
		int sum=0;
            
		bizID.trim();
			
            if(bizID.length()!=10){ // 문자열.length() : 문자열의 길이를 구한다.
                msg = "사업자 등록번호는 10자리 이어야 합니다.";
                request.setAttribute("msg", msg);
            }
            
            for(int i=0;i<bizID.length();i++){ // 문자열.charAt(index) : index위치의 1문자 얻기(index는 0부터)
                if(bizID.charAt(i)<'0' || bizID.charAt(i)>'9'){
                  msg = "사업자 등록번호는 반드시 숫자로만 이루어져 있어야 합니다.";
                  request.setAttribute("msg", msg);
                }
            }
            // 여기까지 내려오면 숫자로만 이루어진 10자리이다.
            
            // 1. 각각의 자리에 1 3 7 1 3 7 1 3 5 를 곱한 합을 구한다. 
            
            for(int i=0;i<checkNo.length();i++)
                sum += (bizID.charAt(i)-'0') * (checkNo.charAt(i)-'0');
            // 2. 마지막에서 두번째 숫자에 5를 곱하고 10으로 나누어 나온 몫을 더한다.
            sum += ((bizID.charAt(8)-'0') * 5)/10;
 
            // 3. 매직키인 10로 나누어 나머지만 취한다. 
            sum %= 10;
 
            // 4. 매직키인 10에서 나머지를 빼면
            sum = 10 - sum;
 
            // 5. 이숫자가 사업자등록번호 마지막 자리의 숫자와 일치하면 대한민국 사업자이다. 
            System.out.println( bizID + "는 " + 
                               ((sum==bizID.charAt(9)-'0') ? "맞는" : "틀린") + "사업자 번호입니다.");
        
		return new ModelAndView();
	}

}

