<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.body-container {
	font-family: "Noto Sans KR", sans-serif;
	max-width: 800px;
	margin: 0 auto;
}

.nobtn1 {
	background-color: #ffa81e;
	border-radius: 20px;
	text-align: center;
	font-family: inherit;
	text-color: #fff;
	border:none;
	width: 100px;
	min-height: 40px;
}

</style>


<script type="text/javascript">
<c:if test="${sessionScope.member.userId==dto.memberId||sessionScope.member.membership>50}">
function deleteMate() {
    if(confirm("게시글을 삭제 하시겠습니까 ? ")) {
	    let query = "mateNum=${dto.mateNum}&${query}";
	    let url = "${pageContext.request.contextPath}/mate/delete?" + query;
    	location.href = url;
    }
}
</c:if>
</script>

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
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}


// 페이징 처리
$(function(){
	listPage(1);
});

function listPage(page) {
	let url = "${pageContext.request.contextPath}/mate/listReply";
	let query = "mateNum=${dto.mateNum}&pageNo="+page;
	let selector = "#listReply";
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}

// 리플 등록
$(function(){
	$(".btnSendReply").click(function(){
		let mateNum = "${dto.mateNum}";
		const $tb = $(this).closest("table");

		let mateRe_content = $tb.find("textarea").val().trim();
		if(! mateRe_content) {
			$tb.find("textarea").focus();
			return false;
		}
		mateRe_content = encodeURIComponent(mateRe_content);
		
		let url = "${pageContext.request.contextPath}/mate/insertReply";
		let query = "mateNum=" + mateNum + "&mateRe_content=" + mateRe_content + "&mateRe_parent=0";
		
		const fn = function(data){
			$tb.find("textarea").val("");
			
			let state = data.state;
			if(state === "true") {
				listPage(1);
			} else if(state === "false") {
				alert("댓글을 추가 하지 못했습니다.");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

// 삭제, 신고 메뉴
$(function(){
	$("body").on("click", ".reply-dropdown", function(){
		const $menu = $(this).next(".reply-menu");
		if($menu.is(':visible')) {
			$menu.fadeOut(100);
		} else {
			$(".reply-menu").hide();
			$menu.fadeIn(100);

			let pos = $(this).offset();
			$menu.offset( {left:pos.left-70, top:pos.top+20} );
		}
	});
	$("body").on("click", function() {
		if($(event.target.parentNode).hasClass("reply-dropdown")) {
			return false;
		}
		$(".reply-menu").hide();
	});
});

// 댓글 삭제
$(function(){
	$("body").on("click", ".deleteReply", function(){
		if(! confirm("게시물을 삭제하시겠습니까 ? ")) {
		    return false;
		}
		
		let mateRe_num = $(this).attr("data-mateRe_num");
		let page = $(this).attr("data-pageNo");
		
		let url = "${pageContext.request.contextPath}/mate/deleteReply";
		let query = "mateRe_num="+mateRe_num;
		
		const fn = function(data){
			// let state = data.state;
			listPage(page);
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});



// 댓글별 답글 리스트
function listReplyAnswer(mateRe_parent) {
	let url = "${pageContext.request.contextPath}/mate/listReplyAnswer";
	let query = "mateRe_parent=" + mateRe_parent;
	let selector = "#listReplyAnswer" + mateRe_parent;
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}

// 댓글별 답글 개수
function countReplyAnswer(mateRe_parent) {
	let url = "${pageContext.request.contextPath}/mate/countReplyAnswer";
	let query = "mateRe_parent=" + mateRe_parent;
	
	const fn = function(data){
		let count = data.count;
		let selector = "#answerCount"+mateRe_parent;
		$(selector).html(count);
	};
	
	ajaxFun(url, "post", query, "json", fn);
}

// 답글 버튼(댓글별 답글 등록폼 및 답글리스트)
$(function(){
	$("body").on("click", ".btnReplyAnswerLayout", function(){
		const $trReplyAnswer = $(this).closest("tr").next();
		
		let isVisible = $trReplyAnswer.is(':visible');
		let mateRe_num = $(this).attr("data-mateRe_num");
			
		if(isVisible) {
			$trReplyAnswer.hide();
		} else {
			$trReplyAnswer.show();
            
			// 답글 리스트
			listReplyAnswer(mateRe_num);
			
			// 답글 개수
			countReplyAnswer(mateRe_num);
		}
	});
	
});

// 댓글별 답글 등록
$(function(){
	$("body").on("click", ".btnSendReplyAnswer", function(){
		let mateNum = "${dto.mateNum}";
		let mateRe_num = $(this).attr("data-mateRe_num");
		const $td = $(this).closest("td");
		
		let mateRe_content = $td.find("textarea").val().trim();
		if(! mateRe_content) {
			$td.find("textarea").focus();
			return false;
		}
		mateRe_content = encodeURIComponent(mateRe_content);
		
		let url = "${pageContext.request.contextPath}/mate/insertReply";
		let query = "mateNum=" + mateNum + "&mateRe_content=" + mateRe_content + "&mateRe_parent=" + mateRe_num;
		
		const fn = function(data){
			$td.find("textarea").val("");
			
			var state = data.state;
			if(state === "true") {
				listReplyAnswer(replyNum);
				countReplyAnswer(replyNum);
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

// 댓글별 답글 삭제
$(function(){
	$("body").on("click", ".deleteReplyAnswer", function(){
		if(! confirm("게시물을 삭제하시겠습니까 ? ")) {
		    return false;
		}
		
		let mateRe_num = $(this).attr("data-mateRe_num");
		let mateRe_parent = $(this).attr("data-mateRe_parent");
		
		let url = "${pageContext.request.contextPath}/mate/deleteReply";
		let query = "mateRe_num=" + mateRe_num;
		
		const fn = function(data){
			listReplyAnswer(mateRe_parent);
			countReplyAnswer(mateRe_parent);
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

</script>

<div class="container">
	<div class="body-container mt-5">	
		<div class="body-title">
			<h3 class="text-center fw-bold"><span style="font-family: 'MapoBackpacking' !important;">여행파트너</span> </h3>
		</div>
		
		<div class="body-main">

			<table class="table table-border table-article mt-5">
				<thead>
					<tr>
						<td colspan="2" align="center" class="fw-bold">
							${dto.mateSubject}
						</td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td width="50%">
							이름 :
							<c:choose>
								<c:when test="${sessionScope.member.membership > 50 }">관리자</c:when>
								<c:otherwise> ${dto.memberName}</c:otherwise>
							</c:choose>	
						</td>
						<td align="right">
							${dto.mateReg_date} | 조회 ${dto.mateHit}
						</td>
					</tr>
					
					<tr>
						<td colspan="2" valign="top" height="200">
							${dto.mateContent}
						</td>
					</tr>
					
					
					<tr>
						<td colspan="2" class="text-reset" style="text-decoration : none;">
							이전글 :
							<c:if test="${not empty preReadDto}">
								<a href="${pageContext.request.contextPath}/mate/article?${query}&mateNum=${preReadDto.mateNum}">${preReadDto.mateSubject}</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-reset" style="text-decoration : none;">
							다음글 : 
							<c:if test="${not empty nextReadDto}">
								<a href="${pageContext.request.contextPath}/mate/article?${query}&mateNum=${nextReadDto.mateNum}">${nextReadDto.mateSubject}</a>
							</c:if>
						</td>
					</tr>
				<tbody>
			</table>
			
			<table class="table">
				<tr>
					<td width="50%">
						<c:choose>
							<c:when test="${sessionScope.member.userId==dto.memberId}">
								<button type="button" class="nobtn1 btn-light" onclick="location.href='${pageContext.request.contextPath}/mate/update?mateNum=${dto.mateNum}&page=${page}';">수정</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="nobtn1 btn-light" disabled="disabled">수정</button>
							</c:otherwise>
						</c:choose>
				    	
						<c:choose>
				    		<c:when test="${sessionScope.member.userId==dto.memberId || sessionScope.member.membership>50}">
				    			<button type="button" class="nobtn1 btn-light" onclick="deleteMate();">삭제</button>
				    		</c:when>
				    		<c:otherwise>
				    			<button type="button" class="nobtn1 btn-light" disabled="disabled">삭제</button>
				    		</c:otherwise>
				    	</c:choose>
					</td>
					<td class="text-end">
						<button type="button" class="nobtn1 btn-light" onclick="location.href='${pageContext.request.contextPath}/mate/list?${query}';">리스트</button>
					</td>
				</tr>
			</table>
			
			<div class="reply">
				<form name="replyForm" method="post">
					<div class='form-header'>
						<span class="bold">댓글</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가해 주세요.</span>
					</div>
					
					<table class="table table-borderless reply-form">
						<tr>
							<td>
								<textarea class='form-control' name="content"></textarea>
							</td>
						</tr>
						<tr>
						   <td align='right'>
						        <button type='button' class='btn btn-light btnSendReply'>댓글 등록</button>
						    </td>
						 </tr>
					</table>
				</form>
				
				<div id="listReply"></div>
			</div>
		</div>
	</div>
</div>
