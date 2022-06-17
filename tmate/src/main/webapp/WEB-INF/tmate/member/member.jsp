<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.input-form {
    max-width: 650px;
    margin-top: 80px;
    padding: 32px;
    background: #fff;
    border-radius: 10px;
}
.form-control, .btn, .form-select{
	border-radius: 15px;
}

.btn-gray {
	background-color: #f8f9fa;
}

.btn-gray:hover {
	background-color: #ffa81e;
	color:#333;
	
}
</style>

<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

function memberOk() {
	const f = document.memberForm;
	let str;
	
	str = f.memberId.value;
	if (!str) {
		alert("아이디를 입력해주세요. ");
		f.memberId.focus();
		return;
	}
	
	if( !/^[a-z][a-z0-9_]{4,9}$/i.test(str) ) { 
		alert("아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.");
		f.memberId.focus();
		return;
	}

	if(f.memberIdValid.value === "false") {
		alert("아이디 중복 검사를 해주세요.");
		str = "아이디 중복 검사가 실행되지 않았습니다.";
		$("#memberId").parent().parent().find(".help-block").html(str);
		f.memberId.focus();
		return;
	}
	
	str = f.memberName.value;
    if( !/^[가-힣]{2,5}$/.test(str) ) {
        alert("이름을 다시 입력해주세요. ");
        f.memberName.focus();
        return;
    }
	
	str = f.memberBirth.value;
    if( !str ) {
        alert("생년월일를 입력해주세요. ");
        f.memberBirth.focus();
        return;
    }
	
	str = f.memberPwd.value;
	if (!str) {
		alert("패스워드를 입력해주세요. ");
		f.memberPwd.focus();
		return;
	}
	
	if( !/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str) ) { 
		alert("패스워드를 다시 입력해주세요. ");
		f.memberPwd.focus();
		return;
	}
	
	if (!f.memberPwdcheck.value) {
		alert("비밀번호확인란을 입력해주세요 ");
        f.memberPwdcheck.focus();
        return;
	}

	if( str !== f.memberPwdcheck.value ) {
        alert("비밀번호가 일치하지 않습니다. ");
        f.memberPwd.focus();
        return;
	}
    
    str = f.memberPhone1.value;
    if( !str ) {
        alert("전화번호를 입력해주세요. ");
        f.memberPhone1.focus();
        return;
    }

    str = f.memberPhone2.value;
    if( !str ) {
        alert("전화번호를 입력해주세요. ");
        f.memberPhone2.focus();
        return;
    }
    if( !/^\d{3,4}$/.test(str) ) {
        alert("전화번호는 숫자만 가능합니다. ");
        f.memberPhone2.focus();
        return;
    }

    str = f.memberPhone3.value;
    if( !str ) {
        alert("전화번호를 입력해주세요. ");
        f.memberPhone3.focus();
        return;
    }
    if( !/^\d{4}$/.test(str) ) {
    	alert("전화번호는 숫자만 가능합니다. ");
        f.memberPhone3.focus();
        return;
    }
    
    str = f.email1.value.trim();
    if( !str ) {
        alert("이메일을 입력해주세요. ");
        f.email1.focus();
        return;
    }

    str = f.email2.value.trim();
    if( !str ) {
        alert("이메일을 입력해주세요. ");
        f.email2.focus();
        return;
    }
    
    if (!f.aggrement.checked) {
		alert("개인정보 수집 및 이용에 동의해주세요");
		return;
	}
    
    f.action = "${pageContext.request.contextPath}/member/join";
    f.submit();
}

function changeEmail() {
	const f = document.memberForm;
	
	let str = f.selectEmail.value;
	if (str !== "direct") {
        f.email2.value = str; 
        f.email2.readOnly = true;
        f.email1.focus(); 
    }
    else {
        f.email2.value = "";
        f.email2.readOnly = false;
        f.email1.focus();
    }
}

