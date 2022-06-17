<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hostPage.css" type="text/css">



	
	<div class="main-container pt-3 p-md-3 p-lg-4">
	   <div class="row g-3 mb-4 align-items-center justify-content-between">
	    <div class="col-auto">
	           <h1 class="app-page-title mb-0">객실달력</h1>
	    </div>
	    <div class="col-auto">
		     <div class="page-utilities">
			    <div class="row g-2 justify-content-start justify-content-md-end align-items-center">
				 <div class="col-auto">
				 	시작일변경	
				 	<input type="date" class="btn app-btn-secondary border">
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
	  
	   <div class="row text-center mb-4 justify-content-md-center">
			<button type="button" class="col btn col-lg-2"><i class="bi bi-arrow-left-square"></i></button> 
			<h3 class="col col-md-auto">2022.06.12~2022.06.26</h3>
			<button type="button" class="col btn col-lg-2"><i class="bi bi-arrow-right-square"></i></button> 
	  </div>
	  <div class="col mb-2 float-left">
	  	 <span class="badge bg-danger">예약완료</span> <span class="badge bg-success">대실</span>
	 	 <span class="badge bg-warning ">장기숙박</span> <span class="badge bg-dark">예약불가</span>
	  </div>
	<div class="tab-content text-center" id="orders-table-tab-content">
	       <div class="tab-pane fade show active" id="orders-all" role="tabpanel" aria-labelledby="orders-all-tab">
		    <div class="app-card app-card-orders-table shadow-sm mb-5">
			    <div class="app-card-body">
				    <div class="table-responsive shadow">
				        <table class="table table-bordered mb-0">
							<thead >
								<tr class="table-secondary">
									<th class="cell">객실/달력</th>
									<th class="cell">12 일</th>
									<th class="cell">13 월</th>
									<th class="cell">14 화</th>
									<th class="cell">15 수</th>
									<th class="cell">16 목</th>
									<th class="cell">17 금</th>
									<th class="cell">18 토</th>
									<th class="cell">19 일</th>
									<th class="cell">20 월</th>
									<th class="cell">21 화</th>
									<th class="cell">22 수</th>
									<th class="cell">23 목</th>
									<th class="cell">24 금</th>
									<th class="cell">25 토</th>
									<th class="cell">26 일</th>
								</tr>
							</thead>
							<tbody>
								<tr style="border-bottom:1px solid #949292; ">
									<td class="cell">201호</td>
									<td class="cell table-danger" colspan="3">홍길동</td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell table-dark"></td>
									<td class="cell table-danger" colspan="2">최자바</td>
						
									<td class="cell"></td>
									<td class="cell "></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
								</tr>
								<tr style="border-bottom:1px solid #949292; ">
									<td class="cell">202호</td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell table-danger" colspan="2">박자바</td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
								</tr>
								<tr style="border-bottom:1px solid #949292; ">
									<td class="cell">203호</td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell table-success">박런닝</td>
									<td class="cell"></td>
									<td class="cell"></td>
								</tr>
								<tr style="border-bottom:1px solid #949292; ">
									<td class="cell">204호</td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									
									<td class="cell table-warning" colspan="7">이자바</td>
								</tr>
								<tr style="border-bottom:1px solid #949292; ">
									<td class="cell">205호</td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
								</tr>
								<tr style="border-bottom:1px solid #949292; ">
									<td class="cell">206호</td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
									<td class="cell"></td>
								</tr>
							</tbody>
						</table>
			        </div>
		       
		    </div>	
		</div>
	</div>
	</div>
	</div>




