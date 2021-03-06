<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lodging2.css?after" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/paginate.css?after" type="text/css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />

<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/moment-with-locales.js"></script>



<div class="whole">
	<div class="whole2">
		<div class="border mt-2 mb-5" id="topslide" style="height: 400px;">

			<div class="slideshow-container " >
				<c:forEach var="vo" items="${photoList}">
					<div class="mySlides">
						<img src="${pageContext.request.contextPath}/tmate/lodging/${vo.lPhotoName}" style="width:100%; height: 400px;">
					</div>		
				</c:forEach>

				<a class="prev" onclick="plusSlides(-1)">❮</a>
				<a class="next" onclick="plusSlides(1)">❯</a>
				
				</div>
				<br>
				
				<div style="text-align:center">
				<c:forEach var="vo" items="${photoList}" varStatus="status">
					<span class="dot" onclick="currentSlide(${status.count})"></span> 
				</c:forEach>
				</div>

		</div>
		<div class="ms-3">
			<div class="room_name mb-3">
				${lodging.lodgName}
			</div>

			<div class="d-flex flex-row mb-3 justify-content-start row ">
				<div class="col-sm-2  bd-highlight ">
					<div class="star-ratings">
						<div class="star-ratings-fill" style=" width: ${total*20}% ">
							<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
						</div>
						<div class="star-ratings-base">
							<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
						</div>	
					</div>
				</div>
				<div class="col-sm bd-highlight mt-2 ms-3 h3" >
					${total} <span class="text-secondary h6">/5</span>
				</div>	
			</div>

			<ul class="room_place">
				<li class="li_set text-primary mt-2" onclick="window.open('https://map.kakao.com/link/map/${lodging.lodgName},${lodging.lodgLat},${lodging.lodgLon}')">
				<i class="bi bi-geo-alt-fill"></i><a>지도로 보기</a></li>
			</ul>			
			<div class="room_homepage mt-2">
				<c:if test="${lodging.lodgPageAddr eq null}">
					<a href="${lodging.lodgPageAddr}">${lodging.lodgPageAddr}</a>
				</c:if>
			</div>
			
			<form name="changeForm" method="get" >
				<div class="d-flex mt-5 mb-3 " style="text-align: right;">
					<div class="h5">
						<span>예약 날짜</span> 
						<input type="text" id="roomDate" style="text-align: center; width: 260px;"
							class="date_set h5">
					</div>
					<div class="peopleform align-content-center h5">
						<span>숙박인원</span>
						<select name="sel_people" id="sel_people" class="date_set h5">
							<option value="1" ${people==1?"selected='selected'":""}>1</option>
							<option value="2" ${people==2?"selected='selected'":""}>2</option>
							<option value="3" ${people==3?"selected='selected'":""}>3</option>
							<option value="4" ${people==4?"selected='selected'":""}>4</option>
							<option value="etc" ${people>=5?"selected='selected'":""}>직접입력</option>
						</select>
						<input type="text" name="people" id="selboxDirect" name="selboxDirect" class="b_set1" placeholder="명"
							${people>=5?"":"readonly='readonly'"} value="${people}" >
					</div>
					<div><button onclick="change();" class="btn btn_set btn-outline-primary">선택</button></div>
				</div>
				<input type="hidden" name="startDate" value="${startDate}">
				<input type="hidden" name="endDate" value="${endDate}">
				<input type="hidden" name="mhId" value="${lodging.mhId}">
			</form>

		</div>
		
