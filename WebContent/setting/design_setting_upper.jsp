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
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>

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
		$(document).find('img').prop('class', 'img-fluid rounded');
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
	    color: #d2dae2;
	}
/* 	table {
		table-layout: fixed;
		margin: 10px 10px 10px 10px;
	} */
	th, td {
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	.container table,
	thead {
		border-radius: 0px 0px 15px 0px;
		background-color: #ffffff;
	}
	table td {
		color: #3d3d3d;
	}
	table th {
		color: #3d3d3d;
		text-align: center;
	}
	.card {
		background-color: #333;
	}
	.card-header {
		background-color: #333;
		color: #d2dae2;
	}
	.card-body {
		background-color: #333;
	}
	li a .nav-style {
		color: white;
	}
		.navbar-light .navbar-nav .nav-link {
    	color: #dcdde1;
	}
	.navbar-light .navbar-nav .nav-link:focus, .navbar-light .navbar-nav .nav-link:hover {
  		color: #f5f6fa;
	}
	.navbar-light .navbar-brand {
  		color: #f5f6fa;
	}
	.dropdown-menu.show {
		background-color: #333;
		color: white;
	}
	.dropdown-menu.show li:hover {
		color: #333
	}
	.navbar-expand-sm .navbar-nav .dropdown-menu {
		color: white;
	}
	.dropdown-menu {
		background-color: #333;
		
	}
</style>
<style media="screen">
 body { background-color:#4b4b4b; font-family:'Roboto'; color:white;}
 h1 { margin-bottom:50px;}
   .text-center{
     text-align: center;
     font-weight: bold;
   }
   .navbar-expand-sm .navbar-nav .dropdown-menu {
   	color: white;
   }
   #message{
     display: none;
   }
 </style>
</head>

<%@ include file="navbar.jsp" %>