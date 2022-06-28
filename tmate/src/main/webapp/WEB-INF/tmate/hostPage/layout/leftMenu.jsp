<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hostPage.css" type="text/css">
	
  <div class="left-body">
 	 <div class="header-name p-3 mb-4">
		<i class="bi bi-person-workspace"></i> HOST
		 <div class="left-name menu-font">
		<h6>Management</h6>
		</div>
	</div>
   
	 <div class="left-accordion-body mb-3">
  		<div class="btn align-items-center collapsed btn-set menu-font"  onclick="location.href='${pageContext.request.contextPath}/hostPage/home';">
          <i class="bi bi-house-door"></i> HOME
    	</div>
    </div>
    <ul class="list-unstyled ps-0">
      <li class="mb-1 icon-set1 pb-3"> <span> <i class="bi bi-hospital"></i></span>
        <button class="btn btn-toggle align-items-center rounded collapsed btn-set menu-font" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
        	<i class="bi bi-journal-check"></i> 예약관리 <i class="bi bi-chevron-down"></i>
        </button>
        <div class="collapse" id="home-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-3 small left-accordion-body ">
            <li><a href="${pageContext.request.contextPath}/hostPage/bookingList/list" class="link-dark rounded menu-font">예약현황</a></li>
            <li><a href="${pageContext.request.contextPath}/hostPage/roomCal/list" class="link-dark rounded menu-font" style="border-bottom: 1px solid #fff;">객실별예약현황</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1 icon-set3">
        <button class="btn btn-toggle align-items-center rounded collapsed btn-set menu-font" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
          	<i class="bi bi-building "></i> 숙소등록 및 관리 <i class="bi bi-chevron-down"></i>
        </button>
        <div class="collapse " id="dashboard-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small left-accordion-body">
          	<li><a href="${pageContext.request.contextPath}/host/info" class="link-dark rounded menu-font">나의정보</a></li>
          	<c:choose>
          		<c:when test="${sessionScope.hasLodging eq null}">
          			<li><a href="${pageContext.request.contextPath}/host/lodging/add" class="link-dark rounded menu-font">숙소등록</a></li>
          		</c:when>
          		<c:otherwise>
          			<li><a href="${pageContext.request.contextPath}/host/lodging/info" class="link-dark rounded menu-font">숙소정보및수정</a></li>
          		</c:otherwise>
          	</c:choose>
            <li><a href="${pageContext.request.contextPath}/hostPage/rooms" class="link-dark rounded menu-font" style="border-bottom: 1px solid #fff;">객실관리</a></li>
          </ul>
        </div>
      </li> 
    </ul>
     <div class="left-accordion-body  mb-3">
  		<button class="btn align-items-center collapsed btn-set menu-font" onclick="location.href='${pageContext.request.contextPath}/hostPage/paymentList/list';">
          <i class="bi bi-coin"></i> 결제내역
    	 </button>
  	</div>
    <div class="left-accordion-body mb-3">
  	<button class="btn align-items-center collapsed btn-set menu-font" onclick="location.href='${pageContext.request.contextPath}/hostPage/reviewList/list';" >
         <i class="bi bi-chat-square-text"></i> 리뷰관리
     </button>
  </div>
 
   <ul class="list-unstyled ps-0">
   	 <li class="mb-1 icon-set3">
        <button class="btn btn-toggle align-items-center rounded collapsed btn-set menu-font" data-bs-toggle="collapse" data-bs-target="#stats-collapse" aria-expanded="false">
          	<i class="bi bi-bar-chart-line-fill"></i> 통계 <i class="bi bi-chevron-down"></i>
        </button>
        <div class="collapse " id="stats-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small left-accordion-body">
            <li><a href="${pageContext.request.contextPath}/hostPage/monthStats/main" class="link-dark rounded menu-font">월별 상세현황 </a></li>
            <li><a href="${pageContext.request.contextPath}/hostPage/yearStats/main" class="link-dark rounded menu-font" style="border-bottom: 1px solid #fff;">연도별 상세현황</a></li>
          </ul>
        </div>
      </li> 
   </ul>
 
  </div>
