<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
  <title>KR_WebProject</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
	.navbar {
	  margin-bottom: 50px;
	  border-radius: 0;
	}
	
	/* Remove the jumbotron's default bottom margin */ 
	 .jumbotron {
	  margin-bottom: 0; 
	}
	
	/* Add a gray background color and some padding to the footer */
	footer {
	  background-color: #f2f2f2;
	  padding: 25px;
	}
	body {
	position: relative; 
	}
	.affix {
	    top:0;
	    width: 100%;
	    z-index: 9999 !important;
	}
	.affix ~ .container-fluid {
	   position: relative;
	   top: 50px;
	}
  </style>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">

<%@ include file="jumbotron.jsp" %>

<%@ include file="navbar.jsp" %>
<!-- container 내용 가변위치 -->
<%@ include file="recruit/recList.jsp" %>
 
<%@ include file="footer.jsp" %>

</body>
</html>
