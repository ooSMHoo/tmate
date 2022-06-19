<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hostPage.css" type="text/css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<div class="mt-3">
	<div class="d-flex">
		<div style="width: 8%;">
			<div>
				<i class="fa-solid fa-user"></i>
			</div>
			<div>
				OOO 님
			</div>
		</div>
		<div class=" "style="width: 92%;">
			<div>
				리뷰 제목
			</div>
			<div class="d-flex">
					<div class="star-ratings">
						<div class="star-ratings-fill" style="{ width: ratingToPercent + '%' }">
							<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
						</div>
						<div class="star-ratings-base">
							<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
						</div>	
					</div>
					<div style="width: 85%;">
						몇점
					</div>	
			</div>
			<div>
				선택 객실
			</div>
			<div>
				리뷰내용이에요~
				어떻게 이럴 수 있는지 정말 좋더라구요.
			</div>
			<div>
				날짜
			</div>
			
				<div class="host_modal">
					<div>
						<button type='button' class='btn btn-light btnSendReplyLike' data-replyNum='${vo.replyNum}' data-replyLike='1' title="좋아요"><i class="bi bi-hand-thumbs-up"></i> <span>${vo.likeCount}</span></button>
						<button type='button' class='btn btn-light btnSendReplyLike' data-replyNum='${vo.replyNum}' data-replyLike='0' title="싫어요"><i class="bi bi-hand-thumbs-down"></i> <span>${vo.disLikeCount}</span></button>	        
					</div>
				</div>
			
			
			
			<div class="mt-2 d-flex room_review">
				<div class="tm_wid8">
					<div>
						<i class="fa-solid fa-building-user"></i>
					</div>
					<div>
						OOO
					</div>
				</div>
				<div class="tm_wid92">
					<div>제휴점 답변</div>
					<div>답변 내용 답변 내용</div>		
					<div>시간</div>						
				</div>
			</div>
			
		</div>
	</div>
</div>