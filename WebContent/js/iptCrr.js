$(function(){
	//////////////////////////////// debug ////////////////////////////////
//	$('*').on(
//		'click',
//		function(event){
//			alert( $(this).val() );
//			return false;
//		}
//	);
//	$('*').on(
//		'click',
//		function(event){
//			alert( $(this).prop('tagName') );
//			return false;
//		}
//	);
	// debug .from / .to / .fromTo 찾기
//	$('.from').on(
//		'change',
//		function(event){
//			alert( 'this의 tagName : ' + $(this).prop('tagName') );
//			alert( 'this의 value : ' + $(this).val() );
//			alert( $(this).parent('td').prop('tagName') );	// TD
//			alert( $(this).parent('td').siblings().prop('tagName') );	// INPUT
//			alert( $(this).parent('td').siblings().find('.fromTo').val() );	// 1개월
//			alert( $(this).parent('td').find('.from').val() );	// undefined
//			alert( $(this).parent('td').siblings().find('.to').val() );	// .to value
//			alert( $(this).parent('td').siblings('td').find('fromTo').val() );
//			return false;
//		}
//	);
	// debug iptId 찾기 
//	$('#iptCrr_tbody').on(
//		'click',
//		'.delCrr',
//		function(event){
//			alert( $(this).parent().siblings().eq(0).val() );
//		}
//	);
//////////////////////////////////////////////////////////////////////////////
	
	// 부트스트랩
	$('table').addClass(
		'table table-bordered'
	);
	
	// Date Picker
	$(document).find('.from, .to').removeClass('hasDatepicker').datepicker();	

	var dateFormat = 
		"mm/dd/yy",
		from = $( ".from" ).datepicker({
				language : "kr",
				defaultDate: "+1w",
				changeMonth: true,
			}),
		to = $( ".to" ).datepicker({
				language : "kr",
				defaultDate: "+1w",
				changeMonth: true,
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
	
	// 기간 산출 및 출력
	$(document).on(
		'change',
		'.from',
		function(event){
			var stDate = new Date( $(this).val() );
		    var edDate = new Date( $(this).parent('td').siblings('td').find('.to').val() );
		    var btMs = edDate.getTime() - stDate.getTime() ;
		    var btDay = btMs / (1000*60*60*24) ;
		    
		    if( $(this).parent('td').siblings().find('.fromTo').val() != NaN){
		    	if(btDay >= 30){
		    		btDay = btDay / 30;
		    		$(this).parent('td').siblings('td').find('.fromTo').val(parseInt(btDay) + ' 개월');
		    	} else {
		    		$(this).parent('td').siblings('td').find('.fromTo').val('1 개월');
		    	}
		    }
		}
	);
	$(document).on(
		'change',
		'.to',
		function(event){
			var stDate = new Date( $(this).parent('td').siblings('td').find('.from').val() );
		    var edDate = new Date( $(this).val() );
		    var btMs = edDate.getTime() - stDate.getTime() ;
		    var btDay = btMs / (1000*60*60*24) ;
		    
			if( $(this).parent('td').siblings().find('.fromTo').val() != NaN){
		    	if(btDay >= 30){
		    		btDay = btDay / 30;
		    		$(this).parent('td').siblings('td').find('.fromTo').val(parseInt(btDay) + ' 개월');
		    	} else {
		    		$(this).parent('td').siblings('td').find('.fromTo').val('1 개월');
		    	}
			}
		}
	);
	
	// 입력경력 행추가
	$('input:button[name="btn_add_tbody"]').on(
		'click',
		function(event){
			var iptNum = 0;	// iptcareer.xml 에 iptId를 겹치지 않게 하기 위함
			var cntNum = eval( $(document).find('input[name=cntNum]').last().val() )+ 1; 
			var rowItem = '<tr>';
			rowItem +=		'<input type="hidden" name="iptId" value="'+iptNum+'">';
			rowItem += 		'<td><input type="text" size="1" name="cntNum" value="' + cntNum + '" placeholder="번호" readonly /></td>';
			rowItem += 		'<td><input type="text" name="iptCompany" value="" placeholder="업체명"  /></td>';
			rowItem += 		'<td><input type="text" name="iptWh" value="" placeholder="근무지" /></td>';
			rowItem += 		'<td><input type="text" size="10" maxlength="10" class="from" name="iptStart" value=""></td>';
			rowItem += 		'<td><input type="text" size="10" maxlength="10" class="to" name="iptEnd" value=""></td>';
			
			rowItem += 		'<td><select class="posId" name="posId" style="width:65px;">';
			rowItem +=			'<option value="1">팀장</option>';
			rowItem +=			'<option value="2">스캔</option>';
			rowItem +=			'<option value="3">예도</option>';
			rowItem +=			'<option value="4">안내</option>';
			rowItem +=			'<option value="5">경호</option>';
			rowItem +=			'<option value="6">기타</option>';
			rowItem +=		'</select></td>';
			
			rowItem += 		'<td><input type="text" name="iptPeriod" class="fromTo" value="" readonly placeholder="기간" /></td>';
			rowItem += 		'<td>';
			rowItem += 			'<button type="button" class="delCrr btn btn-danger"> <i class="fa fa-minus"></i></button>';
			rowItem += 		'</td>';
			rowItem += '<tr>';
			$('#iptCrr_tbody').append(rowItem);
			
			$(document).find('.from, .to').removeClass('hasDatepicker').datepicker();
			
		}
	);
	
	// 입력경력 행삭제
	$('#iptCrr_tbody').on(
		'click',
		'.delCrr',
		function(event){
			$.ajax({
				type : 'POST',
				url : 'iptCrrDel.do',
				data : {
					iptId : $(this).parent().siblings().eq(0).val()
				},
				success : function(){
					alert( '삭제성공' );
					$(this).closest('tr').remove();
					location.reload();
					alert('page가 새로고침 되었습니다.');
				},
				error : function(request,status,error){
				    alert( "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
	);
	
	// 저장버튼 눌러서 INSERT, UPDATE 동시에 진행
	$('input:button[name=btn_submit_tbody]').on(
		'click',
		function(){
			$('#iptCrr_tbody tr').each(function () {
				var cellItem = $(this).find(":input");
				var itemObj = new Object();
				
				var stDate = new Date( cellItem.eq(4).val() );
			    var edDate = new Date( cellItem.eq(5).val() );
			    var btMs = edDate.getTime() - stDate.getTime() ;
			    var btDay = btMs / (1000*60*60*24) ;
		    	if(btDay >= 30){
		    		btDay = parseInt(btDay / 30)+' 개월';
		    	} else {
		    		btDay = '1 개월';
		    	}
		    	
				itemObj.iptId = cellItem.eq(0).val();	// 번호
				itemObj.iptCompany = cellItem.eq(2).val();	// 업체명
				itemObj.iptWh = cellItem.eq(3).val();	// 근무지
				itemObj.iptStart = cellItem.eq(4).val();	// 시작일
				itemObj.iptEnd = cellItem.eq(5).val();	// 종료일
				itemObj.posId = cellItem.eq(6).val();	// 근무직무
				
				//				FIXME : 디버깅용
//				alert(itemObj.iptId);
//				alert(itemObj.iptCompany);
//				alert(itemObj.iptWh);
//				alert(itemObj.iptStart);
//				alert(itemObj.iptEnd);
//				alert(itemObj.posId);

				if( itemObj.iptId != undefined ){
					var realPeriod = btDay.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|" "]/g,"");
					var queryStr = {
						iptId : itemObj.iptId,
						iptCompany : itemObj.iptCompany,
						iptWh : itemObj.iptWh,
						iptStart : itemObj.iptStart,
						iptEnd : itemObj.iptEnd,
						posId : itemObj.posId,
						iptPeriod : realPeriod
					}
					
					$.ajax({
						type : 'POST',
						url : 'iptCrrWrt.do',
						data : queryStr,
						success : function(){
							alert( cellItem.eq(1).val() + '번이 삽입/수정 되었습니다' );
							location.reload();
						},
						error : function(request,status,error){
						    alert( "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				}
			})
		}     
	);
});