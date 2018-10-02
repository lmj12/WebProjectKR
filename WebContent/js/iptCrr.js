
$(function(){
	// Date Picker
	var dateFormat = 
		"mm/dd/yy",
		from = $( "#from" ).datepicker({
				language : "kr",
				defaultDate: "+1w",
				changeMonth: true,
			}).on( "change", function() {
				to.datepicker( "option", "minDate", getDate( this ) );
			}),
		to = $( "#to" ).datepicker({
				language : "kr",
				defaultDate: "+1w",
				changeMonth: true,
			}).on( "change", function() {
				from.datepicker( "option", "maxDate", getDate( this ) );
			});
	
	function getDate( element ) {
		var date;
		try {
			date = $.datepicker.parseDate( dateFormat, element.value );
		} catch( error ) {
			date = null;
		}
		return date;
	}
	
	// 부트스트랩
	$('table').addClass(
		'table table-bordered'
	);
	
	// 기간 구하기
	$('#from, #to').on(
		'change',
		function(event){
			alert("변경");
			var stDate = new Date($('#from').val());
		    var endDate = new Date($('#to').val());
		    alert(stDate);
		    alert(endDate);
		    var btMs = endDate.getTime() - stDate.getTime() ;
		    var btDay = btMs / (1000*60*60*24) ;
		    if($('#fromTo').val() != NaN){
		    	$('#fromTo').val(btDay);
		    }
		}
	);
	// 입력경력 행추가
	$('input:button[name="btn_add_tbody"]').on(
		'click',
		function(event){
			var rowItem = '<tr>';
			rowItem += 	'<td width="8px"><input type="text" name=iptId value="" placeholder="번호" /></td>';
			rowItem += 		'<td><input type="text" name="iptCompany" value="" placeholder="업체명"  /></td>';
			rowItem += 		'<td><input type="text" name="iptWh" value="" placeholder="근무지" /></td>';
			rowItem += 		'<td><input type="text" name="iptStart" id="from" value=""></td>';
			rowItem += 		'<td><input type="text" name="iptEnd" id="to" value=""></td>';
			
			rowItem += 		'<td><select class="form-control" name="posId" id="posId">';
			rowItem +=			'<option value="1">팀장</option>';
			rowItem +=			'<option value="2">스캔</option>';
			rowItem +=			'<option value="3">예도</option>';
			rowItem +=			'<option value="4">안내</option>';
			rowItem +=			'<option value="5">경호</option>';
			rowItem +=			'<option value="6">기타</option>';
			rowItem +=		'</select></td>';
			
			rowItem += 		'<td><input type="text" name="iptPeriod" id="fromTo" value="" readonly placeholder="기간" /></td>';
			rowItem += 		'<td>';
			rowItem += 			'<button type="button" class="btn btn-danger"> <i class="fa fa-minus"></i></button>';
			rowItem += 		'</td>';
			rowItem += '<tr>';
			$('#iptCrr_tbody').append(rowItem);
			
		}
	);
	// 입력경력 행삭제
	$('#iptCrr_tbody').on(
		'click',
		'button',
		function(event){
			$(this).closest('tr').remove();
		}
	);
});