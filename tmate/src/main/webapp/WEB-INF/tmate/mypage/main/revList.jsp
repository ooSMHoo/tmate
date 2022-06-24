<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css" type="text/css">

<c:forEach var="dto" items="${list}" varStatus="status">

		<div class="card like-card-rev" style="width: 18rem;" id="${resCode}">
			<img src="${pageContext.request.contextPath}/resources/images/back.png" class="card-img-top" alt="...">
			<div class="card-body" id="${resCode}">
				<h5 class="card-title">${dto.lodgName}</h5>
				<p>${dto.resCin_date}월 - ${dto.resCout_date} 월</p>
				<hr>
				<button type="button" class="btn-rev"  onclick="location.href='${pageContext.request.contextPath}/mypage/main/reservationInfo?resNum=${dto.resNum}'">상세보기</button>	
			</div>
		</div>

</c:forEach>



<div class="page-box" style="clear:both">
	${dto.dataCount == 0 ? "포인트 내역이 없습니다." : paging}
</div>	 