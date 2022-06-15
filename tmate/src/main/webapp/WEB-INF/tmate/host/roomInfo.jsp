<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reg_form.css" type="text/css">

<div>
    <div class="tm_body">
        <div class="tm_form_wrap">
            <div class="tm_form_title">
                객실 정보
            </div>
            <div class="tm_form">
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>객실 이름</span>
                    </div>
                    <div class="tm_form_input_box">
                        <span>${room.roomName}</span>
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>객실 유형</span>
                    </div>
                    <div class="tm_form_input_box">
                        <span>${roomCategory}</span>
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>객실 설명</span>
                    </div>
                    <div class="tm_form_input_box">
                        <span>${room.roomContent}</span>
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>객실 사진</span>
                    </div>
                    <div class="tm_form_input_box">
                        <div class="img-grid">
                        	<c:forEach var="vo" items="${photoList}">
                        		<img class="item img-add rounded" src="${pageContext.request.contextPath}/tmate/room/${vo.rPhotoName}">
                        	</c:forEach>
                        </div>
                    </div>
                </div>
                <div class="tm_form_list option">
                    <div class="tm_form_lable_box">
                        <span>객실 옵션</span>
                    </div>
                    <div class="tm_form_input_box">
                        <label><input type="checkbox" name="roomOptionArr" disabled="disabled" value="욕조" ${fn:indexOf(room.roomOption,"욕조")!=-1?"checked='checked'":""}>욕조</label>
                        <label><input type="checkbox" name="roomOptionArr" disabled="disabled" value="컴퓨터" ${fn:indexOf(room.roomOption,"컴퓨터")!=-1?"checked='checked'":""}>컴퓨터</label>
                        <label><input type="checkbox" name="roomOptionArr" disabled="disabled" value="수영장" ${fn:indexOf(room.roomOption,"수영장")!=-1?"checked='checked'":""}>수영장</label>
                        <label><input type="checkbox" name="roomOptionArr" disabled="disabled" value="세면도구" ${fn:indexOf(room.roomOption,"세면도구")!=-1?"checked='checked'":""}>세면도구</label>
                        <label><input type="checkbox" name="roomOptionArr" disabled="disabled" value="주방" ${fn:indexOf(room.roomOption,"주방")!=-1?"checked='checked'":""}>주방</label>
                        <label><input type="checkbox" name="roomOptionArr" disabled="disabled" value="세탁기" ${fn:indexOf(room.roomOption,"세탁기")!=-1?"checked='checked'":""}>세탁기</label>
                        <label><input type="checkbox" name="roomOptionArr" disabled="disabled" value="넷플릭스" ${fn:indexOf(room.roomOption,"넷플릭스")!=-1?"checked='checked'":""}>넷플릭스</label>
                        <label><input type="checkbox" name="roomOptionArr" disabled="disabled" value="바다뷰" ${fn:indexOf(room.roomOption,"바다뷰")!=-1?"checked='checked'":""}>바다뷰</label>
                        <label><input type="checkbox" name="roomOptionArr" disabled="disabled" value="도시뷰" ${fn:indexOf(room.roomOption,"도시뷰")!=-1?"checked='checked'":""}>도시뷰</label>
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>객실 가격</span>
                    </div>
                    <div class="tm_form_input_box">
                    	<div class="tm_form_input_inner">
	                    	<span>평일가격(일~목) : ${room.roomWd_price}원</span>
	                    </div>
                        <div class="tm_form_input_inner">
	                    	<span>주말가격(금~토) :  ${room.roomWe_price}원</span>
	                    </div>
	                    <div class="tm_form_input_inner">
	                    	<span>성수기가격(설정한 날짜) :  ${room.roomSeasonPrice}원</span>
	                    </div>
                    </div>
                </div>
                <div class="tm_form_list phone_number">
                    <div class="tm_form_lable_box">
                        <span>기준인원</span>
                    </div>
                    <div class="tm_form_input_box">
                        <span>${room.roomPeople}명</span>
                    </div>
                </div>  
                <div class="tm_form_list phone_number">
                    <div class="tm_form_lable_box">
                        <span>최대인원</span>
                    </div>
                    <div class="tm_form_input_box">
                        <span>${room.roomMax_people}명</span>
                    </div>
                </div>  
                <div class="tm_form_list phone_number">
                    <div class="tm_form_lable_box">
                        <span>침대개수</span>
                    </div>
                    <div class="tm_form_input_box">
                        <span>${room.roomBed}개</span>
                    </div>
                </div>   
            </div>
        </div>
    </div>
    
    <div class="tm_bottom">
        <div class="tm_btn_style large" onclick="location.href='${pageContext.request.contextPath}/rooms/${room.roomNum}/update';">수정하기</div>
    </div>

</div>