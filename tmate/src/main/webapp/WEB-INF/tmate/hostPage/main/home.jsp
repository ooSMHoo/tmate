<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hostPage.css" type="text/css">

<script type="text/javascript">

$(function(){
    let date = new Date();
    let y = date.getFullYear(); //년가져오기
    let m = date.getMonth()+1; //월 가져오기
    let d = date.getDate(); // 일 가져오기
   
	if(m<10) m = "0"+m
	
	let s = y+"-"+m+"-"+d ;
	$("#resultDate").html(s);
});



</script>
<div class="container" >
	<div class=" main-container py-4">

		<h3 class="mb-2 col-auto"> HOME </h3>
			    <div class="row align-items-md-stretch">
			      <div class="col-md-8 mb-3">
			        <div class=" p-2 border bg-white rounded-3 box1 shadow">
			          <h6 class="text-center mt-3  text-primary"><strong>Today</strong></h6>
			          <div class="text-center text-black"><h4 id="resultDate"></h4></div>
			          <div class="row row-cols-3 text-center mt-4 count-box count mb-4">
			          	<div class="col text-primary h1" ><strong> ${restotal}</strong></div>
			          	<div class="col text-primary h1" ><strong> ${todayRes}</strong> </div>
			          	<div class="col text-danger h1" ><strong> ${todayCancel}</strong></div>
			          	<div class="col" style="font-weight: bold;">당일입실</div>
			          	<div class="col" style="font-weight: bold;">예약완료</div>
			          	<div class="col" style="font-weight: bold;">예약취소</div>
			          </div>
			        </div>
			      </div>
			      <div class="col-6 col-md-4 mb-5 ">
			        <div class="h-300 p-2 bg-white border rounded-3 box1 shadow">
			         	<div class="text-center">
			         		<div class="h6 mt-4 ">오늘 매출현황</div>
			         		<div class="h2 mb-4 text-primary"><strong> ${todayrCinPay} </strong></div>
			         		<div class="h6">오늘 예약현황</div>
			         		<div class="h2 mb-2 text-primary"><strong> ${todayPay}</strong></div>
			      		</div>
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
								      <td scope="row">${hp.rnum}</td>
								      <td>${hp.resName}</td>
								      <td>${hp.resPhone}</td>
								      <td>${hp.roomName}</td>
								    </tr>
						    </c:forEach>
						    <c:if test="${restotal ==0 }">
						   		<tr>
						  			 <td colspan="4">당일 입실 예약자가 없습니다.</td>
						  			</tr>
						    </c:if>
						  </tbody>
						</table>
			        </div>
			      </div>
			    </div>
			</div>
	    </div>

