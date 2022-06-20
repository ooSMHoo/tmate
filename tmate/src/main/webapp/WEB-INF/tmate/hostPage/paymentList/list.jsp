<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hostPage.css" type="text/css">

<script type="text/javascript">
function optionList() {
	const f = document.optionForm;
	f.option.value=$("#optionSelect").val();
	f.action="${pageContext.request.contextPath}/hostPage/paymentList/list";
	f.submit();
}

function searchList() {
	const f = document.searchForm;
	f.condition.value=$("#searchSelect").val();
	f.action="${pageContext.request.contextPath}/hostPage/paymentList/list";
	f.submit();
}
</script>

	<div class="main-container pt-3 p-md-3 p-lg-4 h6">
	   <div class="row g-3 mb-4 align-items-center justify-content-between">
    <div class="col-auto">
           <h1 class="app-page-title mb-0">결제내역</h1>
    </div>
    <div class="col-auto">
	     <div class="page-utilities">
		    <div class="row g-2 justify-content-start justify-content-md-end align-items-center">
			    <div class="col-auto">
				     <form class="table-search-form row gx-1 align-items-center" name="searchForm" 
					    	action="${pageContext.request.contextPath}/hostPage/paymentList/list" method="post">
		                   	<div class="col-auto">
		                    <select name="condition" id="searchSelect" class="form-select w-auto" onchange="searchList();">
								<option selected value=""  ${condition==""?"selected='selected'":""}>전체</option>
								<option value="resName" ${condition=="resName"?"selected='selected'":""}>결제자명</option>
								<option value="roomName" ${condition=="roomName"?"selected='selected'":""}>객실명</option>
								<option value="payReg_date" ${condition=="payReg_date"?"selected='selected'":""}>결제일시</option>
							</select>
							</div>
		                    <div class="col-auto">
		                        <input type="text" name="keyword" value="" class="form-control search-orders" placeholder="Search">
		                    </div>
		                    <div class="col-auto">
		                        <button type="button" class="btn btn-ch2 app-btn-secondary border" onclick="searchList()"><i class="bi bi-hand-index-thumb-fill"></i></button>
		                    </div>
		                </form>
			    </div>

		    <div class="col-auto">						    
			    <a class="btn app-btn-secondary border btn-ch2" href="#">
				    Download EXEL
				</a>
		    </div>
	    </div>
    </div>
   </div>
  </div>
  <form name="optionForm" action="${pageContext.request.contextPath}/hostPage/paymentList/list" method="post">
		<table class="table align-middle">
			<tr>
				<td align="left" width="50%">
					${dataCount}개(${page}/${total_page} 페이지)
				</td>
				<td align="right">
					 <select name="option" id="optionSelect" class="form-select w-auto" onchange="optionList();">
						  <option selected value=""  ${option==""?"selected='selected'":""}>전체정렬</option>
						  <option value="option-week" ${option=="option-week"?"selected='selected'":""}>일주일이내</option>
						  <option value="option-month"  ${option=="option-month"?"selected='selected'":""} >한달이내</option>
						  <option value="option-threeM"  ${option=="option-threeM"?"selected='selected'":""}>3개월이내</option> 
					</select>
				</td>
			</tr>
		</table>
	 </form>    	
  
<div class="tab-content text-center" id="orders-table-tab-content">
       <div class="tab-pane fade show active" id="orders-all" role="tabpanel" aria-labelledby="orders-all-tab">
	    <div class="app-card app-card-orders-table shadow-sm mb-5">
		    <div class="app-card-body">
			    <div class="table-responsive shadow">
			        <table class="table app-table-hover mb-0 text-left">
						<thead style="height: 60px;" class="align-middle">
							<tr class="table-secondary">
								<th class="cell">결제방식</th>
								<th class="cell">객실명</th>
								<th class="cell">결제자명</th>
								<th class="cell">전화번호</th>
								<th class="cell">결제일시</th>
								<th class="cell">예약금액</th>
								<th class="cell">포인트사용</th>
								<th class="cell">결제금액</th>
								<th class="cell">상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${list}">
							<tr class="align-middle" style="height: 60px;">
								<td class="cell">${dto.payCode ==0 ? "신용카드" :"다른결제" }</td>
								<td class="cell">${dto.roomName}</td>
								<td class="cell">${dto.resName}</td>
								<td class="cell">${dto.resPhone}</td>
								<td class="cell">${dto.payReg_date}</td>
								<td class="cell">${dto.resTotalcost}</td>
								<td class="cell">${dto.resPoint}</td>
								<td class="cell">${dto.payCost}</td>
								<td class="cell">
									<c:choose>
										<c:when test="${dto.resCode==0}"><span class="badge bg-success">결제완료</span></c:when>
										<c:when test="${dto.resCode==1}"><span class="badge bg-primary">관리자취소</span></c:when>
										<c:when test="${dto.resCode==2}"><span class="badge bg-danger">결제취소</span></c:when>
										<c:otherwise><span class="badge bg-secondary">환불</span></c:otherwise>
									</c:choose>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
		        </div>
	       
	    </div>	
	</div>
	</div>
	</div>
	 <div class="page-box">
		${dataCount == 0 ? "결제내역이 없습니다." : paging}
	</div>
	</div>




