<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.body-main {
	max-width: 850px;
	padding : 20px;
	font-family: "Noto Sans KR", sans-serif;
}

.body-container {
	background-color : #fff;
	max-width: 850px;
	box-shadow: 0 4px 4px -4px black;
}


.body-title h2{
	border-bottom: none;
}

.contentList {
	display: none;
}

.reportTitle {
	min-height : 40px;
	width: 100%;
	display: flex;
	background-color:#FFFFC6;
	display: flex;
    justify-content: center;
    align-items: center;
}

.reportContent {
	min-height : 120px;
	padding: 20px;
}


.reportResult {
	min-height : 40px;
	display: flex;
    justify-content: center;
    align-items: center;
}
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admincss/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admincss/board.css" type="text/css">

<script type="text/javascript">

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data){
			fn(data);
		},
		beforeSend : function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error : function(jqXHR) {
			if (jqXHR.status === 403) {
				location.href="${pageContext.request.contextPath}/member/login";
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패했습니다.");
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

function searchHrCodeList() {
	const f = document.searchForm;
	f.hrCode.value=$("#selectHrCode").val();
	f.action="${pageContext.request.contextPath}/admin/report/hostReportList";
	f.submit();
}

function enabledUpdate(mhId, mhEnabled) {
	if(! confirm("계정 상태를 변경 하시겠습니까 ?")) {
		return;
	}
	
	if(mhEnabled == "0") {
		mhEnabled = "1";
	} else {
		mhEnabled = "0";
	}
	let url = "${pageContext.request.contextPath}/admin/report/updateHostEnabled";
	let query = "mhId="+mhId+"&mhEnabled="+mhEnabled;
	
	const fn = function(data){
		location.href="${pageContext.request.contextPath}/admin/report/hostReportList";
	};
	ajaxFun(url, "post", query, "json", fn);
}

$(function(){
	$(".titleList").click(function(){
		$(this).next(".contentList").toggle();
	});
});


function confirmOk(mhId) {
	if(! confirm("신고를 처리하시겠습니까 ?")) {
		return;
	}
	
	let url = "${pageContext.request.contextPath}/admin/report/updateHrCode";
	let query = "mhId="+mhId+"&hrCode=1";
	
	const fn = function(data){
		location.href="${pageContext.request.contextPath}/admin/report/hostReportList";
	};
	ajaxFun(url, "post", query, "json", fn);
}

function searchList() {
	const f = document.searchForm;
	f.hrCode.value=$("#selectHrCode").val();
	f.hrCode.value=$("#selectHrCode").val();
	f.action="${pageContext.request.contextPath}/admin/report/hostReportList";
	f.submit();
}

</script>

<main>
	<div class="body-container">
	    <div class="body-title" style="text-align: center;">
			<h2>신고 관리 </h2>
	    </div>
	    
	    <div class="body-main">
			
				<table class="table">
					<tr>
						<td align="left" width="50%">
							${dataCount}개(${page}/${total_page} 페이지)
						</td>
							<td align="right" width="100">
								<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/report/hostReportList';">새로고침</button>
								<select id="selectHrCode" class="form-select" onchange="searchHrCodeList();">
									<option value="" ${hrCode=="" ? "selected='selected'":""}>::처리상태::</option>
									<option value="1" ${hrCode=="1" ? "selected='selected'":""}>완료</option>
									<option value="0" ${hrCode=="0" ? "selected='selected'":""}>대기</option>
								</select>
							</td>
							
					</tr>
				</table>
					  	
				<table class="table table-border table-list">
					<thead>
						<tr style="background-color: #FFDC7E;"> 
							<th class="wx-60">번호</th>
							<th class="wx-80">신고자</th>
							<th class="wx-80">호스트</th>
							<th class="">사업자명</th>
							<th class="wx-80">처리 상태</th>
						</tr>
					</thead>
						<!-- 번호, 신고자 아이디, 신고당한 호스트 아이디, 사업자명, 신고제목, 신고처리여부-->
					<tbody>
						<c:forEach var="dto" items="${list}">
							<tr class="hover titleList"> 
								<td>${dto.listNum}</td>
								<td>${dto.memberId}</td>
								<td>${dto.mhId}</td>
								<td>${dto.memberName}</td>
								<td>${dto.hrCode==0?"대기":"완료"}</td>
							</tr>
							<tr class="contentList">
								<td colspan="6">
									<div class="reportTitle">
										<div style="float: left; width: 100%;">${dto.hrSubject}</div>
									</div>
									<div class="reportContent"> ${dto.hrContent}</div>
									<div class="reportResult" style="background-color:#FFFFC6;">
									신고된 호스트 현재 계정상태 : &nbsp;&nbsp;
									${dto.mhEnabled == 0 ? "활성" : "잠금"}
									&nbsp;&nbsp;
									<button type="button" class="btn" onclick="enabledUpdate('${dto.mhId}', '${dto.mhEnabled}')">상태변경</button>
									&nbsp;
									<button type="button" class="btn" onclick="confirmOk('${dto.mhId}', '${dto.hrCode}')">처리완료</button>
									</div>
								</td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
						 
				<div class="page-box">
					${dataCount == 0 ? "처리할 신고가 없습니다." : paging}
				</div>
						
				<table class="table">
					<tr>
						<td align="center">
							<form name="searchForm" action="${pageContext.request.contextPath}/admin/report/hostReportlist" method="post">
								<select name="condition" class="form-select">
									<option value="memberId"  ${condition=="memberId" ? "selected='selected'":""}>신고자 아이디</option>
									<option value="mhId"  ${condition=="mhId" ? "selected='selected'":""}>호스트 아이디</option>
									<option value="mhname" ${condition=="mhname" ? "selected='selected'":""}>사업체명</option>
								</select>
								<input type="text" name="keyword" class="form-control" value="${keyword}">
								<input type="hidden" name="hrCode" value="${hrCode}">
								<input type="hidden" name="mhEnabled" value="${mhEnabled}">
								<input type="hidden" name="page" value="1">
								<button type="button" class="btn" onclick="searchHrCodeList()">검색</button>
							</form>
						</td>
					</tr>
				</table>
			
			</div>

	</div>
	<div id="member-dialog" style="display: none;"></div>
</main>