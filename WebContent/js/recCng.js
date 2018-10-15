$(function(){
	$('.statusOpt').each(
		function(){
			if( $(this).val('모집중') ){
				alert('모집중')
			} else if( $(this).val('모집완료') ){
				alert('모집완료')
			} else if( $(this).val('완료') ){
				alert('완료')
			}
			
		}	
	);
	
	
});


function recCng(recId){
		var sta = $("#sta option:selected").val();
		
				$.ajax(
				{
					url : 'ajaxRecStaCng.do',
					type : "POST",
					data : 
						{
							recId :  recId ,
							cng : sta
						},			
					dataType : 'text',
					success : function(data){	
						if(data ==2){
							$('#stat').text("완료");
							alert("공고상태를 완료로 변경했습니다.")
							location.reload();
						} else if(data==1){
							$('#stat').text("모집완료");
							alert("공고상태를 모집완료로 변경했습니다.")
							location.reload();
						} else if (data == 0){
							$('#stat').text("모집중");	
							alert("공고상태를 모집중으로 변경했습니다.")
							location.reload();
						}else{
							alert("변경에 실패했습니다. 다시 시도해주세요.")
						}
						location.reload();
					},
					error : function(e){
						alert("모집상태가 수정되지 않았습니다");		
					}
				}		
			);		
		}