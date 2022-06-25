<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lodging.css?after" type="text/css">

	<c:forEach var="dto" items="${list}" varStatus="status">
	<div class="card like-card-rev" style="width: 18rem;" >
		<img src="${pageContext.request.contextPath}/resources/images/back.png" class="card-img-top" alt="...">
		<div class="card-body" id="review-card">
			<h5 class="card-title">${dto.lodgName}</h5>
			<p>${dto.roomName}</p>
			<p>체크아웃 : ${dto.resCout_date} </p>
			<hr>
			<c:if test="${revNum==true}">
			<button type="button" class="btn-rev" data-bs-toggle="modal" data-bs-target="#revWrite" data-id="${dto.resNum}" style="margin-right: 130px;">리뷰쓰기</button>	
			</c:if>
			<button type="button" class="btn-rev" data-bs-toggle="modal" data-bs-target="#singo" data-id="${dto.mhId}">신고하기</button>
		</div>
	</div>
	</c:forEach>
	
<div style="clear: both;">${paging}</div>
<!-- 리뷰 -->
<div class="modal fade" id="revWrite" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header" style="margin-bottom: 5px; padding: 5px;">
        <h5 class="modal-title" id="staticBackdropLabel" >리뷰작성하기</h5>
        <button type="button" class="btn-close me-1" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="writeReview">
      	<form class="w-75" name="reviewForm" method="post">
			<div class="mt-3">
					<p id="subject">숙소는 어떠셨어요?</p>
				<div class="d-flex justify-content-center" style="width:100%; margin-left: 65px;">
					<div class="star-rating" style="border: none;">
					  <input type="radio" id="5-stars" name="rating" value="5">
					 	 <label for="5-stars" class="star">&#9733;</label>
					  <input type="radio" id="4-stars" name="rating" value="4">
					  	<label for="4-stars" class="star">&#9733;</label>
					  <input type="radio" id="3-stars" name="rating" value="3">
					  	<label for="3-stars" class="star">&#9733;</label>
					  <input type="radio" id="2-stars" name="rating" value="2">
					  	<label for="2-stars" class="star">&#9733;</label>
					  <input type="radio" id="1-star" name="rating" value="1">
					 	 <label for="1-star" class="star">&#9733;</label>
					</div>
					<div>
						<input type="hidden" name="reviewrating">
					</div>
					<div>
						<input id="resNum" type="hidden" name="resNum">
					</div>
				</div>
				<div>
					<input class="form-control form-memo" name="revSubject" placeholder="제목을 입력하세요">
				</div>
				<div>
				  <textarea class="form-control form-memo" name="revContent" placeholder="내용을 입력하세요." style=" resize: none; height: 100px; margin-top: 10px;"  ></textarea>
				</div>
			</div>
		</form>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="addReview();">작성하기</button>
      </div>
    </div>
  </div>
</div>

<!-- 신고 -->
<div class="modal fade" id="singo" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header" style="margin-bottom: 5px; padding: 5px;">
        <h5 class="modal-title" id="staticBackdropLabel">신고하기</h5>
        <button type="button" class="btn-close me-1" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<form class="w-75" name="reportForm">
			<div class="mt-3">
		
				<select class="form-select" name="stateCode" id="stateCode" onchange="selectStateChange()">
					<option value="">신고사유</option>
					<c:if test="${dto.enabled==0}">
						<option value="0">잠금 해제</option>
					</c:if>
					<option value="2">불법적인 숙소</option>
					<option value="3">게시물과 다른 숙소</option>
					<option value="4">개인정보 유출</option>
					<option value="5">기타 약관 위반</option>
				</select>

				<div>
				  <textarea class="form-control form-memo" placeholder="신고 상세 내용을 입력하세요." style=" resize: none; height: 100px; margin-top: 10px;"></textarea>
				</div>
			</div>
		</form>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">신고하기</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
$(".btn-rev").click(function(){
	var data = $(this).data('id');
	const f = document.reviewForm;
	$("form[name=reviewForm] input[type=radio]").each(function(){
		$(this).prop("checked", false);
	});
	$("form[name=reviewForm] input[name=revSubject]").val("");
	$("form[name=reviewForm] textarea[name=revContent]").val("");
    $("#writeReview #resNum").val(data);
});

function addReview() {
	const f = document.reviewForm;
	let str;
	
	str = f.rating.value;
	if( ! str ) {
		alert("별점을 선택해주세요.");
		return;
	}
	
	str = f.revSubject.value;
	if( ! str ) {
		alert("제목을 입력해주세요.");
		f.revSubject.focus();
		return;
	}
	
	str = f.revContent.value;
	if( ! str ) {
		alert("내용을 입력해주세요.");
		f.revContet.focus();
		return;
	}
	
	f.action="${pageContext.request.contextPath}/mypage/main/addReview";
	f.submit();
}
</script>