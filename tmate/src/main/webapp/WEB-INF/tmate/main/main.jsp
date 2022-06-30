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
				<div class="col lodgcate1">
					<a style="text-decoration: none" href="#"
						class="icon fa-solid fa-hotel"></a><br> <a
						style="text-decoration: none" href="#" class="icon-text">호텔</a>
				</div>
				<div class="col lodgcate2">
					<a style="text-decoration: none" href="#"
						class="icon fa-solid fa-building-columns "></a><br> <a
						style="text-decoration: none" href="#" class="icon-text">모텔</a>
				</div>
				<div class="col lodgcate3">
					<a style="text-decoration: none" href="#"
						class="icon fa-solid fa-house-chimney"></a><br> <a
						style="text-decoration: none" href="#" class="icon-text">펜션</a>
				</div>
				<div class="col lodgcate4">
					<a style="text-decoration: none" href="#"
						class="icon fa-solid fa-people-roof"></a><br> <a
						style="text-decoration: none" href="#" class="icon-text">게스트하우스</a>
				</div>
				<div class="col lodgcate5">
					<a style="text-decoration: none" href="#"
						class="icon fa-solid fa-campground"></a><br> <a
						style="text-decoration: none" href="#" class="icon-text">캠핑/글램핑</a>
				</div>
			</div>
		</div>

		<form class="d-flex m-3" name="searchlodgForm" method="post">
			<input class="form-control search from-search" type="search" name="keyword" placeholder="어디로 떠나시나요?" aria-label="Search">
			<input type="hidden" name="startDate">
			<input type="hidden" name="endDate">
			<input type="hidden" name="people">
			<input type="hidden" name="lodgCategory">
		</form>

		<div class="row mt-1 me-1 ms-2">
			<div class="col">
				<input type="text" id="datePicker-1"
					class="form-control from-search form-picker-1"
					data-position="right bottom" />
			</div>
			<div class="col">
				<input type="text" id="datePicker-2"
					class="form-control from-search form-picker-2"/>
			</div>
			<div class="col-6">
				<div class=" dropdown">
					<button
						class="form-control from-search dropdown-toggle drop-person"
						type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">
						<i class="fa-solid fa-person"></i><span id="peopleLay">1인 여행객입니다.</span>
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" id="people1" href="#">1인 여행객입니다.</a></li>
						<li><a class="dropdown-item" id="people2" href="#">2인 여행객입니다.</a></li>
						<li><a class="dropdown-item" id="people3" href="#">3인 여행객입니다.</a></li>
						<li><a class="dropdown-item" id="people4" href="#">4명 이상 단체 여행객입니다.</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div
			class="position-absolute top-100 start-50 translate-middle btn-lg">
			<p>
				<button type="button" class="btn-select btn-color btn-lg" onclick="listGo()">선택하기</button>
			</p>
		</div>

	</div>
</div>


