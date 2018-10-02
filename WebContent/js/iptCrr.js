
$(function(){
	$('table').addClass(
		'table table-bordered'
	);
	
	
	// 입력경력 행추가
	$('input:button[name="btn_add_tbody"]').on(
		'click',
		function(event){
			var rowItem = '<tr>';
			rowItem += 	'<td> <input type="text" placeholder="번호" readonly /> </td>';
			rowItem += 		'<td> <input type="text" placeholder="업체명" /> </td>';
			rowItem += 		'<td> <input type="text" placeholder="근무지" /> </td>';
			rowItem += 		'<td> <input type="date" placeholder="시작일" /> </td>';
			rowItem += 		'<td> <input type="date" placeholder="종료일" /> </td>';
			rowItem += 		'<td> <input type="text" placeholder="근무직무" /> </td>';
			rowItem += 		'<td> <input type="text" placeholder="기간" readonly /> </td>';
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