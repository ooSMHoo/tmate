<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lodging.css?after" type="text/css">

<c:if test="${list.size() > 0}">
	<c:forEach var="dto" items="${list}" varStatus="status">
	<div class="card like-card-rev" style="width: 18rem;" >
		<img src="${pageContext.request.contextPath}/resources/images/back.png" class="card-img-top" alt="...">
		<div class="card-body" id="review-card">
			<h5 class="card-title">${dto.lodgName}</h5>
			<p>${dto.roomName}</p>
			<p>체크아웃 : ${dto.resCout_date}일 </p>
			<hr>
			<c:if test="${revNum==true}">
			<button type="button" class="btn-rev " data-bs-toggle="modal" data-bs-target="#revWrite"style="margin-right: 130px;">리뷰쓰기</button>	
			</c:if>
			<button type="button" class="btn-rev btn-singo"  onclick="">신고하기</button>
		</div>
	</div>
	</c:forEach>
	
</c:if>


<div class="modal fade" id="revWrite" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel" style="height: 15px; vertical-align:middle;">리뷰작성하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<form class="w-75" name="reviewForm">
			<div class="mt-3">
				<div class="d-flex">
					<div class="star-rating">
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
						<span id="rating_result" style="margin-left: 10px;"></span>점
						<input type="hidden" name="reviewrating">
					</div>
				</div>
				<div>
				  <textarea class="form-control" placeholder="내용을 입력하세요" "floatingTextarea2" style=" resize: none; height: 100px; margin-top: 10px;"  ></textarea>
				</div>
			</div>
		</form>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">작성하기</button>
      </div>
    </div>
  </div>
</div>
