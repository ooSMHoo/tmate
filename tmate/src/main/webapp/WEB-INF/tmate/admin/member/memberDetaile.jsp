<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h3 style="font-size: 15px; padding-top: 10px;"><i class="icofont-double-right"></i> 고객 정보</h3>
<table class="table td-border mx-auto my-10">
	<tr>
		<td class="wp-15 text-center bg-light">아이디</td>
		<td class="wp-35 ps-5">${dto.memberId}</td>
		<td class="wp-15 text-center bg-light">성함</td>
		<td class="wp-35 ps-5">${dto.memberName}</td>
	</tr>
	<tr>
		<td class="text-center bg-light">가입 일자</td>
		<td class="ps-5">${dto.memberReg_date}</td>
		<td class="text-center bg-light">정보수정 일자</td>
		<td class="ps-5">${dto.memberMod_date}</td>
	</tr>
	<tr>
		<td class="text-center bg-light">회원 유형</td>
		<td class="ps-5">${dto.memberAuth==0?"일반 회원":""}</td>
		<td class="text-center bg-light">이메일</td>
		<td class="ps-5">${dto.memberEmail}</td>
	</tr>
	
	<tr>
		<td class="text-center bg-light">생년월일</td>
		<td class="ps-5">${dto.memberBirth}</td>
		<td class="text-center bg-light">핸드폰 번호</td>
		<td class="ps-5">${dto.memberPhone}</td>
	</tr>

	<tr>
		<td class="text-center bg-light">계정 상태&nbsp;&nbsp;</td>
		<td colspan="3" class="ps-5">
			&nbsp; ${dto.enabled==1?"활성":"잠금"}
			&nbsp;&nbsp;
			<button type="button" class="btn" onclick="enabledUpdate('${dto.memberId}', '${dto.enabled}')">상태변경</button>
		</td>
	</tr>
</table>
