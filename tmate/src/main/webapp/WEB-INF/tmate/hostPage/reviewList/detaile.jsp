<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<!-- 답변/수정 모달 -->
<form id="deteailedMemberForm" name="deteailedMemberForm" method="post">
	<div class="table td-border mx-auto my-10" style="font-size: 19px; margin-top: 30px;">
			<div class="ps-2" >
			<textarea  name="resAnswer" id="resAnswer" class="form-control" placeholder="답변을 입력하세요." style="width: 95%" 
				cols="25" rows="6">${dto.resAnswer}</textarea>
			</div>
	</div>
</form>


