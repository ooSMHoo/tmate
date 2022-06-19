<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reg_form.css" type="text/css">

<script type="text/javascript">
function roomOk() {
	const f = document.roomForm;
	let str;
	
	str = f.roomName.value;
	if (!str) {
		alert("객실이름을 입력해주세요.");
		f.roomName.focus();
		return;
	}
	
	if(f.rcNum.value === "0") {
		alert("객실유형을 선택해주세요.");
		return;
	}
	
	str = f.roomContent.value;
	if (!str) {
		alert("객실설명을 입력해주세요.");
		return;
	}
	
	<c:if test="${mode eq 'write'}">
	if (!f.selectFile.value) {
		alert("객실 사진을 등록해주세요.");
		return;
	}
	</c:if>
	
	<c:if test="${mode eq 'update'}">
	if( !f.selectFile.value ) {
		if ($('.delete-img').length == 0) {
			alert("객실 사진을 등록해주세요.");
			f.selectFile.focus();
			return;
		}
	}
	</c:if>
	
	if ($('input[name=roomOptionArr]:checked').length < 1) {
	    alert("객실 옵션을 선택해주세요.");
	    return;
	}
	
	str = f.roomWd_price.value;
	if (!str) {
		alert("평일 가격을 입력해주세요.");
		f.roomWd_price.focus();
		return;
	}
	
	if (!/^[0-9]*$/.test(str)) {
		alert("평일 가격은 숫자만 가능합니다.");
		f.roomWd_price.focus();
		return;
	}
	
	if (parseInt(str) % 10 !== 0) {
		alert("평일 가격은 10원 단위로만 설정 가능합니다.");
		f.roomWd_price.focus();
		return;
	}
	
	str = f.roomWe_price.value;
	if (!str) {
		alert("주말 가격을 입력해주세요.");
		f.roomWe_price.focus();
		return;
	}
	
	if (!/^[0-9]*$/.test(str)) {
		alert("주말 가격은 숫자만 가능합니다.");
		f.roomWe_price.focus();
		return;
	}
	
	if (parseInt(str) % 10 !== 0) {
		alert("주말 가격은 10원 단위로만 설정 가능합니다.");
		f.roomWe_price.focus();
		return;
	}
	
	str = f.roomSeasonPrice.value;
	if (!str) {
		alert("성수기 가격을 입력해주세요.");
		f.roomSeasonPrice.focus();
		return;
	}
	
	if (!/^[0-9]*$/.test(str)) {
		alert("성수기 가격은 숫자만 가능합니다.");
		f.roomSeasonPrice.focus();
		return;
	}
	
	if (parseInt(str) % 10 !== 0) {
		alert("성수기 가격은 10원 단위로만 설정 가능합니다.");
		f.roomSeasonPrice.focus();
		return;
	}
	
	str = f.roomPeople.value;
	if (!str) {
		alert("기준인원을 입력해주세요.");
		f.roomPeople.focus();
		return;
	}
	if(!/^[0-9]*$/.test(str)) {
		alert("기준인원은 숫자만 가능합니다.");
		f.roomPeople.focus();
		return;
	}
	
	str = f.roomMax_people.value;
	if (!str) {
		alert("최대인원을 입력해주세요.");
		f.roomMax_people.focus();
		return;
	}
	if(!/^[0-9]*$/.test(str)) {
		alert("최대인원은 숫자만 가능합니다.");
		f.roomMax_people.focus();
		return;
	}
	
	str = f.roomBed.value;
	if (!str) {
		alert("침대개수를 입력해주세요.");
		f.roomBed.focus();
		return;
	}
	if(!/^[0-9]*$/.test(str)) {
		alert("침대개수는 숫자만 가능합니다.");
		f.roomBed.focus();
		return;
	}
	
	if ("${mode}" === "write") {
		f.action = "${pageContext.request.contextPath}/host/rooms/add";
	} else if ("${mode}" === "update") {
		f.action = "${pageContext.request.contextPath}/host/rooms/${room.roomNum}/update?page=${page}&option=${option}";
	}
	
	f.submit();
}

