<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lodging.css"
	type="text/css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/moment-with-locales.js"></script>

<div class="whole">

	<div class="border">
		<form name="roomSeachForm" method="post">
		<div id="searchdiv">
			<div class="h-100 d-flex align-items-center justify-content-center searchbox" id="searchdiv2">
				
				<div class="h-75 color-wh pos_rel">
					<label class="w-100 h-100">
							<i class="fa-solid fa-magnifying-glass tm_leftcenter ps-1"></i><input class="w-100 h-100 ps-4" name="keyword" type="text" placeholder="지역 및 업소명 검색" value="${keyword}">
					</label>
				</div>
				<div class="h-75 ms-2 color-wh">
					<input type="text" class="w-100 h-100" id="roomDate" style="text-align: center;">
					<input type="hidden" name="startDate" value="${startDate}">
					<input type="hidden" name="endDate" value="${endDate}">
					<input type="hidden" name="mhId" value="">
					<input type="hidden" name="lodgCategory" value="${lodgCategory}">
					<input type="hidden" name="minPrice" value="${minPrice}">
					<input type="hidden" name="maxPrice" value="${maxPrice}">
					<input type="hidden" name="sort" value="${sort}">
					<input type="hidden" name="lodgOption" value="">
					<input type="hidden" name="roomOption" value="">
				</div>
				<div class="h-75 ms-2 color-wh">
					<input class="w-100 h-100 ps-3" id="roomPeople" name="people" type="number" placeholder="인원" min="1" max="100" style="border-radius: 4px;" value="${people}">
				</div>
				<div class="h-75 ms-2 color-wh">
					<input class="w-100 h-100 ps-3" id="roomBed" name="bed" type="number" placeholder="침대" min="1" max="5" style="border-radius: 4px;" value="${bed}">
				</div>
				<div class="h-75 ms-2">
					<button class="sch-bt w-100 h-100" id="serachbtn" type="button">검색하기</button>
				</div>
			</div>
		</div>
		</form>

		<div class="whole2 mt-3">
			<div class="host_modal">
				<span>총 ${dataCount}건의 게시물이 있습니다.</span>
			</div>
			<div class="d-flex">
				<div class="w-25">
				<div class="border">
					<div class="tm-map" id="tm-map"></div>
					<form>
						<div>
							<label><input type="radio" name="lodgCategory" value="" ${lodgCategory==""?"checked='checked'":""}>전체</label> 
						</div>
						<div>
							<label ><input type="radio" name="lodgCategory" value="1" ${lodgCategory=="1"?"checked='checked'":""}>호텔</label> 
						</div>
						<div>
							<label><input type="radio" name="lodgCategory" value="2" ${lodgCategory=="2"?"checked='checked'":""}>모텔</label> 
						</div>
						<div>
							<label><input type="radio" name="lodgCategory" value="3" ${lodgCategory=="3"?"checked='checked'":""}>펜션</label> 
						</div>
						<div>
							<label><input type="radio" name="lodgCategory" value="4" ${lodgCategory=="4"?"checked='checked'":""}>게스트하우스</label> 
						</div>
						<div>
							<label><input type="radio" name="lodgCategory" value="5" ${lodgCategory=="5"?"checked='checked'":""}>캠핑/글램핑</label>
						</div>
					</form>
					<button class="btn btn-primary" type="button"data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">상세옵션</button>
				</div>
			<div class="offcanvas offcanvas-top" tabindex="-1" id="offcanvasTop"
				aria-labelledby="offcanvasTopLabel" style="min-height: 250px;">
				<div class="offcanvas-header">
					<h5 id="offcanvasTopLabel">상세옵션 설정</h5>
				</div>
				<div class="offcanvas-body w-100 mt-3 pos_rel">

					<form>
						<div class="d-flex w-100">
							<div class="w-50">
								<div class="w-75 bor-sol-150 tm-text-cen">

									<div class="mb-2">
										<span>옵션 선택</span>
									</div>
									<div>
										<label class="me-2"><input type="checkbox" name="lodgOption" value="와이파이">와이파이</label> 
										<label class="me-2"><input type="checkbox" name="lodgOption" value="에어컨">에어컨</label> 
										<label class="me-2"><input type="checkbox" name="lodgOption" value="조식">조식</label> 
										<label class="me-2"><input type="checkbox" name="lodgOption" value="드라이기">드라이기</label> 
										<label class="me-2"><input type="checkbox" name="lodgOption" value="냉장고">냉장고</label>
										<label class="me-2"><input type="checkbox" name="lodgOption" value="반려견동반">반려견동반</label>
										<br>
										<label class="me-2"><input type="checkbox" name="lodgOption" value="카페">카페</label>
										<label class="me-2"><input type="checkbox" name="lodgOption" value="바베큐">바베큐</label>
										<label class="me-2"><input type="checkbox" name="lodgOption" value="주차장">주차장</label> 
										<label class="me-2"><input type="checkbox" name="lodgOption" value="조리">조리가능여부</label> 
										<div class="tm_hr my-1 mx-3"></div>
										<label class="me-2"><input type="checkbox" name="roomOption" value="욕조">욕조</label>
										<label class="me-2"><input type="checkbox" name="roomOption" value="컴퓨터">컴퓨터</label>
										<label class="me-2"><input type="checkbox" name="roomOption" value="수영장">수영장</label>
										<label class="me-2"><input type="checkbox" name="roomOption" value="세면도구">세면도구</label>
										<label class="me-2"><input type="checkbox" name="roomOption" value="주방">주방</label>
										<br>
										<label class="me-2"><input type="checkbox" name="roomOption" value="세탁기">세탁기</label>
										<label class="me-2"><input type="checkbox" name="roomOption" value="넷플릭스">넷플릭스</label>
										<label class="me-2"><input type="checkbox" name="roomOption" value="바다뷰">바다뷰</label> 
										<label class="me-2"><input type="checkbox" name="roomOption" value="도시뷰">도시뷰</label> 
									</div>
								</div>
							</div>
							<div class="w-50">
								<div class="w-75 bor-sol-150 tm-text-cen">
									<div class="mb-3">
										<span>가격 선택</span>
									</div>

									<div class="price_slider pos_rel">
										<div class="wrapper">
											<div class="slider">
												<div class="progress"></div>
											</div>
											<div class="range-input">
												<input type="range" class="range-min" min="0" max="${maxValue}" value="${minPrice}" step="100"> 
												<input type="range"	class="range-max" min="0" max="${maxValue}" value="${maxPrice}" step="100">
											</div>
											<div class="price-input">
												<div class="field">
													<input type="number" class="input-min" value="${minPrice}" readonly="readonly">
												</div>
												<div class="separator">-</div>
												<div class="field">
													<input type="number" class="input-max" value="${maxValue}" readonly="readonly">
												</div>
											</div>

										</div>
									</div>


								</div>
							</div>
						</div>

						<div class="option_btn">
							<button type="reset" id="optionReset">설정초기화</button>
							<button type="button" id="optionSelect" class="text-reset" onclick="optionGo()" data-bs-dismiss="offcanvas">설정하기</button>
						</div>
					</form>
				</div>
			</div>
				</div>
				<div class="w-75">
					<div class="bor-sol" style="height: 45px;">
						<ul class="d-flex list-no h-100" id="lodg_list_category">
							<li class="py-1" >정렬기준</li>
							<li class="py-1" onclick="sortGo1()" style="cursor: pointer;">리뷰수 순</li>
							<li class="py-1" onclick="sortGo2()" style="cursor: pointer;">평점 순</li>
							<li class="py-1" onclick="sortGo3()" style="cursor: pointer;">가격 높은 순</li>
							<li class="py-1" onclick="sortGo4()" style="cursor: pointer;">가격 낮은 순</li>
						</ul>
					</div>