<div class="room_content px-3 py-2 mt-3 bc_set" >
	<div>
		객실 리스트
	</div>
	
	<div class="tm_hr my-2"></div>
	
	<c:choose>
	<c:when test="${not empty room}">
	<c:forEach var="vo" items="${room}" varStatus="status">
	<div class="d-flex room_list">
		<div class="tm_wid35 " style="width: 31%">
			<img src="${pageContext.request.contextPath}/tmate/room/${vo.rphotoName}" onclick="roomInfo(${vo.roomNum});"
				class="card-img-top li_set" alt="..." style="height: 190px; border-radius: 15px;">
		</div>
		<div class="tm_wid65 pos_rel pb-4">
			<div>
				<ul class="my-3">
				  <li class="h3 li_set" onclick="roomInfo(${vo.roomNum});"><strong> ${vo.roomName}</strong></li>
				</ul>
			</div>
			<div class="text-secondary h6">
				기준 ${vo.roomPeople}명 / 최대 ${vo.roomMax_people}명
			</div>
			
			<div class="lodg_price">
				<div class="h4 text-black text-end me-4">${vo.price}원</div>
				<div>
					<ul class="my-3">
					  <li class="li_set  h5 text-end me-4" onclick="goReservation('${vo.roomNum}','${vo.roomPeople}')">예약하기</li>
					</ul>
				</div>
			</div>
		</div>
		</div>
		</c:forEach>
		</c:when>
		<c:otherwise>
			<b style="font-size: 30px;">예약 가능한 객실이 없습니다.</b>
		</c:otherwise>
		</c:choose>
	</div>
	
		
			
	<div class="room_content px-3 py-2 mt-2 bc_set">
		편의시설 및 서비스
		<div class="tm_hr my-2"></div>
		<div class="d-flex my-3">
				<c:if test="${fn:contains(lodging.lodgOption, '와이파이')}">
				<div class="tm-text-cen">
					<div><i class="fa-solid fa-wifi"></i></div>
					<div>와이파이</div>
				</div>
				</c:if>
				<c:if test="${fn:contains(lodging.lodgOption, '에어컨')}">
				<div class="tm-text-cen">
					<div><i class="fa-solid fa-snowflake"></i></div>
					<div>에어컨</div>
				</div>
				</c:if>
				<c:if test="${fn:contains(lodging.lodgOption, '조식')}">
				<div class="tm-text-cen">
					<div><i class="fa-solid fa-utensils"></i></div>
					<div>조식</div>
				</div>
				</c:if>
				<c:if test="${fn:contains(lodging.lodgOption, '드라이기')}">
				<div class="tm-text-cen">
					<div><i class="fa-solid fa-wind"></i></div>
					<div>드라이기</div>
				</div>
				</c:if>
				<c:if test="${fn:contains(lodging.lodgOption, '냉장고')}">
				<div class="tm-text-cen">
					<div><i class="fa-solid fa-utensils"></i></div>
					<div>냉장고</div>
				</div>
				</c:if>
				<c:if test="${fn:contains(lodging.lodgOption, '반려견동반')}">
				<div class="tm-text-cen">
					<div><i class="fa-solid fa-dog"></i></div>
					<div>반려견동반</div>
				</div>
				</c:if>
				<c:if test="${fn:contains(lodging.lodgOption, '카페')}">
				<div class="tm-text-cen">
					<div><i class="fa-solid fa-mug-saucer"></i></div>
					<div>카페</div>
				</div>
				</c:if>
				<c:if test="${fn:contains(lodging.lodgOption, '바베큐')}">
				<div class="tm-text-cen">
					<div><i class="fa-solid fa-bacon"></i></div>
					<div>바베큐</div>
				</div>
				</c:if>
				<c:if test="${fn:contains(lodging.lodgOption, '주차장')}">
				<div class="tm-text-cen">
					<div><i class="fa-solid fa-square-parking"></i></div>
					<div>주차장</div>
				</div>
				</c:if>
				<c:if test="${fn:contains(lodging.lodgOption, '조리')}">
				<div class="tm-text-cen">
					<div><i class="fa-solid fa-bowl-rice"></i></div>
					<div>조리가능</div>
				</div>
				</c:if>
		</div>
		
	</div>	
	
			
		
	<div class="room_content px-3 py-2 mt-2 bc_set">
		숙소 이용 규칙
		<div class="tm_hr my-3"></div>
	
		<div>
			체크인 시간 ${lodging.lodgCin_time}시
			체크아웃 시간 ${lodging.lodgCout_time}시
		</div>
		<div class="mb-3">
			${lodging.lodgContent1}
		</div>
	</div>	
		
	<div class="room_content px-3 py-2 mt-2 bc_set">
		기타 확인사항
		<div class="tm_hr my-2"></div>
		<div class="my-3">
			${lodging.lodgContent2}
		</div>
	</div>
	
	<div class="room_content px-3 py-2 mt-2 bc_set">
		<i class="bi bi-geo-alt-fill"></i> 주변 가볼만한 곳
		<div class="tm_hr my-2"></div>
		
		<div id="map" style="width:800px; height:400px; border-radius: 15px; "></div>
		
		<div class="tm_hr mt-2"></div>
		
		
		
	<div>
		<button type="button" class="w-100 mt-2" style="border: none; background: none;" data-bs-toggle="modal" data-bs-target="#hostInfo">
		 	<div>
			 	<div class="host_modal">
			 		호스트 정보
					 	<span>
					 		&gt;
					 	</span> 
			 	</div>
		 	</div>
		</button>
				
		
		<div class="modal fade" id="hostInfo" tabindex="-1" aria-labelledby="hostInfoLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-lg">
		    <div class="modal-content pos_rel">
		      <div class="d-flex">
		      	<div>
			        <h5 class="modal-title mt-3" id="reivewWriteLabel">호스트 정보</h5>
		      	</div>
		      	<div>
			        <button type="button" class="btn-close tm_right mt-1 me-1" data-bs-dismiss="modal" aria-label="Close"></button>
		     	</div>
		     </div>
		      <div class="modal-body d-flex p-4 w-100" id="hostmodal">
				<div class="tm_wid30 hostmodals text-center">
					<div>대표자명</div>
					<div>상호명</div>
					<div>사업자 주소</div>
					<div>이메일 주소</div>
					<div>연락처</div>
					<div>사업자등록번호</div>
				</div>
				<div class="tm_wid70 hostmodals">
					<div>${lodging.memberName}</div>
					<div>${lodging.lodgName}</div>
					<div>${lodging.mhAddr1}, ${lodging.mhAddr2}</div>
					<div>${lodging.memberEmail}</div>
					<div>${lodging.mhPhone}</div>
					<div>${lodging.mhNum}</div>
					</div>
			      </div>
			    </div>
			  </div>
			</div>
	</div>		
 </div>
	
	
	<div class="room_content px-3 py-2 mt-2 bc_set">
		리뷰
		<div class="tm_hr mt-2"></div>
		
		
		<div class="tm-text-cen">
			<div class="star-ratings">
				<div class="star-ratings-fill" style="width: ${total*20}%">
					<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
				</div>
				<div class="star-ratings-base">
					<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
				</div>
			</div>
			<div class="h4 mt-1">${total} <span class="text-secondary h6">/5</span></div>
		</div>
		
		
		<div class="my-3">
			<p class="text-secondary">관심 있는 키워드를 선택해서 후기를 살펴보세요.</p>
			<ul class="d-flex list-no review-cate my-2">
				<li onclick="search('all');">전체</li>
				<li onclick="search('clean');">청결 +</li> <!-- (깔끔, 깨끗, 청결, 위생, 더러, 더럽) -->
				<li onclick="search('service');">서비스 +</li> <!--(친절, 직원, 매너, 서비스) -->
				<li onclick="search('location');">위치 +</li> <!--(근처, 위치)-->
				<li onclick="search('loud');">소음 +</li> <!--(조용, 시끄러움, 소음) -->
				<li onclick="search('comfort');">편안함 +</li> <!--(편안, 편한, 쉼) -->
				<li onclick="search('wind');">난/냉방 +</li> <!--(난방 ,냉방) -->
			</ul>
			
		</div>
		<div id="roomReview"></div>
	</div>
	


 </div>
