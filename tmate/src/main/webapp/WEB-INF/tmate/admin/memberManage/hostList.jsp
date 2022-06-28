<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	box-shadow: 0 .5rem 1rem rgba(0,0,0,.15);
}

.body-title h2{
	border-bottom: none;
	
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


function searchEnabledList() {
	const f = document.searchForm;
	f.mhEnabled.value=$("#selectEnabled").val();

	f.action="${pageContext.request.contextPath}/admin/memberManage/hostList";
	f.submit();
}

function searchList() {
	const f = document.searchForm;
	f.mhSign.value=$("#selectSign").val();

	f.action="${pageContext.request.contextPath}/admin/memberManage/hostList";
	f.submit();
}
	
function detailedMember(mhId) {
	var dlg = $("#member-dialog").dialog({
		  autoOpen: false,
		  modal: true,
		  buttons: {
		       " 닫기 " : function() {
		    	   $(this).dialog("close");
		       }
		  },
		  height: 540,
		  width: 830,
		  title: "호스트상세정보",
		  close: function(event, ui) {
		  }
	});

	let url = "${pageContext.request.contextPath}/admin/memberManage/hostDetaile";
	let query = "mhId="+mhId;
	
	const fn = function(data){
		$('#member-dialog').html(data);
		dlg.dialog("open");
	};
	ajaxFun(url, "post", query, "html", fn);
}

function signUpdate(mhId) {
	if(! confirm("호스트를 승인하시겠습니까 ?")) {
		return;
	}
	let url = "${pageContext.request.contextPath}/admin/memberManage/updateHostSign";
	let query = "mhId="+mhId+"&mhSign=1";
	
	const fn = function(data){
		location.href="${pageContext.request.contextPath}/admin/memberManage/hostList";
	};
	ajaxFun(url, "post", query, "json", fn);
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
	let url = "${pageContext.request.contextPath}/admin/memberManage/updateHostEnabled";
	let query = "mhId="+mhId+"&mhEnabled="+mhEnabled;
	
	const fn = function(data){
		location.href="${pageContext.request.contextPath}/admin/memberManage/hostList";
	};
	ajaxFun(url, "post", query, "json", fn);
}

</script>

<main>
	<div class="body-container">
	    <div class="body-title" style="text-align: center;">
			<h2>호스트 관리 </h2>
	    </div>
	    
	    <div class="body-main">
			
				<table class="table">
					<tr>
						<td align="left" width="50%">
							${dataCount}개(${page}/${total_page} 페이지)
						</td>
						<td align="right" width="120">
							<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/memberManage/hostList';">새로고침</button>
							<select id="selectSign" class="form-select" onchange="searchList();">
									<option value="" ${mhSign=="" ? "selected='selected'":""}>::승인상태::</option>
									<option value="1" ${mhSign=="1" ? "selected='selected'":""}>승인 계정</option>
									<option value="0" ${mhSign=="0" ? "selected='selected'":""}>대기 계정</option>
							</select>
							
							<select id="selectEnabled" class="form-select" onchange="searchEnabledList();">
								<option value="" ${mhEnabled=="" ? "selected='selected'":""}>::활성화상태::</option>
								<option value="0" ${mhEnabled=="0" ? "selected='selected'":""}>활성 계정</option>
								<option value="1" ${mhEnabled=="1" ? "selected='selected'":""}>잠금 계정</option>
							</select>
							
						</td>
							
					</tr>
				</table>
					
				<table class="table table-border table-list">
					<thead>
						<tr style="background-color: #F5F9FF;"> 
							<th class="wx-60">번호</th>
							<th class="wx-100">아이디</th>
							<th class="wx-100">대표자</th>
							<th>업체명</th>
							<th class="wx-120">전화번호</th>
							<th class="wx-60">승인여부</th>
							<th class="wx-60">활성여부</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="dto" items="${list}">
						<tr class="hover" onclick="detailedMember('${dto.mhId}');"> 
							<td>${dto.listNum}</td>
							<td>${dto.mhId}</td>
							<td>${dto.memberName}</td>
							<td>${dto.mhName}</td>
							<td>${dto.mhPhone}</td>
							<td>${dto.mhSign==1?"승인":"대기"}</td>
							<td>${dto.mhEnabled==0?"활성":"잠금"}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
						 
				<div class="page-box">
					${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
				</div>
						
				<table class="table">
					<tr>
						<td align="center">
							<form name="searchForm" action="${pageContext.request.contextPath}/admin/memberManage/hostList" method="post">
								<select name="condition" class="form-select">
									<option value="mhId"     ${condition=="mhId" ? "selected='selected'":""}>아이디</option>
									<option value="mhName"   ${condition=="mhName" ? "selected='selected'":""}>사업체명</option>
								</select>
								<input type="text" name="keyword" class="form-control" value="${keyword}">
								<input type="hidden" name="mhSign" value="${mhSign}">
								<input type="hidden" name="mhEnabled" value="${mhEnabled}">
								<input type="hidden" name="page" value="1">
								<button type="button" class="btn" onclick="searchList()">검색</button>
							</form>
						</td>
					</tr>
				</table>
			
			</div>

	</div>
	<div id="member-dialog" style="display: none;"></div>
</main>
