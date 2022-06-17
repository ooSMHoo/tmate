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

</style>


<script type="text/javascript">
<c:if test="${sessionScope.member.membership>50}">
function deleteOk() {
    if(confirm("게시글을 삭제 하시겠습니까 ? ")) {
	    let query = "noticeNum=${dto.noticeNum}&${query}";
	    let url = "${pageContext.request.contextPath}/notice/delete?" + query;
    	location.href = url;
    }
}
</c:if>
</script>

<div class="container">
	<div class="body-container mt-5">	
		<div class="body-title">
			<h3 class="text-center fw-bold"><span style="font-family: 'MapoBackpacking' !important;">공지사항</span> </h3>
		</div>
		
		<div class="body-main">

			<table class="table table-border table-article mt-5">
				<thead>
					<tr>
						<td colspan="2" align="center" class="fw-bold">
							${dto.noticeSubject}
						</td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td width="50%">
							이름 :
							<c:choose>
								<c:when test="${sessionScope.member.membership > 50 }">관리자</c:when>
								<c:otherwise>관리자</c:otherwise>
							</c:choose>	
						</td>
						<td align="right">
							${dto.noticeReg_date} | 조회 ${dto.noticeHit}
						</td>
					</tr>
					
					<tr>
						<td colspan="2" valign="top" height="200">
							${dto.noticeContent}
						</td>
					</tr>
					
					<c:forEach var="vo" items="${listFile}">
						<tr>
							<td colspan="2">
								파&nbsp;&nbsp;일 :
								<a href="${pageContext.request.contextPath}/notice/download?nfileNum=${vo.nfileNum}">${vo.nfileOri_name}</a>
							</td>
						</tr>
					</c:forEach>
					
					<tr>
						<td colspan="2" class="text-reset" style="text-decoration : none;">
							이전글 :
							<c:if test="${not empty preReadDto}">
								<a href="${pageContext.request.contextPath}/notice/article?${query}&noticeNum=${preReadDto.noticeNum}">${preReadDto.noticeSubject}</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-reset" style="text-decoration : none;">
							다음글 : 
							<c:if test="${not empty nextReadDto}">
								<a href="${pageContext.request.contextPath}/notice/article?${query}&noticeNum=${nextReadDto.noticeNum}">${nextReadDto.noticeSubject}</a>
							</c:if>
						</td>
					</tr>
				<tbody>
			</table>
			
			<table class="table">
				<tr>
					<td width="50%">
						<c:if test="${sessionScope.member.membership>50}">
							<button type="button" class="nobtn1 btn-light" onclick="location.href='${pageContext.request.contextPath}/notice/update?noticeNum=${dto.noticeNum}&page=${page}';">수정</button>
							<button type="button" class="nobtn1 btn-light" onclick="deleteOk();">삭제</button>
						</c:if>
					</td>
					<td class="text-end">
						<button type="button" class="nobtn1 btn-light" onclick="location.href='${pageContext.request.contextPath}/notice/list?${query}';">리스트</button>
					</td>
				</tr>
			</table>

		</div>
	</div>
</div>
