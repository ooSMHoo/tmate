<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css" type="text/css">
<script type="text/javascript">
function login() {
	location.href="${pageContext.request.contextPath}/member/login";
}

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
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

$(function(){
	listPage(1);
    $("button[role='tab']").on("click", function(e){
    	listPage(1);
    });
});

function listPage(page) {
	const $tab = $("button[role='tab'].active");
	let revNum = $tab.attr("data-revNum");
	
	let url = "${pageContext.request.contextPath}/mypage/main/reviewList";
	let query ="page="+page+"&revNum="+revNum;
	console.log(query);
	let selector = "#nav-content";
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}
</script>

<div class="reviewList-box" style="margin-left: 10px;">
<h3 style="font-size:22px; font-weight: bold; color: #044b85;">리뷰 관리</h3>

	<ul class="nav nav-tabs nav-tabs-rev show" id="myTab" role="tablist">
		<li class="nav-item rev-nav" role="presentation">
			<button class="nav-link active" id="tab-0" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab"aria-selected="true" data-revNum="${revNum==null}">작성 예정 리뷰</button>
		</li>
	
		<li class="nav-item" role="presentation">
			<button class="nav-link rev-nav" id="tab-1" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab"aria-selected="true" data-revNum="${revNum!=null}">작성 완료 리뷰</button>
		</li>

	</ul>
	
	<div class="tab-content pt-2" id="nav-tabContent">
		<div class="tab-pane fade show active" id="nav-content" role="tabpanel" aria-labelledby="nav-tab-content">
		</div>
	</div>
	
</div>

<div id="booking-dialog" style="display: none;"></div>