<!-- 
					<ul>
						
						<c:forEach var="dto" items="${list}">
							<li>
								<div>사진</div>
								<div>
									<span>제목들</span> <span>평점+리뷰수</span> <span>간단한 정보</span> <span>가격(오른쪽으로)
										(기간, 주말에 맞춰서 가격 다르게 보이기)</span>
								</div>
							</li>
						</c:forEach>
					</ul>
-->
				<c:forEach var="dto" items="${list}">
					<ul class="bor-sol-200 list-no pos_rel">
							<li>
								<div class="d-flex p-2" style="height: 200px;">
									<div class="w-25"><img class="w-100 h-100" src="${pageContext.request.contextPath}/tmate/lodging/${dto.lPhotoName}"></div>
									<div class="w-75 ps-2 roomlistGO" style="cursor: pointer;">
										<div class="lodg_name mb-2 d-flex">
											<div class="w-50"><a>${dto.lodgName}</a></div>
											<input type="hidden" class="postRoom_id" value="${dto.mhId}">
											<div class="w-50 host_modal"><span><i class="fa-regular fa-heart" id="liked${dto.mhId}" onclick="isLiked('${dto.mhId}')" data-state="${dto.isLiked}" style="background: red;"></i></span></div>
										</div>
										<div class="lodg_grade mb-2">
										
											<div class="pos_rel" style="height: 30px;">
											<div class="tm_left">
												<div class="star-ratings" style="font-size: 20px;">
													<div class="star-ratings-fill" style="width: ${dto.percent}%;">
														<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
													</div>
													<div class="star-ratings-base">
														<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
													</div>
												</div>
											</div>
											<div style="padding-left: 110px; padding-top: 5px;">
												<span id="gradeAvg">${dto.reviewGrade}</span>(${dto.reviewCount})
											</div>
											</div>
											
										</div>
										<div class="lodg_content">${dto.mhAddr1}</div> 
										<div class="lodg_price">
											${dto.roomPrice}
											<span class="price_won">원 </span>
										</div>
									</div>
								</div>
							</li>
					</ul>
				</c:forEach>
					
					<div class="page-box">
						${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
					</div>
				</div>
			</div>



		</div>
	</div>
</div>


<script type="text/javascript">

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}


