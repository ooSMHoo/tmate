<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>

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

</head>
<body>
 <div class="container">
    <div class="row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="my-auto mb-4 text-center" style="max-width: 450px; font-weight: 800">회원가입</h4>
     
      <form class="memberForm" >
	      <div class="row mb-3">
			<div class="col-sm-10 userId-box">
				 <label for="userId" class="ms-1">아이디</label>
				<div class="row">
					<div class="col-7 pe-1">	
						<input type="text" name="userId" id="userId" class="form-control" placeholder="영문 5~10자 이내">
					</div>
					<div class="col-4 ps-1"> 
						<button type="button" class="btn btn-light btn-gray" onclick="userIdCheck();">아이디중복확인</button>
					</div>
				</div>
			 </div>
		 </div>
		
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="name" class="ms-1">이름</label>
              <input type="text" class="form-control" id="name" placeholder="이름을 입력해주세요." value="" required>
            <div class="invalid-feedback"> 이름을 입력해주세요. </div>
            </div>
            </div>
              <div class="row">
             <div class="col-md-6 mb-3">
              <label for="name" class="ms-1">생년월일</label>
              <input type="date" class="form-control" id="birth" value="" required>
            <div class="invalid-feedback"> 생년월일을 입력해주세요. </div>
            </div>
            </div>
          
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="pwd" class="ms-1">비밀번호</label>
              <input type="text" class="form-control" id="pwd" placeholder="비밀번호를 입력해주세요." value="" required>
            </div>
          </div>
          <div class="row mb-3">
			<div class="col-sm-10 userId-box">
				<label for="pwdCheck" class="ms-1">비밀번호확인</label>
			<div class="row">
				<div class="col-7 pe-1">
					<input type="text" name="pwd" id="pwd" class="form-control" placeholder="비밀번호를 입력해주세요.">
				</div>
				<div class="col-4 ps-1">
					<button type="button" class="btn btn-light btn-gray" onclick="userIdCheck();">비밀번호확인</button>
				</div>
			</div>	
			</div>
		</div>
		<div class="mb-3">
		<label for="tel" class="ms-1">전화번호</label>
			<div class="row">
				<div class="col-2 pe-0">
					<input type="text" name="tel1" class="form-control">
				</div>
				<div class="col-auto">
					<p class="form-control-plaintext text-center">-</p>
				</div>
				<div class="col-2 px-0">
					<input type="text" name="tel2" class="form-control">
				</div>
				<div class="col-auto">
					<p class="form-control-plaintext text-center">-</p>
				</div>
				<div class="col-2 px-0">
					<input type="text" name="tel3" class="form-control">
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
	        <div class="d-grid gap-2 mb-3">
  				<button class="btn btn-primary btn-light btn-gray" type="button" style="width: 80%;">메일전송</button>
			</div>	        
	    </div>    


          <div class="mb-4">
          	<div class="custom-control custom-checkbox">
            	<input type="checkbox" class="custom-control-input" id="aggrement" required>
            	<label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
         	 </div>
          </div>
         
          
          <div class="row mb-3" style="width: 80%;">
			   <div class="text-center">
			       <button type="button" name="sendButton" class="btn btn-light btn-gray" onclick="memberOk();" style="background-color: #ffa81e"> 회원가입 <i class="bi bi-check2"></i></button>
			       <button type="button" class="btn btn-light btn-gray" onclick="" style="background-color: #ffa81e"> 가입취소 <i class="bi bi-x"></i></button>
				   <input type="hidden" name="userIdValid" id="userIdValid" value="false">
			   </div>
		</div>
          
        </form>
      </div>
    </div>
</div>

   

  
</body>
</html>