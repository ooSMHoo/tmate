<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reg_form.css" type="text/css">

<script type="text/javascript">
function hostOk() {
	const f = document.hostForm;
	let str;
	
	str = f.mhPhone1.value;
	if( !str ) {
		alert("전화번호를 입력해주세요.");
		f.mhPhone1.focus();
		return;
	}
	
	if( !/^\d{3}$/.test(str) ) {
        alert("전화번호는 숫자만 가능합니다. ");
        f.tel2.focus();
        return;
    }
	
	str = f.mhPhone2.value;
	if( !str ) {
		alert("전화번호를 입력해주세요.");
		f.mhPhone2.focus();
		return;
	}
	
	if( !/^\d{3,4}$/.test(str) ) {
        alert("전화번호는 숫자만 가능합니다. ");
        f.mhPhone2.focus();
        return;
    }
	
	str = f.mhPhone3.value;
	if( !str ) {
		alert("전화번호를 입력해주세요.");
		f.mhPhone3.focus();
		return;
	}
	
	if( !/^\d{4}$/.test(str) ) {
        alert("전화번호는 숫자만 가능합니다. ");
        f.mhPhone3.focus();
        return;
    }
	
	str = f.mhName.value;
	if ( !str ) {
		alert("상호명을 입력해주세요.");
		f.mhName.focus();
		return;
	}
	
	str = f.mhNum.value;
	if ( !str ) {
		alert("사업자등록번호를 입력해주세요.");
		f.mhNum.focus();
		return;
	}
	
	str = f.mhAddr1.value;
	if ( !str ) {
		alert("기본 주소를 입력해주세요.");
		f.mhAddr1.focus();
		return;
	}
	
	str = f.mhAddr2.value;
	if ( !str ) {
		alert("상세 주소를 입력해주세요.");
		f.mhAddr2.focus();
		return;
	}
	
	str = f.mhAc_name.value;
	if ( !str ) {
		alert("예금주를 입력해주세요.")
		return;
	}
	
	str = f.mhAc_num.value;
	if ( !str ) {
		alert("계좌번호를 입력해주세요.")
		return;
	}
	
	str = f.mhNum.value;
	if( !/^\d{10}$/.test(str) ) {
		alert("사업자등록번호를 다시 입력하세요");
		f.mhNum.focus();
		return;
	}
	
	str = f.mhAc_name.value;
	if ( !/^[가-힣]{2,5}$/.test(str) ) {
		alert("예금주를 다시 입력하세요.");
		return;
	}
	
	str = f.mhAc_num.value;
	if ( !/^[0-9]*$/.test(str) ) {
		alert("계좌번호는 숫자만 가능합니다.");
		return;
	}
	
	if ("${mode}" === "write") {
		f.action = "${pageContext.request.contextPath}/hosts/add";
	} else if("${mode}" === "update") {
		f.action = "${pageContext.request.contextPath}/hosts/${member.memberId}";	
	}
	
    f.submit();
}

function changeBank() {
	let val = $('select[name=bankNum]').val();
	if(val !== "0") {
		$('input[name=mhAc_name]').attr("readonly", false);
		$('input[name=mhAc_num]').attr("readonly", false);
		$('input[name=mhAc_name]').focus();
	} else if (val === "0"){
		$('input[name=mhAc_name]').attr("readonly", true);
		$('input[name=mhAc_num]').attr("readonly", true);
		$('input[name=mhAc_name]').val("");
		$('input[name=mhAc_num]').val("");
		$('input[name=mhAc_name]').blur();
		$('input[name=mhAc_num]').blur();
	}
}
</script>

<div>
	<form name="hostForm" method="post">
    <div class="tm_body">
        <div class="tm_form_wrap">
            <div class="tm_form_title">
                호스트 정보
            </div>
            <div class="tm_form">
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>이메일</span>
                    </div>
                    <div class="tm_form_input_box">
                        <span>${member.memberEmail}</span>
                    </div>
                </div>
                <div class="tm_form_list phone_number">
                    <div class="tm_form_lable_box">
                        <span>전화번호</span>
                    </div>
                    <div class="tm_form_input_box">
                        <input type="text" maxlength="3" name="mhPhone1">
                        <input type="text" maxlength="4" name="mhPhone2">
                        <input type="text" maxlength="4" name="mhPhone3">
                    </div>
                </div>       
            </div>
        </div>
    
        <div class="tm_form_wrap">
            <div class="tm_form_title">
                사업자 등록 정보
            </div>
        
            <div class="tm_form">
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>상호명 (법인명)</span>
                    </div>
                    <div class="tm_form_input_box">
                        <input type="text" name="mhName" placeholder="상호명을 입력해주세요">
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>사업자등록번호</span>
                    </div>
                    <div class="tm_form_input_box">
                        <input type="text" name="mhNum" placeholder="사업자등록번호를 입력해주세요('-'를 제외한 숫자만 입력해주세요)" maxlength="10">
                    </div>
                </div>    
                <div class="tm_form_list address">
                    <div class="tm_form_lable_box">
                        <span>업체주소</span>
                    </div>
                    <div class="tm_form_input_box">
                        <input id="addr1" type="text" name="mhAddr1" placeholder="기본 주소" value="" readonly="readonly">
                        <button class="tm_btn_style small" type="button" onclick="daumPostcode();" style="background: white;">주소검색</button>
                        <input id="addr2" type="text" name="mhAddr2" placeholder="상세주소를 입력해주세요">
                        <input type="hidden" id="zip" name="mhZip" value="">
                    </div>
                </div>    
            </div>
        </div>
    
        <div class="tm_form_wrap">
            <div class="tm_form_title">
                입금 계좌 정보
            </div>
        
            <div class="tm_form">
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>거래은행</span>
                    </div>
                    <div class="tm_form_input_box">
                        <select class="tm_select_style large" name="bankNum" onchange="changeBank();">
                            <option value="0">::은행선택::</option>
                            <option value="1">하나은행</option>
                            <option value="2">SC제일은행</option>
                            <option value="3">국민은행</option>
                            <option value="4">신한은행</option>
                            <option value="5">외환은행</option>
                            <option value="6">우리은행</option>
                            <option value="7">한국시티은행</option>
                        </select>
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>예금주</span>
                    </div>
                    <div class="tm_form_input_box">
                        <input type="text" name="mhAc_name" placeholder="예금주명을 입력해주세요" readonly="readonly">
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>계좌번호</span>
                    </div>
                    <div class="tm_form_input_box">
                        <input type="text" name="mhAc_num" placeholder="숫자만 입력해주세요" readonly="readonly">
                    </div>
                </div>       
            </div>
        </div>
    
    </div>
    <div style="text-align: center; margin-top: 15px;">
    	<span style="color: red;">${message}</span>
    </div>

    <div class="tm_bottom">
        <div class="tm_btn_style large" onclick="location.href='${pageContext.request.contextPath}/';">취소하기</div>
        <div class="tm_btn_style large" onclick="hostOk();">신청하기</div>
    </div>
	</form>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function daumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				var fullAddr = '';
				var extraAddr = '';
				
				if (data.userSelectedType === 'R') {
					fullAddr = data.roadAddress;
				} else {
					fullAddr = data.jibunAddress;
				}
				
				if (data.userSelectedType === 'R') {
					if(data.bname !== '') {
						extraAddr += data.bname;
					}
					
					if(data.buildingName !== '') {
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					
					fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
				}
				
				document.getElementById('zip').value = data.zonecode;
				document.getElementById('addr1').value = fullAddr;
				
				document.getElementById('addr2').focus();
			}
		}).open();
	}
</script>
