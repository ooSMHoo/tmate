<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hostPage.css" type="text/css">

<script type="text/javascript">



function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data){
			fn(data);
		},
		beforeSend : function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error : function(jqXHR) {
			if (jqXHR.status === 403) {
				location.href="${pageContext.request.contextPath}/member/login";
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패했습니다.");
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}
function optionList() {
	const f = document.optionForm;
	f.option.value=$("#optionSelect").val();
	f.action="${pageContext.request.contextPath}/hostPage/bookingList/list";
	f.submit();
}

function searchList() {
	const f = document.searchForm;
	f.condition.value=$("#searchSelect").val();
	f.action="${pageContext.request.contextPath}/hostPage/bookingList/list";
	f.submit();
}


function detaileBooking(resNum) {
	var dlg = $("#booking-dialog").dialog({
		  autoOpen: false,
		  modal: true,
		  buttons: {
		       " 예약삭제 " : function() {
		    	   deleteOk(userId);
			   },
		       " 닫기 " : function() {
		    	   $(this).dialog("close");
		       }
		  },
		  height: 500,
		  width: 830,
		  title: "예약상세정보",
		  close: function(event, ui) {
		  }
	});

	let url = "${pageContext.request.contextPath}/hostPage/bookingList/detaile";
	let query = "resNum="+resNum;
	
	const fn = function(data){
		$('#booking-dialog').html(data);
		dlg.dialog("open");
	};
	ajaxFun(url, "post", query, "html", fn);
	console.log(query);
}

/*
function updateOk() {
	const f = document.memoUpdateForm;
	
	if(! $.trim(f.memoinput.value)) {
		f.memoinput.focus();
		return;
	}
	
	//여기서부터 
	let url = "${pageContext.request.contextPath}/admin/memberManage/updateMemberState";
	let query=$("#memoUpdateForm").serialize();

	const fn = function(data){
		$("form input[name=page]").val("${page}");
		searchList();
	};
	ajaxFun(url, "post", query, "json", fn);
		
	$('#booking-dialog').dialog("close");
}
*/
</script>
	
	<div class="main-container pt-3 p-md-3 p-lg-4 h5">
	   <div class="row g-3 mb-2 align-items-center justify-content-between">
	    <div class="col-auto">
	           <h1 class="app-page-title mb-0">예약목록 </h1>
	    </div>
	    <div class="col-auto">
		     <div class="page-utilities">
			    <div class="row g-2 justify-content-start justify-content-md-end align-items-center">
				    <div class="col-auto">
					    <form class="table-search-form row gx-1 align-items-center" name="searchForm" 
					    	action="${pageContext.request.contextPath}/hostPage/bookingList/list" method="post">
		                   	<div class="col-auto">
		                    <select name="condition" id="searchSelect" class="form-select w-auto" onchange="searchList();">
								<option selected value=""  ${condition==""?"selected='selected'":""}>전체</option>
								<option value="resName" ${condition=="resName"?"selected='selected'":""}>예약자명</option>
								<option value="roomName" ${condition=="roomName"?"selected='selected'":""}>객실명</option>
								<option value="resReg_date" ${condition=="resReg_date"?"selected='selected'":""}>예약일</option>
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
	  <form name="optionForm" action="${pageContext.request.contextPath}/hostPage/bookingList/list" method="post">
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
	  
	  
	  
	<div class="tab-content text-center shadow " id="orders-table-tab-content">
	       <div class="tab-pane fade show active" id="orders-all" role="tabpanel" aria-labelledby="orders-all-tab">
		    <div class="app-card app-card-orders-table shadow-sm mb-5">
			    <div class="app-card-body">
				    <div class="table-responsive">
				        <table class="table app-table-hover mb-0 text-left table-hover ">
							<thead  style="height: 60px;" class="align-middle">
								<tr class="table-secondary">
									<th class="cell">예약번호</th>
									<th class="cell">예약자명</th>
									<th class="cell">예약일</th>
									<th class="cell">체크인</th>
									<th class="cell">체크아웃</th>
									<th class="cell">객실</th>
									<th class="cell">요금</th>
									<th class="cell">예약상태</th>
								</tr>
							</thead>
							<tbody >
								<c:forEach var="dto" items="${list}">
								<tr class="hover align-middle" onclick="detaileBooking('${dto.resNum}');"  style="height: 60px;">
									<td class="cell">${dto.resNum}</td>
									<td class="cell">${dto.resName}</td>
									<td class="cell">${dto.resReg_date}</td>
									<td class="cell">${dto.resCin_date}</td>
									<td class="cell">${dto.resCout_date}</td>
									<td class="cell">${dto.roomName}</td>
									<td class="cell">${dto.resTotalcost}</td>
									<td class="cell">
										<c:choose>
											<c:when test="${dto.resCode==0}"><span class="badge bg-success">예약완료</span></c:when>
											<c:when test="${dto.resCode==1}"><span class="badge bg-primary">관리자취소</span></c:when>
											<c:when test="${dto.resCode==2}"><span class="badge bg-danger">예약취소</span></c:when>
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
		${dataCount == 0 ? "예약이 없습니다." : paging}
	</div>
	
	
	</div>
	<div id="booking-dialog" style="display: none;"></div>



