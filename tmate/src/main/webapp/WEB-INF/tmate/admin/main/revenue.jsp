<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.container-chart {
	max-width: 850px;
	margin-top: 15px;
	padding-bottom: 15px;
	box-shadow: 0 4px 4px -4px black;
	font-family: "Noto Sans KR", sans-serif;
	text-align: center;
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

.container-info {
	margin-top: 20px;
	margin-bottom: 20px;
	padding-top: 5px;
	padding-bottom: 5px;
	font-family: "Noto Sans KR", sans-serif;
	text-align: center;
}

.container-info .info-box{
	box-sizing: border-box;
	padding: 10px;
	width: 95%;
	margin: 0 auto;
	height: 250px;
	border: 1px solid #1f93fa;
	text-align: center;

}

.container-info .p{
	margin : 30px;
}

</style>

<main>
	<div class="container container-chart">
		<p class="date">2022년 6월 21일</p>
		<div id="lineContainer1" class="box">그래프</div>
	</div>

	<div class="container container-info">
		<p> 총 매출 </p>
		<div class="info-box">
		 	 
	 	</div> 
	</div>
</main>