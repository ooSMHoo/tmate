<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h3 style="font-size: 15px; padding-top: 10px;"><i class="icofont-double-right"></i> 호스트 정보</h3>
<table class="table td-border mx-auto my-10">
	<tr>
		<td class="wp-15 text-center bg-light">사업자 번호</td>
		<td class="wp-35 ps-5">${dto.mhNum}</td>
		<td class="wp-15 text-center bg-light">사업자명</td>
		<td class="wp-35 ps-5">${dto.mhName}</td>
	</tr>
	<tr>
		<td class="text-center bg-light">회원아이디</td>
		<td class="ps-5">${dto.mhId}</td>
		<td class="text-center bg-light">회원이름</td>
		<td class="ps-5">${dto.memberName}</td>
	</tr>
	<tr>
		<td class="text-center bg-light">전화번호</td>
		<td class="ps-5">${dto.mhPhone}</td>
		<td class="text-center bg-light">이메일</td>
		<td class="ps-5">${dto.memberEmail}</td>
	</tr>
	
	
	
	<tr>
		<td class="text-center bg-light">승인여부</td>
		<td colspan="3" class="ps-5">
			${dto.memberAuth==2?"승인완료":"대기"}
			<c:if test="${dto.mhSign==0}">
				&nbsp;&nbsp;
				<button type="button" class="btn" onclick="signUpdate('${dto.mhId}')">승인</button>
				<button type="button" class="btn" onclick="deleteUpdate('${dto.mhId}')">거절</button>
			</c:if>
		</td>
	</tr>
	
	<tr>
		<td class="text-center bg-light">계정상태</td>
		<td colspan="3" class="ps-5">
			${dto.mhEnabled==0?"활성":"잠금"}
			&nbsp;&nbsp;
			<button type="button" class="btn" onclick="enabledUpdate('${dto.mhId}', '${dto.mhEnabled}')">상태변경</button>
		</td>
	</tr>
</table>
