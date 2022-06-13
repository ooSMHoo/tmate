<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css" type="text/css">


<div class="point-content">
	<h3 style="font-size:22px; font-weight: bold; color: #044b85;">포인트</h3>
	<div class="title">
	사용가능 포인트 : <i class="point-balance">포인트 잔액  P</i>
	</div>
	
	<hr>
	<ul class="list-group">

		  <li class="list-group-item">리얼 리뷰 작성
		  	 	<p class="list-group-point">+500</p>
		  	<div class="group">
		  	 	<p class="list-group-date">2022-06-01</p>
		  	</div>
		  </li>
		  
		  <li class="list-group-item">리얼 리뷰 작성
		  	 	<p class="list-group-point">+500</p>
		  	<div class="group">
		  	 	<p class="list-group-date">2022-06-01</p>
		  	</div>
		  </li>	  
	</ul>
</div>
