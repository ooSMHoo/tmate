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

// 유효성 체크
function update_name(){
	const f = document.updateForm;
	let obj;
	
	obj = f.firstName.value;
	if(! obj){
		alert("이름을 입력하지 않았습니다.");
		f.firstName.focus();
		return false;
	}
	
	return true;
	
	f.action = "${pageContext.request.contextPath}/mypage/updateSubmit";
    f.submit();
}

</script>



<div class="container-md profile">
	<form name="updateForm" method="post">
		<div class="box-title">
			<h3 style="font-weight: bold; color: #044b85; font-size: 22px;">사용자
				정보</h3>
		</div>
	
	
		<div class="box box-info box-info-name profile-box name">
			<div class="profile-box profile-name">
				<i class="profile-icon fa-solid fa-circle-user fa-4x"></i>
				<h4 class=" profile-text">이름</h4>
				<p class="content-name">${dto.memberName}</p>
			</div>
			<button type="button" class="btn btn-info btn-info-name">변경하기</button>
		</div>

		<div class="option-box option-box-info name-option">
			<div class="option">
				<label for="exampleFormControlInput1" class="form-label">이름</label>
				<input type="text" name="firstName" class="form-control" id="exampleFormControlInput1">
			</div>
			<div class="btn-contnet name-btn">
				<button type="button" class="option-btn-2 option-btn-name">취소</button>
				<button type="button" class="option-btn" onclick="update_name();">변경하기</button>
			</div>
		</div>


		<div class="box box-info birth profile-box">
			<div class="profile-box">
				<i class="profile-text">생년월일</i>
				<p class="	float: right;">${dto.memberBirth}</p>
				<button type="button" class="btn btn-info btn-info-birth">변경하기</button>
			</div>
		</div>

		<div class="option-box option-box-info birth-option ">
			<div class="option">
				<input type="date" name="birth" class="birth-box" placeholder="생년-월-일">
			</div>
			<div class="btn-contnet birth-btn">
				<button type="button" class="option-btn-2 option-btn-birth">취소</button>
				<button type="button" class="option-btn">변경하기</button>
			</div>
		</div>

		<div class="box box-info profile-box pwd-1 profile-box">
			<div class="profile-box">
				<i class="profile-text">비밀번호</i>
			</div>
			<button type="button" class="btn btn-info btn-info-pwd">변경하기</button>
		</div>

		<div class="option-box option-box-info pwd-option">
			<div class="option">
				<label for="exampleFormControlInput1" class="form-label">현재 비밀번호</label> 
				<input type="text" name="ownPwd" class="form-control" id="exampleFormControlInput1">
			</div>
			<div class="option">
				<label for="exampleFormControlInput1" class="form-label">새 비밀번호</label> 
				<input type="text" name="newPwd" class="form-control"id="exampleFormControlInput1">
			</div>
			<div class="option">
				<label for="exampleFormControlInput1" class="form-label">비밀번호 확인</label> 
				<input type="text" name="conPwd" class="form-control" id="exampleFormControlInput1">
			</div>
			<div class="btn-contnet pwd-btn">
				<button type="button" class="option-btn-2 option-btn-pwd">취소</button>
				<button type="button" class="option-btn" onclick="update_pwd();">변경하기</button>
			</div>
		</div>

		<div class="box box-info profile-box email">
			<div class="profile-box">
				<i class="profile-text">이메일</i>
			</div>
			<button type="button" class="btn btn-info btn-info-email">변경하기</button>
		</div>

		<div class="option-box option-box-info email-option">
			<div class="row">
				<label for="exampleFormControlInput1" class="form-label" style="margin-left: 10px; margin-top: 10px;">이메일</label>
				<div class="col-sm-10 row" >
					<div class="col-3 ">
						<select name="selectEmail" id="selectEmail" class="form-select" onchange="changeEmail();" style="margin-left: 10px;">
							<option value="">선 택</option>
							<option value="naver.com"
								${dto.memberEmail2=="naver.com" ? "selected='selected'" : ""}>네이버메일</option>
							<option value="gmail.com"
								${dto.memberEmail2=="gmail.com" ? "selected='selected'" : ""}>지메일</option>
							<option value="hanmail.net"
								${dto.memberEmail2=="hanmail.net" ? "selected='selected'" : ""}>한메일</option>
							<option value="hotmail.com"
								${dto.memberEmail2=="hotmail.com" ? "selected='selected'" : ""}>핫메일</option>
							<option value="direct">직접입력</option>
						</select>
					</div>

					<div class="col input-group">
						<input type="text" name="email1" class="form-control" maxlength="30" value="${dto.memberEmail1}"> 
							<span class="input-group-text p-1" style="border: none; background: none;">@</span> 
						<input type="text" name="email2" class="form-control" maxlength="30"
							value="${dto.memberEmail2}" readonly="readonly">
					</div>
				</div>
			</div>

			<div class="btn-contnet email-btn">
				<button type="button" class="option-btn-2 option-btn-email">취소</button>
				<button type="button" class="option-btn" onclick="update_email();">변경하기</button>
			</div>
		</div>

		<div class="box box-info profile-box phone">
			<div class="profile-box">
				<i class="profile-text">전화번호</i>
			</div>
			<button type="button" class="btn btn-info btn-info-phone">변경하기</button>
		</div>
		
		<div class="option-box option-box-info phone-option">
			<label for="exampleFormControlInput1" class="form-label" style="margin-left: 10px; margin-top: 10px;">전화번호</label>
			
			<div class="col input-group input-phone">
				<input type="text" name="phone1" class="form-control" maxlength="3" value="${dto.phone1}"> 
					<span class="input-group-text p-1" style="border: none; background: none;">-</span> 
				<input type="text" name="phone2" class="form-control" maxlength="4" value="${dto.phone2}"> 
					<span class="input-group-text p-1" style="border: none; background: none;">-</span> 
				<input type="text" name="phone3" class="form-control" maxlength="4" value="${dto.phone3}">
			</div>
								
			<div class="btn-contnet phone-btn">
				<button type="button" class="option-btn-2 option-btn-phone">취소</button>
				<button type="button" class="option-btn" onclick="update_phone();">변경하기</button>
			</div>
		</div>
		
</form>
</div>


