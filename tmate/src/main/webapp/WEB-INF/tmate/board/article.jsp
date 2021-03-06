<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.body-container {
	font-family: "Noto Sans KR", sans-serif;
	max-width: 800px;
	margin: 0 auto;
}

.nobtn1 {
	background-color: #1f93fa;
	border-radius: 20px;
	text-align: center;
	font-family: inherit;
	text-color: #fff;
	border:none;
	width: 100px;
	min-height: 40px;
	margin-bottom:20px;
}

.nobtn1:hover{background-color:#ffa81e; }

</style>

<script type="text/javascript">
<c:if test="${sessionScope.member.userId==dto.memberId||sessionScope.member.membership>50}">
	function deleteBoard() {
	    if(confirm("게시글을 삭제 하시 겠습니까 ? ")) {
		    let query = "boardNum=${dto.boardNum}&${query}";
		    let url = "${pageContext.request.contextPath}/board/delete?" + query;
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
	let url = "${pageContext.request.contextPath}/board/listReply";
	let query = "boardNum=${dto.boardNum}&pageNo="+page;
	let selector = "#listReply";
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}

// 리플 등록
$(function(){
	$(".btnSendReply").click(function(){
		let boardNum = "${dto.boardNum}";
		const $tb = $(this).closest("table");

		let boardRe_content = $tb.find("textarea").val().trim();
		if(! boardRe_content) {
			$tb.find("textarea").focus();
			return false;
		}
		boardRe_content = encodeURIComponent(boardRe_content);
		
		let url = "${pageContext.request.contextPath}/board/insertReply";
		let query = "boardNum=" + boardNum + "&boardRe_content=" + boardRe_content + "&boardRe_parent=0";
		
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
		if(! confirm("댓글을 삭제하시겠습니까 ? ")) {
		    return false;
		}
		
		let boardRe_num = $(this).attr("data-boardRe_num");
		let page = $(this).attr("data-pageNo");
		
		let url = "${pageContext.request.contextPath}/board/deleteReply";
		let query = "boardRe_num="+boardRe_num;
		
		const fn = function(data){
			// let state = data.state;
			listPage(page);
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});



// 댓글별 답글 리스트
function listReplyAnswer(boardRe_parent) {
	let url = "${pageContext.request.contextPath}/board/listReplyAnswer";
	let query = "boardRe_parent=" + boardRe_parent;
	let selector = "#listReplyAnswer" + boardRe_parent;
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}

// 댓글별 답글 개수
function countReplyAnswer(boardRe_parent) {
	let url = "${pageContext.request.contextPath}/board/countReplyAnswer";
	let query = "boardRe_parent=" + boardRe_parent;
	
	const fn = function(data){
		let count = data.count;
		let selector = "#answerCount"+boardRe_parent;
		$(selector).html(count);
	};
	
	ajaxFun(url, "post", query, "json", fn);
}

// 답글 버튼(댓글별 답글 등록폼 및 답글리스트)
$(function(){
	$("body").on("click", ".btnReplyAnswerLayout", function(){
		const $trReplyAnswer = $(this).closest("tr").next();
		
		let isVisible = $trReplyAnswer.is(':visible');
		let boardRe_num = $(this).attr("data-boardRe_num");
			
		if(isVisible) {
			$trReplyAnswer.hide();
		} else {
			$trReplyAnswer.show();
            
			// 답글 리스트
			listReplyAnswer(boardRe_num);
			
			// 답글 개수
			countReplyAnswer(boardRe_num);
		}
	});
	
});

// 댓글별 답글 등록
$(function(){
	$("body").on("click", ".btnSendReplyAnswer", function(){
		let boardNum = "${dto.boardNum}";
		let boardRe_num = $(this).attr("data-boardRe_num");
		const $td = $(this).closest("td");
		
		let boardRe_content = $td.find("textarea").val().trim();
		if(! boardRe_content) {
			$td.find("textarea").focus();
			return false;
		}
		boardRe_content = encodeURIComponent(boardRe_content);
		
		let url = "${pageContext.request.contextPath}/board/insertReply";
		let query = "boardNum=" + boardNum + "&boardRe_content=" + boardRe_content + "&boardRe_parent=" + boardRe_num;
		
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
		
		let boardRe_num = $(this).attr("data-boardRe_num");
		let boardRe_parent = $(this).attr("data-boardRe_parent");
		
		let url = "${pageContext.request.contextPath}/board/deleteReply";
		let query = "boardRe_num=" + boardRe_num;
		
		const fn = function(data){
			listReplyAnswer(boardRe_parent);
			countReplyAnswer(boardRe_parent);
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

</script>

<div class="container">
	<div class="body-container mt-5">	
		<div class="body-title">
			<h3 class="text-center fw-bold"><span style="font-family: 'MapoBackpacking' !important;">자유게시판</span> </h3>
		</div>
		
		<div class="body-main">

			<table class="table table-border table-article mt-5">
				<thead>
					<tr>
						<td colspan="2" align="center" class="fw-bold">
							${dto.boardSubject}
						</td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td width="50%">
							이름 : ${dto.memberName}
						</td>
						<td align="right">
							${dto.boardReg_date} | 조회 ${dto.boardHit}
						</td>
					</tr>
					
					<tr>
						<td colspan="2" valign="top" height="200">
							${dto.boardContent}
						</td>
					</tr>
					
				
					<tr>
						<td colspan="2" class="text-reset" style="text-decoration : none;">
							이전글 :
							<c:if test="${not empty preReadDto}">
								<a href="${pageContext.request.contextPath}/board/article?${query}&boardNum=${preReadDto.boardNum}" style="text-decoration: none; color: #000;">${preReadDto.boardSubject}</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-reset" style="text-decoration :none;">
							다음글 :
							<c:if test="${not empty nextReadDto}">
								<a href="${pageContext.request.contextPath}/board/article?${query}&boardNum=${nextReadDto.boardNum}" style="text-decoration: none; color: #000;">${nextReadDto.boardSubject}</a>
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
			
			<table class="table">
				<tr>
					<td width="50%">
						<c:choose>
							<c:when test="${sessionScope.member.userId==dto.memberId}">
								<button type="button" class="nobtn1 btn-light" onclick="location.href='${pageContext.request.contextPath}/board/update?boardNum=${dto.boardNum}&page=${page}';">수정</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="nobtn1 btn-light" disabled="disabled">수정</button>
							</c:otherwise>
						</c:choose>
				    	
						<c:choose>
				    		<c:when test="${sessionScope.member.userId==dto.memberId || sessionScope.member.membership>50}">
				    			<button type="button" class="nobtn1 btn-light" onclick="deleteBoard();">삭제</button>
				    		</c:when>
				    		<c:otherwise>
				    			<button type="button" class="nobtn1 btn-light" disabled="disabled">삭제</button>
				    		</c:otherwise>
				    	</c:choose>
					</td>
					<td class="text-end">
						<button type="button" class="nobtn1 btn-light" onclick="location.href='${pageContext.request.contextPath}/board/list?${query}';">리스트</button>
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
						        <button type='button' class='nobtn1 btn-light btnSendReply'>댓글 등록</button>
						    </td>
						 </tr>
					</table>
				</form>
				
				<div id="listReply"></div>
			</div>
			
			<div style=" padding-bottom: 200px;"></div>

		</div>
	</div>
</div>