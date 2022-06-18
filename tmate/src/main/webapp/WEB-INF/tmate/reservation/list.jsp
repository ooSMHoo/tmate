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
		<div id="searchdiv">
			<div class="h-100 d-flex align-items-center justify-content-center searchbox" id="searchdiv2">
				<div class="h-75 color-wh pos_rel">
					<label class="w-100 h-100">
							<i class="fa-solid fa-magnifying-glass tm_leftcenter"></i><input class="w-100 h-100 ps-4" name="searchbox" type="text" placeholder="지역 및 업소명 검색">
					</label>
				</div>
				<div class="h-75 ms-2 color-wh">
					<input type="text" class="w-100 h-100" id="roomDate" style="text-align: center;">
				</div>
				<div class="h-75 ms-2 color-wh">
					<input class="w-100 h-100 ps-3" id="roomPeople" type="number" placeholder="인원" min="1" max="100" style="border-radius: 4px;">
				</div>
				<div class="h-75 ms-2">
					<button class="sch-bt w-100 h-100" type="button">검색하기</button>
				</div>
			</div>
		</div>

		<div class="whole2 mt-3">
			<div class="host_modal">
				<span>총 OO건의 게시물이 있습니다.</span>
			</div>
			<div class="d-flex">
				<div class="w-25 border">
					<div class="tm-map" id="tm-map"></div>
					<form>
						<div>
							<label><input type="radio" name="lodgCategory" value="">전체</label> 
						</div>
						<div>
							<label><input type="radio" name="lodgCategory" value="호텔">호텔</label> 
						</div>
						<div>
							<label><input type="radio" name="lodgCategory" value="모텔">모텔</label> 
						</div>
						<div>
							<label><input type="radio" name="lodgCategory" value="펜션">펜션</label> 
						</div>
						<div>
							<label><input type="radio" name="lodgCategory" value="게하">게스트하우스</label> 
						</div>
						<div>
							<label><input type="radio" name="lodgCategory" value="캠핑">캠핑/글램핑</label>
						</div>
					</form>
					<button class="btn btn-primary" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop"
				aria-controls="offcanvasTop">상세옵션</button>
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

									<div class="mb-3">
										<span>옵션 선택</span>
									</div>
									<label><input type="checkbox" name="option" value="와이파이">와이파이</label> 
										<label><input type="checkbox" name="option" value="조식">조식</label> 
										<label><input type="checkbox" name="option" value="반려견동반">반려견동반</label>
										<label><input type="checkbox" name="option" value="바베큐">바베큐</label>
										<label><input type="checkbox" name="option" value="주차장">주차장</label> 
										<label><input type="checkbox" name="option" value="카페">카페</label>
										<br>
										<label><input type="checkbox" name="option" value="에어컨">에어컨</label> 
										<label><input type="checkbox" name="option" value="드라이기">드라이기</label> 
										<label><input type="checkbox" name="option" value="조리">조리가능여부</label> 
										<label><input type="checkbox" name="option" value="냉장고">냉장고</label>
										<label><input type="checkbox" name="option" value="주방">주방</label>
										<br>
										<label><input type="checkbox" name="option" value="바다뷰">바다뷰</label> 
										<label><input type="checkbox" name="option" value="도시뷰">도시뷰</label> 
										<label><input type="checkbox" name="option" value="넷플릭스">넷플릭스</label>
										<label><input type="checkbox" name="option" value="세면도구">세면도구</label>
										<label><input type="checkbox" name="option" value="욕조">욕조</label>
										<label><input type="checkbox" name="option" value="컴퓨터">컴퓨터</label>
										<label><input type="checkbox" name="option" value="수영장">수영장</label>
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
												<input type="range" class="range-min" min="0" max="50000" value="0" step="100"> 
												<input type="range"	class="range-max" min="0" max="50000" value="50000" step="100">
											</div>
											<div class="price-input">
												<div class="field">
													<input type="number" class="input-min" value="0">
												</div>
												<div class="separator">-</div>
												<div class="field">
													<input type="number" class="input-max" value="50000">
												</div>
											</div>

										</div>
									</div>


								</div>
							</div>
						</div>

						<div class="option_btn">
							<button type="reset">설정초기화</button>
							<button type="button" class="text-reset" data-bs-dismiss="offcanvas">설정하기</button>
						</div>
					</form>
				</div>
			</div>
				</div>
				<div class="w-75 border">
					<div class="bor-sol" style="height: 45px;">
						<ul class="d-flex list-no h-100" id="lodg_list_category">
							<li class="py-1">정렬기준</li>
							<li class="py-1">리뷰수 순</li>
							<li class="py-1">평점 순</li>
							<li class="py-1">가격 높은 순</li>
							<li class="py-1">가격 낮은 순</li>
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
					<ul class="bor-sol-200 list-no pos_rel">
							<li>
								<div class="d-flex"  >
									<div class="w-25">사진</div>
									<div class="w-75" onclick="roomList()" style="cursor: pointer;">
										<div class="lodg_name mb-2 d-flex">
											<div class="w-50"><a>숙소 이름</a></div>
											<div class="w-50 host_modal"><span><i class="fa-regular fa-heart"></i><i class="fa-solid fa-heart"></i></span></div>
										</div>
										<div class="lodg_grade mb-2">평균리뷰점수+리뷰수</div>
										<div class="lodg_content">주소 (~~시)</div> 
										<div class="lodg_price">
											가격
											(기간, 주말에 맞춰서 가격 다르게 보이기)
											or매진
											<span class="price_won">원 </span>
										</div>
									</div>
								</div>
							</li>
					</ul>
					
				</div>

			</div>



		</div>
	</div>
</div>


<script type="text/javascript">
function roomList() {
    location.href = "${pageContext.request.contextPath}/reservation/roomlist";
}
</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fddbdb5b41a871e2d6fae3966e94fc09"></script>


<script>
var staticMapContainer  = document.getElementById('tm-map'), // 이미지 지도를 표시할 div  
    staticMapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 이미지 지도의 중심좌표
        level: 3 // 이미지 지도의 확대 레벨
    };

// 이미지 지도를 표시할 div와 옵션으로 이미지 지도를 생성합니다
var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);


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
        "firstDay": 1
    },
    "alwaysShowCalendars": false,
    "startDate": "${startDate}",
    "endDate": "${endDate}",
    "minDate": moment()
}, function(start, end, label) {
  console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
});
  
$("#roomDate").on('show.daterangepicker', function (ev, picker) {
      $(".yearselect").css("float", "left");
      $(".monthselect").css("float", "right");
      $(".cancelBtn").css("float", "right");
});

$("#roomDate").change(function(){
	var ciDate = $(this).val().substr(0, 10);
	var coDate = $(this).val().substr(13, 10);
	
	alert(ciDate + "," + coDate);	
});

</script>