$(function() {
	var sel_files = [];
	
	$("body").on("click", ".tm_form .img-add", function(event){
		$("form[name=roomForm] input[name=selectFile]").trigger("click");
	});
	
	$("form[name=roomForm] input[name=selectFile]").change(function(){
		if(! this.files) {
			var dt = new DataTransfer();
			for(file of sel_files) {
				dt.items.add(file);
			}
			document.roomForm.selectFile.files = dt.files;
	    	return false;
	    }
	    
		// 유사 배열을 배열로 변환
	    const fileArr = Array.from(this.files);
	    <c:choose>
			<c:when test="${mode eq 'write'}">
			if(sel_files.length+fileArr.length > 15) {
				alert("사진은 최대 15장까지 등록 가능합니다.");
				return false;
			}
			</c:when>
			<c:when test="${mode eq 'update'}">
			if(sel_files.length+fileArr.length+$('.delete-img').length > 15) {
				alert("사진은 최대 15장까지 등록 가능합니다.");
				return false;
			}
			</c:when>
		</c:choose>
		fileArr.forEach((file, index) => {
			sel_files.push(file);
			
			const reader = new FileReader();
			const $img = $("<img>", {class:"item img-item"});
			$img.attr("data-filename", file.name);
	        reader.onload = e => {
	        	$img.attr("src", e.target.result);
	        };
	        
	        reader.readAsDataURL(file);
	        $(".img-grid").append($img);
	    });
		
		var dt = new DataTransfer();
		for(file of sel_files) {
			dt.items.add(file);
		}
		document.roomForm.selectFile.files = dt.files;
	});
		
	$("body").on("click", ".tm_form .img-item", function(event) {
		if(! confirm("선택한 파일을 삭제 하시겠습니까 ?")) {
			return false;
		}
		
		var filename = $(this).attr("data-filename");
		
	    for(var i = 0; i < sel_files.length; i++) {
	    	if(filename === sel_files[i].name){
	    		sel_files.splice(i, 1);
	    		break;
			}
	    }
		
		var dt = new DataTransfer();
		for(file of sel_files) {
			dt.items.add(file);
		}
		document.roomForm.selectFile.files = dt.files;
		
		$(this).remove();
	});
});

<c:if test="${mode=='update'}">
$(function() {
	$('select[name=rcNum] option').each(function() {
		if (this.value == '${room.rcNum}') {
			$(this).attr("selected", "true");
		}
	});
	
	$('input[name=roomOptionArr]').each(function() {
		if ('${room.roomOption}'.indexOf(this.value) !== -1) {
			$(this).attr("checked", "checked");
		}
	});
});

$(function(){
	$(".delete-img").click(function(){
		if(! confirm("사진을 삭제 하시겠습니까 ?")) {
			return false;
		}
		var $img = $(this);
		var fileNum = $img.attr("data-fileNum");
		var fileName = $img.attr("data-fileName")
		$('#deleteimg').append("<input type='hidden' value='"+ fileNum +"' name='fileNum'>");
		$('#deleteimg').append("<input type='hidden' value='"+ fileName +"' name='fileName'>");
		$(this).remove();
	});
});
</c:if>
</script>

