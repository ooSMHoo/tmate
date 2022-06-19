<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css" type="text/css">


<div class="point-content">
	<h3 style="font-size:22px; font-weight: bold; color: #044b85;">포인트</h3>
	<div class="title">
	사용가능 포인트 : <i class="point-balance"> ${total} P</i>
	</div>
	
	<hr>
	<ul class="list-group">
		<c:if test="${dataCount!=0 }">
			<c:forEach var="dto" items="${list}" varStatus="status">
				<c:if test="${dto.pointCode==1}">
				  <li class="list-group-item">포인트 적립
				  	 	<p class="list-group-point">+${dto.pointQuant} </p>
				  	<div class="group">
				  	 	<p class="list-group-date">${dto.pointDate}</p>
				  	</div>
				  </li>
				</c:if>
				<c:if test="${dto.pointCode==0}">
				  <li class="list-group-item">포인트 사용
				  	 	<p class="list-group-point">-${dto.pointQuant} </p>
				  	<div class="group">
				  	 	<p class="list-group-date">${dto.pointDate}</p>
				  	</div>
				  </li>
				</c:if>
			 </c:forEach> 
		</c:if>
	</ul>
		<input type="hidden" name="rows" value="${rows}">
	
	<div class="page-box">
		${dataCount == 0 ? "포인트 내역이 없습니다." : paging}
	</div>

</div>
