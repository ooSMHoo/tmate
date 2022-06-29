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

<style type="text/css">
.write-form .img-viewer {
	cursor: pointer;
	border: 1px solid #ccc;
	width: 45px;
	height: 45px;
	border-radius: 45px;
	background-image: url("${pageContext.request.contextPath}/resources/images/add_photo.png");
	position: relative;
	z-index: 9999;
	background-repeat : no-repeat;
	background-size : cover;
}
</style>

<script type="text/javascript">
function sendOk() {
    var f = document.prForm;
	var str;
	
    str = f.prSubject.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.prSubject.focus();
        return;
    }

    str = f.prContent.value.trim();
    if(!str) {
        alert("내용을 입력하세요. ");
        f.prContent.focus();
        return;
    }
    
    var mode = "${mode}";
    if( (mode === "write") && (!f.selectFile.value) ) {
        alert("이미지 파일을 추가 하세요. ");
        f.prphotoName.focus();
        return;
	}    

    f.action = "${pageContext.request.contextPath}/pr/${mode}";
    f.submit();
}

$(function() {
	var img = "${dto.prphotoName}";
	if( img ) { // 수정인 경우
		img = "${pageContext.request.contextPath}/uploads/pr/" + img;
		$(".write-form .img-viewer").empty();
		$(".write-form .img-viewer").css("background-image", "url("+img+")");
	}
	
	$(".write-form .img-viewer").click(function(){
		$("form[name=prForm] input[name=selectFile]").trigger("click"); 
	});
	
	$("form[name=prForm] input[name=selectFile]").change(function(){
		var file=this.files[0];
		if(! file) {
			$(".write-form .img-viewer").empty();
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/pr/" + img;
				$(".write-form .img-viewer").css("background-image", "url("+img+")");
			} else {
				img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
				$(".write-form .img-viewer").css("background-image", "url("+img+")");
			}
			return false;
		}
		
		if(! file.type.match("image.*")) {
			this.focus();
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function(e) {
			$(".write-form .img-viewer").empty();
			$(".write-form .img-viewer").css("background-image", "url("+e.target.result+")");
		}
		reader.readAsDataURL(file);
	});
});
</script>

<div class="container">
	<div class="body-container mt-5">	
		<div class="body-title">
			<h3 class="text-center fw-bold"><span style="font-family: 'MapoBackpacking' !important;">홍보게시판</span> </h3>
		</div>
		<div class="body-main">
		
			<form name="prForm" method="post" enctype="multipart/form-data">
				<table class="table table-border write-form mt-5 h-100">
					<tr>
						<td class="text-center" style="background-color: #f5f9ff;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
						<td>
							<input type="text" name="prSubject" class="form-control" value="${dto.prSubject}">
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2 text-center" scope="row" style="background-color: #f5f9ff;">작성자</td>
 						<td>
							<p class="form-control-plaintext">${sessionScope.member.userName}</p>
						</td>
					</tr>

					<tr>
						<td class="text-center mx-auto" style="height: 300px; overflow: auto; background-color: #f5f9ff;" >내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
						<td valign="top"> 
							<textarea name="prContent" id="content" class="form-control" style="height: 100%; resize: none;">${dto.prContent}</textarea>
						</td>
					</tr>
					
					<tr>
						<td class="text-center" style="background-color: #f5f9ff;" scope="row">이미지</td>
						<td>
							<div class="img-viewer"></div>
							<input type="file" name="selectFile" accept="image/*" class="form-control" style="display: none;">
						</td>
					</tr>

				</table>
				
				<table class="table">
 					<tr>
						<td align="center">
							<button type="button" class="nobtn1" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
							<button type="reset" class="nobtn1">다시입력</button>
							<button type="button" class="nobtn1" onclick="location.href='${pageContext.request.contextPath}/pr/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="prNum" value="${dto.prNum}">
								<input type="hidden" name="prphotoName" value="${dto.prphotoName}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		<div style=" padding-bottom: 200px;"></div>
		</div>
	</div>
</div>