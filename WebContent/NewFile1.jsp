<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>insert문 ㅠㅠ구직자</h2>



                                                                                                                         
insert into KRjobseeker values('human1', '1212abc', sysdate, 'choi', 1, TO_DATE('1999/01/13 10:30:14', 'YYYY/MM/DD HH:MI:SS'), '--', '서울', '강남구', 'gw@naver.com', '01012345678', 'C:\image\sun.jpg', 1, '자기소개서');
insert into KRjobseeker values('human2', '1212abc', sysdate, 'choi', 1, TO_DATE('1998/04/01 11:30:14', 'YYYY/MM/DD HH:MI:SS'), '--', '부산', '해운대구', 'gw@naver.com', '01012345678', 'C:\image\sun.jpg', 1, '자기소개서');
insert into KRjobseeker values('human3', '1212abc', sysdate, 'choi', 1, TO_DATE('1997/11/09 05:40:14', 'YYYY/MM/DD HH:MI:SS'), '경기', '파주시', '금촌동', 'gw@naver.com', '01012345678', 'C:\image\sun.jpg', 1, '자기소개서');
insert into KRjobseeker values('human4', '1212abc', sysdate, 'choi', 1, TO_DATE('1996/05/06 04:51:14', 'YYYY/MM/DD HH:MI:SS'), '경기', '성남시', '분당구', 'gw@naver.com', '01012345678', 'C:\image\sun.jpg', 1, '자기소개서');
insert into KRjobseeker values('human5', '1212abc', sysdate, 'choi', 1, TO_DATE('1995/06/21 09:42:14', 'YYYY/MM/DD HH:MI:SS'), '--, '대구', '남구', 'gw@naver.com', '01012345678', 'C:\image\sun.jpg', 1, '자기소개서');
insert into KRjobseeker values('human6', '1212abc', sysdate, 'choi', 1, TO_DATE('1994/08/10 03:33:14', 'YYYY/MM/DD HH:MI:SS'), '--', '서울', '도봉구', 'gw@naver.com', '01012345678', 'C:\image\sun.jpg', 1, '자기소개서');
insert into KRjobseeker values('human7', '1212abc', sysdate, 'choi', 1, TO_DATE('1993/06/02 02:22:14', 'YYYY/MM/DD HH:MI:SS'), '--', '서울', '서초구', 'gw@naver.com', '01012345678', 'C:\image\sun.jpg', 1, '자기소개서');

insert into KRjobseeker values('human8', '1212abc', sysdate, 'choi', 2, TO_DATE('1992/03/11 01:17:14', 'YYYY/MM/DD HH:MI:SS'), '--', '서울', '마포구', 'gw@naver.com', '01012345678', 'C:\image\sun.jpg', 1, '자기소개서');
insert into KRjobseeker values('human9', '1212abc', sysdate, 'choi', 2, TO_DATE('1991/12/24 04:12:14', 'YYYY/MM/DD HH:MI:SS'), '--', '서울', '동작구', 'gw@naver.com', '01012345678', 'C:\image\sun.jpg', 1, '자기소개서');
insert into KRjobseeker values('human10', '1212abc', sysdate, 'choi', 2, TO_DATE('1900/07/07 05:10:14', 'YYYY/MM/DD HH:MI:SS'), '--', '서울', '노원구', 'gw@naver.com', '01012345678', 'C:\image\sun.jpg', 1, '자기소개서');
insert into KRjobseeker values('human11', '1212abc', sysdate, 'choi', 2, TO_DATE('1992/08/16 06:18:14', 'YYYY/MM/DD HH:MI:SS'), '경기', '남양주시', '가운동', 'gw@naver.com', '01012345678', 'C:\image\sun.jpg', 1, '자기소개서');
insert into KRjobseeker values('human12', '1212abc', sysdate, 'choi', 2, TO_DATE('1994/08/05 07:26:14', 'YYYY/MM/DD HH:MI:SS'), '--', '부산', '강서구', 'gw@naver.com', '01012345678', 'C:\image\sun.jpg', 1, '자기소개서');
insert into KRjobseeker values('human13', '1212abc', sysdate, 'choi', 2, TO_DATE('1997/09/03 08:27:14', 'YYYY/MM/DD HH:MI:SS'), '--', '서울', '금천구', 'gw@naver.com', '01012345678', 'C:\image\sun.jpg', 1, '자기소개서');
insert into KRjobseeker values('human14', '1212abc', sysdate, 'choi', 2, TO_DATE('1992/10/13 12:28:14', 'YYYY/MM/DD HH:MI:SS'), '--', '서울', '동대문구', 'gw@naver.com', '01012345678', 'C:\image\sun.jpg', 1, '자기소개서');



 insert into KRadmin values('admin1', '1212abc', 1, sysdate);
 insert into KRadmin values('admin2', '1212abc', 1, sysdate);
 insert into KRadmin values('admin3', '1212abc', 1, sysdate);
 
 
 
 insert into KRboard values('1_1','', '삼정호텔신고합니다. 시급떼먹었어요.', 1, 1, 'human1', to_date('10/13/2018 11:41:15', 'MM/dd/yyyy hh24:mi:ss'));
 insert into KRboard values('1_2','', '확인했습니다. 삼정호텔에서 시급돌려드릴겁니다', 0, 1, 'admin3', to_date('10/13/2018 12:41:15', 'MM/dd/yyyy hh24:mi:ss'));
 insert into KRboard values('2_1','', '웨딩헤너스 불량업체인 거 같아요. 거기갔더니 부려먹고 시간도 공지랑 다르네요', 0, 2, 'human2', to_date('10/14/2018 12:41:15', 'MM/dd/yyyy hh24:mi:ss'));
 insert into KRboard values('3_1','', '알바구합니다. 열심히 일할게요', 0, 3, 'human3', to_date('10/14/2018 06:41:15', 'MM/dd/yyyy hh24:mi:ss'));
 insert into KRboard values('4_1','', '왜 답글 빨리 안달아주세요?', 1, 4, 'human2', to_date('10/15/2018 10:41:15', 'MM/dd/yyyy hh24:mi:ss'));
 insert into KRboard values('4_2','', '10/14일은 서버점검기간이여서 답글을 달아드리지 못한 점 죄송합니다.이전 댓글은 확인 후 답글달아드리겠습니다', 0, 4, 'admin2', to_date('10/16/2018 12:41:15', 'MM/dd/yyyy hh24:mi:ss'));
 insert into KRboard values('5_1','', '아펠가모위치를 못찾겠어요', 0, 5, 'human5', to_date('10/17/2018 02:15:15', 'MM/dd/yyyy hh24:mi:ss'));
 insert into KRboard values('5_2','', '위치는 해당업체에 연락해서 찾아보세요.업체가 없을시 신고해주세요', 0, 5, 'human5', to_date('10/17/2018 04:38:15', 'MM/dd/yyyy hh24:mi:ss'));
 insert into KRboard values('0_1','공지, 신고업체기입', '공지드립니다.신고내용에 신고하시는 업체 꼭 기입해주세요', 1, 0, 'admin1', to_date('10/17/2018 12:41:15', 'MM/dd/yyyy hh24:mi:ss'));
 insert into KRboard values('0_2','서버점검기간 공지', '공지 : 10/14일에서 10/15일은 서버점검기간입니다', 1, 0, 'admin2', to_date('10/13/2018 12:41:15', 'MM/dd/yyyy hh24:mi:ss'));
 insert into KRboard values('0_3','신고게시판', '공지:이 게시판은 신고용도로만 사용해주세요', 1, 0, 'admin3', to_date('10/16/2018 12:41:15', 'MM/dd/yyyy hh24:mi:ss'));
 insert into KRboard values('0_4', '이용자수 많은 기간', '10/18일에 이용자수가 많아 서버가 느려질 수 있으니 참고하세요', 1, 0, 'admin1', to_date('10/16/2018 12:41:15', 'MM/dd/yyyy hh24:mi:ss'));
 insert into KRboard values('0_5', 'D-1', 'D-1 내일은 홈페이지 시현하는 날입니다.', 1, 0, 'admin2', to_date('10/17/2018 12:55:15', 'MM/dd/yyyy hh24:mi:ss'));
 
 
 
 