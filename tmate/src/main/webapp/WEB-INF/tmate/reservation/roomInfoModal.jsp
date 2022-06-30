<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			


<div class="d-flex w-800 shadow-sm" style="height: 500px">
<div class="w-75 h-100 room_slide" style="background: black">


<div class="slider slider-1">
    <div class="slides">
    	<c:forEach var="vo" items="${roomPhoto}" varStatus="status">
        <div class="${status.count==1?'active':''}"><img src="${pageContext.request.contextPath}/tmate/room/${vo.rphotoName}"></div>
        </c:forEach>
    </div>
    
    <div class="pages">
        <c:forEach var="vo" items="${roomPhoto}" varStatus="status">
        <div class="${status.count==1?'active':''}"><img src="${pageContext.request.contextPath}/tmate/room/${vo.rphotoName}"></div>
        </c:forEach>
    </div>
    
    <div class="side-btns">
        <div><div class="slider-prenext">&lt;</div></div>
        <div><div class="slider-prenext">&gt;</div></div>
    </div>
</div>
		
</div>
<div class="w-25">
	<div class="room_detail_modal shadow-sm " style="height: 100%; overflow-y: auto;">
	
		<div>
			<div><strong> [${room.roomName}] </strong></div>
		</div>	
		<div>
			<div>객실 유형</div>
			<c:if test="${room.rcNum==1}">
			<div>혼성</div>
			</c:if>
			<c:if test="${room.rcNum==2}">
			<div>여성</div>
			</c:if>
			<c:if test="${room.rcNum==3}">
			<div>남성</div>
			</c:if>
			<c:if test="${room.rcNum==4}">
			<div>개인실</div>
			</c:if>
			<c:if test="${room.rcNum==5}">
			<div>독채</div>
			</c:if>
		</div>				
									
		<div>
			<div>객실 정원</div>
			<div><i class="fa-solid fa-person-circle-check"></i> 적정인원 : ${room.roomPeople}명</div>
			<div><i class="fa-solid fa-person-circle-exclamation"></i> 최대인원 : ${room.roomMax_people}명</div>
		</div>
		<div>
			<div>객실 구성</div>
			<div><i class="fa-solid fa-bed"></i> 침대 ${room.roomBed}개</div>
			<c:if test="${fn:contains(room.roomOption, '주방')}">
				<div><i class="fa-solid fa-kitchen-set"></i> 주방</div>
			</c:if>
			<c:if test="${fn:contains(room.roomOption, '수영장')}">
				<div><i class="fa-solid fa-person-swimming"></i> 수영장</div>
			</c:if>
		</div>
		<div>
			<div>욕실 및 세면 도구</div>
			<c:if test="${fn:contains(room.roomOption, ' 욕조')}">
				<div><i class="fa-solid fa-bath"></i>욕조</div>
			</c:if>
			<c:if test="${fn:contains(room.roomOption, ' 세면도구')}">
				<div><i class="fa-solid fa-hands-bubbles"></i> 세면 도구</div>
			</c:if>
			<div><i class="fa-solid fa-grip-lines"></i> 타월</div>
		</div>
		<div>
			<div>편의 시설/용품</div>
			<c:if test="${fn:contains(room.roomOption, ' 넷플릭스')}">
				<div><i class="fa-solid fa-tv"></i> 넷플릭스</div>
			</c:if>
			<c:if test="${fn:contains(room.roomOption, ' 컴퓨터')}">
				<div><i class="fa-solid fa-computer"></i> 컴퓨터</div>
			</c:if>
			<c:if test="${fn:contains(room.roomOption, ' 세탁기')}">
				<div><i class="fa-solid fa-socks"></i> 세탁기</div>
			</c:if>
		</div>
		<div>
			<c:if test="${fn:contains(room.roomOption, ' 뷰')}">
			<div>객실 전망</div>
			</c:if>
			<c:if test="${fn:contains(room.roomOption, ' 바다뷰')}">
				<div><i class="fa-solid fa-water"></i> 바다뷰</div>
			</c:if>
			<c:if test="${fn:contains(room.roomOption, ' 도시뷰')}">
				<div><i class="fa-solid fa-mountain-city"></i> 도시뷰</div>
			</c:if>
		</div>
		<div class="mb-2">
			<div>안전 및 보안 시설</div>
			<div><i class="fa-solid fa-land-mine-on"></i> 화재 경보기</div>
			<div><i class="fa-solid fa-fire-extinguisher"></i> 소화기</div>
			<div><i class="fa-solid fa-building-shield"></i> 완강기</div>
		</div>
		
	</div>
	<div class="pos_rel text-secondary mt-4" style="height: 15%;">
		<div class="lodg_price">1박(평일) / ${room.roomWd_price}원<br>1박(주말) / ${room.roomWe_price}원<br>1박(성수기) / ${room.roomSeasonPrice}원</div>
		</div>
	
</div>
</div>
<div class="w-100" style="height: 120px">
		<div style="width: 95%; height: 80%;">
		</div>
</div>
<script type="text/javascript">
$(function() {
	$('.slider > .pages > div').click(function() {
	    let $this = $(this);
	    let $slider = $this.closest('.slider');
	    
	    $this.addClass('active');
	    $this.siblings('.active').removeClass('active');
	    
	    let index = $this.index();
	    
	    $slider.find(' > .slides > .active').removeClass('active');
	    $slider.find(' > .slides > div').eq(index).addClass('active');
	});


	$('.slider > .side-btns > div').click(function() {
	    let $this = $(this);
	    let index = $this.index();

	    let $slider = $this.closest('.slider');
	    
	    let $current = $slider.find('.pages > div.active');
	    let $post;
	    
	    if ( index == 0 ) {
	        $post = $current.prev();
	    }
	    else {
	        $post = $current.next();
	    }
	    
	    if ( $post.length == 0 ) {
	        if ( index == 0 ) {
	            $post = $slider.find('.pages > div:last-child');
	        }
	        else {
	            $post = $slider.find('.pages > div:first-child');
	        }
	    }
	    
	    $post.click();
	});
});

</script>

