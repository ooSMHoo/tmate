<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hostPage.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />

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

function answerReview(revNum) {

	var dlg = $("#answer-dialog").dialog({
		  autoOpen: false,
		  modal: true,
		  buttons: {
			  " 답변저장 " : function() {
		    	  updateAnswer(revNum);
			   },
		       " 답변삭제 " : function() {
		    	   deleteAnswer(revNum);
			   },
		       " 닫기 " : function() {
		    	   $(this).dialog("close");
		       }
		  },
		  height: 400,
		  width: 800,
		  title: "리뷰에 대한 나의 답변",
		  close: function(event, ui) {
		  }
	});

	let url = "${pageContext.request.contextPath}/hostPage/reviewList/detaile";
	let query = "revNum="+revNum;
	
	const fn = function(data){
		$('#answer-dialog').html(data);
		dlg.dialog("open");
	};
	ajaxFun(url, "post", query, "html", fn);

}
function updateAnswer(value) {
	const f = document.deteailedMemberForm;
	let revNum = value;
	
	if(! $.trim(f.resAnswer.value)) {
		f.resAnswer.focus();
		return;
	}
	
	let url = "${pageContext.request.contextPath}/hostPage/reviewList/updateAnswer";
	let query=$("#deteailedMemberForm").serialize()+"&page="+${page}+"&revNum="+value;
	console.log(query);
	const fn = function(data){
		
	};
	
	ajaxFun(url, "post", query, "json", fn);
		
	$('#answer-dialog').dialog("close");
}

function deleteAnswer(revNum) {
	
	if(confirm("답변을 삭제하시겠습니까 ?")) {
		const f = document.getElementById("resAnswer").value ='';
	}

	let url = "${pageContext.request.contextPath}/hostPage/reviewList/deleteAnswer";
	let query = "revNum="+revNum+"&page="+${page};
	
	const fn = function(data){

	};
	
	ajaxFun(url, "post", query, "json", fn);
	console.log(query);
	$('#answer-dialog').dialog("close");
}

</script>

<div class=" main-container py-4">
  <div class="review-container ">
	<div><h3>리뷰관리</h3></div>
		<div align="right" class="mb-2">
			${dataCount}개(${page}/${total_page} 페이지)
		</div>
		
		<c:forEach var="rl" items="${rl}">
		  <div class="room_content shadow-sm mb-3 ">		
		  	<div class="border-bottom bg-light">
			  	<p class="mb-1 mx-3 h5"> ${rl.roomName} </p> 
			  	<p class="mb-1 mx-3">${rl.resCin_date} ~ ${rl.resCout_date}  </p>
		  	</div>
			<div class="pos_rel me-3">
				<button type="button" class="mt-2 tm_right btn-outline-primary btn " >
				 	<div>
					 	<div class="host_moda" onclick="answerReview('${rl.revNum}');">
					 		${rl.resAnswer == null ? '답변작성':'답변수정'}
					 	</div>
				 	</div>
				</button>
		</div>
		
		<div class="mt-3">
			<div class="d-flex">
				<div style="width: 10%;" class="ms-3">
					<div>
						<i class="fa-solid fa-user"></i>
					</div>
					<div>
						${rl.memberId}
					</div>
				</div>
				<div style="width: 92%;">
					<div>
						${rl.revSubject}
					</div>
					<div class="d-flex">
							<div class="star-ratings">
								<div class="star-ratings-fill" style=" width: ${rl.revGrade*20}% ">
									<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
								</div>
								<div class="star-ratings-base">
									<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
								</div>	
							</div>
					</div>
					<div>
						${rl.revContent}
					</div>
					<div class="me-3 mb-1" style="float: right;" >
						${rl.revReg_date}
					</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="page-box">
			${dataCount == 0 ? "리뷰가 없습니다." : paging}
		</div>
    </div>
</div>
<div id="answer-dialog" style="display: none;"></div>
	