<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css" type="text/css">

<script type="text/javascript">
function list_delete(mhId){
	const f = document.likeList;

	if(confirm("리스트에서 삭제하시겠습니까?")) {	
		f.action = "${pageContext.request.contextPath}/mypage/main/deleteList?mhId="+mhId;
		f.submit();
	}
}


</script>

<div class="like-card-box ">

<h3 style="font-size:22px; font-weight: bold; color: #044b85;">관심숙소 / 지역</h3>

<form name="likeList" method="post">
<c:if test=""></c:if>
	<c:forEach var="dto" items="${list}" varStatus="status">
		<div class="card like-card">
			  <img src="${pageContext.request.contextPath}/tmate/lodging/${dto.lphotoName}" class="card-img-top">
				
			  <div class="card-body">
			    <h5 class="card-title">${dto.lodgName} </h5>
			    <p >${dto.mhaddr}</p>
			    <hr style="margin: 7px;">
				    <div class="card-info">
					    <button type="button" class="list-btn" onclick="location.href='${pageContext.request.contextPath}/reservation/roomlist?mhId=${dto.mhId}'">상세보기</button>		
					  
					    <button type="button" class="list-btn" onclick="list_delete('${dto.mhId}');">삭제하기</button>
				    </div>
			  </div>
		</div>
	</c:forEach>
	<input type="hidden" name="rows" value="${rows}">

</form>
	

		<div class="page-box" style="clear:both">
				${dataCount == 0 ? "찜한 목록이 없습니다." : paging}
		</div>
</div>
