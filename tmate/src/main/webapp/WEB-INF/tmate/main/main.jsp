<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.standalone.min.css" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main2.css" type="text/css">

<img class="img-fluid bg-image" src="${pageContext.request.contextPath}/resources/images/back.png">

<div class="container-fluid bground">
	<div class="container-fluid container-subject container-main">
		<div class="container-fluid container-icon container-main-icon">
			<div class="row">
				<div class="col">
					<a style="text-decoration: none" href="#"
						class="icon fa-solid fa-hotel"></a><br> <a
						style="text-decoration: none" href="#" class="icon-text">호텔</a>
				</div>
				<div class="col">
					<a style="text-decoration: none" href="#"
						class="icon fa-solid fa-building-columns"></a><br> <a
						style="text-decoration: none" href="#" class="icon-text">모텔</a>
				</div>
				<div class="col">
					<a style="text-decoration: none" href="#"
						class="icon fa-solid fa-house-chimney"></a><br> <a
						style="text-decoration: none" href="#" class="icon-text">펜션</a>
				</div>
				<div class="col">
					<a style="text-decoration: none" href="#"
						class="icon fa-solid fa-people-roof"></a><br> <a
						style="text-decoration: none" href="#" class="icon-text">게스트하우스</a>
				</div>
				<div class="col">
					<a style="text-decoration: none" href="#"
						class="icon fa-solid fa-campground"></a><br> <a
						style="text-decoration: none" href="#" class="icon-text">캠핑/글램핑</a>
				</div>
			</div>
		</div>

		<form class="d-flex m-3" action="">
			<input class="form-control search from-search" type="search" placeholder="어디로 떠나시나요?" aria-label="Search">
		</form>

		<div class="row mt-1 me-1 ms-2">
			<div class="col">
				<input type="text" id="datePicker-1"
					class="form-control from-search form-picker-1"
					data-position="right bottom" />
			</div>
			<div class="col">
				<input type="text" id="datePicker-2"
					class="form-control from-search form-picker-2" value="2022-05-27" />
			</div>
			<div class="col-6">
				<div class=" dropdown">
					<button
						class="form-control from-search dropdown-toggle drop-person"
						type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">
						<i class="fa-solid fa-person"></i>성인 1명
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" href="#">2인 여행객 입니다.</a></li>
						<li><a class="dropdown-item" href="#">4인/가족 여행객 입니다.</a></li>
						<li><a class="dropdown-item" href="#">단체 여행객 입니다.</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div
			class="position-absolute top-100 start-50 translate-middle btn-lg">
			<p>
				<button type="button" class="btn-select btn-color btn-lg">선택하기</button>
			</p>
		</div>

	</div>
</div>


<div class="down">
	<div class="container-fluid attraction">
		<h5>트레블메이트와 함께하는 여행지</h5>
		<img
			src="${pageContext.request.contextPath}/resources/images/seoul.png">
		<img
			src="${pageContext.request.contextPath}/resources/images/gangwondo.png">
		<img
			src="${pageContext.request.contextPath}/resources/images/gyeongju.png">
		<img
			src="${pageContext.request.contextPath}/resources/images/jejudo.png">
		<img
			src="${pageContext.request.contextPath}/resources/images/busan.png">

	</div>
	<div class="container-fluid recommend">
		<h5>트래블 메이트가 고객님께 추천하는 숙소</h5>
		<c:forEach var="vo" items="${list}">
		<div class="card main-card" style="width: 280px;">
		  <img class="main-img" src="${pageContext.request.contextPath}/tmate/lodging/${vo.lphotoName}" class="card-img-top">
			  <div class="card-body">
			    <p class="card-name" style="font-size: 18px; font-weight: bold;">${vo.lodgName}</p>
			    <p class="card-addr">${vo.mhAddr1}</p>
			</div>		
		</div>
		</c:forEach>
</div>
</div>



<script type="text/javascript">
	$('#datePicker-1').datepicker({
		format : 'yyyy년 mm월 dd일',
		autoclose : true,
		calendarWeeks : false,
		language : 'ko',
		todayHighlight : true,
		startDate : 'setDate',
		endDate : '+15m',
		orientation : 'bottom',
	}).datepicker("setDate", "0");

	$('#datePicker-2').datepicker({
		format : 'yyyy년 mm월 dd일',
		autoclose : true,
		calendarWeeks : false,
		language : 'ko',
		startDate : 'setDate',
		endDate : '+18m',
		orientation : 'bottom',
	}).datepicker("setDate", "0");
</script>

