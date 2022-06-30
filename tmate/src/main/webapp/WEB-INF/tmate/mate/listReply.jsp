<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class='reply-info'>
	<span class='reply-count'>댓글 ${replyCount}개</span>
	<span>[목록, ${pageNo}/${total_page} 페이지]</span>
</div>

<table class='table table-borderless'>
	<c:forEach var="vo" items="${listReply}">
		<tr class='border bg-light'>
			<td width='50%'>
				<div class='row reply-writer'>
					<div class='col-1'><i class='bi bi-person-circle text-muted icon'></i></div>
					<div class='col-auto align-self-center'>
						<div class='name'>${vo.memberName}</div>
						<div class='date'>${vo.mateRe_reg_date}</div>
					</div>
				</div>
			</td>
			<td width='50%' align='right' class='align-middle'>
				<div class='deleteReply reply-menu-item' data-mateRe_num='${vo.mateRe_num}' data-pageNo='${pageNo}'>삭제</div>
			</td>
		</tr>
		<tr>
			<td colspan='2' valign='top'>${vo.mateRe_content}</td>
		</tr>

		<tr>
			<td>
				<button type='button' class='btn btn-light btnReplyAnswerLayout' data-mateRe_num='${vo.mateRe_num}'>답글 <span id="answerCount${vo.mateRe_num}">${vo.answerCount}</span></button>
			</td>

		</tr>
	
	    <tr class='reply-answer'>
	        <td colspan='2'>
	        	<div class='border rounded'>
		            <div id='listReplyAnswer${vo.mateRe_num}' class='answer-list'></div>
		            <div>
		                <textarea class="form-control m-2"></textarea>
		            </div>
					<div class='text-end pe-2 pb-1'>
						<button type='button' class='nobtn1 btn-light btnSendReplyAnswer' data-mateRe_num='${vo.mateRe_num}'>답글 등록</button>
		            </div>
	            </div>
			</td>
	    </tr>
	</c:forEach>
</table>

<div class="page-box">
	${paging}
</div>			
