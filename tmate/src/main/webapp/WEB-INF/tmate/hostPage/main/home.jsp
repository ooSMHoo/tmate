<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hostPage.css" type="text/css">
<script type="text/javascript">
/*
const dateTitle = document.getElementById("js-date");

function today() {
    const today = new Date();
    const years = today.getFullYear(); // 년도 가져오기
    const months = today.getMonth() + 1; // 월 가져오기
    const dates = today.getDate(); // 일 가져오기
    const week = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
    const days = week[today.getDay()]; // 요일 가져오기 

    dateTitle.innerText = `${years}년 ${months}월 ${dates}일 ${days}`
}
*/



</script>
<div class="container" >
	<div class=" main-container py-4">
		<h3 class="mb-2 ">HOME</h3>
			    <div class="row align-items-md-stretch">
			      <div class="col-md-8 mb-3">
			        <div class=" p-2 border bg-white rounded-3 box1 shadow">
			          <h6 class="text-center mt-3  text-primary">Today</h6>
			          <div class="text-center text-black" onload="today();"><h5 id="js-date"></h5></div>
			          <div class="row row-cols-3 text-center mt-4 count-box count">
			          	<div class="col"><h1>${restotal}</h1></div>
			          	<div class="col"><h1>${todayRes}</h1></div>
			          	<div class="col"><h1>${todayCancel}</h1></div>
			          	<div class="col">당일입실</div>
			          	<div class="col">예약완료</div>
			          	<div class="col">예약취소</div>
			          </div>
			        </div>
			      </div>
			      <div class="col-6 col-md-4 mb-5 ">
			        <div class="h-300 p-5 bg-white border rounded-3 box1 shadow">
			         	날씨정보
			        </div>
			      </div>
			    </div>
			
			    <div class="row align-items-md-stretch box2">
			      <div class="col-md-5">
			        <div class="h-100 p-5  bg-white border rounded-3 shadow">
			           	<h6 style="font-weight: bold;">객실재고현황</h6>
			           	<table class="table text-center">
						  <thead>
						    <tr class="table-secondary">
						      <th scope="col">구분</th>
						      <th scope="col">총객실수</th>
						      <th scope="col">입실객실수</th>
						      <th scope="col">객실재고</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">합계</th>
						      <td>${total}</td>
						      <td>${restotal}</td>
						      <td>${total - restotal}</td>
						    </tr>
						  </tbody>
						</table>
			        </div>
			      </div>
			      <div class="col-md-7">
			        <div class="h-100 p-5 bg-white border rounded-3 shadow">
			          <h6 style="font-weight: bold;">당일 입실 명단</h6>
			          <table class="table text-center">
						  <thead>
						    <tr class="table-secondary">
						      <th scope="col">#</th>
						      <th scope="col">예약자명</th>
						      <th scope="col">전화번호</th>
						      <th scope="col">객실명</th>
						    </tr>
						  </thead>
						  <tbody>
						  	<c:forEach var="hp" items="${hp}">
						    <tr>
						      <th scope="row">${hp.rnum}</th>
						      <td>${hp.resName}</td>
						      <td>${hp.resPhone}</td>
						      <td>${hp.roomName}</td>
						    </tr>
						    </c:forEach>
						  </tbody>
						</table>
			        </div>
			      </div>
			    </div>
			</div>
	    </div>