function memberIdCheck() {
	let memberId = $("#memberId").val();

	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(memberId)) { 
		var str = "아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.";
		$("#memberId").focus();
		$("#memberId").parent().parent().find(".help-block").html(str);
		return;
	}
	
	let url = "${pageContext.request.contextPath}/member/userIdCheck";
	let query = "memberId=" + memberId;
	$.ajax({
		type:"POST"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			let passed = data.passed;

			if(passed === "true") {
				let str = "<span style='color:blue; font-weight: bold;'>" + memberId + "</span> 아이디는 사용가능 합니다.";
				$(".userId-box").find(".help-block").html(str);
				$("#memberIdValid").val("true");
				$("input[name=memberId]").attr("readonly", true);
			} else {
				let str = "<span style='color:red; font-weight: bold;'>" + memberId + "</span> 아이디는 사용할수 없습니다.";
				$(".userId-box").find(".help-block").html(str);
				$("#memberId").val("");
				$("#memberIdValid").val("false");
				$("#memberId").focus();
			}
		}
	});
}

function sendEmail() {
    if( !document.memberForm.email1.value.trim() ) {
        alert("이메일을 입력해주세요.");
        document.memberForm.email1.focus();
        return;
    }

    if( !document.memberForm.email2.value.trim() ) {
        alert("이메일을 입력해주세요.");
        return;
    }
	let url = "${pageContext.request.contextPath}/mail/send";
	let query = "userEmail=" + $("input[name=email1]").val() + "@" + $("input[name=email2]").val();
	$.ajax({
		type:"POST"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			let result = data.result;

			if (result === "true") {
				let str = "<div class='row'>" +
								"<div class='col-5 pe-1'>" +
									"<input type='text' name='authCode' id='authCode' class='form-control' placeholder='이메일 인증 코드 입력'>" +
						 		"</div>" +
					   		    "<div class='col-2 ps-1'>" +
						   			"<button type='button' name='mailcheckbtn' class='btn btn-light btn-gray' onclick='codeCheck();'>인증하기</button>" +
						  		"</div>" +
	    				  "</div>";
				$('#emailauth').append(str);
				$('#emailsend').attr("disabled", "disabled");
				alert("이메일이 전송되었습니다.");
			} else if (result === "error") {
				alert("이메일 형식이 잘못되었습니다. 다시 입력해주세요.");
			} else {
				alert("이메일 전송에 실패하였습니다.");
			}
		}
	});
}