<div>
    <div class="tm_body">
        <div class="tm_form_wrap">
            <div class="tm_form_title">
                객실 정보 입력
            </div>
            <p> * 모든 입력 사항은 필수입력사항입니다.</p>
            <form name="roomForm" method="post" enctype="multipart/form-data">
            <div class="tm_form">
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>객실 이름</span>
                    </div>
                    <div class="tm_form_input_box">
                        <input type="text" name="roomName" value="${room.roomName}">
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>객실 유형</span>
                    </div>
                    <div class="tm_form_input_box">
                        <select class="tm_select_style large" name="rcNum">
                            <option value="0">::객실유형::</option>
                            <option value="1">혼성</option>
                            <option value="2">여성</option>
                            <option value="3">남성</option>
                            <option value="4">개인실</option>
                            <option value="5">독채</option>
                        </select>
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>객실 설명</span>
                    </div>
                    <div class="tm_form_input_box">
                        <textarea class="tm_textarea" rows="8" cols="60" name="roomContent">${room.roomContent}</textarea>
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>객실 사진 업로드<br>(최소1장,최대15장)</span>
                    </div>
                    <div class="tm_form_input_box">
                        <div class="img-grid">
                        	<img class="item img-add rounded" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
                        	<c:if test="${mode=='update'}">
                        		<c:forEach var="vo" items="${photoList}">
                        			<img class="item rounded delete-img" src="${pageContext.request.contextPath}/tmate/room/${vo.rPhotoName}"
                        				data-fileNum="${vo.rPhotoNum}" data-fileName="${vo.rPhotoName}">
                        		</c:forEach>
                        	</c:if>
                        </div>
                        <input type="file" name="selectFile" accept="image/*" multiple="multiple" style="display: none;" class="form-control">
                        <c:if test="${mode=='update'}">
	                        <div id="deleteimg">
	                        </div>
	                    </c:if>
                    </div>
                </div>
                <div class="tm_form_list option">
                    <div class="tm_form_lable_box">
                        <span>객실 옵션(다중 선택 가능)</span>
                    </div>
                    <div class="tm_form_input_box">
                        <label><input type="checkbox" name="roomOptionArr" value="욕조">욕조</label>
                        <label><input type="checkbox" name="roomOptionArr" value="컴퓨터">컴퓨터</label>
                        <label><input type="checkbox" name="roomOptionArr" value="수영장">수영장</label>
                        <label><input type="checkbox" name="roomOptionArr" value="세면도구">세면도구</label>
                        <label><input type="checkbox" name="roomOptionArr" value="주방">주방</label>
                        <label><input type="checkbox" name="roomOptionArr" value="세탁기">세탁기</label>
                        <label><input type="checkbox" name="roomOptionArr" value="넷플릭스">넷플릭스</label>
                        <label><input type="checkbox" name="roomOptionArr" value="바다뷰">바다뷰</label>
                        <label><input type="checkbox" name="roomOptionArr" value="도시뷰">도시뷰</label>
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>객실 가격 설정</span>
                    </div>
                    <div class="tm_form_input_box">
                    	<div class="tm_form_input_inner">
	                    	<span>평일가격(일~목) :  </span>
	                    	<input type="text" name="roomWd_price" style="width: 100px" value="${room.roomWd_price}">
	                    	<span>원</span>
	                    </div>
                        <div class="tm_form_input_inner">
	                    	<span>주말가격(금~토) :  </span>
	                    	<input type="text" name="roomWe_price" style="width: 100px" value="${room.roomWe_price}">
	                    	<span>원</span>
	                    </div>
	                    <div class="tm_form_input_inner">
	                    	<span>성수기가격(설정한 날짜) :  </span>
	                    	<input type="text" name="roomSeasonPrice" style="width: 100px" value="${room.roomSeasonPrice}">
	                    	<span>원</span>
	                    </div>
                    </div>
                </div>
                <div class="tm_form_list phone_number">
                    <div class="tm_form_lable_box">
                        <span>기준인원</span>
                    </div>
                    <div class="tm_form_input_box">
                        <input type="text" name="roomPeople" value="${room.roomPeople}"><span>명</span>
                    </div>
                </div>  
                <div class="tm_form_list phone_number">
                    <div class="tm_form_lable_box">
                        <span>최대인원</span>
                    </div>
                    <div class="tm_form_input_box">
                        <input type="text" name="roomMax_people" value="${room.roomMax_people}"><span>명</span>
                    </div>
                </div>  
                <div class="tm_form_list phone_number">
                    <div class="tm_form_lable_box">
                        <span>침대개수</span>
                    </div>
                    <div class="tm_form_input_box">
                        <input type="text" name="roomBed" value="${room.roomBed}"><span>개</span>
                    </div>
                </div>   
            </div>
            </form>
        </div>
    </div>
    
    <div class="tm_bottom">
        <div class="tm_btn_style large" onclick="location.href='${pageContext.request.contextPath}/hostPage/rooms?page=${page}&option=${option}';">취소하기</div>
        <div class="tm_btn_style large" onclick="roomOk();">${mode=='update'?'수정완료':'등록하기'}</div>
    </div>

</div>