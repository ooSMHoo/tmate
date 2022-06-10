<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css" type="text/css">

<div class="reservationList-box">
<h3 style="font-size:22px; font-weight: bold; color: #044b85;">예약내역</h3>

	<ul class="nav nav-tabs nav-tabs-rev" id="myTab" role="tablist">
	  <li class="nav-item rev-nav" role="presentation">
	    <button class="nav-link nav-link-rev active" id="home-tab" data-bs-toggle="tab" 
	    data-bs-target="#home" type="button" role="tab" aria-controls="contact" aria-selected="true">
	       	투숙 예정 예약</button>
	  </li>
	   
	  <li class="nav-item" role="presentation">
	    <button class="nav-link rev-nav" id="profile-tab" data-bs-toggle="tab" 
	    data-bs-target="#profile" type="button" role="tab" aria-controls="contact" aria-selected="false">
	    	투숙 완료 예약</button>
	  </li>
	   
	  <li class="nav-item" role="presentation">
	    <button class="nav-link rev-nav" id="contact-tab" data-bs-toggle="tab"
	     data-bs-target="#messages" type="button" role="tab" aria-controls="contact" aria-selected="false">
	     	취소된 예약</button>
	  </li> 
	</ul>


<div class="tab-content" id="myTabContent">
    <div class="tab-pane active" id="home" role="tabpanel" aria-labelledby="home-tab">
  	    
   <div class="card like-card" style="width: 18rem;">
			<img
				src="${pageContext.request.contextPath}/resources/images/back.png"
				class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">크라운하버호텔 부산</h5>
				<p>06.06 월 - 06.06.월</p>
				<hr>
				<button class="btn-rev">상세보기</button>
				
			</div>
		</div>
		
  </div>
  <div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-tab">
		<div class="card like-card" style="width: 18rem;">
			<img
				src="${pageContext.request.contextPath}/resources/images/back.png"
				class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">2</h5>
				<p>06.06 월 - 06.06.월</p>
				<hr>
			</div>
		</div>
  </div>
  <div class="tab-pane" id="messages" role="tabpanel" aria-labelledby="messages-tab">
		<div class="card like-card" style="width: 18rem;">
			<img
				src="${pageContext.request.contextPath}/resources/images/back.png"
				class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">3</h5>
				<p>06.06 월 - 06.06.월</p>
				<hr>
			</div>
		</div>

  </div>
  
</div>
</div>
