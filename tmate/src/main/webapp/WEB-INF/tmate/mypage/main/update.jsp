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

// 유효성 체크
function updateOk(){
	const f = document.updateForm;
	let obj;
	
	obj = f.firstName.value;
	if(! obj){
		alert("이름을 입력하지 않았습니다.");
		f.firstName.focus();
		return false;
	}
	
	obj = f.lastName.value;
	if(! obj){
		alert("성을 입력하지 않았습니다.");
		f.lastName.focus();
		return false;
	}	
}

$(function(){
	$(".option-btn").on("click", function(){
		if()
	});
});
// 버튼마다 다른 함수를 부르는 방법 밖에는 없는지?
// 이름이 똑같으니깐 한번에 다 처리할 수 없는지?
	
</script>



<div class="container-md profile">
	<form name="updateForm">
	<div class="box-title">
		<h3 style="font-weight: bold; color:#044b85; font-size: 22px; ">사용자 정보</h3>	
	</div>
	
	<div class="box box-info box-info-name profile-box name">
		<div class="profile-box profile-name">
			<i class="profile-icon fa-solid fa-circle-user fa-4x"></i>	
				 <h4 class="content-name profile-text">이름</h4>
				 <p class="content-name">메이트</p>
		</div>
			<button type="button" class="btn btn-info btn-info-name" >변경하기</button>
	</div>
	
	<div class="option-box option-box-info name-option">
		<div class="option">
		  <label for="exampleFormControlInput1" class="form-label">이름</label>
		  <input type="text" name="firstName" class="form-control" id="exampleFormControlInput1">
		</div>
		<div class="option">
		  <label for="exampleFormControlInput1" class="form-label lastName">성</label>
		  <input type="text" name="lastName" class="form-control" id="exampleFormControlInput1">
		</div>
		<div class="btn-contnet name-btn">
			<button class="option-btn-2 option-btn-name">취소</button>
			<button type="button" class="option-btn" onclick="updateOk();">변경하기</button>
		</div>
	</div>
	
	
	<div class="box box-info birth profile-box">
		<div class="profile-box">
			<i class="profile-text">생년월일</i>
			<p class="	float: right;">2000년00월00일</p>
			<button class="btn btn-info btn-info-birth">변경하기</button>
		</div>
	</div>
	
	<div class="option-box option-box-info birth-option ">
		<div class="option">
			<input type="date" name="birth" class="birth-box" placeholder="생년-월-일">
		</div>
		<div class="btn-contnet birth-btn">
			<button class="option-btn-2 option-btn-birth">취소</button>
			<button class="option-btn" >변경하기</button>
		</div>
	</div>
	
	<div class="box box-info profile-box pwd-1 profile-box">
		<div class="profile-box">
			<i class="profile-text">비밀번호</i>
		</div>
			<button class="btn btn-info btn-info-pwd">변경하기</button>
	</div>
	
	<div class="option-box option-box-info pwd-option">
		<div class="option">
		  <label for="exampleFormControlInput1" class="form-label">현재 비밀번호</label>
		  <input type="text" name="ownPwd" class="form-control" id="exampleFormControlInput1" >
		</div>
		<div class="option">
		  <label for="exampleFormControlInput1" class="form-label">새 비밀번호</label>
		  <input type="text" name="newPwd" class="form-control" id="exampleFormControlInput1">
		</div>
		<div class="option">
		  <label for="exampleFormControlInput1" class="form-label">비밀번호 확인</label>
		  <input type="text" name="conPwd" class="form-control" id="exampleFormControlInput1">
		</div>
		<div class="btn-contnet pwd-btn">
			<button class="option-btn-2 option-btn-pwd">취소</button>
			<button class="option-btn">변경하기</button>
		</div>
	</div>	
	
	<div class="box box-info profile-box email">
		<div class="profile-box">
			<i class="profile-text">이메일</i>
		</div>
			<button class="btn btn-info btn-info-email">변경하기</button>
	</div>
	
	<div class="option-box option-box-info email-option">
		<div class="option">
		  <label for="exampleFormControlInput1" class="form-label">변경 이메일</label>
		  <input type="text" name="newEmail" class="form-control" id="exampleFormControlInput1">
		</div>
		<div class="btn-contnet email-btn">
			<button class="option-btn-2 option-btn-email">취소</button>
			<button class="option-btn" >변경하기</button>
		</div>
	</div>
</form>
</div>


