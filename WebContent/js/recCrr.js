	function viewDetail(jbskId){
		location.replace("recCrrDetail.do?recId="+recId+"&jbskId="+jbskId);
	}
	
	function staCng(status,recCrrId){	//에이잭스 통신용 다른 메소드에서 호출되는 메소드.
		$.ajax({
	    	method : "POST",
	    	url : "ajaxRecCrrCngSta.do",
	    	cache : false,
			async : false,
			data : {
				status : status,
				recCrrId : recCrrId
			},
			datatype : "text",
			success : function(data){
				if(data==1){
					alert("지원자를 확정했습니다.")
					location.reload();
				} else if(data==2){
					alert("확정에 실패했습니다. 다시 시도해주세요.")
				} else if(data==3){
					alert("지원자를 탈락시켰습니다.")
					location.reload();
				} else if (data==4){
					alert("탈락에 실패했습니다. 다시 시도했습니다.")
				} else if (data==5){
					alert("오류가 발생헀습니다 다시 시도해주세요.")
				}
			}, error:function(request,status,error){
				alert();
			}
		})
	}
	
	function staCngConfirm(cursta,recCrrId){
		event.stopPropagation();
		if(cursta==3){
			if(confirm("이미 탈락시킨 지원자입니다. 정말 확정하시겠습니까?")){
				staCng(2,recCrrId);
			};
		}else if(cursta==2){
			alert("이미 확정된 지원자입니다.")
		} else {
			staCng(2,recCrrId);
		}
	}
	
	function staCngDrop(cursta,recCrrId){
		event.stopPropagation();
		if(cursta==2){
			if(confirm("이미 확정시킨 지원자입니다. 정말 탈락시키시겠습니까?")){
				staCng(3,recCrrId);
			};
		}else if(cursta==3){
			alert("이미 탈락된 지원자입니다.")
		} else {
			staCng(3,recCrrId);
		}
	}