<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lodging.css?after" type="text/css">

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
				<span id="rating_result"></span>점
				<input type="hidden" name="reviewrating">
			</div>
		</div>
		<select name="roomNameRivew">
			<option value=""></option>
		</select>
		<div>
		  <textarea class="w-100 mt-3" style="resize: none; height: 150px;"></textarea>
		</div>
		<div class="mt-2 mb-3 host_modal">
			<button type="button" onclick=""> 작성하기 </button>
		</div>
	</div>
</form>