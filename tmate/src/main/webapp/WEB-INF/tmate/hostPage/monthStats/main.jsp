<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hostPage.css" type="text/css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.2.2/echarts.min.js"></script>
<script type="text/javascript">

function monthMove(p) {
	let baseDate = "${startDate}";
	
	let ss = baseDate.split("-");
	
	let y = parseInt(ss[0]);
	let m = parseInt(ss[1])+p;
	let sDate = new Date(y, m-1);
	
	let ty = sDate.getFullYear();
	let tm = sDate.getMonth()+1;

	if(tm<10) tm = "0"+tm
	
	let startDate = ty + "-" + tm ;
	console.log(startDate);

	let query = "startDate="+startDate;
	
	location.href="${pageContext.request.contextPath}/hostPage/monthStats/main?"+query;
	
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
	let url = "${pageContext.request.contextPath}/hostPage/monthStats/mtotalpay?startDate=${startDate}";
	
	$.getJSON(url, function(data){

		const chartDom = document.getElementById('mtotalpay');
		let myChart = echarts.init(chartDom);
		let option;
		
		let values = [];
		
		for(let i=0; i<data.ms.length; i++){
			let s = [data.ms[i].roomName, data.ms[i].total];
			values.push(s);
		}
		console.log(values);
		
		option = {
					title: {
				    text: '객실별 매출현황',
				    left: 'center'
				  },
				  dataset: [
				    {
				      dimensions: ['roomName',  'total'],
				      source: values
				    },
				    {
				      transform: {
				        type: 'sort',
				        config: { dimension: 'total', order: 'desc' }
				      }
				    }
				  ],
				  grid: {
					    left: '3%',
					    right: '4%',
					    bottom: '3%',
					    containLabel: true
					  },
				  xAxis: {
				    type: 'category',
				    axisLabel: { interval: 0, rotate: 30 }
				  },
				  yAxis: {},
				  series: {
				    type: 'bar',
				    encode: { x: 'roomName', y: 'total' },
				    datasetIndex: 1
				  }
				};
		option && myChart.setOption(option);	
		
	});
	
});


$(function(){
	let url = "${pageContext.request.contextPath}/hostPage/monthStats/mCountRes?startDate=${startDate}";
	
	$.getJSON(url, function(data){

		const chartDom = document.getElementById('mCountRes');
		let myChart = echarts.init(chartDom);
		let option;
		let value;
		let name;
		
		let values = [];
		
		for(let i=0; i<data.ms2.length; i++){
			let s = { value : data.ms2[i].count, name : data.ms2[i].roomName};
			values.push(s);
		}
		
		option = {
				  title: {
				    text: '객실별 예약현황',
				    left: 'center'
				  },
				  tooltip: {
				    trigger: 'item'
				  },
				  series: [
				    {
				      name: '객실명',
				      type: 'pie',
				      radius: '50%',
				      data: values,
				      emphasis: {
				        itemStyle: {
				          shadowBlur: 10,
				          shadowOffsetX: 0,
				          shadowColor: 'rgba(0, 0, 0, 0.5)'
				        }
				      }
				    }
				  ]
				};
		option && myChart.setOption(option);	
		
	});
	
});

$(function(){
	let url = "${pageContext.request.contextPath}/hostPage/monthStats/totalASday?startDate=${startDate}";
	
	$.getJSON(url, function(data){

		const chartDom = document.getElementById('totalASday');
		let myChart = echarts.init(chartDom);
		let option;
		
		let titles = [];
		let values = [];
		
		for(let i=0; i<data.ms3.length; i++){
			titles.push(data.ms3[i].readDay+"일");
			values.push(data.ms3[i].total);
		}
		
		
		console.log(titles);
		console.log(values);
		option = {
				title: {
				    text: '일별 매출현황',
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
			                color: '#fc8452',
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
		<h3 class="app-page-title mb-0">월별 상세현황</h3>
			<div class="row text-center mb-3 mt-2 justify-content-md-center ">
				<button type="button" class="col btn col-lg-2 " onclick="monthMove(-1)"><i class="bi bi-arrow-left-square h3"></i></button> 
				 <span class="col-lg-4 h3"  >${startDate}</span>
				<button type="button" class="col btn col-lg-2" onclick="monthMove(+1)"><i class="bi bi-arrow-right-square h3"></i></button> 
			</div>
			    <div class="row align-items-md-stretch ">
			      <div class="mb-4">
			        <div class=" p-2 border bg-white rounded-3 box1 shadow">
			          <h6 class="text-center mt-2 text-dark" style="font-weight: bold;">이번달 누적현황</h6>
			          <div class="row row-cols-5 text-center mt-4 count-box count mb-3">
			          	<div class="col text-primary" ><h1><strong> ${restotal}</strong></h1></div>
			          	<div class="col text-primary"><h1 style="font-weight: bold;"><strong> ${cintotal}</strong></h1></div>
			          	<div class="col text-primary ${totalPay !='0' ? 'mt-2' : '' } &nbsp; ${totalPay !='0' ? 'h2' : 'h1' }" >
			          	 		<strong>${totalPay}</strong> </div>
			          	<div class="col text-danger"><h1 style="font-weight: bold;"><strong> ${conceltotal}</strong></h1></div>
			          	<div class="col text-danger ${conceltotalPay !='0' ? 'mt-2' : '' } &nbsp; ${conceltotalPay !='0' ? 'h2' : 'h1' } ">
			          			<strong>${conceltotalPay}</strong> </div>
			          	<div class="col" style="font-weight: bold;">예약건</div>
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
			        <div class=" p-2 border bg-white rounded-3  shadow">
			         <div class="mt-3 ms-5" id="mtotalpay" style="width: 900px; height:350px; "></div>
			        </div> 
			      </div>
			    </div>
			     
			     <div class="align-items-md-stretch">
			      <div class="mb-4">
			        <div class=" p-2 border bg-white rounded-3  shadow">
			         <div class="mt-3 ms-5" id="totalASday" style="width: 900px; height:350px; "></div>
			        </div> 
			      </div>
			    </div>
			    <div class="row align-items-md-stretch  mb-4 ">
			      <div class="col-md-6">
			        <div class=" bg-white border rounded-3 shadow">
			          	<div class="mt-3" id="mCountRes" style="width: 490px; height:280px;"></div>
			        </div>
			      </div>
			      <!-- 
			      <div class="col-md-6">
			        <div class=" ps-2 bg-white border rounded-3 shadow">
			          <div class="mt-3 " id="" style="width: 700px; height:280px;"></div>
			        </div>
			      </div>
			       -->
			    </div>
			     
			</div>
	    </div>