</div>

<script type="text/javascript">
function change() {
	const f = document.changeForm;
	let str;
	
	str = f.people.value;
	if ( !str ) {
		alert("인원을 선택 혹은 입력해주세요");
		return;
	}
    
	f.action = "${pageContext.request.contextPath}/reservation/roomlist";
	f.submit();
}

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data){
			fn(data);
		},
		beforeSend : function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error : function(jqXHR) {
			if (jqXHR.status === 403) {
				location.href="${pageContext.request.contextPath}/member/login";
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패했습니다.");
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

function roomInfo(value) {
	var dlg = $("roomInfo-dialog").dialog({
		  autoOpen: false,
		  modal: true,
		  height: 540,
		  width: 830,
		  close: function(event, ui) {
		  }
	});

	let url = "${pageContext.request.contextPath}/reservation/roomInfo";
	let query = "roomNum="+value;
	
	const fn = function(data){
		$('.modal-body').html(data);
		$("#myDialogModal").modal("show");
	};
	ajaxFun(url, "post", query, "html", fn);
}

$(function() {
	listPage(1, "all");
});

function listPage(page, option) {
	let url = "${pageContext.request.contextPath}/reservation/roomReview";
	let query = "mhId=${lodging.mhId}&pageNo="+page+"&option="+option;
	let selector = "#roomReview";
	
	const fn = function(data) {
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}

function search(value) {
	listPage(1, value);
}

function writeReview(value) {
	var dlg = $("writeReview-dialog").dialog({
		  autoOpen: false,
		  modal: true,
		  height: 540,
		  width: 830,
		  close: function(event, ui) {
		  }
	});

	let url = "${pageContext.request.contextPath}/reservation/writeReview";
	let query = "mhId="+value;
	
	const fn = function(data){
		$('.modal-body2').html(data);
		$("#reivewWrite").modal("show");
	};
	ajaxFun(url, "get", query, "html", fn);
}

$("input[name=rating]").click(function() {
    	var rating = $(this).val();
	alert(rating);
    
    $('#rating_result').text(rating);
    $('input[name=reviewrating]').val(rating);
    
  });	


// 날짜 구하기
var date = new Date();

var year = date.getFullYear();
var month = ('0' + (date.getMonth() + 1)).slice(-2);
var day = ('0' + date.getDate()).slice(-2);

var today =  year + '-' + month  + '-' + day;

var today = function() {
  document.write(today);
};


$("select[name=sel_people]").on("change", function(){
    var $addr = $(this).closest(".peopleform").find("input[name=people]");
    if ($(this).val() == "etc") {
        $addr.val('');
        $(this).closest(".peopleform").find("input[name=people]").focus();
        $addr.prop("readonly",false);

    } else {
        $addr.val($(this).val());
        $addr.prop("readonly",true);
    }
});


// 달력

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
 
});
  
$("#roomDate").on('show.daterangepicker', function (ev, picker) {
      $(".yearselect").css("float", "left");
      $(".monthselect").css("float", "right");
      $(".cancelBtn").css("float", "right");
});

$("#roomDate").change(function(){
	var ciDate = $(this).val().substr(0, 10);
	var coDate = $(this).val().substr(13, 10);
	
	$('input[name=startDate]').val(ciDate);
	$('input[name=endDate]').val(coDate);
});

function goReservation(roomNum, roomPeople) {
	let startDate = "${startDate}";
	let endDate = "${endDate}";

	location.href = "${pageContext.request.contextPath}/reservation/reservation?startDate="+startDate+"&endDate="+endDate+"&roomNum="+roomNum+"&roomPeople="+roomPeople;
}
</script>

<script>
// 맨 위 이미지 슬라이드
let slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6b5f3fcfb7cb246f1390e33c8725bd6c&libraries=services"></script>
<script type="text/javascript">
var mapContainer = document.getElementById('map');
var mapOption = {
	center: new kakao.maps.LatLng(${lodging.lodgLat}, ${lodging.lodgLon}),  // 지도의 중심좌표 : 위도(latitude), 경도(longitude)
	level: 7 
};

var map = new kakao.maps.Map(mapContainer, mapOption);

var geocoder = new kakao.maps.services.Geocoder();

var data = ${attraction};

$(function() {

	$(data.response.body.items.item).each(function(index, item){
		var subject = item.title;
		var addr = item.addr1;
		var dist = ((item.dist)/1000).toFixed(2);

		geocoder.addressSearch(addr, function(result, status) {

		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        var infowindow = new kakao.maps.InfoWindow({
		        	content:"<div class='marker-info'>"+subject+"("+dist+"km)</div>"
		        });

			    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));			        
		    } 
		});
		
	});
	
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}	
});

$(function(){

	$("#selboxDirect").hide();
	$("#sel_people").change(function() {

		if($("#sel_people").val() == "etc") {
			$("#selboxDirect").show();
		}  else {
			$("#selboxDirect").hide();
		}
	}) 
});
</script>
<div class="modal fade" id="myDialogModal" tabindex="-1" aria-labelledby="myDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-xl">
		<div class="modal-content pos_rel">
			<div class="modal-header">
				<h5 class="modal-title" id="myDialogModalLabel">객실 상세 보기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
			</div>
		</div>
	</div>
</div>