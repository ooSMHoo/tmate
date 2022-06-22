<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css" type="text/css">
<script type="text/javascript">


</script>

<div class="reservationList-box">
<h3 style="font-size:22px; font-weight: bold; color: #044b85;">예약내역</h3>
	<ul class="nav nav-tabs nav-tabs-rev" id="myTab" role="tablist">
		  <li class="nav-item rev-nav " role="presentation">
		    <button class="nav-link rev-nav active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" 
		    	type="button" role="tab" aria-controls="pills-home" aria-selected="true" >
		       	투숙 예정 예약</button>
	  </li>
	   
	  <li class="nav-item" role="presentation">
	    <button class="nav-link rev-nav" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" 
	    	type="button" role="tab" aria-controls="pills-profile" aria-selected="false">
	    	투숙 완료 예약</button>
	  </li>
	   
	  <li class="nav-item" role="presentation">
	    <button class="nav-link rev-nav" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" 
	    	type="button" role="tab" aria-controls="pills-contact" aria-selected="false">
	     	취소된 예약</button>
	  </li> 
	</ul>

<form name="reservation_info">

    <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
			<c:forEach var="dto" items="${list}" varStatus="status">
				<c:if test="${dto.resCode==0}">
					<div class="card like-card-rev" style="width: 18rem;">
						<img src="${pageContext.request.contextPath}/resources/images/back.png" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">${dto.lodgName}</h5>
							<p>${dto.resCin_date}월 - ${dto.resCout_date}월</p>
							<hr>
							<button type="button" class="btn-rev"  onclick="location.href='${pageContext.request.contextPath}/mypage/main/reservationInfo?resNum=${dto.resNum}'">상세보기</button>
						</div>
					</div>
				</c:if>
			</c:forEach>
<div class="page-box" style="clear:both">
${dto.dataCount == 0 ? "포인트 내역이 없습니다." : paging}
</div>	 
		</div>

  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
			<c:forEach var="dto" items="${list}" varStatus="status">
				<c:if test="${dto.resCode==1}">
					<div class="card like-card-rev" style="width: 18rem;">
						<img src="${pageContext.request.contextPath}/resources/images/back.png" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">${dto.lodgName}</h5>
							<p>${dto.resCin_date}월 - ${dto.resCout_date}월</p>
							<hr>
							<button type="button" class="btn-rev" onclick="location.href='${pageContext.request.contextPath}/mypage/reservationInfo';">상세보기</button>
						</div>
					</div>
				</c:if>
			</c:forEach>
<div class="page-box" style="clear:both">
${dto.dataCount == 0 ? "포인트 내역이 없습니다." : paging}
</div>
		</div>
		
  <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
			<c:forEach var="dto" items="${list}" varStatus="status">
				<c:if test="${dto.resCode==2}">
					<div class="card like-card-rev" style="width: 18rem;">
						<img src="${pageContext.request.contextPath}/resources/images/back.png" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">${dto.lodgName}</h5>
							<p>${dto.resCin_date}월 - ${dto.resCout_date}월</p>
							<hr>
							<button type="button" class="btn-rev" onclick="info();">상세보기</button>
						</div>
					</div>
				</c:if>
			</c:forEach>

		</div>
 </form> 	
 

</div>
