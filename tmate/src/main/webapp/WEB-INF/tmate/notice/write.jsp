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
function sendOk() {
	var f = document.noticeForm;
	
	var str = f.noticeSubject.value;
	if(! str) {
		alert("제목을 입력하세요.");
		f.noticeSubject.focus();
		return;
	}
	
	str = f.noticeContent.value;
	if(! str) {
		alert("내용을 입력하세요.");
		f.noticeContent.focus();
		return;
	}
	
	f.action = "${pageContext.request.contextPath}/notice/${mode}";
	f.submit();
}

<c:if test="${mode=='update'}">
function deleteFile(nfileNum) {
	var url="${pageContext.request.contextPath}/notice/deleteFile";
	$.post(url, {nfileNum:nfileNum}, function(data){
		$("#f"+nfileNum).remove();
	}, "json");
}
</c:if>
</script>


<div class="container">
	<div class="body-container mt-5">	
		<div class="body-title">
			<h3 class="text-center fw-bold"><span style="font-family: 'MapoBackpacking' !important;">공지사항</span> </h3>
		</div>
		
		<div class="body-main">
			
			<form name="noticeForm" method="post" enctype="multipart/form-data">
				<table class="table table-border table-form mt-5 h-100">
					<tr> 
						<td class="text-center" style="background-color: #f1f1e6;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
						<td> 
							<input type="text" name="noticeSubject" class="form-control" value="${dto.noticeSubject }">
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2 text-center" scope="row" style="background-color: #f1f1e6;">작성자</td>
 						<td>
							<p class="form-control-plaintext">${sessionScope.member.userName}</p>
						</td>
					</tr>
					
					<tr> 
						<td class="text-center mx-auto" style="height: 300px; overflow: auto; background-color: #f1f1e6;" >내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
						<td valign="top"> 
							<textarea name="noticeContent" class="form-control" style="height: 100%; resize: none;" >${dto.noticeContent}</textarea>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2 text-center" style="background-color: #f1f1e6;">첨 부</td>
						<td> 
							<input type="file" name="selectFile" multiple="multiple" class="form-control">
						</td>
					</tr>
					
					<c:if test="${mode=='update'}">
						<c:forEach var="vo" items="${listFile}">
							<tr id="f${vo.nfileNum}">
								<td class="table-light col-sm-2 text-center" scope="row">첨부된파일</td>
								<td> 
									<p class="form-control-plaintext">
										<a href="javascript:deleteFile('${vo.nfileNum}');"><i class="bi bi-trash"></i></a>
										${vo.nfileOri_name}
									</p>
								</td>
							</tr>
						</c:forEach> 
					</c:if>
					
				</table>
					
				<table class="table">
					<tr> 
						<td align="center">
							<button type="button" class="nobtn1" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
							<button type="reset" class="nobtn1">다시입력</button>
							<button type="button" class="nobtn1" onclick="location.href='${pageContext.request.contextPath}/notice/list';">${mode=='update'?'수정취소':'등록취소'}</button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="noticeNum" value="${dto.noticeNum}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
				</table>
		
			</form>			
			
		</div>
	</div>
</div>
