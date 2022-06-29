<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lodging.css?after" type="text/css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/moment-with-locales.js"></script>

<div class="whole">
	<div class="whole2">
	
	<div class="my-5">
	<h3>예약이 완료되었습니다.</h3>
		<div class="mt-5">
			<div>
				<div class="d-flex">
					<div class="w-25 ps-3">예약번호</div>
					<div class="w-75">26</div>
				</div>
			</div>
			<div class="tm_hr my-3"></div>
			<div>
				<div class="d-flex">
					<div class="w-25 ps-3">체크인</div>
					<div class="w-75"> ${cinDate} ${dto.lodgCin_time} </div>
				</div>
				<div class="d-flex">
					<div class="w-25 ps-3">체크아웃</div>
					<div class="w-75"> ${coutDate} ${dto.lodgCout_time} </div>
				</div>
			</div>
			<div class="tm_hr my-3"></div>
			<div>
				<div class="d-flex">
					<div class="w-25 ps-3">투숙객 이름</div>
					<div class="w-75"> 김자바</div>
				</div>
				<div class="d-flex">
					<div class="w-25 ps-3">연락처 정보</div>
					<div class="w-75"> 01013244842</div>
				</div>
			</div>
			<div class="tm_hr my-3"></div>
			<div>
				<div class="d-flex">
					<div class="w-25 ps-3">예약 숙소</div>
					<div class="w-75">오두막호텔</div>
				</div>
				<div class="d-flex">
					<div class="w-25 ps-3">예약 객실</div>
					<div class="w-75">슈퍼디럭스룸</div>
				</div>
			</div>
			<div class="tm_hr my-3"></div>
			<div>
				<div class="d-flex">
					<div class="w-25 ps-3">결제 수단</div>
					<div class="w-75">간편결제</div>
				</div>
				<div class="d-flex">
					<div class="w-25 ps-3">결제 승인번호</div>
					<div class="w-75">13241247</div>
				</div>
				<div class="d-flex">
					<div class="w-25 ps-3">결제 일시</div>
					<div class="w-75">2022년 6월 11일</div>
				</div>
			</div>
			<div class="d-flex mt-5">
				<div>
					<button>메인페이지</button>
				</div>
				<div>
					<button>예약 내역</button>
				</div>
			</div>
			
			
		</div>
	</div>
	
	</div>
</div>



