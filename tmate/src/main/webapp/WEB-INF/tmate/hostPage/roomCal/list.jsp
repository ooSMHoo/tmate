<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hostPage.css" type="text/css">

<script type="text/javascript">
function dayMove(p) {
	let baseDate = "${startDate}";
	
	let ss = baseDate.split("-");
	let y = parseInt(ss[0]);
	let m = parseInt(ss[1]);
	let d = parseInt(ss[2])+p;
	
	let sDate = new Date(y, m-1, d);
	let eDate = new Date(y, m-1, d+6);
	
	let ty = sDate.getFullYear();
	let tm = sDate.getMonth()+1;
	let td = sDate.getDate();

	if(tm<10) tm = "0"+tm
	if(td<10) td = "0"+td
	let startDate = ty + "-" + tm +"-"+ td;
	
	let ly = eDate.getFullYear();
	let lm = eDate.getMonth()+1;
	let ld = eDate.getDate();
	if(lm<10) lm = "0"+lm
	if(ld<10) ld = "0"+ld
	let endDate = ly + "-" + lm +"-"+ ld;
	
	let query = "startDate="+startDate+"&endDate="+endDate;
	location.href="${pageContext.request.contextPath}/hostPage/roomCal/list?"+query;
}

</script>

	<div class="main-container pt-3 p-md-3 p-lg-4 h5">
	   <div class="row g-3 mb-4 align-items-center justify-content-between">
	    <div class="col-auto">
	           <h3 class="app-page-title mb-0">객실별예약현황</h3>
	    </div>
	    <!-- 
	    <div class="col-auto">
		     <div class="page-utilities">
			    <div class="row g-2 justify-content-start justify-content-md-end align-items-center">
				 <div class="col-auto">
				 	시작일변경	
				 	<input type="date" name="changeDate" id="changeDate" class="btn app-btn-secondary border">
				 </div> 
				 
			    <div class="col-auto">						    
				    <a class="btn app-btn-secondary border btn-ch2" href="#">
					    Download EXEL
					</a>
			    </div>
			  
		    </div>
	    </div>
	   </div>
	    -->
	  </div>
	  
	   <div class="row text-center mb-4 justify-content-md-center">
			<button type="button" class="col btn col-lg-2 " onclick="dayMove(-1)"><i class="bi bi-arrow-left-square h3"></i></button> 
			 <span class="col-lg-4 h3" >${startDate} ~ ${endDate}</span>
			<button type="button" class="col btn col-lg-2" onclick="dayMove(+1)"><i class="bi bi-arrow-right-square h3"></i></button> 
	  </div>
	  <div class="col mb-3 float-left">
	  	 <small class="text-secondary">오늘을 기준으로 일주일의 객실별 예약현황이 확인 가능합니다.</small>
	  </div>
	<div class="tab-content text-center shadow" id="orders-table-tab-content">
	       <div class="tab-pane fade show active" id="orders-all" role="tabpanel" aria-labelledby="orders-all-tab">
		    <div class="app-card app-card-orders-table shadow-sm mb-5">
			    <div class="app-card-body">
				    <div class="table-responsive">
				        <table class="table table-bordered mb-0">
							<thead >
								<tr class="table-secondary">
									<th class="cell">객실 / 날짜</th>
									<c:forEach var="day" items="${days}" varStatus="state">
										<th class="cell">${day}(${weeks[state.index]})</th>
									</c:forEach>
								</tr>
							</thead>
							<tbody>
								${out}
							</tbody>
						</table>
			        </div>
		       
		    </div>	
		</div>
	</div>
	</div>
	</div>




