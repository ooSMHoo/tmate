<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css" type="text/css">

<div class="friend-box">
<h3 style="font-size:22px; font-weight: bold; color: #044b85;">친구목록</h3>

<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">친구목록</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">신청친구목록</button>
  </li>
</ul>


<!-- Tab panes -->
<div class="tab-content">
	<div class="tab-pane active " id="home" role="tabpanel"
		aria-labelledby="home-tab">
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col">아이디</th>
					<th scope="col">친구 승인 일자</th>
					<th scope="col">상태</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>Mark</td>
					<td>Otto</td>
					<td>
						<button class="friend-btn">차단하기</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-tab">
  		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col">아이디</th>
					<th scope="col">친구 신청 일자</th>
					<th scope="col">상태</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>Mark</td>
					<td>Otto</td>
					<td>
						<button class="friend-btn">승인하기</button>
						<button class="friend-btn">거절하기</button>
					</td>
				</tr>
			</tbody>
		</table>
  </div>
</div>
</div>