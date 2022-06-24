<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lodging.css?after" type="text/css">

<c:forEach var="vo" items="${reviewList}">
<div class="mt-3">
	<div class="d-flex">
		<div style="width: 8%;">
			<div>
				<i class="fa-solid fa-user"></i>
			</div>
			<div>
				${vo.memberId} 님
			</div>
		</div>
		<div class=" "style="width: 92%;">
			<div>
				${vo.revSubject}
			</div>
			<div class="d-flex">
					<div class="star-ratings">
						<div class="star-ratings-fill" style=" width: ${vo.revGrade*20}% ">
							<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
						</div>
						<div class="star-ratings-base">
							<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
						</div>	
					</div>
					<div style="width: 85%;">
					</div>	
			</div>
			<div>
				${vo.roomName}
			</div>
			<div>
				${vo.revContent}
			</div>
			<div>
				${vo.revReg_date}
			</div>
			
				<div class="host_modal">
					<div>
						        
					</div>
				</div>
			
			
			<c:if test="${!empty vo.resAnswer}">
			<div class="mt-2 d-flex room_review">
				<div class="tm_wid8">
					<div>
						<i class="fa-solid fa-building-user"></i>
					</div>
					<div>
						${vo.lodgName}
					</div>
				</div>
				<div class="tm_wid92">
					<div>${vo.resAnswer}</div>					
				</div>
			</div>
			</c:if>
		</div>
	</div>
</div>
</c:forEach>

<div class="page-box" style="margin-top: 30px;">
	${paging}
</div>