function codeCheck() {
	if( !document.memberForm.authCode.value.trim() ) {
        alert("인증코드를 입력해주세요.");
        document.memberForm.authCode.focus();
        return;
    }
	let url = "${pageContext.request.contextPath}/mail/check";
	let query = "authCode=" + $("input[name=authCode]").val()

	$.ajax({
		type:"POST"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			let result = data.result;

			if (result === "true") {
				$("input[name=authCode]").attr("disabled", "disabled");
				$("button[name=mailcheckbtn]").attr("disabled", "disabled");
				$("button[name=mailcheckbtn]").text("인증완료");
				$("input[name=mailcheck]").val("true");
				alert("메일 인증에 성공했습니다.");
			} else {
				alert("메일 인증에 실패했습니다.");
			}
		}
	});
}
</script>

 <div class="container">
    <div class="row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="my-auto mb-4 text-center" style="max-width: 450px; font-weight: 800">회원가입</h4>
     	
      <form name="memberForm" method="post">
	      <div class="row mb-3">
			<div class="col-sm-10 userId-box">
				 <label for="memberId" class="ms-1">아이디</label>
				<div class="row">
					<div class="col-7 pe-1">	
						<input type="text" name="memberId" id="memberId" class="form-control" placeholder="영문 또는 숫자 5~10자 이내">
					</div>
					<div class="col-4 ps-1"> 
						<button type="button" class="btn btn-light btn-gray" onclick="memberIdCheck();">아이디중복확인</button>
					</div>
					<small class="form-control-plaintext help-block" style="padding-left: 20px;"></small>
				</div>
			 </div>
		 </div>
		
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="name" class="ms-1">이름</label>
              <input type="text" class="form-control" placeholder="이름을 입력해주세요." name="memberName">
            </div>
            </div>
              <div class="row">
             <div class="col-md-6 mb-3">
              <label for="name" class="ms-1">생년월일</label>
              <input type="date" class="form-control" name="memberBirth">
            </div>
            </div>
          
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="pwd" class="ms-1">비밀번호</label>
              <input type="password" class="form-control" placeholder="비밀번호를 입력해주세요." name="memberPwd">
            </div>
            <small class="form-control-plaintext">비밀번호는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.</small>
          </div>
          <div class="row mb-3">
			<div class="col-sm-10 userId-box">
				<label for="pwdCheck" class="ms-1">비밀번호확인</label>
			<div class="row">
				<div class="col-7 pe-1">
					<input type="password" name="memberPwdcheck" class="form-control" placeholder="비밀번호를 입력해주세요.">
				</div>
			</div>	
			</div>
		</div>
		<div class="mb-3">
		<label for="tel" class="ms-1">전화번호</label>
			<div class="row">
				<div class="col-2 pe-0">
					<input type="text" name="memberPhone1" class="form-control">
				</div>
				<div class="col-auto">
					<p class="form-control-plaintext text-center">-</p>
				</div>
				<div class="col-2 px-0">
					<input type="text" name="memberPhone2" class="form-control">
				</div>
				<div class="col-auto">
					<p class="form-control-plaintext text-center">-</p>
				</div>
				<div class="col-2 px-0">
					<input type="text" name="memberPhone3" class="form-control">
				</div>
			</div>
		</div>
		
		<hr style="width: 80%;">

			    
		<div class="row mb-3">
	       <label for="email" class="ms-1">이메일인증</label>
	    <div class="col row">
				<div class="col-3 pe-0">
					<input type="text" name="email1" class="form-control">
				</div>
				<div class="col-auto">
					<p class="form-control-plaintext text-center">@</p>
				</div>
				<div class="col-3 px-0">
					<input type="text" name="email2" class="form-control" readonly="readonly">
				</div>
				
				<div class="col-3 ps-2 mb-3">
					<select name="selectEmail" id="selectEmail" class="form-select" onchange="changeEmail();">
						<option value="">선 택</option>
						<option value="naver.com" >naver.com</option>
						<option value="gmail.com" >gmail.com</option>
						<option value="hotmail.com" >hotmail.com</option>
						<option value="hanmail.net">hanmail.com</option>
						<option value="direct">직접입력</option>
					</select>
				</div>	
	        </div>
	        <div id="emailauth" class="d-grid gap-2 mb-3">
  				<button id="emailsend" class="btn btn-primary btn-light btn-gray" type="button" style="width: 80%;" onclick="sendEmail();">메일전송</button>
			</div>
			<div>
				<input type="hidden" name="mailcheck" value="false">
			</div>
	    </div>    

          <div class="mb-4">
          	<div class="custom-control custom-checkbox">
            	<input type="checkbox" class="custom-control-input" id="aggrement" name="aggrement">
            	<label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
         	 </div>
          </div>
          
          <div>
          	<p style="color: red;">${message}</p>
          </div>
         
          
          <div class="row mb-3" style="width: 80%;">
			   <div class="text-center">
			       <button type="button" name="sendButton" class="btn btn-light btn-gray" onclick="memberOk();" style="background-color: #ffa81e"> 회원가입 <i class="bi bi-check2"></i></button>
			       <button type="button" class="btn btn-light btn-gray" onclick="location.href='${pageContext.request.contextPath}/'" style="background-color: #ffa81e"> 가입취소 <i class="bi bi-x"></i></button>
				   <input type="hidden" name="memberIdValid" id="memberIdValid" value="false">
			   </div>
		</div>
          
        </form>
      </div>
    </div>
</div>
