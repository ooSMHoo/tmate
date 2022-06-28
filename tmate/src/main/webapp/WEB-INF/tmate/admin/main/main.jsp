<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.container-chart {
	margin-top: 50px;
	max-width: 850px;
	padding-bottom: 15px;
	box-shadow: 0 4px 4px -4px black;
	font-family: "Noto Sans KR", sans-serif;
	box-shadow: 0 .5rem 1rem rgba(0,0,0,.15);
}

.container-chart .box {
	box-sizing: border-box;
	padding: 10px;
	width: 95%;
	margin: 0 auto;
	height: 250px;
	border: 1px solid #1f93fa;
	text-align: center;
}

.container-chart .date {
	padding: 10px;
	font-size : 15px;
	text-align: center; 
}

.container-info {
	max-width: 850px;
	margin-top: 20px;
	margin-bottom: 20px;
	padding-top: 5px;
	padding-bottom: 5px;
	font-family: "Noto Sans KR", sans-serif;
	box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)!important;
}

.container-info .info-box { 
	display: grid;
    grid-template-columns: 2fr 3fr;  
    width: 95%;
    margin: 20px auto;
    background-color : #fff;
    border-radius : 5px;
}

.box1 {
	width : 550px;
	height : 600px;
	background: #fff;
	border: 1px solid #1f93fa;
	grid-row: span 2;
	margin-right: 20px;
	box-shadow: 0 4px 4px -4px black;
	font-family: "Noto Sans KR", sans-serif;
}

.box2 {
	border: 1px solid #1f93fa;
	margin-bottom: 20px;
	box-shadow: 0 4px 4px -4px black;
	font-family: "Noto Sans KR", sans-serif;
	text-align: center;
}


.box3{
	border: 1px solid #1f93fa;
	box-shadow: 0 4px 4px -4px black;
	font-family: "Noto Sans KR", sans-serif;
	text-align: center; 
}

</style>

<script src="https://code.highcharts.com/highcharts.js"></script>

<script type="text/javascript">
$(function(){
	let url = "${pageContext.request.contextPath}/admin/bar";
	$.getJSON(url, function(data){
		var arr=[
			{	// 요약 범례
		        name: '총 예약 금액',
		        type: 'column',
		        yAxis: 1,
		        data: data.listTotal,
		        tooltip: {
		            valueSuffix: ' 원'
		        }

		    }, {
		        name: '예약 건수',
		        type: 'spline',
		        data: data.listCount,
		        tooltip: {
		            valueSuffix: ' 건'
		        }
		    }
		];
		
		
		Highcharts.chart('maincontainer', {
		    chart: {
		        zoomType: 'xy'
		    },
		    title: {
		        text: '이번달 총 수익'
		    },
		    xAxis: [{
		        categories: ['1일', '2일', '3일', '4일', '5일', '6일',
		            '7일', '8일', '9일', '10일', '11일', '12일', '13일', 
		            '14일', '15일', '16일', '17일', '18일', '19일', '20일',
		            '21일', '22일', '23일', '24일', '25일', '26일', '27일',
		            '28일', '29일', '30일', '31일'],
		        crosshair: true
		    }],
		    yAxis: [{ // Primary yAxis
		        labels: {
		            format: '{value} 건',
		            style: {
		                color: Highcharts.getOptions().colors[1]
		            }
		        },
		        title: {
		            text: '예약 건수',
		            style: {
		                color: Highcharts.getOptions().colors[1]
		            }
		        }
		    }, { // Secondary yAxis
		        title: {
		            text: '총 예약 금액',
		            style: {
		                color: Highcharts.getOptions().colors[0]
		            }
		        },
		        labels: {
		            format: '{value} 원',
		            style: {
		                color: Highcharts.getOptions().colors[0]
		            }
		        },
		        opposite: true
		    }],
		    tooltip: {
		        shared: true
		    },
		    legend: {
		        layout: 'vertical',
		        align: 'left',
		        x: 120,
		        verticalAlign: 'top',
		        y: 100,
		        floating: true,
		        backgroundColor:
		            Highcharts.defaultOptions.legend.backgroundColor || // theme
		            'rgba(255,255,255,0.25)'
		    },
		    series: arr
		});		
	});
		
});


$(function(){
    let date = new Date();
    let y = date.getFullYear(); 
    let m = date.getMonth()+1; 
    let d = date.getDate(); 
   
	if(m<10) m = "0"+m
	
	let s = y+"년 "+m+"월 "+d +"일";
	$("#resultDate").html(s);
});

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

function searchList() {
	const f = document.searchForm;
	f.mhSign.value=$("#selectSign").val();

	f.action="${pageContext.request.contextPath}/admin/memberManage/hostList";
	f.submit();
}
</script>

<main>
	<div class="container container-chart">
		<div class="text-center text-black"><h2 id="resultDate"></h2></div>
		<div id="maincontainer" class="box">그래프</div>
	</div>

	<div class="container container-info">
		<div class="info-box">
		  <div class="box1">
		 	 <main style="background-color: #fff; padding: -10px;">
				<div class="body-container">
	   				<div class="body-title" style="text-align: center; font-size: large;">
						호스트 신청 대기목록 
	    			</div>
	  		  
	  			<div class="body-main">					
						<table class="table table-border table-list">
							<thead>
								<tr style="background-color: #F5F9FF;"> 
									<th class="wx-70">아이디</th>
									<th class="wx-70">대표자</th>
									<th>업체명</th>
									<th class="wx-70">승인여부</th>
								</tr>
							</thead>
							
							<tbody style="background-color: #fff;">
								<c:forEach var="dto" items="${list}">
									<tr class="hover" onclick="location.href='${pageContext.request.contextPath}/admin/memberManage/hostList?mhSign=0';"> 
										<td class="wx-70" style="text-align: center;">${dto.mhId}</td>
										<td class="wx-70" style="text-align: center;">${dto.memberName}</td>
										<td style="text-align: center;">${dto.mhName}</td>
										<td class="wx-70" style="text-align: center;">${dto.mhSign==1?"승인":"대기"}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						 
						<div class="page-box">
								${dataCount == 0 ? "대기중인 신청이 없습니다." : paging}
						</div>
				</div>
				</div>
			</main>
		  </div>
		  
		  
		 <div class="box2">
		 	<div style="padding : 10px 0;  background-color: #F5F9FF; font-size: 20px; height: 50px;"> 등록된 숙소 </div>
		 	<div> <span style="font-size: 40px;">${allHouse}</span>개 </div>
		 	<div style="padding : 10px 0; background-color: #F5F9FF; font-size: 20px; height: 50px;"> 고객</div>
		 	<div> <span style="font-size: 40px;">${allMember}</span>명 </div>
		 	<div style="padding : 10px 0; background-color: #F5F9FF; font-size: 20px; height: 50px;"> 호스트</div>
		 	<div> <span style="font-size: 40px;">${allHost}</span>명 </div>
		 </div>
		 
		 <div class="box3">
		 	<div style="padding : 10px 0; background-color: #FFFF90; font-size: 20px; height: 50px;"> 신고 </div>
		 	<div> <span style="font-size: 40px;">${allReport}</span>건 </div>
		 </div> 
	  </div> 
	</div>
</main>