<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hostPage.css" type="text/css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.2.2/echarts.min.js"></script>
<script type="text/javascript">

function yearMove(p) {
	let baseDate = "${startDate}";
	let startDate = parseInt(baseDate)+p;
	
	let query = "startDate="+startDate;
	location.href="${pageContext.request.contextPath}/hostPage/yearStats/main?"+query;

}

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

$(function(){
	let url = "${pageContext.request.contextPath}/hostPage/yearStats/yRoomstats?startDate=${startDate}";
	
	$.getJSON(url, function(data){

		const chartDom = document.getElementById('yRoomstats');
		let myChart = echarts.init(chartDom);
		let option;
		
		let titles = [];
		let lastpay = [];
		let thispay = [];
		let lastcount = [];
		let thiscount = [];
		
		for(let i=0; i<data.ys1.length; i++){
			titles.push(data.ys1[i].roomName);
			lastpay.push(data.ys1[i].total);
		}

		
		for(let i=0; i<data.ys2.length; i++){
			thispay.push(data.ys2[i].total);
		}


		for(let i=0; i<data.ys3.length; i++){
			lastcount.push(data.ys3[i].count);
		}

		
		for(let i=0; i<data.ys4.length; i++){
			thiscount.push(data.ys4[i].count);
		}

		option = {
				title: {
				    text: '이번년도 객실별 상세',
				    left: 'center'
				  },
				  tooltip: {
					    trigger: 'item'
					  },
				
				  xAxis: [
				    {
				      type: 'category',
				      data: titles,
				      axisPointer: {
				        type: 'shadow'
				      }
				    }
				  ],
				  yAxis: [
				    {
				      type: 'value',
				      name: '총금액',
				      axisLabel: {
				        formatter: '{value}원'
				      }
				    },
				    {
				      type: 'value',
				      name: '총건수',
				      axisLabel: {
				        formatter: '{value}명'
				      }
				    }
				  ],
				  series: [
				    {
				      name: '작년 매출',
				      type: 'bar',
				      tooltip: {
				        valueFormatter: function (value) {
				          return value + ' 원';
				        }
				      },
				      itemStyle:{
			                color: '#fac858',
			            },
				      data: lastpay
				    },
				    {
				      name: '올해 매출',
				      type: 'bar',
				      tooltip: {
				        valueFormatter: function (value) {
				          return value + ' 원';
				        }
				      },
				      itemStyle:{
			                color: '#5470c6',
			            },
				      data: thispay
				    },
				    {
				      name: '작년 총예약수',
				      type: 'line',
				      yAxisIndex: 1,
				      tooltip: {
				        valueFormatter: function (value) {
				          return value + ' 건';
				        }
				      },
				      itemStyle:{
			                color: '#91cc75',
			            },
				      data: lastcount
				    },
				    {
				      name: '올해 총예약수',
				      type: 'line',
				      yAxisIndex: 1,
				      tooltip: {
				        valueFormatter: function (value) {
				          return value + ' 건';
				        }
				      },
				      itemStyle:{
			                color: '#ee6666',
			            },
				      data:thiscount
				    }
				  ]
				};
		option && myChart.setOption(option);	
		
	});
	
});

$(function(){
	let url = "${pageContext.request.contextPath}/hostPage/yearStats/totalASmonth?startDate=${startDate}";
	
	$.getJSON(url, function(data){

		const chartDom = document.getElementById('totalASmonth');
		let myChart = echarts.init(chartDom);
		let option;
		
		let titles = [];
		let values = [];
		
		for(let i=0; i<data.ys5.length; i++){
			titles.push(data.ys5[i].readMonth+"월");
			values.push(data.ys5[i].total);
		}
		
		
		console.log(titles);
		console.log(values);
		option = {
				title: {
				    text: '달별 매출현황',
				    left: 'center'
				  },
				  tooltip: {
					    trigger: 'item'
					  },
			       
				  xAxis: {
				    type: 'category',
				    data: titles,
				  },
				  yAxis: {
				    type: 'value',
				    axisLabel: {
				        formatter: '{value}원'
			        }
				  },
				  series: [
				    {
				      data: values,
				      type: 'line',
				      itemStyle:{
			                color: '#5470c6',
			            }
				    },
				  ]
				};
		option && myChart.setOption(option);	
	});
});
</script>

<div class="container-fluid">
	<div class=" main-container py-4" >
		<h3 class="app-page-title mb-0">연도별 상세현황</h3>
			<div class="row text-center mb-1 justify-content-md-center mt-2 mb-3">
				<button type="button" class="col btn col-lg-2 " onclick="yearMove(-1)"><i class="bi bi-arrow-left-square h3"></i></button> 
				 <span class="col-lg-4 h3" >${startDate}</span>
				<button type="button" class="col btn col-lg-2" onclick="yearMove(+1)"><i class="bi bi-arrow-right-square h3"></i></button> 
			</div>
			    <div class="row align-items-md-stretch">
			      <div class="mb-4">
			        <div class=" p-2 border bg-white rounded-3 shadow ">
			          <h5 class="text-center text-dark mt-2">이번연도 누적현황</h5>
			          <div class="row row-cols-4 text-center mt-4 count-box count mb-3">
			          	<div class="col text-primary"><h1 style="font-weight: bold;"><strong> ${restotal}</strong></h1></div>
			          	<div class="col text-primary ${totalPay !='0' ? 'mt-2' : '' } &nbsp; ${totalPay !='0' ? 'h2' : 'h1' }" >
			          	 		<strong>${totalPay}</strong> </div>
			          	<div class="col text-danger"><h1 style="font-weight: bold;"><strong> ${conceltotal}</strong></h1></div>
			          	<div class="col text-danger ${conceltotalPay !='0' ? 'mt-2' : '' } &nbsp; ${conceltotalPay !='0' ? 'h2' : 'h1' } ">
			          			<strong>${conceltotalPay}</strong> </div>
			          	<div class="col" style="font-weight: bold;">입실건</div>
			          	<div class="col" style="font-weight: bold;">판매금액</div>
			          	<div class="col" style="font-weight: bold;">취소건</div>
			          	<div class="col" style="font-weight: bold;">취소금액</div>
			          </div>
			        </div>
			      </div>
			    </div>
				<div class="align-items-md-stretch">
			      <div class="mb-4">
			        <div class=" border bg-white rounded-3 shadow">
			         <div class="mt-3 ms-5" id="yRoomstats" style="width: 900px; height:400px; "></div>
			         
			        </div>
			      </div>
			    </div>
			    <div class="align-items-md-stretch">
			      <div class="mb-4">
			        <div class=" border bg-white rounded-3 shadow">
			         <div class="mt-3 ms-5" id="totalASmonth" style="width: 900px; height:400px; "></div>
			         
			        </div>
			      </div>
			    </div>
			    
			     
			</div>
	    </div>