<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hostPage.css" type="text/css">

<div class="main-header">
	<div class="row form-inline align-middle">
		<p class="col-md-3 logo-box mt-3 m-1">로고</p>
	 	<input type="text" class="col-md-3 form-control input-form me-1 mt-3" id="searchInput" placeholder="예약자명/전화번호/상세사항 등을 검색하세요.">
		<button type="button" class="col-md-3 btn btn-default border searchbtn ms-1 mt-3 btn-change rounded-3 rounded-3">
		 <i class="bi bi-hand-index-thumb-fill"></i></button>
	 	<button type="button" class="col-md-3 btn btn-default exitbtn "><i class="bi bi-box-arrow-right"></i> </button>
	</div>
</div>
