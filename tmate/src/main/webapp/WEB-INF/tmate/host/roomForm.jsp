<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reg_form.css" type="text/css">

<script type="text/javascript">
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
	    if(sel_files.length+fileArr.length > 15) {
			alert("사진은 최대 15장까지 등록 가능합니다.");
			return false;
		}
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
                        <input id="" type="text" name="">
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>객실 유형</span>
                    </div>
                    <div class="tm_form_input_box">
                        <select class="tm_select_style large">
                            <option value="">::객실유형::</option>
                            <option value="혼성">혼성</option>
                            <option value="여성">여성</option>
                            <option value="남성">남성</option>
                            <option value="개인실">개인실</option>
                            <option value="독채">독채</option>
                        </select>
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>객실 설명</span>
                    </div>
                    <div class="tm_form_input_box">
                        <textarea class="tm_textarea" rows="8" cols="60"></textarea>
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>객실 사진 업로드(최대15장)</span>
                    </div>
                    <div class="tm_form_input_box">
                        <div class="img-grid"><img class="item img-add rounded" src="${pageContext.request.contextPath}/resources/images/add_photo.png"></div>
                        <input type="file" name="selectFile" accept="image/*" multiple="multiple" style="display: none;" class="form-control">
                    </div>
                </div>
                <div class="tm_form_list option">
                    <div class="tm_form_lable_box">
                        <span>객실 옵션</span>
                    </div>
                    <div class="tm_form_input_box">
                        <label><input type="checkbox" name="option" value="와이파이">와이파이</label>
                        <label><input type="checkbox" name="option" value="에어컨">에어컨</label>
                        <label><input type="checkbox" name="option" value="조식">조식</label>
                        <label><input type="checkbox" name="option" value="드라이기">드라이기</label>
                        <label><input type="checkbox" name="option" value="반려견동반">반려견동반</label>
                        <label><input type="checkbox" name="option" value="카페">카페</label>
                        <label><input type="checkbox" name="option" value="바베큐">바베큐</label>
                        <label><input type="checkbox" name="option" value="주차장">주차장</label>
                        <label><input type="checkbox" name="option" value="조리">조리가능여부</label>
                        <label><input type="checkbox" name="option" value="냉장고">냉장고</label>
                        <label><input type="checkbox" name="option" value="바다뷰">바다뷰</label>
                        <label><input type="checkbox" name="option" value="도시뷰">도시뷰</label>
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>객실 가격 설정</span>
                    </div>
                    <div class="tm_form_input_box">
                    	<div class="tm_form_input_inner">
	                    	<span>평일가격(일~목) :  </span>
	                    	<input id="" type="text" name="" style="width: 100px">
	                    	<span>원</span>
	                    </div>
                        <div class="tm_form_input_inner">
	                    	<span>주말가격(금~토) :  </span>
	                    	<input id="" type="text" name="" style="width: 100px">
	                    	<span>원</span>
	                    </div>
	                    <div class="tm_form_input_inner">
	                    	<span>성수기가격(설정한 날짜) :  </span>
	                    	<input id="" type="text" name="" style="width: 100px">
	                    	<span>원</span>
	                    </div>
                    </div>
                </div>
                <div class="tm_form_list phone_number">
                    <div class="tm_form_lable_box">
                        <span>침대개수</span>
                    </div>
                    <div class="tm_form_input_box">
                        <input id="" type="text" name=""><span>개</span>
                    </div>
                </div>   
            </div>
            </form>
        </div>
    </div>
    
    <div class="tm_bottom">
        <div class="tm_btn_style large">취소하기</div>
        <div class="tm_btn_style large">등록하기</div>
    </div>

</div>