<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);


.body-container {
	font-family: "Noto Sans KR", sans-serif;
	max-width: 800px;
	margin: 0 auto;
}


.nobtn1 {
	background-color: #ffa81e;
	border-radius: 20px;
	text-align: center;
	font-family: inherit;
	text-color: #fff;
	border:none;
	width: 100px;
	min-height: 40px;
}

.nobtn2 {
	background-color: #ffa81e;
	border-radius: 20px;
	text-align: center;
	font-family: inherit;
	display: inline-block;
	border:none;
	width: 50px;
	min-height: 40px;
}

.notitle {
	background-color: #FFFFC6;
	font-weight: lighter;

}

</style>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>
<div class="container">
	<div class="body-container mt-5">	
		<div class="body-title">
			<h3 class="text-center fw-bold"><span style="font-family: 'MapoBackpacking' !important;">여행파트너</span> </h3>
		</div>
		
		<div class="body-main">
			<table class="table table-border table-list mt-5 table-hover">
				<thead>
					<tr class="notitle">
						<th class="listNum text-center">번호</th>
						<th class="mateSubject text-center">제목</th>
						<th class="memberName text-center">작성자</th>
						<th class="mateReg_date text-center">작성일</th>
						<th class="mateHit text-center">조회수</th>
						<th></th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${list}">
						<tr>
							<td class="text-center">${dto.listNum}</td>
							<td class="left col-6">
								<a href="${articleUrl}&mateNum=${dto.mateNum}" class="text-reset text-decoration-none">${dto.mateSubject}</a>
							</td>
							<td>${dto.memberName}</td>
							<td class="text-center">${dto.mateReg_date}</td>
							<td class="text-center">${dto.mateHit}</td>
							<td>
							</td>
						</tr>
					</c:forEach>
				<tbody>
				
			</table>
			
			<div class="text-end">
				${dataCount}개(${page}/${total_page} 페이지)
			</div>
					
			<div class="page-box">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>

				<div class="row">
					<div class="col">
						<button type="button" class="nobtn1 btn-outline-*" onclick="location.href='${pageContext.request.contextPath}/mate/list';">새로고침</button>
					</div>
					<div align="center" class="noticesearch col-6">
						<form class="row justify-content-md-center" name="searchForm" action="${pageContext.request.contextPath}/mate/list" method="post">
							<div class="col col-lg-4 p-1">
								<select name="condition" class="form-select">
									<option value="all" ${condition=="all"?"selected='selected'":""}>제목+내용</option>
									<option value="mateReg_date" ${condition=="mateReg_date"?"selected='selected'":""}>등록일</option>
									<option value="mateSubject" ${condition=="mateSubject"?"selected='selected'":""}>제목</option>
									<option value="mateContent"  ${condition=="mateContent"?"selected='selected'":""}>내용</option>
								</select>
							</div>
							<div class="col p-1">
								<input type="text" name="keyword" value="${keyword}" class="form-control col-md-auto">
							</div>
							<div class="col col-lg-2 p-1">
									<button type="button" class="nobtn2 btn-outline-*" onclick="searchList()"> <i class="bi bi-search"></i> </button>
							</div>
							
						</form>
					</div>
					<div align="right" class="matewrite col">
							<button type="button" class="nobtn1 btn-outline-*" onclick="location.href='${pageContext.request.contextPath}/mate/write';">글올리기</button>
					</div>
				</div>
			
		</div>

	</div>

</div>

