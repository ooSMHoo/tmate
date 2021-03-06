<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css" type="text/css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<script type="text/javascript">
$(document).ready(function() {
	$('.pwd-1').show();
	$('.pwd-option').hide();
	$('.btn-info-pwd').click(function() {
		$('.pwd-1').hide();
		$('.pwd-option').fadeIn(800); 
		return false;
	});
	$('.option-btn-pwd').click(function() {
		$('.pwd-option').hide(); 
		$('.pwd-1').show();
		return false;
	});
});

$(document).ready(function() {
	$('.birth').show();
	$('.birth-option').hide();
	$('.btn-info-birth').click(function() {
		$('.birth').hide();
		$('.birth-option').fadeIn(800); 
		return false;
	});
	$('.option-btn-birth').click(function() {
		$('.birth-option').hide(); 
		$('.birth').show();
		return false;
	});
});

$(document).ready(function() {
	$('.email').show();
	$('.email-option').hide();
	$('.btn-info-email').click(function() {
		$('.email').hide();
		$('.email-option').fadeIn(800); 
		return false;
	});
	$('.option-btn-email').click(function() {
		$('.email-option').hide(); 
		$('.email').show();
		return false;
	});
});

$(document).ready(function() {
	$('.name').show();
	$('.name-option').hide();
	$('.btn-info-name').click(function() {
		$('.name').hide();
		$('.name-option').fadeIn(800); 
		return false;
	});
	$('.option-btn-name').click(function() {
		$('.name-option').hide(); 
		$('.name').show();
		return false;
	});
});

$(document).ready(function() {
	$('.phone').show();
	$('.phone-option').hide();
	$('.btn-info-phone').click(function() {
		$('.phone').hide();
		$('.phone-option').fadeIn(800); 
		return false;
	});
	$('.option-btn-phone').click(function() {
		$('.phone-option').hide(); 
		$('.phone').show();
		return false;
	});
});


// ????????? ??????
function update_name(){
	let str = $("input[name=memberName]").val();

	if( !/^[???-???]{2,5}$/.test(str) ) {
        alert("????????? ?????? ???????????????.");
        $("input[name=memberName]").focus();
        return;
    }
	
	var f = document.updateForm;
	f.colName.value = "memberName";
	f.colValue.value = str;
	
	f.action = "${pageContext.request.contextPath}/mypage/main/update";
	f.submit();
}

function update_email(){
	let str1 = $('input[name=memberEmail1]').val();
		
    if( ! str1 ) {
    	alert("???????????? ?????? ???????????????.");
        $("input[name=memberEmail1]").focus();
        return;
    }
    
    let str2 = $('input[name=memberEmail2]').val();
    if( ! str2 ) {
    	alert("???????????? ?????? ??????????????? ???????????????.");
        $("input[name=memberEmail2]").focus();
        return;
    }
	var f = document.updateForm;
	f.colName.value = "memberEmail";
	f.colValue.value = str1 + "@" + str2;
	
	f.action = "${pageContext.request.contextPath}/mypage/main/update";
	f.submit();
}

function update_phone(){
	let str1 =  $('input[name=phone1]').val();
	
    if( !str1) {
        alert("??????????????? ???????????????.");
        $("input[name=phone1]").focus();
        return;
    }

    let str2 = $('input[name=phone2]').val();
    if( !/^\d{3,4}$/.test(str2) ) {
        alert("????????? ???????????????. ");
        $("input[name=phone3]").focus();
        return;
    }

    let str3= $('input[name=phone3]').val();
    if( !/^\d{4}$/.test(str3) ) {
    	alert("????????? ???????????????. ");
    	 $("input[name=phone3]").focus();
        return;
    }
	
	var f = document.updateForm;
	f.colName.value = "memberPhone";
	f.colValue.value = str1 + "-" + str2 + "-" + str3;
	
	f.action = "${pageContext.request.contextPath}/mypage/main/update2";
	f.submit();
}

