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

function changeOption(value) {
	
	location.href = "${pageContext.request.contextPath}/hostPage/rooms?option="+value;
}

function changeState(value) {
	let enabled = $('#flexSwitchCheckDefault'+value).attr("enabled");
	let msg = "객실을 비활성화하시겠습니까?";
	if(enabled === "1") {
		msg = "객실을 활성화하시겠습니까?";
	}
	
	if (! confirm(msg)) {
		event.preventDefault();
		return false;
	}
	let url = "${pageContext.request.contextPath}/host/rooms/"+value+"/enable";
	let query = "enabled=" + enabled;
	
	const fn = function(data) {
		let enabled = data.enabled;
		let result = data.result;
		if (result === "true") {
			if (enabled === "1") {
				$('#flexSwitchCheckDefault'+value).attr("checked", false);	
			} else {
				$('#flexSwitchCheckDefault'+value).attr("checked", true);
			}
			$('#flexSwitchCheckDefault'+value).attr("enabled", enabled);
		} else {
			alert("오류로 인해 처리하지 못했습니다.");
		}
	}
	
	ajaxFun(url, "post", query, "json", fn);
	
}

function deleteRoom(value) {
	if(confirm("해당 객실을 삭제하시겠습니까?")) {
		location.href="${pageContext.request.contextPath}/host/rooms/"+ value +"/delete?page=${current_page}&option=${option}";
	}
}
</script>
	
	<div class="main-container pt-3 p-md-3 p-lg-4">
	   <div class="row g-3 mb-2 align-items-center justify-content-between">
	    <div class="col-auto">
	           <h1 class="app-page-title mb-0">객실관리</h1>
	    </div>
	  </div>
		<table class="table">
			<tr>
				<td align="left" width="50%">
					${dataCount}개(${current_page}/${total_page} 페이지)
				</td>
				<td align="right">
					 <select name="option" id="optionSelect" class="form-select w-auto" onchange="changeOption(this.value);">
						  <option selected value=""  ${option==""?"selected='selected'":""}>전체</option>
						  <option value="active" ${option=="active"?"selected='selected'":""}>활성화</option>
						  <option value="noactive"  ${option=="noactive"?"selected='selected'":""}>비활성화</option> 
					</select>
				</td>
			</tr>
		</table>	
	  
	<div class="tab-content text-center shadow" id="orders-table-tab-content">
	       <div class="tab-pane fade show active" id="orders-all" role="tabpanel" aria-labelledby="orders-all-tab">
		    <div class="app-card app-card-orders-table shadow-sm mb-5">
			    <div class="app-card-body">
				    <div class="table-responsive">
				        <table class="table app-table-hover mb-0 text-left table-hover">
							<thead >
								<tr class="table-secondary">
									<th class="cell">번호</th>
									<th class="cell">객실이름</th>
									<th class="cell">객실유형</th>
									<th class="cell">객실상세</th>
									<th class="cell">객실정보수정</th>
									<th class="cell">객실삭제</th>
									<th class="cell">활성화/비활성화</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="room" items="${list}">
									<tr class="hover">
										<td class="cell">${room.listNum}</td>
										<td class="cell">${room.roomName}</td>
										<td class="cell">${room.roomCategory}</td>
										<td class="cell"><button onclick="location.href='${pageContext.request.contextPath}/host/rooms/${room.roomNum}?page=${current_page}&option=${option}'">객실상세</button></td>
										<td class="cell"><button onclick="location.href='${pageContext.request.contextPath}/host/rooms/${room.roomNum}/update?page=${current_page}&option=${option}'">수정하기</button></td>
										<td class="cell"><button onclick="deleteRoom(${room.roomNum});">삭제하기</button></td>
										<td class="cell">
											<div class="form-check form-switch">
											  <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault${room.roomNum}" onclick="changeState(${room.roomNum});" ${room.enabled=="0"?"checked='checked' enabled=0":"enabled=1"}>
											  <label class="form-check-label" for="flexSwitchCheckDefault${room.roomNum}"></label>
											</div>
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
		${dataCount == 0 ? "객실이 없습니다." : paging}
	</div>
	
	
	</div>
	<div id="booking-dialog" style="display: none;"></div>



