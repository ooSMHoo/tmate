<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hostPage.css" type="text/css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
    let date = new Date();
    let y = date.getFullYear(); //년가져오기
    let m = date.getMonth()+1; //월 가져오기 
    let d = date.getDate(); // 일 가져오기
   
	
	let today = new Date(y, m-1, d);
	let later = new Date(y, m-1, d+7);

	let ty = today.getFullYear();
	let tm = today.getMonth()+1;
	let td = today.getDate();

	if(tm<10) tm = "0"+tm
	if(td<10) td = "0"+td
	let start = ty + "." + tm +"."+ td;
	
	
	let ly = later.getFullYear();
	let lm = later.getMonth()+1;
	let ld = later.getDate();
	if(lm<10) lm = "0"+lm
	if(ld<10) ld = "0"+ld
	let end = ly + "." + lm +"."+ ld;
	
	
	$("#resultDate").attr("data-start",start); //시작은 오늘 날짜 
    $("#resultDate").attr("data-end", end);
	
	
	let s = start + "~" + end;
	$("#resultDate").html(s);
	
});


function dayMove(p) {
	let startDate = $("#resultDate").attr("data-start");
	let endDate = $("#resultDate").attr("data-end");
	
	let ss = startDate.split(".");
	
	let y = parseInt(ss[0]);
	let m = parseInt(ss[1])+1;
	let d = parseInt(ss[2])+p;
	
	let today = new Date(y, m-1, d);
	let later = new Date(y, m-1, d+7);
	
	let ty = today.getFullYear();
	let tm = today.getMonth();
	let td = today.getDate();

	if(tm<10) tm = "0"+tm
	if(td<10) td = "0"+td
	let start = ty + "." + tm +"."+ td;
	
	
	let ly = later.getFullYear();
	let lm = later.getMonth();
	let ld = later.getDate();
	if(lm<10) lm = "0"+lm
	if(ld<10) ld = "0"+ld
	let end = ly + "." + lm +"."+ ld;
	
	
	$("#resultDate").attr("data-start",start); 
    $("#resultDate").attr("data-end", end);
	
	
	let s = start + "~" + end;
	$("#resultDate").html(s);
	
}


</script>


	
	<div class="main-container pt-3 p-md-3 p-lg-4 h5">
	   <div class="row g-3 mb-4 align-items-center justify-content-between">
	    <div class="col-auto">
	           <h1 class="app-page-title mb-0">객실달력</h1>
	    </div>
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
	  </div>
	  
	   <div class="row text-center mb-4 justify-content-md-center">
			<button type="button" class="col btn col-lg-2 " onclick="dayMove(-1)"><i class="bi bi-arrow-left-square h3"></i></button> 
			 <span class="col-lg-4 h3" id="resultDate" data-start="" data-end=""></span>
			<button type="button" class="col btn col-lg-2" onclick="dayMove(+1)"><i class="bi bi-arrow-right-square h3"></i></button> 
	  </div>
	  <div class="col mb-3 float-left">
	  	 <span class="badge bg-success">예약완료</span> <span class="badge bg-primary">대실</span>
	 	 <span class="badge bg-warning ">장기숙박</span> <span class="badge bg-dark">예약불가</span>
	  </div>
	<div class="tab-content text-center shadow" id="orders-table-tab-content">
	       <div class="tab-pane fade show active" id="orders-all" role="tabpanel" aria-labelledby="orders-all-tab">
		    <div class="app-card app-card-orders-table shadow-sm mb-5">
			    <div class="app-card-body">
				    <div class="table-responsive">
				        <table class="table mb-0   ">
							<thead style="height: 60px;" class="align-middle">
								<tr class="table-secondary">
									<th class="cell">객실/달력</th>
									<th class="cell">입실일</th>
									<th class="cell">퇴실일</th>
									<th class="cell">예약자명</th>
									<th class="cell">예약상태</th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach var="dto" items="${list}">
								<tr class="align-middle" style="height: 60px;">
									<td class="cell">${dto.roomName}</td>
									<td class="cell">${dto.resCin_date}</td>
									<td class="cell">${dto.resCout_date}</td>
									<td class="cell">${dto.resName}</td>
									<td class="cell">
										<c:choose>
											<c:when test="${dto.enabled!=1 && dto.resCode==0}"><span class="badge bg-success">예약완료</span></c:when>
											<c:when test="${dto.enabled!=1 && dto.resCode==1}"><span class="badge bg-secondary">관리자취소</span></c:when>
											<c:when test="${dto.enabled!=1 && dto.resCode==2}"><span class="badge bg-danger">예약취소</span></c:when>
											<c:when test="${dto.enabled ==1}"><span class="badge bg-dark">예약불가</span></c:when>
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
	</div>




