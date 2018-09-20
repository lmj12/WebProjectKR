<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<h2> 구직자 경력기입 </h2>

<html>
<head>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
         
    <script type="text/javascript">
        $(document).ready(function(){
            // 항목추가 버튼 클릭시
            $(".addBtn").click(function(){
                var clickedRow = $(this).parent().parent();
                var cls = clickedRow.attr("class");
 
                // tr 복사해서 마지막에 추가
                var newrow = clickedRow.clone();
                newrow.find("td:eq(0)").remove();
                newrow.insertAfter($("#example ."+cls+":last"));
 
                // rowspan 증가
                resizeRowspan(cls);
            });
             
             
            // 삭제버튼 클릭시
            $(".delBtn").live("click", function(){
                var clickedRow = $(this).parent().parent();
                var cls = clickedRow.attr("class");
                 
                // 각 항목의 첫번째 row를 삭제한 경우 다음 row에 td 하나를 추가해 준다.
                if( clickedRow.find("td:eq(0)").attr("rowspan") ){
                    if( clickedRow.next().hasClass(cls) ){
                        clickedRow.next().prepend(clickedRow.find("td:eq(0)"));
                    }
                }
 
                clickedRow.remove();
 
                resizeRowspan(cls);
            });
 
            // cls : rowspan 을 조정할 class ex) item1, item2, ...
            function resizeRowspan(cls){
                var rowspan = $("."+cls).length;
                $("."+cls+":first td:eq(0)").attr("rowspan", rowspan);
            }
        });
    </script>
</head>
 
<body>
<table id="example" border="1px">
        <tr>
            <th>업체 이름</th>
            <th>웨딩홀 이름</th>
            <th>시작 월</th>
            <th>종료 월</th>
            <th>일했던 포지션</th>
            <th>웨딩홀 추가</th>
        </tr>
        <tr class="item1">
            <td><input type="text" name="iptCompany" /><button class="addBtn">항목추가</button></td>
            <td><input type="text" name="iptWh" readonly/></td>
            <td><input type="month" name="iptStart"/></td>
            <td><input type="month" name="iptEnd"/></td>
            <td><input type="text" name="iptPos"/></td>
            <td><button class="delBtn">삭제</button></td>
        </tr>
        <tr class="item2">
            <td><input type="text" name="iptCompany" /><button class="addBtn">항목추가</button></td>
            <td><input type="text" name="iptWh" readonly/></td>
            <td><input type="month" name="iptStart"/></td>
            <td><input type="month" name="iptEnd"/></td>
            <td><input type="text" name="iptPos"/></td>
            <td><button class="delBtn">삭제</button></td>
        </tr>
         <tr class="item3">
            <td><input type="text" name="iptCompany" /><button class="addBtn">항목추가</button></td>
            <td><input type="text" name="iptWh" readonly/></td>
            <td><input type="month" name="iptStart"/></td>
            <td><input type="month" name="iptEnd"/></td>
            <td><input type="text" name="iptPos"/></td>
            <td><button class="delBtn">삭제</button></td>
        </tr>
         <tr class="item4">
            <td><input type="text" name="iptCompany" /><button class="addBtn">항목추가</button></td>
            <td><input type="text" name="iptWh" readonly/></td>
            <td><input type="month" name="iptStart"/></td>
            <td><input type="month" name="iptEnd"/></td>
            <td><input type="text" name="iptPos"/></td>
            <td><button class="delBtn">삭제</button></td>
        </tr>
</table>
</body>
</html>  


