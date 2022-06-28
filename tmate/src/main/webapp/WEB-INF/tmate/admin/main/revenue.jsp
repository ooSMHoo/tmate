<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.container-chart {
	max-width: 850px;
	margin-top: 15px;
	padding-bottom: 15px;
	box-shadow: 0 .5rem 1rem rgba(0,0,0,.15);
	font-family: "Noto Sans KR", sans-serif;
	text-align: center;
	font-size: x-large;
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

.container-info {
	margin-top: 20px;
	margin-bottom: 20px;
	padding-top: 5px;
	padding-bottom: 5px;
	font-family: "Noto Sans KR", sans-serif;
	text-align: center;
	font-size: x-large;
	box-shadow: 0 .5rem 1rem rgba(0,0,0,.15);
}

.container-info .info-box{
	box-sizing: border-box;
	padding: 10px;
	width: 95%;
	margin: 0px auto;
	height: 250px;
	border: 1px solid #1f93fa;
	text-align: center;
}

</style>

<script src="https://code.highcharts.com/highcharts.js"></script>

<script type="text/javascript">
$(function(){
	let url = "${pageContext.request.contextPath}/admin/bar2";
	
	$.getJSON(url, function(data){
	
		Highcharts.chart('barContainer', {
		    chart: {
		        type: 'column'
		    },
		    title: {
		        text: '월별 회원 및 호텔 가입원수'
		    },
		    xAxis: {
		        categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        crosshair: true
		    },
		    yAxis: {
		        min: 0,
		        title: {
		            text: '인원'
		        }
		    },
		    plotOptions: {
		        column: {
		            pointPadding: 0.2,
		            borderWidth: 0
		        }
		    },
		    series: [
				{name:'호텔', data: data.listHost},
				{name:'회원', data: data.listCustomer},
			]
		});
		
	});
});




$(function(){
	let url = "${pageContext.request.contextPath}/admin/bar1";
	$.getJSON(url, function(data){
		var arr=[
			{
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
		
		
		Highcharts.chart('maincontainer2', {
		    chart: {
		        zoomType: 'xy'
		    },
		    title: {
		        text: '올해 총 수익'
		    },
		    xAxis: [{
		        categories: ['1월', '2월', '3월', '4월', '5월', '6월',
		            '7월', '8월', '9월', '10월', '11월', '12월'],
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




</script>
<main>
	<div class="container container-chart">
		<div class="text-center text-black"><h5 id="resultDate"></h5></div>
		<div id="barContainer">그래프</div>
	</div>

	<div class="container container-info">
		<p> 총 매출 </p>
		<div id="maincontainer2" class="info-box">
		 	 
	 	</div> 
	</div>
</main>