<div class="down">
	<div class="container-fluid attraction">
		<h5>트레블메이트와 함께하는 여행지</h5>
		<img
			src="${pageContext.request.contextPath}/resources/images/seoul.png" title="서울 숙소" style="cursor: pointer;">
		<img
			src="${pageContext.request.contextPath}/resources/images/gangwondo.png" title="강원도 숙소" style="cursor: pointer;">
		<img
			src="${pageContext.request.contextPath}/resources/images/gyeongju.png" title="경주 숙소" style="cursor: pointer;">
		<img
			src="${pageContext.request.contextPath}/resources/images/jejudo.png" title="제주도 숙소" style="cursor: pointer;">
		<img
			src="${pageContext.request.contextPath}/resources/images/busan.png" title="부산 숙소" style="cursor: pointer;">

	</div>
	<div class="container-fluid recommend">
		<h5>트래블 메이트가 고객님께 추천하는 숙소</h5>
		<c:forEach var="vo" items="${list}">
		<div class="card main-card" onclick="famousLodging('${vo.mhId}');" style="width: 280px;">
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
	}).datepicker("setDate", "+1D");
	
	$('.lodgcate1').click(function(){
		
		const f = document.searchlodgForm;
		
		$('input[name=lodgCategory]').val('1');
		$('input[name=startDate]').val('');
		$('input[name=endDate]').val('');
		$('input[name=people]').val('');
		$('input[name=keyword]').val('');
		
		f.action = "${pageContext.request.contextPath}/reservation/list";
		
		f.submit();
		
	});
	
	$('.lodgcate2').click(function(){

		const f = document.searchlodgForm;
		
		$('input[name=lodgCategory]').val('2');
		$('input[name=startDate]').val('');
		$('input[name=endDate]').val('');
		$('input[name=people]').val('');
		$('input[name=keyword]').val('');
		
		f.action = "${pageContext.request.contextPath}/reservation/list";
		
		f.submit();
		
	});
	
	$('.lodgcate3').click(function(){

		const f = document.searchlodgForm;
		
		$('input[name=lodgCategory]').val('3');
		$('input[name=startDate]').val('');
		$('input[name=endDate]').val('');
		$('input[name=people]').val('');
		$('input[name=keyword]').val('');
		
		f.action = "${pageContext.request.contextPath}/reservation/list";
		
		f.submit();
		
	});
	
	$('.lodgcate4').click(function(){

		const f = document.searchlodgForm;
		
		$('input[name=lodgCategory]').val('4');
		$('input[name=startDate]').val('');
		$('input[name=endDate]').val('');
		$('input[name=people]').val('');
		$('input[name=keyword]').val('');
		
		f.action = "${pageContext.request.contextPath}/reservation/list";
		
		f.submit();
		
	});
	
	$('.lodgcate5').click(function(){

		const f = document.searchlodgForm;
		
		$('input[name=lodgCategory]').val('5');
		$('input[name=startDate]').val('');
		$('input[name=endDate]').val('');
		$('input[name=people]').val('');
		$('input[name=keyword]').val('');
		
		f.action = "${pageContext.request.contextPath}/reservation/list";
		
		f.submit();
	});
	
	$('#people1').click(function(){
		var p1 = $(this).text();
		
		$('#peopleLay').text(p1);
		$('input[name=people]').val('1');
	});
	
	$('#people2').click(function(){
		var p2 = $(this).text();
		
		$('#peopleLay').text(p2);
		$('input[name=people]').val('2');
	});
	
	$('#people3').click(function(){
		var p3 = $(this).text();
		
		$('#peopleLay').text(p3);
		$('input[name=people]').val('3');
	});
	
	$('#people4').click(function(){
		var p4 = $(this).text();
		
		$('#peopleLay').text(p4);
		$('input[name=people]').val('4');
	});
	
	function listGo(){
		
		var str1 = $('#datePicker-1').val();
		var startDate = str1.substr(0,4) + "-" + str1.substr(6,2) + "-" + str1.substr(10,2);
		
		var str2 = $('#datePicker-2').val();
		var endDate = str2.substr(0,4) + "-" + str2.substr(6,2) + "-" + str2.substr(10,2);

		$('input[name=startDate]').val(startDate);
		$('input[name=endDate]').val(endDate);
		
		const f = document.searchlodgForm;
		f.action = "${pageContext.request.contextPath}/reservation/list";
		f.submit();
		
	};
	
	$('.attraction>img').click(function(){
		var title = $(this).attr('title');
		var key = title.substr(0,2);

		const f = document.searchlodgForm;
		
		$('input[name=lodgCategory]').val('');
		$('input[name=startDate]').val('');
		$('input[name=endDate]').val('');
		$('input[name=people]').val('');
		$('input[name=keyword]').val(key);
		
		f.action = "${pageContext.request.contextPath}/reservation/list";
		
		f.submit();
	});
	
	function famousLodging(mhId) {
		location.href="${pageContext.request.contextPath}/reservation/roomlist?mhId="+mhId;
	}
</script>

