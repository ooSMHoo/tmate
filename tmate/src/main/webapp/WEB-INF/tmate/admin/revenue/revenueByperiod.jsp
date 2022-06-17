<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.rcontainer {
	padding-bottom: 15px;
}

.rcontainer .rbox {
	box-sizing: border-box;
	padding: 10px;
	width: 95%;
	margin: 0 auto;
	height: 250px;
	border: 1px solid #1f93fa;
	text-align: center;
}

.rcontainer-chart .date {
	padding: 10px;
	font-size : 15px;
	text-align: center; 
}

.rcontainer-graph {
	margin-top: 20px;
	margin-bottom: 20px;
	padding-top: 5px;
	padding-bottom: 5px;
}

</style>


<main>
<div class="rcontainer">
	<div>
		<p class="date">날짜</p>
		<div class="rbox">
			<div class="rnumber">
				<div>50</div>
				<div>500,000</div>
				<div>30</div>
				<div>200,000</div>
			</div>
			
			<div class="rcontext">
				<div>실시간 예약</div>
				<div>총 거래 금액</div>
				<div>등록된 숙소</div>
				<div>예상 수수료</div>
			</div>
		</div>
		<div class=rgraph>
			그래프
		</div>
	</div>
</div>

<div class=rcontainer-graph>

</div>
</main>