function isLiked(mhId) {
	
	var state = $('#liked'+mhId).attr('data-state');
	var msg = state == "true" ? " 숙소를 찜 목록에서 삭제하시겠습니까? " : " 숙소를 찜 목록에 추가하시겠습니까? " ;
	
	if(! confirm( msg )) {
		return false;
	}
	
	var url = "${pageContext.request.contextPath}/reservation/insertLikeList";
	var mhId = "${dto.mhId}";
	var query = "mhId="+mhId;
	
	onst fn = function(data){
		let state = data.state;
		if(state === "true") {
			if( userLiked ) {
				$i.removeClass("fa-solid").addClass("fa-regular");
			} else {
				$i.removeClass("fa-regular").addClass("fa-solid");
			}
			
		} else if(state === "false") {
			alert("숙소 찜 여부 처리가 실패했습니다.");
		}
	};
	
	ajaxFun(url, "post", query, "json", fn);
	
}


$('.roomlistGO').click(function(){
	
	var postId = $(this).find('.postRoom_id').val();
	
	$('input[name=mhId]').val(postId);
	
	const f = document.roomSeachForm;
	
	f.action = "${pageContext.request.contextPath}/reservation/roomlist";
	
	f.submit();
    
});

$('#serachbtn').click(function(){
	if( newOpen ){
		newOpen.close();
		newOpen = null;
	}
	
	$('input[type=hidden][name=lodgCategory]').val('');
	$('input[type=hidden][name=minPrice]').val('');
	$('input[type=hidden][name=maxPrice]').val('');
	$('input[type=hidden][name=lodgOption]').val('');
	$('input[type=hidden][name=roomOption]').val('');
	
	const f = document.roomSeachForm;
	
	f.action = "${pageContext.request.contextPath}/reservation/list";
	
	f.submit();
		
});

$('input[type=radio][name=lodgCategory]').click(function(){
	
	var roomCt = $(this).val();
	
	$('input[type=hidden][name=lodgCategory]').val(roomCt);
	
	const f = document.roomSeachForm;
	
	f.submit();
	
	
});

</script>

<script type="text/javascript">

const rangeInput = document.querySelectorAll(".range-input input"),
priceInput = document.querySelectorAll(".price-input input"),
range = document.querySelector(".slider .progress");
let priceGap = 10000;

priceInput.forEach(input =>{
    input.addEventListener("input", e =>{
        let minPrice = parseInt(priceInput[0].value),
        maxPrice = parseInt(priceInput[1].value);
        
        if((maxPrice - minPrice >= priceGap) && maxPrice <= rangeInput[1].max){
            if(e.target.className === "input-min"){
                rangeInput[0].value = minPrice;
                range.style.left = ((minPrice / rangeInput[0].max) * 100) + "%";
            }else{
                rangeInput[1].value = maxPrice;
                range.style.right = 100 - (maxPrice / rangeInput[1].max) * 100 + "%";
            }
        }
    });
});

