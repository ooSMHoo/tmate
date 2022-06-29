<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lodging2.css?after" type="text/css">

<c:forEach var="vo" items="${reviewList}">
<div class="mt-3 border-bottom">
	<div style="width: 92%;">
	<div style="border: 1px solid #eee;">
		<div class="mb-3 justify-content-start row pt-2">
			<div class="col-sm-2  bd-highlight p-2">
				<div class="h4 text-center">
					${vo.revGrade > 3 ? '<i class="bi bi-emoji-smile"></i>' : '<i class="bi bi-emoji-neutral"></i>'}
				</div>
				<div class="col-sm bd-highlight text-center ">
					${vo.memberId}님
				</div>
			</div>
			<div class=" col-sm bd-highlight p-2">
				<p class="h6 "> "${vo.revSubject}" </p>
			<div class=" col-sm bd-highlight ">
			<div class="d-flex">
				<div class="star-ratings">
					<div class="star-ratings-fill h5" style=" width: ${vo.revGrade*20}% ">
						<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
					</div>
					<div class="star-ratings-base h5">
						<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
					</div>	
				</div>
					<div style="width: 85%;">
				</div>	
			</div>
			</div>
			</div>
		</div>
	</div>
		
	
	<div class="text-secondary">
		[${vo.roomName}]
	</div>
	<div class="py-2">
		${vo.revContent}
	</div>
	<div class="mb-1">
		${vo.revReg_date}
	</div>
	
		<div class="host_modal">
			<div>
				        
			</div>
		</div>
	
	
		<c:if test="${!empty vo.resAnswer}">

		<div class="bg-light mb-2 p-2" >
			<div class=" mb-3 justify-content-start  ">
				<div class=" row">
					<div class="col-sm-1 bd-highlight text-center h5 ">
						<i class="fa-solid fa-building-user"></i>
					</div>
					<div class="col-sm-11 bd-highlight ">
						<strong> 제휴점의 답변</strong>
					</div>
				</div>
			</div>
			<div class="align-content-start ms-3 mb-2">
				<div >${vo.resAnswer}</div>					
			</div>
		</div>
	 </c:if>
 </div>
</div>

</c:forEach>

<div class="page-box" style="margin-top: 30px;">
	${paging}
</div>