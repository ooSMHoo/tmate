<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hostPage.css" type="text/css">

<style>
@font-face {
    font-family: 'MapoBackpacking';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoBackpackingA.woff') format('woff');
    font-weight: normal;
    font-style: normal; 
}

</style>

 <div class="header-container row  align-items-center justify-content-between">
    <div class="col-auto logo-form">
           <a class="navbar-brand mt-5" href="${pageContext.request.contextPath}/" style="color:#ffa81e;  font-family: MapoBackpacking; font-size:17pt;">트레블&amp;메이트</a>
    </div>
    <div class="col-auto">
	     <div class="page-utilities">
		    <div class="row g-2 justify-content-start justify-content-md-end align-items-center">
			    <!-- 
			    <div class="col-auto">
					 <form class=" row gx-1 align-items-center">
	                    <div class="col-auto">
	                        <input type="text" id="search-orders" name="searchorders" class="form-control search-orders" placeholder="Search">
	                    </div>
	                    <div class="col-auto">
	                        <button type="submit" class="btn border btn-ch2"><i class="bi bi-hand-index-thumb-fill"></i></button>
	                    </div>
	                </form>
			    </div>
			     -->
		   		 <div class="col-auto  ms-10">
	          		<button type="button" class="btn btn-primary btn-ch" onclick="location.href='${pageContext.request.contextPath}';">Exit</button>
	       		</div>
	    </div>
    </div>
   </div>
  </div>
