<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.container-chart {
	max-width: 850px;
	padding-bottom: 15px;
	box-shadow: 0 4px 4px -4px black;
	font-family: "Noto Sans KR", sans-serif;
}

.container-chart .box {
	box-sizing: border-box;
	padding: 10px;
	width: 95%;
	margin: 0 auto;
	height: 250px;
	border: 1px solid #1f93fa;
	text-align: center;
}

.container-chart .date {
	padding: 10px;
	font-size : 15px;
	text-align: center; 
}

.container-info {
	margin-top: 20px;
	margin-bottom: 20px;
	padding-top: 5px;
	padding-bottom: 5px;
	font-family: "Noto Sans KR", sans-serif;
}

.container-info .info-box { 
	display: grid;
    grid-template-columns: 2fr 3fr;  
    width: 95%;
    margin: 20px auto;
    
    background-color : #fff;
    border-radius : 5px;
}

.box1 {
	width : 550px;
	height : 600px;
	background: #fff;
	border: 1px solid #1f93fa;
	grid-row: span 2;
	margin-right: 20px;
	box-shadow: 0 4px 4px -4px black;
	font-family: "Noto Sans KR", sans-serif;
}

.box2 {
	border: 1px solid #1f93fa;
	margin-bottom: 20px;
	box-shadow: 0 4px 4px -4px black;
	font-family: "Noto Sans KR", sans-serif;
}

.box3{
	border: 1px solid #1f93fa;
	box-shadow: 0 4px 4px -4px black;
	font-family: "Noto Sans KR", sans-serif;
}

</style>

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

	<div class="container container-chart">
		<p class="date">2022년 6월 8일</p>
		<div id="lineContainer1" class="box">그래프</div>
	</div>

	<div class="container container-info">
		<div class="info-box">
		  <div class="box1">
		 	 <main>
				<div class="body-container">
	   				<div class="body-title" style="text-align: center;">
						<h4> 호스트 신청 대기목록 </h4>
	    			</div>
	  		  
	  			<div class="body-main">					
						<table class="table table-border table-list">
							<thead>
								<tr style="background-color: #F5F9FF;"> 
									<th class="wx-30">번호</th>
									<th class="wx-70">아이디</th>
									<th class="wx-70">대표자</th>
									<th>업체명</th>
									<th class="wx-30">승인여부</th>
								</tr>
							</thead>
							
							<tbody>
								<c:forEach var="dto" items="${list}">
									<tr class="hover" onclick="detailedMember('${dto.mhId}');"> 
										<td>${dto.listNum}</td>
										<td>${dto.mhId}</td>
										<td>${dto.memberName}</td>
										<td>${dto.mhName}</td>
										<td>${dto.mhSign==1?"승인":"대기"}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						 
						<div class="page-box">
								${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
						</div>
				</div>
				</div>
			</main>
		  </div>
		  
		  
		 <div class="box2">
		 	<p> 등록된 숙소 수 : ${dataCount}</p>
		 	<p> 고객 수 : </p>
		 	<p> 호스트 수 : </p>
		 	
		 </div>
		 <div class="box3">신고수</div> 
	  </div> 
	</div>
</main>