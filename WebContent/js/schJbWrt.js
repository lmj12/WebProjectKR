
	
   function makeTable(){
      var tabstr = "";
      // FIXME rowspan2칸씩 적용됨.
      tabstr ="<table border='1' id='tb"+cnt+"'><tbody id='tbd"+cnt+"'><tr><th id='th"+cnt+"' rowspan='14'>식장</th><th>업무</th><th>지원자</th></tr><input type='hidden' value=6 id='rcnt"+cnt+"'>"
      for (var i=1; i<6; i++){
            tabstr += "<tr id='tr"+cnt+i+"'><td><select id='r"+cnt+i+"'><option value='1'>팀장</option><option value='2'>스캔</option><option value='3'>"
            + "예도</option><option value='4'>안내</option><option value='5'>경호</option></select></td><td><input type='text'readonly></td><tr>"
      }
      tabstr += "</tbody><tr><th colspan='4'><input type='button' value='필요인원추가' onclick='makeRow("+cnt+")'><input type='button' value='인원삭제' onclick='delRow("+cnt+")'></th></tr></table>"
      $("#s").append(tabstr);
      cnt++; 
   }
   
   function makeRow(tcnt){
      var rcnt = $("#rcnt"+tcnt).val();
      $("#tbd"+tcnt).append("<tr id='tr"+tcnt+rcnt+"'><td><select id='r"+tcnt+rcnt+"'><option value='1'>팀장</option><option value='2'>스캔</option><option value='3'>"
      + "예도</option><option value='4'>안내</option><option value='5'>경호</option></select></td><td><input type='text'readonly></td><tr>")
      rcnt++;
      $("#th"+tcnt).attr("rowspan",rcnt*2);
      $("#rcnt"+tcnt).val(eval(rcnt));
   }
   
   function delRow(tcnt){
	   var rcnt = $("#rcnt"+tcnt).val();
	   rcnt--;
       $('#tr'+tcnt+rcnt).remove();
       $("#th"+tcnt).attr("rowspan",rcnt*2);
       $("#rcnt"+tcnt).val(eval(rcnt));
   }
   
   
   function schJbWrt(){
	  var schmap = new Map(); // 전체 홀을 담을 맵객체
	  schmap.put("schId",schId);
	  
      for(var i=1; i<cnt; i++){
         var rcnt = $("#rcnt"+ i).val();
         var schjb = new Array(); // 한개 홀의 직업내용을 담을 배열
         for(var j=1; j<rcnt; j++){
        	 schjb[j-1] = $("#r"+i+j+" option:selected").val();
         }
         schmap.put(i, schjb);

      }
      var json = schmap.jsonString();
      var form = document.createElement("form");
      form.setAttribute("method", "post");
      form.setAttribute("action", "schJbWrt.do");
      var hiddenField = document.createElement("input");
      hiddenField.setAttribute("type", "hidden");
      hiddenField.setAttribute("name", "json");
      hiddenField.setAttribute("value", json);
      
      form.appendChild(hiddenField);
      document.body.appendChild(form);
      form.submit();

   }