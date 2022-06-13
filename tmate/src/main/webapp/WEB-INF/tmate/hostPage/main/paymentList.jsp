<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hostPage.css" type="text/css">


	<div class="main-container pt-3 p-md-3 p-lg-4">
	   <div class="row g-3 mb-4 align-items-center justify-content-between">
    <div class="col-auto">
           <h1 class="app-page-title mb-0">결제내역</h1>
    </div>
    <div class="col-auto">
	     <div class="page-utilities">
		    <div class="row g-2 justify-content-start justify-content-md-end align-items-center">
			    <div class="col-auto">
				    <form class="table-search-form row gx-1 align-items-center">
	                    <div class="col-auto">
	                        <input type="text" id="search-orders" name="searchorders" class="form-control search-orders" placeholder="Search">
	                    </div>
	                    <div class="col-auto">
	                        <button type="submit" class="btn btn-ch2 app-btn-secondary border"><i class="bi bi-hand-index-thumb-fill"></i></button>
	                    </div>
	                </form>
			    </div>
		    <div class="col-auto">
			    <select class="form-select w-auto" >
					  <option selected value="option-1">전체</option>
					  <option value="option-2">일주일이내</option>
					  <option value="option-3">한달이내</option>
					  <option value="option-4">3개월이내</option> 
				</select>
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
  
<div class="tab-content text-center" id="orders-table-tab-content">
       <div class="tab-pane fade show active" id="orders-all" role="tabpanel" aria-labelledby="orders-all-tab">
	    <div class="app-card app-card-orders-table shadow-sm mb-5">
		    <div class="app-card-body">
			    <div class="table-responsive shadow">
			        <table class="table app-table-hover mb-0 text-left">
						<thead >
							<tr class="table-secondary">
								<th class="cell">결제방식</th>
								<th class="cell">객실명</th>
								<th class="cell">결제자명</th>
								<th class="cell">전화번호</th>
								<th class="cell">결제일시</th>
								<th class="cell">결제금액</th>
								<th class="cell">포인트사용</th>
								<th class="cell">상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="cell">신용카드</td>
								<td class="cell">디럭스 더블</td>
								<td class="cell">홍길동</td>
								<td class="cell">010-1111-1111</td>
								<td class="cell">2022.06.10</td>
								<td class="cell">100,000</td>
								<td class="cell">1000</td>
								<td class="cell"><span class="badge bg-success">결제완료</span></td>
							</tr>
							<tr>
								<td class="cell">신용카드</td>
								<td class="cell">디럭스 더블</td>
								<td class="cell">홍길동</td>
								<td class="cell">010-1111-1111</td>
								<td class="cell">2022.06.10</td>
								<td class="cell">100,000</td>
								<td class="cell">1000</td>
								<td class="cell"><span class="badge bg-success">결제완료</span></td>
							</tr>
							<tr>
								<td class="cell">신용카드</td>
								<td class="cell">디럭스 더블</td>
								<td class="cell">홍길동</td>
								<td class="cell">010-1111-1111</td>
								<td class="cell">2022.06.10</td>
								<td class="cell">100,000</td>
								<td class="cell">1000</td>
								<td class="cell"><span class="badge bg-danger">취소</span></td>
							</tr>
							<tr>
								<td class="cell">신용카드</td>
								<td class="cell">디럭스 더블</td>
								<td class="cell">홍길동</td>
								<td class="cell">010-1111-1111</td>
								<td class="cell">2022.06.10</td>
								<td class="cell">100,000</td>
								<td class="cell">1000</td>
								<td class="cell"><span class="badge bg-secondary">환불</span></td>
							</tr>
							<tr>
								<td class="cell">신용카드</td>
								<td class="cell">디럭스 더블</td>
								<td class="cell">홍길동</td>
								<td class="cell">010-1111-1111</td>
								<td class="cell">2022.06.10</td>
								<td class="cell">100,000</td>
								<td class="cell">1000</td>
								<td class="cell"><span class="badge bg-success">결제완료</span></td>
							</tr>
							<tr>
								<td class="cell">신용카드</td>
								<td class="cell">디럭스 더블</td>
								<td class="cell">홍길동</td>
								<td class="cell">010-1111-1111</td>
								<td class="cell">2022.06.10</td>
								<td class="cell">100,000</td>
								<td class="cell">1000</td>
								<td class="cell"><span class="badge bg-success">결제완료</span></td>
							</tr>
						</tbody>
					</table>
		        </div>
	       
	    </div>	
	</div>
	</div>
	</div>
	 <nav class="app-pagination mt-5">
			<ul class="pagination justify-content-center">
				<li class="page-item disabled">
					<a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
			    </li>
				<li class="page-item active"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item">
				    <a class="page-link" href="#">Next</a>
				</li>
			</ul>
		</nav>
	</div>




