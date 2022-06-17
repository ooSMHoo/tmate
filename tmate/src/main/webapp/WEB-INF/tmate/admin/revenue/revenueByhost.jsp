<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.container-chart {
	padding-bottom: 15px;
}

.container-chart .box {
	box-sizing: border-box;
	padding: 10px;
	width: 95%;
	margin: 0 auto;
	height: 250px;
	border: 1px solid #1f93fa;
	text-align: center;
}

.container-chart .date {
	padding: 10px;
	font-size : 15px;
	text-align: center; 
}

.container-info {
	margin-top: 20px;
	margin-bottom: 20px;
	padding-top: 5px;
	padding-bottom: 5px;
}

.container-info .info-box { 
	display: grid;
    grid-template-columns: 2fr 3fr;  
    width: 95%;
    margin: 20px auto;
    
    background-color : #fff;
    border-radius : 5px;
}

.box1 {
	width : 550px;
	height : 600px;
	background: #fff;
	border: 1px solid #1f93fa;
	grid-row: span 2;
	margin-right: 20px;
}

.box2 {
	border: 1px solid #1f93fa;
	margin-bottom: 20px;
}

.box3{
	border: 1px solid #1f93fa;
}

</style>

<main>
	<h4><a href="">홈페이지로 돌아가기</a></h4>
	
	<div class="container container-chart">
		<p class="date">2022년 6월 8일</p>
		<div id="lineContainer1" class="box">그래프</div>
		
	</div>

	<div class="container container-info">
		<div class="info-box">
		  <div class="box1">호스트 신청</div>
		  <div class="box2">방문자수</div>
		  <div class="box3">신고수</div> 
	  </div> 
	</div>
</main>