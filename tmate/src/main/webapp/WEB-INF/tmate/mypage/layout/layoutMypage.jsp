<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><tiles:insertAttribute name="title"/></title>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">
	
		
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/icon/bootstrap-icons.css" type="text/css">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/icofont/icofont.min.css" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.ui.datepicker-ko.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util-jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/menu.js"></script>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css" type="text/css">	
</head>

<body>
		<div id="header" >
			<tiles:insertAttribute name="header" />
		</div>
		
	<div id="container-mypage" style="width: 1300px;">
		<div id="sidebar-left">
			<tiles:insertAttribute name="sidebar" />
		</div>
		<div id="content">
			<tiles:insertAttribute name="body" />
		</div>
	</div>
	
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>

</body>
</html>