function update_birth(){
	let str = $("input[name=memberBirth]").val();

    if( !str ) {
        alert("??????????????? ???????????????. ");
        $("input[name=memberBirth]").focus();
        return;
    }
	
	var f = document.updateForm;
	f.colName.value = "memberBirth";
	f.colValue.value = str;
	
	f.action = "${pageContext.request.contextPath}/mypage/main/update2";
	f.submit();
}
//memberPwd: ???????????? memberPwd2:????????????1 memberPwd3: ????????????3
function update_pwd(){
	let str1 = $("input[name=memberPwd]").val();
	if( str1 != '${dto.memberPwd}') {
        alert("?????? ??????????????? ????????????. ");
        $("input[name=memberPwd]").focus();
        return;
    }
	
	let str2 = $("input[name=memberPwd2]").val();
	if( !/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str2) ) { 
		alert("??????????????? ?????? ?????? ?????????.");
		$("input[name=memberPwd2]").focus();
		return;
	}
	
	let str3 = $("input[name=memberPwd3]").val();
	if( str3 != str2 ) { 
		alert("??????????????? ?????? ????????????.");
		$("input[name=memberPwd3]").focus();
		return;
	}
	
	var f = document.updateForm;
	f.colName.value = "memberPwd";
	f.colValue.value = str2;
	
	f.action = "${pageContext.request.contextPath}/mypage/main/update";
	f.submit();
}

function changeEmail(){
    let x = $('select[name=selectEmail]').val();
 	
    let y = $('input[name=memberEmail2]').val();

    if(x !== "direct") {
    	$('input[name=memberEmail2]').attr("value", x );
    	$('input[name=memberEmail2]').attr("readonly", true);
    	$('input[name=memberEmail2]').focus();
    }
    else {
    	$('input[name=memberEmail2]').attr("value", x );
    	$('input[name=memberEmail2]').attr("readonly", false);
    	$('input[name=memberEmail2]').focus();
    } 
}

</script>



