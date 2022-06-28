<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reg_form.css" type="text/css">
<script type="text/javascript">
$(function() {
	$('input[name=lodgOptionArr]').each(function() {
		if ('${lodging.lodgOption}'.indexOf(this.value) !== -1) {
			$(this).attr("checked", "checked");
		}
	});
});
</script>

<div>
    <div class="tm_body">
        <div class="tm_form_wrap">
            <div class="tm_form_title">
                숙소 정보
            </div>
            <div class="tm_form">
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>숙소 이름</span>
                    </div>
                    <div class="tm_form_input_box">
                        <span>${lodging.lodgName}</span>
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>숙소 유형</span>
                    </div>
                    <div class="tm_form_input_box">
  						<span>${lodgingCategory}</span>
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>숙소 사진</span>
                    </div>
                    <div class="tm_form_input_box">
                        <div class="img-grid">
                        	<c:forEach var="vo" items="${photoList}">
                        		<img class="item img-add rounded" src="${pageContext.request.contextPath}/tmate/lodging/${vo.lPhotoName}">
                        	</c:forEach>
                        </div>
                    </div>
                </div>
                <div class="tm_form_list option">
                    <div class="tm_form_lable_box">
                        <span>편의 시설 서비스</span>
                    </div>
                    <div class="tm_form_input_box">
                        <label><input type="checkbox" name="lodgOptionArr" disabled="disabled" value="와이파이">와이파이</label>
                        <label><input type="checkbox" name="lodgOptionArr" disabled="disabled" value="에어컨">에어컨</label>
                        <label><input type="checkbox" name="lodgOptionArr" disabled="disabled" value="조식">조식</label>
                        <label><input type="checkbox" name="lodgOptionArr" disabled="disabled" value="드라이기">드라이기</label>
                        <label><input type="checkbox" name="lodgOptionArr" disabled="disabled" value="냉장고">냉장고</label>
                        <label><input type="checkbox" name="lodgOptionArr" disabled="disabled" value="반려견동반">반려견동반</label>
                        <label><input type="checkbox" name="lodgOptionArr" disabled="disabled" value="카페">카페</label>
                        <label><input type="checkbox" name="lodgOptionArr" disabled="disabled" value="바베큐">바베큐</label>
                        <label><input type="checkbox" name="lodgOptionArr" disabled="disabled" value="주차장">주차장</label>
                        <label><input type="checkbox" name="lodgOptionArr" disabled="disabled" value="조리">조리가능여부</label>
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>숙소 이용 규칙</span>
                    </div>
                    <div class="tm_form_input_box">
                        <span>${lodging.lodgContent1}</span>
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>기타 확인사항</span>
                    </div>
                    <div class="tm_form_input_box">
                        <span>${lodging.lodgContent2}</span>
                    </div>
                </div>
                <div class="tm_form_list summer_date">
                    <div class="tm_form_lable_box">
                        <span>성수기 시작일, 종료일</span>
                    </div>
                    <div class="tm_form_input_box">
                        <div><span>성수기 시작일 : ${lodging.lodgStart_date}</span></div>
                        <div><span>성수기 종료일 : ${lodging.lodgEnd_date}</span></div>
                    </div>
                </div>
                <div class="tm_form_list phone_number">
                    <div class="tm_form_lable_box">
                        <span>체크인 시간, <br/>체크아웃 시간</span>
                    </div>
                    <div class="tm_form_input_box">
	                    <div class="tm_form_input_inner">
	                    	<span>체크인 시간 : ${lodging.lodgCin_time}</span>
	                    </div>
                        <div class="tm_form_input_inner">
	                    	<span>체크아웃 시간 : ${lodging.lodgCout_time}</span>
	                    </div>
                                         
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>홈페이지 주소</span>
                    </div>
                    <div class="tm_form_input_box">
                        <span>${lodging.lodgPageAddr==null?"없음":lodging.lodgPageAddr}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="tm_bottom">
    	<div class="tm_btn_style large" onclick="location.href='${pageContext.request.contextPath}/hostPage/home'">호스트페이지로</div>
        <div class="tm_btn_style large" onclick="location.href='${pageContext.request.contextPath}/host/lodging/update'">수정하기</div>
    </div>

</div>