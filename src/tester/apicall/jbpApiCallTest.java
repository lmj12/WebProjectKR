package tester.apicall;

import java.util.Scanner;

public class jbpApiCallTest {

	public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        dasi:
        while(true){
            System.out.print("사업자 등록번호를 입력하세요(0은 종료)");
            String bizID = scan.nextLine();
            System.out.println("trim 전 : "+bizID);
            if(bizID.trim().equals("0")) break; // 문자열.trim() : 앞뒤공백을 제거해라
            System.out.println("trim "+bizID.trim());
            if(bizID.length()!=10){ // 문자열.length() : 문자열의 길이를 구한다.
                System.out.println("사업자 등록번호는 10자리 이어야 합니다.");
                continue;
            }
            for(int i=0;i<bizID.length();i++){ // 문자열.charAt(index) : index위치의 1문자 얻기(index는 0부터)
                if(bizID.charAt(i)<'0' || bizID.charAt(i)>'9'){
                    System.out.println("사업자 등록번호는 반드시 숫자로만 이루어져 있어야 합니다.");
                    continue dasi;
                }
            }
            // 여기까지 내려오면 숫자로만 이루어진 10자리이다.
            int sum=0;
            // 1. 각각의 자리에 1 3 7 1 3 7 1 3 5 를 곱한 합을 구한다. 
            String checkNo="137137135";
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
        }
        scan.close();
    }

}
