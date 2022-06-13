<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hostPage.css" type="text/css">

<div class="container-fluid">
	<div class=" main-container py-4" >
		<h1 class="app-page-title mb-0">연도별 상세현황</h1>
			<div class="row text-center mb-1 justify-content-md-center">
				<button type="button" class="col col-lg-2 btn"><i class="bi bi-arrow-left-square"></i></button> 
				<h3 class="col col-md-auto">2022년</h3>
				<button type="button" class="col col-lg-2 btn"><i class="bi bi-arrow-right-square"></i></button> 
			</div>
			    <div class="row align-items-md-stretch">
			      <div class="mb-4">
			        <div class=" p-2 border bg-white rounded-3 box1 shadow">
			          <h5 class="text-center text-black mt-2">이번연도 누적현황</h5>
			          <div class="row row-cols-4 text-center mt-4 count-box count">
			          	<div class="col"><h1>3</h1></div>
			          	<div class="col"><h1>0</h1></div>
			          	<div class="col"><h1>3</h1></div>
			          	<div class="col"><h1>1</h1></div>
			          	<div class="col">예약건</div>
			          	<div class="col">판매금액</div>
			          	<div class="col">취소건</div>
			          	<div class="col">취소금액</div>
			          </div>
			        </div>
			      </div>
			    </div>
			
			    <div class="row align-items-md-stretch box2 mb-4">
			      <div class="col-md-6">
			        <div class="h-100 p-5 bg-white border rounded-3 shadow">
			          	<h6 style="font-weight: bold;">객실별 판매상세</h6>
			        </div>
			      </div>
			      <div class="col-md-6">
			        <div class="h-100 p-5 bg-white border rounded-3 shadow">
			          <h6 style="font-weight: bold;">비교분석</h6>
			        </div>
			      </div>
			    </div>
			    
			     <div class="align-items-md-stretch">
			      <div class="mb-4">
			        <div class=" p-2 border bg-white rounded-3 box2 shadow">
			          <h5 class="text-center text-black mt-2">매출지표</h5>
			        </div>
			      </div>
			    </div>
			</div>
	    </div>