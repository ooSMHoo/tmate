<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reg_form.css" type="text/css">

<script type="text/javascript">
function lodgingOk() {
	const f = document.lodgingForm;
	let str;

	str = f.lodgName.value;
	if( ! str ) {
		alert("숙소이름을 입력해 주세요.");
		f.lodgName.focus();
		return;
	}
	
	if ($('input[name=lcNum]:checked').length < 1) {
	    alert("숙소유형을 선택해주세요.");
	    return;
	}
	
	<c:if test="${mode eq 'write'}">
	if( !f.selectFile.value ) {
		alert("숙소 사진을 등록해주세요.");
		f.selectFile.focus();
		return;
	}
	</c:if>
	
	<c:if test="${mode eq 'update'}">
	if( !f.selectFile.value ) {
		if ($('.delete-img').length == 0) {
			alert("숙소 사진을 등록해주세요.");
			f.selectFile.focus();
			return;
		}
	}
	</c:if>
	
	if ($('input[name=lodgOptionArr]:checked').length < 1) {
	    alert("편의 시설 서비스 안내를 선택해주세요.");
	    return;
	}
	
	str = f.lodgContent1.value;
	if( ! str ) {
		alert("숙소이용규칙을 입력해주세요.");
		f.lodgContent1.focus();
		return;
	}
	
	str = f.lodgContent2.value;
	if( ! str ) {
		alert("기타확인사항을 입력해주세요.");
		f.lodgContent2.focus();
		return;
	}
	
	if(f.start_month.value === "0") {
		alert("성수기 시작일을 선택해주세요.");
		return;
	}
	if(f.start_day.value === "0") {
		alert("성수기 시작일을 선택해주세요.");
		return;
	}
	if(f.end_month.value === "0") {
		alert("성수기 종료일을 선택해주세요.");
		return;
	}
	if(f.end_day.value === "0") {
		alert("성수기 종료일을 선택해주세요.");
		return;
	}

	str = f.lodgCin_time.value;
	if( !str ) {
		alert("체크인 시간을 입력해주세요.");
		f.lodgCin_time.focus();
		return;
	}
	if( !/^[0-9]*$/.test(str) ) {
		alert("체크인 시간은 숫자만 입력해주세요.");
		f.lodgCin_time.focus();
		return;
	}
	
	str = f.lodgCout_time.value;
	if( !str ) {
		alert("체크아웃 시간을 입력해주세요.");
		f.lodgCout_time.focus();
		return;
	}
	if( !/^[0-9]*$/.test(str) ) {
		alert("체크아웃 시간은 숫자만 입력해주세요.");
		f.lodgCout_time.focus();
		return;
	}
	
	let start_month = parseFloat(f.start_month.value);
	let start_day = parseFloat(f.start_day.value);
	let end_month = parseFloat(f.end_month.value);
	let end_day = parseFloat(f.end_day.value);
	if(start_month > end_month) {
		alert("성수기 종료일은 시작일보다 작을 수 없습니다.");
		return;
	} else if(start_month === end_month) {
		if (start_day > end_day){
			alert("성수기 종료일은 시작일보다 작을 수 없습니다.");
			return;
		}
	}
	
	

	if ("${mode}" === "write") {
		f.action = "${pageContext.request.contextPath}/host/lodging/add";
	} else if("${mode}" === "update") {
		f.action = "${pageContext.request.contextPath}/host/lodging/update";	
	}

	f.submit();
}

