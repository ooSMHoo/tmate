<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
</style>
<style type="text/css">
.box {
	border: 1px solid #ccc;
	margin: 10px auto;
	padding: 10px;
	max-width: 800px;
}

.btn-color {
	border-radius: 15px;
	background-color: #f8f9fa;
}

.btn-color:hover {
	background-color: #ffa81e;
	color:#333;
	
}

@font-face {
    font-family: 'MapoBackpacking';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoBackpackingA.woff') format('woff');
    font-weight: normal;
    font-style: normal; 
}
.navbar-font{
	font-size: 25px; 
	font-weight:600;
	font-family: 'Noto Sans KR', sans-serif; 
}
</style>
 <form name="loginForm" action="" method="post" >
<div class="container " style="width:400px;">
	<div class="body-container ">
    <h6 class="text-center mt-5" style="color:#ffa81e; font-family: MapoBackpacking; font-size:17pt;"><small> 트레블&amp;메이트 </small></h6>
	<h6 class="text-center m-3"><small> 행복한 여행되기를 기원합니다. </small></h6>
    <div class="container justify-content-md-center">
        <div class="m-1">
            <h5><small>아이디</small></h5>
            <input type="text" name="memberId" class="form-control" placeholder="아이디" style="min-width:200px; border-radius: 15px;">
        </div>
    	<br>
        <div class="m-1">
             <h5><small>비밀번호</small></h5>
            <input type="password" name="memberPwd" class="form-control" placeholder="비밀번호" style="min-width:200px; border-radius: 15px;">
        </div>
    </div>
    
    <div class="row justify-content-md-center pt-2">
      	<a href="#" class="col-auto pt-1 ps-3 pe-2 text-center text-decoration-none">아이디 찾기</a>
        <a href="#" class="col-auto pt-1 ps-3 pe-2 text-center text-decoration-none">패스워드 찾기</a>
        <a href="${pageContext.request.contextPath}/member/join" class="col-auto pt-1 ps-3 pe-2 text-center text-decoration-none">회원가입</a>
    </div>
    <br>
    <br>
    <div style="text-align: center; margin-top: -30px; margin-bottom: 5px;">
    	<span style="color: red;">${message}</span>
    </div>
    <div class="d-grid gap-2 pt-2 col-6 mx-auto">
      <button type="submit" class="btn btn-color " name="homelogin"  style="background-color: #ffa81e">홈페이지 로그인</button>
    </div>
    </div>
</div>
</form>

</html>