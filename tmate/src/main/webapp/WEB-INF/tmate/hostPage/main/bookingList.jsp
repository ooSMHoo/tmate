<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hostPage.css" type="text/css">



	
	<div class="main-container pt-3 p-md-3 p-lg-4">
	   <div class="row g-3 mb-4 align-items-center justify-content-between">
	    <div class="col-auto">
	           <h1 class="app-page-title mb-0">예약목록</h1>
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
	  
	<div class="tab-content text-center shadow" id="orders-table-tab-content">
	       <div class="tab-pane fade show active" id="orders-all" role="tabpanel" aria-labelledby="orders-all-tab">
		    <div class="app-card app-card-orders-table shadow-sm mb-5">
			    <div class="app-card-body">
				    <div class="table-responsive">
				        <table class="table app-table-hover mb-0 text-left table-hover">
							<thead >
								<tr class="table-secondary">
									<th class="cell">#</th>
									<th class="cell">고객명</th>
									<th class="cell">예약일</th>
									<th class="cell">체크인</th>
									<th class="cell">체크아웃</th>
									<th class="cell">객실</th>
									<th class="cell">요금</th>
									<th class="cell">예약상태</th>
									<th class="cell"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="cell">#001</td>
									<td class="cell">홍길동</td>
									<td class="cell">06.01</td>
									<td class="cell">06.28</td>
									<td class="cell">06.29</td>
									<td class="cell">스탠다드 더블</td>
									<td class="cell">100,000</td>
									<td class="cell"><span class="badge bg-success">예약완료</span></td>
									<td class="cell"><button type="button" class="btn-sm  border btn-ch2 btnDialog" data-bs-dismiss="offcanvas" aria-label="Close">상세</button> </td>
								</tr>
								<tr>
									<td class="cell">#001</td>
									<td class="cell">홍길동</td>
									<td class="cell">06.01</td>
									<td class="cell">06.28</td>
									<td class="cell">06.29</td>
									<td class="cell">스탠다드 더블</td>
									<td class="cell">100,000</td>
									<td class="cell"><span class="badge bg-success">예약완료</span></td>
									<td class="cell"><button type="button" class="btn-sm border btn-ch2 btnDialog">상세</button> </td>
								</tr>
								<tr>
									<td class="cell">#001</td>
									<td class="cell">홍길동</td>
									<td class="cell">06.01</td>
									<td class="cell">06.28</td>
									<td class="cell">06.29</td>
									<td class="cell">스탠다드 더블</td>
									<td class="cell">100,000</td>
									<td class="cell"><span class="badge bg-primary">미결제</span></td>
									<td class="cell"><button type="button" class="btn-sm  border btn-ch2 btnDialog">상세</button> </td>
								</tr>
								
								<tr>
									<td class="cell">#001</td>
									<td class="cell">홍길동</td>
									<td class="cell">06.01</td>
									<td class="cell">06.28</td>
									<td class="cell">06.29</td>
									<td class="cell">스탠다드 더블</td>
									<td class="cell">100,000</td>
									<td class="cell"><span class="badge bg-danger">취소</span></td>
									<td class="cell"><button type="button" class="btn-sm border btn-ch2 btnDialog">상세</button> </td>
								</tr>
								<tr>
									<td class="cell">#001</td>
									<td class="cell">홍길동</td>
									<td class="cell">06.01</td>
									<td class="cell">06.28</td>
									<td class="cell">06.29</td>
									<td class="cell">스탠다드 더블</td>
									<td class="cell">100,000</td>
									<td class="cell"><span class="badge bg-secondary">환불</span></td>
									<td class="cell"><button type="button" class="btn-sm border btn-ch2 btnDialog">상세</button> </td>
								</tr>
								<tr>
									<td class="cell">#001</td>
									<td class="cell">홍길동</td>
									<td class="cell">06.01</td>
									<td class="cell">06.28</td>
									<td class="cell">06.29</td>
									<td class="cell">스탠다드 더블</td>
									<td class="cell">100,000</td>
									<td class="cell"><span class="badge bg-success">예약완료</span></td>
									<td class="cell"><button type="button" class="btn-sm  border btn-ch2 btnDialog">상세</button> </td>
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


<!-- 일정 상세 보기 Modal -->
<div class="modal fade" id="myDialogModal" tabindex="-1" aria-labelledby="myDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myDialogModalLabel">예약 상세 보기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<table class="table">
					<tr>
						<td colspan="2" class="text-center align-middle">
							<p class="form-control-plaintext view-subject"></p>
						</td>
					</tr>
					<tr>
						<td class="table-light col-2 align-middle">예약번호</td>
						<td>
							<p class="form-control-plaintext view-category">#001</p>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-2 align-middle">객실명</td>
						<td>
							<p class="form-control-plaintext view-reg_date">스탠다드 더블</p>
						</td>
					</tr>

					<tr>
						<td class="table-light col-2 align-middle">고객명</td>
						<td>
							<p class="form-control-plaintext view-period">홍길동</p>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-2 align-middle">전화번호</td>
						<td>
							<p class="form-control-plaintext view-period">010-1111-1111</p>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-2 align-middle">이메일</td>
						<td>
							<p class="form-control-plaintext view-period">java@gmail.com</p>
						</td>
					</tr>
					<tr>
						<td class="table-light col-2 align-middle">예약일</td>
						<td>
							<p class="form-control-plaintext view-repeat">2022년 06월 01일 오후 2시 22분 22초</p>
						</td>
					</tr>

 					<tr>
						<td class="table-light col-2 align-middle">체크인</td>
						<td>
							<p class="form-control-plaintext view-reg_date">06.28</p>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-2 align-middle">체크아웃</td>
						<td>
							<p class="form-control-plaintext view-reg_date">06.29</p>
						</td>
					</tr>
					
					
					<tr>
						<td class="table-light col-2 align-middle">예약상태</td>
						<td>
							<p class="form-control-plaintext view-reg_date">예약완료</p>
						</td>
					</tr>

					<tr>
						<td class="table-light col-2 align-middle">요금</td>
						<td>
							<p class="form-control-plaintext view-reg_date">100,000</p>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-2 align-middle">쿠폰사용</td>
						<td>
							<p class="form-control-plaintext view-reg_date">1,000</p>
						</td>
					</tr>
					
 					<tr>
						<td class="table-light col-2 align-middle">고객<br>요청사항</td>
						<td>
							<p class="form-control-plaintext view-memo"></p>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-2 align-middle">관리자<br>메모</td>
						<td>
							<p class="form-control-plaintext view-memo"></p>
						</td>
					</tr>
				</table>
				
				<table class="table table-borderless">
					<tr>
						<td class="text-end">
							<button type="button" class="btn btn-outline-primary btnScheduleUpdate">일정 수정</button>
			    			<button type="button" class="btn btn-outline-danger btnScheduleDelete">일정 삭제</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

$(function(){
	$(".btnDialog").click(function(){
		$("#myDialogModal").modal("show");
	});
});


</script>
