<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css" type="text/css">

<div class="container-fluid container-info-rev">
	<h3 style="font-size:22px; font-weight: bold; color: #044b85; margin-bottom: 20px;">호텔이름</h3>
	
	<div class="container-fluid contaniner-info-box">
	 	<div class="container-info-rev">
	 		<p class="info-menu">체크인  </p>
	 		<p>${dto.resCin_date}</p>
	 	</div>
	 	<div class="container-info-rev">
	 		<p class="info-menu">체크아웃  </p>
	 		<p>${dto.resCout_date}</p>
	 	</div>
	 	<div class="container-info-rev">
	 		<p class="info-menu">예약번호 </p>
	 		<p>${dto.resNum}</p>
	 	</div>
	 	<div class="container-info-rev">
	 		<p class="info-menu">예약자이름</p>
	 		<p>${dto.resName}</p>
	 	</div>

	</div>
	
	<div class="container-fluid container-pirce">
	<hr style="clear:both; width: 300px;">
		<p style="font-weight: bold">결제정보</p>
		<p>총 결제 금액 : ${dto.resTotalCost} 원</p>
	</div>
	
</div>