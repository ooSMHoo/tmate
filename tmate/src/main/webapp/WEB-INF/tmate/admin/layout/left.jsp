﻿<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<nav>
	<header>
		관리자
	</header>

	<ul>
		<li><a href="${pageContext.request.contextPath}/admin">메인</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/revenue">수익관리</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/memberManage/list">회원관리</a></li>
		<li><a>신고관리</a></li>
		<li><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
		<li><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
	</ul>
</nav>
