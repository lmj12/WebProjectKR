$(function(){
	var admCnt = 0;
	$('.adm-radio-label').on(
		'click',
		function(){
			if(admCnt < 5){
				admCnt += 1;
			} else if(admCnt >= 5){
				$('input:radio[value=adm]')
				.removeAttr('disabled');
			}
		}
	);
});