<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hostPage.css" type="text/css">
	
  <div class="left-body">
 	 <div class="header-name">
		<i class="bi bi-person-workspace"></i> 호스트
	</div>
    <div class="left-name">
	<h6>Management</h6>
	</div>
	 <div class="left-accordion-body mb-3">
  		<div class="btn align-items-center collapsed btn-set"  onclick="location.href='${pageContext.request.contextPath}/host/home';">
          HOME
    	</div>
    </div>
    <ul class="list-unstyled ps-0">
      <li class="mb-1 icon-set1 pb-3"> <span> <i class="bi bi-hospital"></i></span>
        <button class="btn btn-toggle align-items-center rounded collapsed btn-set" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
        	<i class="bi bi-journal-check"></i> 예약관리 <i class="bi bi-chevron-down"></i>
        </button>
        <div class="collapse" id="home-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-3 small left-accordion-body ">
            <li><a href="#" class="link-dark rounded">고객관리</a></li>
            <li><a href="#" class="link-dark rounded">타임라인</a></li>
            <li><a href="#" class="link-dark rounded" style="border-bottom: 1px solid #fff;">캘린더</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1 icon-set3">
        <button class="btn btn-toggle align-items-center rounded collapsed btn-set" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
          	<i class="bi bi-building"></i> 숙소등록 및 관리 <i class="bi bi-chevron-down"></i>
        </button>
        <div class="collapse " id="dashboard-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small left-accordion-body">
            <li><a href="#" class="link-dark rounded">호스트정보</a></li>
            <li><a href="#" class="link-dark rounded">숙소등록</a></li>
            <li><a href="#" class="link-dark rounded" style="border-bottom: 1px solid #fff;">객실등록</a></li>
          </ul>
        </div>
      </li> 
    </ul>
    <div class="left-accordion-body mb-3">
  	<button class="btn align-items-center collapsed btn-set"  >
         <i class="bi bi-chat-square-text"></i> 리뷰관리
     </button>
  </div>
  <div class="left-accordion-body  mb-3">
  	<button class="btn align-items-center collapsed btn-set" >
          <i class="bi bi-coin"></i> 정산
     </button>
  </div>
  <div class="left-accordion-body  mb-3">
  	<button class="btn align-items-center collapsed btn-set" >
          	<i class="bi bi-bar-chart-line"></i> 통계
     </button>
  </div>
  <div class="left-accordion-body">
  	<button class="btn align-items-center collapsed btn-set" >
          	<i class="bi bi-gear-fill"></i> setting
     </button>
  </div>
  </div>
