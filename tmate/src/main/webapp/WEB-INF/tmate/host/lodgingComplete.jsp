<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="border mt-5 p-4 rounded-2" >
                       <h4 class="text-center fw-bold">${title}</h4>
                       
	                <div class="d-grid pt-3">
						<p class="alert alert-primary text-center lh-base fs-6">
							${message}						
						</p>
	                </div>
                       
                       <div class="d-grid">
                           <button type="button" class="btn btn-lg btn-primary btn-select" onclick="location.href='${pageContext.request.contextPath}/hostPage/home';">호스트 페이지로 이동 <i class="bi bi-arrow-counterclockwise"></i> </button>
                       </div>
                </div>
            </div>
        </div>

	</div>
</div>
