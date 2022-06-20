<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hostPage.css" type="text/css">

	

<table class="table td-border mx-auto my-10" style="font-size: 19px; margin-top: 30px;">
	<tr>
		<td class="wp-15 text-center bg-light">예약번호</td>
		<td class="wp-35 ps-5">${dto.resNum}</td>
		<td class="wp-15 text-center bg-light">객실명</td>
		<td class="wp-35 ps-5">${dto.roomName}</td>
	</tr>
	<tr>
		<td class="text-center bg-light">예약자명</td>
		<td class="ps-5">${dto.resName}</td>
		<td class="text-center bg-light">전화번호</td>
		<td class="ps-5">${dto.resPhone}</td>
	</tr>
	<tr>
		<td class="text-center bg-light">이메일</td>
		<td class="ps-5">${dto.memberEmail}</td>
		<td class="text-center bg-light">예약일자</td>
		<td class="ps-5">${dto.resReg_date}</td>
	</tr>
	<tr>
		<td class="text-center bg-light">입실일자</td>
		<td class="ps-5">${dto.resCin_date}</td>
		<td class="text-center bg-light">퇴실일자</td>
		<td class="ps-5">${dto.resCout_date}</td>
	</tr>
	<tr>
		<td class="text-center bg-light">결제금액</td>
		<td class="ps-5">${dto.resTotalcost}</td>
		<td class="text-center bg-light">포인트사용</td>
		<td class="ps-5">${dto.resPoint}</td>
	</tr>
	<tr>
		<td class="text-center bg-light">예약상태</td>
		<td class="ps-5">
			<c:choose>
				<c:when test="${dto.resCode==0}">예약완료</c:when>
				<c:when test="${dto.resCode==1}">관리자취소</c:when>
				<c:when test="${dto.resCode==2}">예약취소</c:when>
				<c:otherwise>환불</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<!-- 
	<tr>
		<td class="pe-7 text-center bg-light">메 모</td>
		<td class="ps-5">${dto.hostMemo}</td>
	</tr>
	 -->
</table>



