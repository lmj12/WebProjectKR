var elem = document.getElementById('sta') ;
	
	var points = null; 
	
	    if (elem.value){  
	    points.push(elem.value);   
	    } 
	
	var id= document.getElementById('val');
	id.setAttribute("value", points);
	
