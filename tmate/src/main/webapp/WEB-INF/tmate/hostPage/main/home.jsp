<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hostPage.css" type="text/css">

<div class="container-fluid" >
	
	<div class=" main-container py-4">
		<h3 class="mb-2">HOME</h3>
			    <div class="row align-items-md-stretch">
			      <div class="col-md-8 mb-4">
			        <div class=" p-2 border bg-white rounded-3 box1">
			          <h6 class="text-center text-black mt-3 fw-blod">Today</h6>
			          <h5 class="text-center text-black">2022-06-08</h5>
			          
			          <div class="row row-cols-4 text-center mt-4 count-box count">
			          	<div class="col"><h1>3</h1></div>
			          	<div class="col"><h1>0</h1></div>
			          	<div class="col"><h1>3</h1></div>
			          	<div class="col"><h1>1</h1></div>
			          	<div class="col">당일예약</div>
			          	<div class="col">입금대기</div>
			          	<div class="col">예약완료</div>
			          	<div class="col">예약취소</div>
			          </div>
			        </div>
			      </div>
			      <div class="col-6 col-md-4 mb-5 ">
			        <div class="h-300 p-5 bg-white border rounded-3 box1">
			         	날씨정보
			        </div>
			      </div>
			    </div>
			
			    <div class="row align-items-md-stretch box2">
			      <div class="col-md-5">
			        <div class="h-100 p-5 text-white bg-white border rounded-3">
			           
			        </div>
			      </div>
			      <div class="col-md-7">
			        <div class="h-100 p-5 bg-white border rounded-3">
			          <h6 style="font-weight: bold;">오늘 입실</h6>
			          <table class="table text-center">
						  <thead>
						    <tr class="table-secondary">
						      <th scope="col">#</th>
						      <th scope="col">예약자명</th>
						      <th scope="col">전화번호</th>
						      <th scope="col">객실명</th>
						      <th scope="col">입실체크</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">1</th>
						      <td>김자바</td>
						      <td>010-1111-1111</td>
						      <td>room1</td>
						      <td><input type="checkbox"></td>
						    </tr>
						    <tr>
						      <th scope="row">2</th>
						      <td>박자바</td>
						      <td>010-1111-1111</td>
						      <td>room2</td>
						      <td><input type="checkbox"></td>
						    </tr>
						    <tr>
						      <th scope="row">3</th>
						      <td>최자바</td>
						      <td>010-1111-1111</td>
						      <td>room3</td>
						      <td><input type="checkbox"></td>
						    </tr>
						  </tbody>
						</table>
			        </div>
			      </div>
			    </div>
			</div>
	    </div>

