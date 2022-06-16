<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />


		<div class=" d-flex flex-column  flex-menu">
	
			<ul class="nav nav-pills flex-column">

				<li><a href="${pageContext.request.contextPath}/mypage/reservationList" class="nav-link nav-link-menu pt-4"> 
					<i class="fa-solid fa-calendar-check"></i>
					예약관리 
				</a></li>
				
				
				<li><a href="${pageContext.request.contextPath}/mypage/likeList" class="nav-link nav-link-menu"> 
					<i class="fa-brands fa-gratipay"></i>
					찜 목록 
				</a></li>
				
				
				<li><a href="${pageContext.request.contextPath}/mypage/friend" class="nav-link nav-link-menu"> 
					<i class="fa-solid fa-people-group"></i>
					친구목록 
				</a></li>
				
				<li><a href="${pageContext.request.contextPath}/mypage/reviewList" class="nav-link nav-link-menu"> 
					<i class="fa-solid fa-star"></i>
					리뷰 관리
				</a></li>
				
				<li><a href="${pageContext.request.contextPath}/mypage/point" class="nav-link nav-link-menu"> 
					<i class="fa-brands fa-product-hunt"></i>
					포인트 관리 
				</a></li>
				
				
				<li><a href="${pageContext.request.contextPath}/mypage/update" class="nav-link nav-link-menu"> 
					<i class="fa-solid fa-circle-user"></i>
					회원정보
				</a></li>
				
				<li><a href="${pageContext.request.contextPath}/hosts/add" class="nav-link nav-link-menu"> 
					<i class="fa-solid fa-house-user"></i>
					호스트신청
				</a></li>
				
			</ul>
			

			
		</div>

