   

   function calendar(tYear,tMonth){ //달력 함수  
       var nowDate = new Date();               //오늘 날짜 객체 선언  
       var nYear = nowDate.getFullYear();      //오늘의 년도  
       var nMonth = nowDate.getMonth() ;       //오늘의 월 ※ 0월부터 시작  
       var nDate = nowDate.getDate();           //오늘의 날  
       var nNumday = nowDate.getDay();         //오늘의 요일 0=일요일...6=토요일  
       var endDay=new Array(31,28,31,30,31,30,31,31,30,31,30,31);      //각달의 마지막 날짜  
       var dayName=new Array("일", "월", "화", "수", "목", "금", "토"); // 숫자 요일을 문자 요일 바꿀 함수  
       var col=0;  //나중에 앞뒤 빈 날짜칸 계산   
       if (tYear==null) {
          tYear=nYear;
       } 
       if (tMonth==null){
          tMonth=nMonth;
       }
        eDate= new Date();       // 변경된 날짜 객체 선언  
        eDate.setFullYear(tYear);// 변경된 년도 세팅  
        year = eDate.getFullYear();
        eDate.setMonth(tMonth);  // 변경된 월 세팅  
        month = eDate.getMonth()+1;
        eDate.setDate(1);        // 날짜는 1일로 설정해서  
        var fNumday=eDate.getDay();    // 첫번째 날짜 1일의 숫자 요일  
        lastDay=endDay[eDate.getMonth()]; //변경된 월의 마지막 날짜  
  
        if ((eDate.getMonth()==1)&&(((eDate.getYear()%4==0)&&(eDate.getYear() %100 !=0))||eDate.getYear() % 400 ==0 ))  
            {lastDay=29;} // 0월 부터 시작하므로 1는 2월임. 윤달 계산 4년마다 29일 , 100년는 28일, 400년 째는 29일  
  
        calendarStr  = "<TABLE>"  
        calendarStr +="<TR align=center><TH valign=middle>"  
        calendarStr +="<a href=javascript:calendar("+tYear+","+(tMonth-1)+") class=preNext>◀</a>" //월을 넘길때 빼기 -1을 해서 넘긴다(년도는 자동 계산됨)  
        calendarStr +="</TH><TH colspan=5 >"  
        calendarStr +="<font size=3 color=black>  <b>"+eDate.getFullYear()+"년 "+(eDate.getMonth()+1)+"월</b></font> "// 해당하는 년도와 월 표시  
        calendarStr +="</TH><TH valign=middle>"  
        calendarStr +="<a href=javascript:calendar("+tYear+","+(tMonth+1)+") class=preNext>▶</a>" //월을 넘길때 더하기 +1을 해서 넘긴다(년도는 자동 계산됨)  
        calendarStr +="</TH></TR><TR>"  
        for (i=0;i<dayName.length;i++){            
            calendarStr +="<TH class=week>"+dayName[i] + "</TH>" // 숫자 요일을 날짜 요일로 입력  
        }  
  
        calendarStr +="</TR><TR align=center>"  
  
        for (i=0;i<fNumday;i++){          // 첫번째 날짜의 숫자 요일을 구해서 그전까지는 빈칸 처리  
            calendarStr +="<TD>&nbsp;</TD>"   
            col++;                               }  
  
        for ( i=1; i<=lastDay; i++){       // 해당 월의 달력   
            if(eDate.getFullYear()==nYear&&eDate.getMonth()==nMonth&&i==nDate){//오늘이면 today 스타일로 표시  
                calendarStr +="<TD class=today id='"+i+ "' onmouseover=onMouse(this) onmouseout=outMouse(this,'today') onClick=datePicker("+tYear+","+tMonth+","+i+",'"+dayName[col]+"')>"+i+"</TD>"   // onclick부분 스케줄 핸들러로 넘기게 수정행
            }else{  
  
                if(col==0){              //일요일이면  
                    calendarStr +="<TD class=sunday id='"+i+ "' onmouseover=onMouse(this) onmouseout=outMouse(this,'notToday') onClick=datePicker("+tYear+","+tMonth+","+i+",'"+dayName[col]+"')>"+i+"</TD>"  
                }else if(1<=col&&col<=5){//그외 평범한 날이면  
                    calendarStr +="<TD class=workday id='"+i+ "' onmouseover=onMouse(this) onmouseout=outMouse(this,'notToday') onClick=datePicker("+tYear+","+tMonth+","+i+",'"+dayName[col]+"')>"+i+"</TD>"   
                }else if(col==6){        //토요일이면  
                    calendarStr +="<TD class=satday id='"+i+ "' onmouseover=onMouse(this) onmouseout=outMouse(this,'notToday') onClick=datePicker("+tYear+","+tMonth+","+i+",'"+dayName[col]+"')>"+i+"</TD>"   
                }  
  
            }             
            col++;  
  
            if(col==7){     //7칸을 만들면 줄 바꾸어 새 줄을 만들고 다시 첫 칸부터 시작  
                calendarStr +="</TR><TR align=center>"  
            col=0;  
            }  
        }     
  
        for (i=col;i<dayName.length;i++){        //마지막 날에서 남은 요일의 빈 칸 만들기  
            calendarStr +="<TD>&nbsp;</TD>"  
        }  
  
  
        calendarStr +="</TR></TABLE>"  
        document.getElementById('calcal').innerHTML = calendarStr  
   }  
   
    function onMouse(td){  
        td.style.backgroundColor = "#dfdfdf";  
        td.style.color="#000099"  
        td.style.fontWeight="bold";  
        td.style.cursor="hand";  
    }  
    function outMouse(td,today){  
        if(today=="today"){  
            td.style.backgroundColor = "#cc0033";  
            td.style.color="#ffffff"  
            td.style.fontWeight="bold";  
        }else{  
            td.style.backgroundColor = "#ffffff";  
            td.style.fontWeight="normal";  
        }  
    }  
    
    function getSchedule(){
       $.ajaxSetup({cache:false}); 
       $.ajax({
          method : "POST",
          url : "ajaxCalander.do",
          cache : false,
          async : false,
          data : {
             year : year,
             month : month,
             memId : memId,
             memType : memType
          },
          datatype : "json",
          success : function(data){   //TODO : 30으로 되어있는거 enddate로 바꿔야함.
             var list = $.parseJSON(data);
             sessionStorage.setItem("jobpId", list[0].jobpId);
             for (var i=1; i<=30; i++){
                $("#"+i).text(i);
             }
             
             for (var i=0; i<list.length; i++){
                var date = new Date(list[i].schstartTime)
                var day = date.getDate()
                $("#"+day).text("스케줄있음");
             }
          }, error:function(request,status,error){
              $("#rst").text("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
          }
       })
 
    }


    function datePicker(year, month, date, day){
       var len = $("#"+date).eq(0).text().length
       if (len<3){
          if(memType==2){
             var now = new Date()-86400000;//오늘 날자에서 하루 뺀 날자로 설정.
             var pick =  (month+1) + "/" + date + "/"+ year;
             var pickday = new Date(pick);
             
             if(pickday > now){
                location.href="schCalander.do?year="+year+"&month="+month+"&date="+date+"&day="+day
             } else {
                alert("이미 지난 날자입니다.");
             }
          } else {
             alert("스케줄은 구인자회원만이 만들 수 있습니다.")
          }
       } else {
          location.href="schView.do?year="+year+"&month="+month+"&date="+date+"&day="+day+"&memId="+memId
       }
    }
    