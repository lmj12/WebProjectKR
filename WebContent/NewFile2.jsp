<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>스케줄, 스케줄직무</h2>                                                                                                        
insert into KRschedule values(KRschedule_seq.nextval, TO_DATE('2018/10/13 10:30:14', 'YYYY/MM/DD HH:MI:SS'), TO_DATE('2018/10/13 16:30:14', 'YYYY/MM/DD HH:MI:SS'), '팀장외 3명 지원하세요', 'test1');
insert into KRschedule values(KRschedule_seq.nextval, TO_DATE('2018/10/14 09:15:14', 'YYYY/MM/DD HH:MI:SS'), TO_DATE('2018/10/14 16:30:14', 'YYYY/MM/DD HH:MI:SS'), '스캔, 예도, 안내, 경호 지원요망', 'test1');
insert into KRschedule values(KRschedule_seq.nextval, TO_DATE('2018/10/18 08:17:14', 'YYYY/MM/DD HH:MI:SS'), TO_DATE('2018/10/18 13:30:14', 'YYYY/MM/DD HH:MI:SS'), '급구 3명', 'test1');
insert into KRschedule values(KRschedule_seq.nextval, TO_DATE('2018/10/20 07:45:14', 'YYYY/MM/DD HH:MI:SS'), TO_DATE('2018/10/20 14:30:14', 'YYYY/MM/DD HH:MI:SS'), '팀장만', 'test1');
insert into KRschedule values(KRschedule_seq.nextval, TO_DATE('2018/10/13 10:35:14', 'YYYY/MM/DD HH:MI:SS'), TO_DATE('2018/10/13 15:30:14', 'YYYY/MM/DD HH:MI:SS'), '1번홀 필요인원', 'test2');
insert into KRschedule values(KRschedule_seq.nextval, TO_DATE('2018/10/14 11:00:14', 'YYYY/MM/DD HH:MI:SS'), TO_DATE('2018/10/14 17:30:14', 'YYYY/MM/DD HH:MI:SS'), '스케줄 확인하세요', 'test2');
insert into KRschedule values(KRschedule_seq.nextval, TO_DATE('2018/10/18 12:55:14', 'YYYY/MM/DD HH:MI:SS'), TO_DATE('2018/10/18 18:30:14', 'YYYY/MM/DD HH:MI:SS'), '스케줄 입니다', 'test2');
insert into KRschedule values(KRschedule_seq.nextval, TO_DATE('2018/10/20 09:10:14', 'YYYY/MM/DD HH:MI:SS'), TO_DATE('2018/10/20 19:30:14', 'YYYY/MM/DD HH:MI:SS'), '20일 스케줄', 'test2');
insert into KRschedule values(KRschedule_seq.nextval, TO_DATE('2018/10/13 10:30:14', 'YYYY/MM/DD HH:MI:SS'), TO_DATE('2018/10/13 14:10:14', 'YYYY/MM/DD HH:MI:SS'), '13일 기타한명', 'test3');
insert into KRschedule values(KRschedule_seq.nextval,  TO_DATE('2018/10/14 08:30:14', 'YYYY/MM/DD HH:MI:SS'), TO_DATE('2018/10/14 22:30:14, 'YYYY/MM/DD HH:MI:SS''), '14일 팀장, 스캔, 예도', 'test3');
insert into KRschedule values(KRschedule_seq.nextval,  TO_DATE('2018/10/18 11:30:14', 'YYYY/MM/DD HH:MI:SS'), TO_DATE('2018/10/18 21:30:14', 'YYYY/MM/DD HH:MI:SS'), '18일 경호2명', 'test3');
insert into KRschedule values(KRschedule_seq.nextval,  TO_DATE('2018/10/20 10:00:14', 'YYYY/MM/DD HH:MI:SS'), TO_DATE('2018/10/20 18:30:14', 'YYYY/MM/DD HH:MI:SS'), '20일 안내, 기타', 'test3');



insert into KRschjob values(KRschjob_seq.nextval, 1, 1, 1, '');
insert into KRschjob values(KRschjob_seq.nextval, 1, 2, 1, '');
insert into KRschjob values(KRschjob_seq.nextval, 1, 3, 1, '');
insert into KRschjob values(KRschjob_seq.nextval, 1, 5, 1, '');
insert into KRschjob values(KRschjob_seq.nextval, 5, 2, 1, '');
insert into KRschjob values(KRschjob_seq.nextval, 5, 3, 1, '');
insert into KRschjob values(KRschjob_seq.nextval, 5, 4, 1, '');
insert into KRschjob values(KRschjob_seq.nextval, 5, 5, 1, '');
insert into KRschjob values(KRschjob_seq.nextval, 9, 1, 1, '');
insert into KRschjob values(KRschjob_seq.nextval,  2, 2, 1, '');
insert into KRschjob values(KRschjob_seq.nextval,  2, 3, 1, '');
insert into KRschjob values(KRschjob_seq.nextval,  2, 4, 1, '');
insert into KRschjob values(KRschjob_seq.nextval,  2, 5, 1, '');
insert into KRschjob values(KRschjob_seq.nextval,  6, 2, 1, '');
insert into KRschjob values(KRschjob_seq.nextval,  6, 3, 1, '');
insert into KRschjob values(KRschjob_seq.nextval, 10, 1, 1, '');
insert into KRschjob values(KRschjob_seq.nextval, 10, 2, 1, '');
insert into KRschjob values(KRschjob_seq.nextval, 10, 3, 1, '');                           
insert into KRschjob values(KRschjob_seq.nextval,  3, 4, 1, '');
insert into KRschjob values(KRschjob_seq.nextval,  3, 5, 1, '');
insert into KRschjob values(KRschjob_seq.nextval,  3, 1, 1, '');
insert into KRschjob values(KRschjob_seq.nextval,  7, 4, 1, '');
insert into KRschjob values(KRschjob_seq.nextval,  11, 5, 1, '');
insert into KRschjob values(KRschjob_seq.nextval,  11, 5, 1, '');
insert into KRschjob values(KRschjob_seq.nextval,  4, 5, 1, '');
insert into KRschjob values(KRschjob_seq.nextval,  8, 1, 1, '');
insert into KRschjob values(KRschjob_seq.nextval,  8, 4, 1, '');
insert into KRschjob values(KRschjob_seq.nextval,  12, 4, 1, '');
insert into KRschjob values(KRschjob_seq.nextval,  12, 6, 1, '');