rangeInput.forEach(input =>{
    input.addEventListener("input", e =>{
        let minVal = parseInt(rangeInput[0].value),
        maxVal = parseInt(rangeInput[1].value);

        if((maxVal - minVal) < priceGap){
            if(e.target.className === "range-min"){
                rangeInput[0].value = maxVal - priceGap;
            }else{
                rangeInput[1].value = minVal + priceGap;
            }
        }else{
            priceInput[0].value = minVal;
            priceInput[1].value = maxVal;
            range.style.left = ((minVal / rangeInput[0].max) * 100) + "%";
            range.style.right = 100 - (maxVal / rangeInput[1].max) * 100 + "%";
        }
    });
});

</script>

<script type="text/javascript">

//달력

$('#roomDate').daterangepicker({
	
	"maxSpan": {
        "days": 7
    },
	
    "locale": {
        "format": "YYYY-MM-DD",
        "separator": " ~ ",
        "applyLabel": "적용",
        "cancelLabel": "취소",
        "fromLabel": "From",
        "toLabel": "To",
        "customRangeLabel": "Custom",
        "weekLabel": "W",
        "daysOfWeek": [
            "일",
            "월",
            "화",
            "수",
            "목",
            "금",
            "토"
        ],
        "monthNames": [
            "1월",
            "2월",
            "3월",
            "4월",
            "5월",
            "6월",
            "7월",
            "8월",
            "9월",
            "10월",
            "11월",
            "12월"
        ],
        "firstDay": 1,
        
    },
    "alwaysShowCalendars": false,
    "startDate": "${startDate}",
    "endDate": "${endDate}",
    "minDate": moment(),
    "maxDate": moment().add(1,'y')
});
  
$("#roomDate").on('show.daterangepicker', function (ev, picker) {
      $(".yearselect").css("float", "left");
      $(".monthselect").css("float", "right");
      $(".cancelBtn").css("float", "right");
});

$("#roomDate").change(function(){
	var ciDate = $(this).val().substr(0, 10);
	var coDate = $(this).val().substr(13, 10);
	
	if( ciDate == coDate ){
		alert("당일 체크인 체크아웃은 불가능합니다.");
		$('.cancelBtn').click();
		$('#roomDate').focus();
		return;
	}
	
	
	 $("input[name=startDate]").val(ciDate);
	 $("input[name=endDate]").val(coDate);
});






$('#roomBed').change(function(){
	var $bed = $(this).val();

	if( $bed >= 6 || $bed <= 0){
		alert("1~5개 까지 입력 가능합니다.");
		$('#roomBed').val("1");
		return;
	}
});

$('#roomPeople').change(function(){
	var $people = $(this).val();

	if( $people <= 0){
		alert("0 이하의 값은 입력 불가능합니다.");
		$('#roomPeople').val("1");
		return;
	}
});


</script>

<script>

function optionGo(){
	
	var lodgOptionArr = [];
	var roomOptionArr = [];

	$('input[name=lodgOption]:checked').each(function(){
			let $chk = $(this).val();
			lodgOptionArr.push($chk);
	});
	
	$('input[name=roomOption]:checked').each(function(){
			let $chk = $(this).val();
			roomOptionArr.push($chk);
	});
	
	
	$('input[type=hidden][name=lodgOption]').val(lodgOptionArr);
	$('input[type=hidden][name=roomOption]').val(roomOptionArr);

	
	var min = $('.input-min').val();
	var max = $('.input-max').val();
	

	$('input[type=hidden][name=minPrice]').val(min);
	$('input[type=hidden][name=maxPrice]').val(max);
	
	const f = document.roomSeachForm;
	
	f.action = "${pageContext.request.contextPath}/reservation/list";
	
	f.submit();
	

};

function sortGo1(){
	$('input[type=hidden][name=sort]').val('reviewSort');
	
	const f = document.roomSeachForm;
	
	f.action = "${pageContext.request.contextPath}/reservation/list";
	
	f.submit();
};

function sortGo2(){
	$('input[type=hidden][name=sort]').val('gradeSort');
	
	const f = document.roomSeachForm;
	
	f.action = "${pageContext.request.contextPath}/reservation/list";
	
	f.submit();
};

function sortGo3(){
	$('input[type=hidden][name=sort]').val('priceDSort');
	
	const f = document.roomSeachForm;
	
	f.action = "${pageContext.request.contextPath}/reservation/list";
	
	f.submit();
};

function sortGo4(){
	$('input[type=hidden][name=sort]').val('priceASort');
	
	const f = document.roomSeachForm;
	
	f.action = "${pageContext.request.contextPath}/reservation/list";
	
	f.submit();
};




</script>