<div class="container-md profile">
		<div class="box-title">
			<h3 style="font-weight: bold; color: #044b85; font-size: 22px;">????????? ??????</h3>
		</div>
	
	
		<div class="box box-info box-info-name profile-box name">
			<div class="profile-box profile-name">
				<i class="profile-icon fa-solid fa-circle-user fa-4x"></i>
				<h4 class=" profile-text">??????</h4>
				<p class="content-name">${dto.memberName}</p>
			</div>
			<button type="button" class="btn btn-info btn-info-name">????????????</button>
		</div>

		<div class="option-box option-box-info name-option">
			<div class="option">
				<label for="exampleFormControlInput1" class="form-label">??????</label>
				<input type="text" name="memberName" class="form-control">
				<small class="form-control-plaintext">????????? 2-5?????? ????????? ???????????????.</small>
			</div>
			<div class="btn-contnet name-btn">
				<button type="button" class="option-btn-2 option-btn-name">??????</button>
				<button type="button" class="option-btn" onclick="update_name();">????????????</button>
			</div>
		</div>


		<div class="box box-info birth profile-box">
			<div class="profile-box">
				<i class="profile-text">????????????</i>
				<p class="	float: right;">${dto.memberBirth}</p>
				<button type="button" class="btn btn-info btn-info-birth">????????????</button>
			</div>
		</div>

		<div class="option-box option-box-info birth-option ">
			<div class="option">
				<input type="date" name="memberBirth" class="birth-box" value="${dto.memberBirth}" placeholder="????????????">
				<small class="form-control-plaintext">??????????????? 2000-00-00 ???????????? ?????? ?????????.</small>
			</div>
			<div class="btn-contnet birth-btn">
				<button type="button" class="option-btn-2 option-btn-birth">??????</button>
				<button type="button" class="option-btn" onclick="update_birth();">????????????</button>
			</div>
		</div>

		<div class="box box-info profile-box pwd-1 profile-box">
			<div class="profile-box">
				<i class="profile-text">????????????</i>
			</div>
			<button type="button" class="btn btn-info btn-info-pwd">????????????</button>
		</div>

		<div class="option-box option-box-info pwd-option">
			<div class="option">
				<label for="exampleFormControlInput1" class="form-label">?????? ????????????</label> 
				<input type="password" name="memberPwd" class="form-control" id="exampleFormControlInput1" autocomplete="new-password">
			</div>
			<div class="option">
				<label for="exampleFormControlInput1" class="form-label">??? ????????????</label> 
				<input type="password" name="memberPwd2" class="form-control" id="exampleFormControlInput2">
				<small class="form-control-plaintext">??????????????? 5~10????????? ?????? ????????? ????????? ??????????????? ??????????????? ?????????.</small>
			</div>
			<div class="option">
				<label for="exampleFormControlInput1" class="form-label">???????????? ??????</label> 
				<input type="password" name="memberPwd3" class="form-control" id="exampleFormControlInput3">
			</div>
			<div class="btn-contnet pwd-btn">
				<button type="button" class="option-btn-2 option-btn-pwd">??????</button>
				<button type="button" class="option-btn" onclick="update_pwd();">????????????</button>
			</div>
		</div>

		<div class="box box-info profile-box email">
			<div class="profile-box">
				<i class="profile-text">?????????</i>
			</div>
			<button type="button" class="btn btn-info btn-info-email">????????????</button>
		</div>

		<div class="option-box option-box-info email-option">
			<div class="row" id="emailChange">
				<label for="exampleFormControlInput1" class="form-label" style="margin-left: 10px; margin-top: 10px;">?????????</label>
				<div class="col-sm-10 row" >
					<div class="col-3 ">
						<select name="selectEmail" id="selectEmail" class="form-select" onchange="changeEmail();" style="margin-left: 10px;">
							<option value="">??? ???</option>
							<option value="naver.com" 
								${dto.memberEmail2=="naver.com" ? "selected='selected'" : ""}>????????? ??????</option>
							<option value="gmail.com"
								${dto.memberEmail2=="gmail.com" ? "selected='selected'" : ""}>?????????</option>
							<option value="hanmail.net"
								${dto.memberEmail2=="hanmail.net" ? "selected='selected'" : ""}>?????????</option>
							<option value="tm.com"
								${dto.memberEmail2=="tmmail.com" ? "selected='selected'" : ""}>TM??????</option>
							<option value="direct">????????????</option>
						</select>
					</div>

					<div class="col input-group">
						<input type="text" name="memberEmail1" class="form-control" maxlength="30" value="${dto.memberEmail1}"> 
							<span class="input-group-text p-1" style="border: none; background: none;">@</span> 
						<input type="text" name="memberEmail2" class="form-control" maxlength="30"
							value="${dto.memberEmail2}"  readonly="readonly" >
					</div>
				</div>
			</div>

			<div class="btn-contnet email-btn">
				<button type="button" class="option-btn-2 option-btn-email">??????</button>
				<button type="button" class="option-btn" onclick="update_email();">????????????</button>
			</div>
		</div>

		<div class="box box-info profile-box phone">
			<div class="profile-box">
				<i class="profile-text">????????????</i>
			</div>
			<button type="button" class="btn btn-info btn-info-phone">????????????</button>
		</div>
		
		<div class="option-box option-box-info phone-option">
			<label for="exampleFormControlInput1" class="form-label" style="margin-left: 10px; margin-top: 10px;">????????????</label>
			
			<div class="col input-group input-phone">
				<input type="text" name="phone1" class="form-control" maxlength="3" value="${dto.phone1}"> 
					<span class="input-group-text p-1" style="border: none; background: none;">-</span> 
				<input type="text" name="phone2" class="form-control" maxlength="4" value="${dto.phone2}"> 
					<span class="input-group-text p-1" style="border: none; background: none;">-</span> 
				<input type="text" name="phone3" class="form-control" maxlength="4" value="${dto.phone3}">
			</div>
								
			<div class="btn-contnet phone-btn">
				<button type="button" class="option-btn-2 option-btn-phone">??????</button>
				<button type="button" class="option-btn" onclick="update_phone();">????????????</button>
			</div>
		</div>
		
		<form name="updateForm" method="post">
			<input type="hidden" name="colName">
			<input type="hidden" name="colValue">

		</form>
</div>