$(function() {
	var sel_files = [];
	
	$("body").on("click", ".tm_form .img-add", function(event){
		$("form[name=lodgingForm] input[name=selectFile]").trigger("click");
	});
	
	$("form[name=lodgingForm] input[name=selectFile]").change(function(){
		if(! this.files) {
			var dt = new DataTransfer();
			for(file of sel_files) {
				dt.items.add(file);
			}
			document.lodgingForm.selectFile.files = dt.files;
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
		document.lodgingForm.selectFile.files = dt.files;
	});
		
	$("body").on("click", ".tm_form .img-item", function(event) {
		if(! confirm("선택한 사진을 삭제 하시겠습니까 ?")) {
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
		document.lodgingForm.selectFile.files = dt.files;
		
		$(this).remove();
	});
});

<c:if test="${mode=='update'}">
	$(function() {
		$('input[name=lcNum]').each(function() {
			if (this.value == '${lodging.lcNum}') {
				$(this).attr("checked", "checked");
			}
		});
		
		$('select[name=start_month] option').each(function(){
		    if (this.value == '${lodging.start_month}') {
		        $(this).attr("selected", "true");
		    }
		});
		
		$('select[name=start_day] option').each(function(){
		    if (this.value == '${lodging.start_day}') {
		        $(this).attr("selected", "true");
		    }
		});
		
		$('select[name=end_month] option').each(function(){
		    if (this.value == '${lodging.end_month}') {
		        $(this).attr("selected", "true");
		    }
		});
		
		$('select[name=end_day] option').each(function(){
		    if (this.value == '${lodging.end_day}') {
		        $(this).attr("selected", "true");
		    }
		});
		
		$('input[name=lodgOptionArr]').each(function() {
			if ('${lodging.lodgOption}'.indexOf(this.value) !== -1) {
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
                숙소 정보 입력
            </div>
            <p> * 홈페이지 주소를 제외한 모든 사항은 필수입력사항입니다.</p>
            <form name="lodgingForm" method="post" enctype="multipart/form-data">
            <div class="tm_form">
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>숙소 이름</span>
                    </div>
                    <div class="tm_form_input_box">
                        <input type="text" name="lodgName" value="${lodging.lodgName}">
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>숙소 유형</span>
                    </div>
                    <div class="tm_form_input_box">
                        <label style="width: auto; margin-right: 20px;"><input type="radio" name="lcNum" value="1">호텔</label>
                        <label style="width: auto; margin-right: 20px;"><input type="radio" name="lcNum" value="2">모텔</label>
                        <label style="width: auto; margin-right: 20px;"><input type="radio" name="lcNum" value="3">펜션</label>
                        <label style="width: auto; margin-right: 20px;"><input type="radio" name="lcNum" value="4">게스트하우스</label>
                        <label style="width: auto; margin-right: 20px;"><input type="radio" name="lcNum" value="5">캠핑/글램핑</label>
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>숙소 사진 업로드 <br>(최소1장,최대15장)</span>
                    </div>
                    <div class="tm_form_input_box">
                        <div class="img-grid">
                        	<img class="item img-add rounded" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
                        	<c:if test="${mode=='update'}">
                        		<c:forEach var="vo" items="${photoList}">
                        			<img class="item rounded delete-img" src="${pageContext.request.contextPath}/tmate/lodging/${vo.lPhotoName}"
                        				data-fileNum="${vo.lPhotoNum}" data-fileName="${vo.lPhotoName}">
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
                        <span>편의 시설 서비스 안내 <br>(중복가능)</span>
                    </div>
                    <div class="tm_form_input_box">
                        <label><input type="checkbox" name="lodgOptionArr" value="와이파이">와이파이</label>
                        <label><input type="checkbox" name="lodgOptionArr" value="에어컨">에어컨</label>
                        <label><input type="checkbox" name="lodgOptionArr" value="조식">조식</label>
                        <label><input type="checkbox" name="lodgOptionArr" value="드라이기">드라이기</label>
                        <label><input type="checkbox" name="lodgOptionArr" value="냉장고">냉장고</label>
                        <label><input type="checkbox" name="lodgOptionArr" value="반려견동반">반려견동반</label>
                        <label><input type="checkbox" name="lodgOptionArr" value="카페">카페</label>
                        <label><input type="checkbox" name="lodgOptionArr" value="바베큐">바베큐</label>
                        <label><input type="checkbox" name="lodgOptionArr" value="주차장">주차장</label>
                        <label><input type="checkbox" name="lodgOptionArr" value="조리">조리가능여부</label>
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>숙소 이용 규칙</span>
                    </div>
                    <div class="tm_form_input_box">
                        <textarea class="tm_textarea" name="lodgContent1" rows="8" cols="60">${lodging.lodgContent1}</textarea>
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>기타 확인사항</span>
                    </div>
                    <div class="tm_form_input_box">
                        <textarea class="tm_textarea" name="lodgContent2" rows="8" cols="60">${lodging.lodgContent2}</textarea>
                    </div>
                </div>
                <div class="tm_form_list summer_date">
                    <div class="tm_form_lable_box">
                        <span>성수기 시작일, 종료일 설정</span>
                    </div>
                    <div class="tm_form_input_box">
                        <select class="tm_select_style small" name=start_month>
                        	<option value="0" ${mode=="write"?"selected='selected'":""}>::월선택::</option>
                        	<option value="07">07</option>
                        	<option value="08">08</option>
                        </select>
                        <span>월</span>
                        <select class="tm_select_style small" name=start_day>
                       		<option value="0" ${mode=="write"?"selected='selected'":""}>::일선택::</option>
                        	<option value="01">01</option>
                        	<option value="02">02</option>
                        	<option value="03">03</option>
                        	<option value="04">04</option>
                        	<option value="05">05</option>
                        	<option value="06">06</option>
                        	<option value="07">07</option>
                        	<option value="08">08</option>
                        	<option value="09">09</option>
                        	<option value="10">10</option>
                        	<option value="11">11</option>
                        	<option value="12">12</option>
                        	<option value="13">13</option>
                        	<option value="14">14</option>
                        	<option value="15">15</option>
                        	<option value="16">16</option>
                        	<option value="17">17</option>
                        	<option value="18">18</option>
                        	<option value="19">19</option>
                        	<option value="20">20</option>
                        	<option value="21">21</option>
                        	<option value="22">22</option>
                        	<option value="23">23</option>
                        	<option value="24">24</option>
                        	<option value="25">25</option>
                        	<option value="26">26</option>
                        	<option value="27">27</option>
                        	<option value="28">28</option>
                        	<option value="29">29</option>
                        	<option value="30">30</option>
                        	<option value="31">31</option>
                        </select>
                        <span>일</span>
                        <span>~</span>
                        <select class="tm_select_style small" name=end_month>
                        	<option value="0" selected="selected">::월선택::</option>
                        	<option value="07">07</option>
                        	<option value="08">08</option>
                        </select>
                        <span>월</span>
                        <select class="tm_select_style small" name=end_day>
                       		<option value="0" selected="selected">::일선택::</option>
                        	<option value="01">01</option>
                        	<option value="02">02</option>
                        	<option value="03">03</option>
                        	<option value="04">04</option>
                        	<option value="05">05</option>
                        	<option value="06">06</option>
                        	<option value="07">07</option>
                        	<option value="08">08</option>
                        	<option value="09">09</option>
                        	<option value="10">10</option>
                        	<option value="11">11</option>
                        	<option value="12">12</option>
                        	<option value="13">13</option>
                        	<option value="14">14</option>
                        	<option value="15">15</option>
                        	<option value="16">16</option>
                        	<option value="17">17</option>
                        	<option value="18">18</option>
                        	<option value="19">19</option>
                        	<option value="20">20</option>
                        	<option value="21">21</option>
                        	<option value="22">22</option>
                        	<option value="23">23</option>
                        	<option value="24">24</option>
                        	<option value="25">25</option>
                        	<option value="26">26</option>
                        	<option value="27">27</option>
                        	<option value="28">28</option>
                        	<option value="29">29</option>
                        	<option value="30">30</option>
                        	<option value="31">31</option>
                        </select>
                        <span>일</span>
                    </div>
                </div>
                <div class="tm_form_list phone_number">
                    <div class="tm_form_lable_box">
                        <span>체크인 시간, <br/>체크아웃 시간 설정 <br/>(0시~24시)</span>
                    </div>
                    <div class="tm_form_input_box">
	                    <div class="tm_form_input_inner">
	                    	<span>체크인 시간 : </span>
	                    	<input type="text" name="lodgCin_time" value="${lodging.lodgCin_time}">
	                    	<span>시</span>
	                    </div>
                        <div class="tm_form_input_inner">
	                    	<span>체크아웃 시간 : </span>
	                    	<input type="text" name="lodgCout_time" value="${lodging.lodgCout_time}">
	                    	<span>시</span>
	                    </div>
                                         
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>홈페이지 주소</span>
                    </div>
                    <div class="tm_form_input_box">
                        <input type="text" name="lodgPageAddr" value="${lodging.lodgPageAddr}">
                    </div>
                </div>
                <input type="hidden" name=lodgLat value="${lodging.lodgLat}">
                <input type="hidden" name=lodgLon value="${lodging.lodgLon}">   
            </div>
            </form>
        </div>
    </div>
    <div style="text-align: center; margin-top: 15px;">
    	<span style="color: red;">${message}</span>
    </div>

    <div class="tm_bottom">
        <div class="tm_btn_style large">취소하기</div>
        <div class="tm_btn_style large" onclick="lodgingOk();">${mode=='update'?'수정완료':'등록하기'}</div>
    </div>

</div>

<c:if test="${mode eq 'write'}">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e127a9fac584024a1564da7a8555ea94&libraries=services"></script>
<script type="text/javascript">
window.onload = function() {
	var geocoder = new kakao.maps.services.Geocoder();
	let juso = "${host.mhAddr1}";
	geocoder.addressSearch(juso, callback);
}

var callback = function(result, status) {
	if (status === kakao.maps.services.Status.OK) {
		$("input[name=lodgLon]").val(result[0].x);
		$("input[name=lodgLat]").val(result[0].y);
	}
	
};
</script>
</c:if>