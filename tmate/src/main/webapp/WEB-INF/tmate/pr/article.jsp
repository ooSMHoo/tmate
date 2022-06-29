<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.body-container {
	font-family: "Noto Sans KR", sans-serif;
	max-width: 800px;
	margin: 0 auto;
}

.nobtn1 {
	background-color: #1f93fa;
	border-radius: 20px;
	text-align: center;
	font-family: inherit;
	text-color: #fff;
	border:none;
	width: 100px;
	min-height: 40px;
	margin-bottom:20px;
}

.nobtn1:hover{background-color:#ffa81e; }

</style>

<script type="text/javascript">
<c:if test="${sessionScope.member.userId==dto.memberId || sessionScope.member.membership>50}">
function deletePr() {
	let query = "prNum=${dto.prNum}&${query}&prphotoName=${dto.prphotoName}";
    let url = "${pageContext.request.contextPath}/pr/delete?" + query;

    if(confirm("게시글을 삭제 하시겠습니까 ? ")) {
  	  location.href = url;
    }
}
</c:if>
</script>


<div class="container">
	<div class="body-container mt-5">	
		<div class="body-title">
		<h3 class="text-center fw-bold"><span style="font-family: 'MapoBackpacking' !important;">홍보게시판</span> </h3>
		</div>
		
		<div class="body-main">

			<table class="table table-border table-article mt-5">
				<thead>
					<tr>
						<td colspan="2" align="center" class="fw-bold">
							${dto.prSubject}
						</td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td width="50%">
							이름 : ${dto.memberName}				
		
						</td>
						<td align="right">
							${dto.prReg_date} | 조회 ${dto.prHit}
						</td>
					</tr>

					<tr>
						<td colspan="2" style="border-bottom: none;">
							<img src="${pageContext.request.contextPath}/uploads/pr/${dto.prphotoName}" 
								class="img-fluid img-thumbnail w-100 h-auto">
						</td>
					</tr>
											
					<tr>
						<td colspan="2" valign="top" height="200">
							${dto.prContent}
						</td>
					</tr>
					
					<tr>
						<td colspan="2" class="text-reset" style="text-decoration : none;">
							이전글 :
							<c:if test="${not empty preReadDto}">
								<a href="${pageContext.request.contextPath}/pr/article?${query}&prNum=${preReadDto.prNum}" style="text-decoration: none; color: #000;">${preReadDto.prSubject}</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-reset" style="text-decoration : none;">
							다음글 :
							<c:if test="${not empty nextReadDto}">
								<a href="${pageContext.request.contextPath}/pr/article?${query}&prNum=${nextReadDto.prNum}" style="text-decoration: none; color: #000;">${nextReadDto.prSubject}</a>
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
			
			<table class="table">
				<tr>
					<td width="50%">
						<c:if test="${sessionScope.member.membership>1}">
						<c:choose>
							<c:when test="${sessionScope.member.userId==dto.memberId}">
								<button type="button" class="nobtn1 btn-light" onclick="location.href='${pageContext.request.contextPath}/pr/update?prNum=${dto.prNum}&page=${page}';">수정</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="nobtn1 btn-light" disabled="disabled">수정</button>
							</c:otherwise>
						</c:choose>
				    	
						<c:choose>
				    		<c:when test="${sessionScope.member.userId==dto.memberId || sessionScope.member.membership>50}">
				    			<button type="button" class="nobtn1 btn-light" onclick="deletePr();">삭제</button>
				    		</c:when>
				    		<c:otherwise>
				    			<button type="button" class="nobtn1 btn-light" disabled="disabled">삭제</button>
				    		</c:otherwise>
				    	</c:choose>
				    	</c:if>
					</td>
					<td class="text-end">
						<button type="button" class="nobtn1 btn-light" onclick="location.href='${pageContext.request.contextPath}/pr/list?${query}';">리스트</button>
					</td>
				</tr>
			</table>
			
					<div style=" padding-bottom: 200px;"></div>
			
		</div>
	</div>
</div>