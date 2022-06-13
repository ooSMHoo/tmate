<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<style>
@font-face {
    font-family: 'MapoBackpacking';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoBackpackingA.woff') format('woff');
    font-weight: normal;
    font-style: normal; 
}
.navbar-font{
	font-size: 25px;
	font-family:MapoBackpacking;  
}
</style>
	<nav class="navbar navbar-expand-lg navbar-light navbar-font" style=" font-size:14pt;" >
		<div class="container-fluid ms-5">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/" style="color:#ffa81e; font-family: MapoBackpacking; font-size:17pt;">트레블&amp;메이트</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav ms-auto flex-nowrap">
					<li class="nav-item me-3"><a class="nav-link" href="${pageContext.request.contextPath}/lodgingmain">예약</a>
					</li>
					<li class="nav-item me-3"><a class="nav-link" href="${pageContext.request.contextPath}/chat/list">채팅</a>
					</li>

					<li class="nav-item dropdown me-3"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> 커뮤니티 </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/board/list">자유게시판</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/pr/list">홍보게시판</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/partner/list">여행파트너</a></li>
						</ul></li>

					<li class="nav-item dropdown me-3"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> 공지사항 </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/faq/list">FAQ</a></li>
						</ul></li>


					
				<c:choose>
					<c:when test="${empty sessionScope.member}">
						<a href="${pageContext.request.contextPath}/member/login"
							title="로그인" style="padding-top:10px; padding-right: 30px; text-decoration: none;  color: gray;" >로그인</a>
						<a href="${pageContext.request.contextPath}/member/join"
							title="회원가입" style="padding-top:10px; text-decoration: none;  color: gray; padding-right: 40px;">회원가입</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/member/logout"
							title="로그아웃" style="padding-top:10px; padding-right: 30px; text-decoration: none;  color: gray;">로그아웃</a>
							
							<c:choose>
							<c:when test="${sessionScope.member.membership>50}">
							<a href="${pageContext.request.contextPath}/admin/main" title="관리자"  style="padding-top:10px; 
							text-decoration: none; color: gray; padding-right: 40px;">관리자페이지</a>
							</c:when>
							<c:when test="${sessionScope.member.membership==2}">
							<a href="${pageContext.request.contextPath}/hostPage/home" title="호스트"  style="padding-top:10px; 
							text-decoration: none; color: gray; padding-right: 40px;">호스트페이지</a>
							</c:when>
							<c:otherwise>
							<a href="${pageContext.request.contextPath}/mypage/main/reservationList" title="마이페이지" style="padding-top:10px;  
							text-decoration: none; color: gray; padding-right: 40px;">마이페이지</a> 
							</c:otherwise> 
							</c:choose>
					
					</c:otherwise>
				</c:choose>
			

				</ul>
			</div>
		</div>
	</nav>
