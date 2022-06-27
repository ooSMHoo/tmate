<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   response.setStatus(HttpServletResponse.SC_OK);
%>

<style type="text/css">
.container{ margin-top: 150px; }
.row{ max-width: 800px;margin: 30px auto; }
.btn-select {
	background-color: #ffa81e;
	border: none;
	font-size: large;
	color: white;
	box-shadow: 0px 5px 5px #f0e5d5;
}

.btn-select:hover{ background-color: #044b85; color: white; }

.alert-primary{ background-color: #FFF8ED; border: none; color : black;}
</style>

<div class="container">
	<div class="body-container">	

        <div class="row justify-content-md-center mt-5">
            <div class="col-md-8">
                <div class="border mt-5 p-4">
                       <h4 class="text-center fw-bold">파일 용량 초과</h4>
                       
	                <div class="d-grid pt-3">
						<p class="alert alert-primary text-center lh-base fs-6">
							파일은 최대 10MB 까지만 업로드가 가능합니다.<br>
							파일의 용량을 확인하고 다시 등록하기시 바랍니다.			
						</p>
	                </div>
                       
                       <div class="d-grid">
                           <button type="button" class="btn btn-lg btn-primary" onclick="location.href='${pageContext.request.contextPath}/';">메인화면으로 이동 <i class="bi bi-arrow-counterclockwise"></i> </button>
                       </div>
                </div>
            </div>
        </div>

	</div>
</div>
