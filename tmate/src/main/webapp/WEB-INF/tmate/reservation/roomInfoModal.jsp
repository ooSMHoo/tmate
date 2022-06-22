<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			

<div class="modal-body d-flex w-100 shadow-sm" style="height: 500px">
<div class="w-75 h-100 room_slide" style="background: black">


	<div class="slider slider-1">
	    <div class="slides">
	        <div class="active"><img src=""></div>
			<div><img src=""></div>
	        <div><img src=""></div>
	        <div><img src=""></div>
	    </div>
	    
	    <div class="pages">
	        <div class="active"><img src=""></div>
	        <div><img src=""></div>
	        <div><img src=""></div>
	        <div><img src=""></div>
	    </div>
	    
	    <div class="side-btns">
	        <div><div class="slider-prenext">&lt;</div></div>
	        <div><div class="slider-prenext">&gt;</div></div>
	    </div>
	</div>
		
</div>
<div class="w-25">
	<div class="room_detail_modal shadow-sm" style="height: 85%; overflow-y: auto;">
	
		<div>
			<div>객실 이름</div>
		</div>
		<div>
			<div>숙소 공용 시설 / 서비스</div>
			<div><i class="fa-solid fa-square-parking"></i>주차장 L</div>
			<div><i class="fa-solid fa-mug-saucer"></i>카페 L</div>
			<div><i class="fa-solid fa-fire-burner"></i>바베큐L</div>
			<div><i class="fa-solid fa-utensils"></i>조식 L</div>
			<div><i class="fa-solid fa-dog"></i>반려견 동반 가능 / 불가 L</div>
			<div><i class="fa-solid fa-bowl-food"></i>조리 가능 / 불가 L</div>
		</div>													
		<div>
			<div>객실 정원</div>
			<div><i class="fa-solid fa-person-circle-check"></i>적정인원 : X명</div>
			<div><i class="fa-solid fa-person-circle-exclamation"></i>최대인원 : X명</div>
		</div>
		<div>
			<div>객실 구성</div>
			<div><i class="fa-solid fa-bed"></i>침대 O개</div>
			<div><i class="fa-solid fa-shower"></i>샤워실</div>
			<div><i class="fa-solid fa-kitchen-set"></i>주방r</div>
			<div><i class="fa-solid fa-person-swimming"></i>수영장r</div>
		</div>
		<div>
			<div>욕실 및 세면 도구</div>
			<div><i class="fa-solid fa-bath"></i>욕조r</div>
			<div><i class="fa-solid fa-hands-bubbles"></i>세면 도구r</div>
			<div><i class="fa-solid fa-grip-lines"></i>타월</div>
			<div><i class="fa-solid fa-fan"></i>헤어드라이기 L</div>
		</div>
		<div>
			<div>편의 시설/용품</div>
			<div><i class="fa-solid fa-wifi"></i>무료 Wi-Fi L</div>
			<div><i class="fa-solid fa-tv"></i>넷플릭스r</div>
			<div><i class="fa-solid fa-computer"></i>컴퓨터r</div>
			<div><i class="fa-solid fa-socks"></i>세탁기r</div>
			<div><i class="fa-brands fa-hotjar"></i>난방</div>
			<div><i class="fa-solid fa-bolt"></i>전자레인지</div>
			<div><i class="fa-regular fa-snowflake"></i>냉장고 L</div>
			<div><i class="fa-solid fa-wind"></i>에어컨 L</div>
		</div>
		<div>
			<div>객실 전망</div>
			<div><i class="fa-solid fa-water"></i>바다뷰r</div>
			<div><i class="fa-solid fa-mountain-city"></i>도시뷰r</div>
		</div>
		<div>
			<div>안전 및 보안 시설</div>
			<div><i class="fa-solid fa-land-mine-on"></i>화재 경보기</div>
			<div><i class="fa-solid fa-fire-extinguisher"></i>소화기</div>
			<div><i class="fa-solid fa-building-shield"></i>완강기</div>
		</div>
	</div>
	<div class="pos_rel" style="height: 15%;">
		<div class="lodg_price">1박(평일) / OOO,OOO원</div>
	</div>
</div>
</div>
<div class="w-100" style="height: 120px">
		<div style="width: 95%; height: 80%;">
		</div>
</div>
<script type="text/javascript">
$('.slider > .pages > div').click(function() {
    var $this = $(this);
    var $slider = $this.closest('.slider');
    
    $this.addClass('active');
    $this.siblings('.active').removeClass('active');
    
    var index = $this.index();
    
    $slider.find(' > .slides > .active').removeClass('active');
    $slider.find(' > .slides > div').eq(index).addClass('active');
});


$('.slider > .side-btns > div').click(function() {
    var $this = $(this);
    var index = $this.index();
    var $slider = $this.closest('.slider');
    
    var $current = $slider.find('.pages > div.active');
    var $post;
    
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
</script>