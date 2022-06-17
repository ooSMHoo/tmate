<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hostPage.css" type="text/css">


 <div class="header-container row  align-items-center justify-content-between">
    <div class="col-auto logo-form">
           <h1 class="mb-0 mt-3">로고</h1>
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
