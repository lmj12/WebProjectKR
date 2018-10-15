<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>KR_WebProject</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
	integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
	crossorigin="anonymous"></script>

<script type="text/javascript">
//<!--
	$(function() {
		var toggleAffix = function(affixElement, scrollElement,
				wrapper) {
			var height = affixElement.outerHeight(), top = wrapper
					.offset().top;
			if (scrollElement.scrollTop() >= top) {
				wrapper.height(height);
				affixElement.addClass("affix");
			} else {
				affixElement.removeClass("affix");
				wrapper.height('auto');
			}
		};

		$('[data-toggle="affix"]').each(function() {
			var ele = $(this), wrapper = $('<div></div>');
			ele.before(wrapper);
			$(window).on('scroll resize', function() {
				toggleAffix(ele, $(this), wrapper);
			});
			// init
			toggleAffix(ele, $(window), wrapper);
		});
		
		$(document).find('table').prop('class', 'table table-bordered table-secondary');
		$(document).find('thead').prop('class', 'thead-inverse text-center');
		$(document).find('th').prop('class', 'text-center');
	});
//-->
</script>
<style>
	header {
	    height: 110px;
	    background: #333;
	    color: white;
	}
	
	#main {
	    padding-top:70px;
	}
	
	.navbar {
	  border-radius: 0;
	  transition: all 0.3s ease-out;
	}
	
	.affix {
	  position: fixed;
	  top: 0;
	  right: 0;
	  left: 0;
	  z-index: 1030;
	}
	
	/* fixed to top styles */
	.affix.navbar {
	  background-color: #333;
	}
	.affix.navbar .nav-item>a, 
	.affix.navbar .navbar-brand {
	    color: #fff;
	}
</style>
<style media="screen">
 body { background-color:#fafafa; font-family:'Roboto';}
 h1 { margin-bottom:50px;}
   .text-center{
     text-align: center;
     font-weight: bold;
   }
   #message{
     display: none;
   }
 </style>
</head>

<%@ include file="navbar.jsp" %>