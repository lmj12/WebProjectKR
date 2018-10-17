<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<script type="text/javascript">	//공용 펑션 error alert
//<!--
	function erroralert( msg ) {
		alert( msg );
		return false;
	} 
	
	function errorback( msg ) {
		alert( msg );
		history.back();
	} 
	

	function hBack(){
		history.go(-1);
	}
	
	Date.prototype.format = function(f) {
	    if (!this.valueOf()) return " ";
	 
	    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	    var d = this;
	     
	    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
	        switch ($1) {
	            case "yyyy": return d.getFullYear();
	            case "yy": return (d.getFullYear() % 1000).zf(2);
	            case "MM": return (d.getMonth() + 1).zf(2);
	            case "dd": return d.getDate().zf(2);
	            case "E": return weekName[d.getDay()];
	            case "HH": return d.getHours().zf(2);
	            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
	            case "mm": return d.getMinutes().zf(2);
	            case "ss": return d.getSeconds().zf(2);
	            case "a/p": return d.getHours() < 12 ? "am" : "pm";
	            default: return $1;
	        }
	    });
	};
	 
	String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
	String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
	Number.prototype.zf = function(len){return this.toString().zf(len);};

Map = function(){
		this.map = new Object();
	};   
Map.prototype = {   
   	put : function(key, value){   
       	this.map[key] = value;
	},
	putMap : function(key, value){
    		this.map[key] = value.map;
  		},
    putMapList : function(key, value){
     	var list = new Array();
     	for(var i=0;i<value.length;i++){
      		list.push(value[i].map);
    	}
    	 this.map[key] = list;
    },
    get : function(key){   
        return this.map[key];
    },
    containsKey : function(key){    
     	return key in this.map;
    },
    containsValue : function(value){    
     	for(var prop in this.map){
      		if(this.map[prop] == value) return true;
    	 }
     	return false;
    },
    isEmpty : function(key){    
     	return (this.size() == 0);
    },
    clear : function(){   
     	for(var prop in this.map){
      		delete this.map[prop];
     	}
    },
    remove : function(key){    
     	delete this.map[key];
    },
    keys : function(){
        var keys = new Array();
        for(var prop in this.map){
            keys.push(prop);
        }
        return keys;
    },
    values : function(){   
     	var values = new Array();   
        for(var prop in this.map){   
         values.push(this.map[prop]);
        }   
        return values;
    },
   	size : function() {
	    var count = 0;
	    for (var prop in this.map) {
	      count++;
    	}
   	 	return count;
  	},
    jsonString: function(){
     	return JSON.stringify(this.map);    
    	}
};

//-->
</script>

<!-- 세팅 경로 -->
<c:set var="setting" value="/KR_WebProject/setting/"/>

<%-- js 폴더 경로 --%>
<c:set var="js" value="/KR_WebProject/js/"/>
	<script src="${js}jquery-3.3.1.js"></script>
