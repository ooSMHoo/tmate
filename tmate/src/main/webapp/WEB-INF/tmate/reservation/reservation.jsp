<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lodging.css?after"
	type="text/css">


<div class="whole">
	<div class="whole2">

		<form action="" method="post" id="payForm">
			<div class="d-flex room_content w-100">
				<div class="w-75 p-3">

					<div class="pe-4">
						<div class="room_name">예약자 정보</div>
						<div class="mt-2">
							<div>이름</div>
							<div>
								<input type="text" placeholder="예)김티엠">
							</div>
						</div>
						<div class="mt-2">
							<div>생년월일</div>
							<div>
								<input type="text" placeholder="예)901225">
							</div>
						</div>
						<div class="mt-2">
							<div>휴대폰 번호</div>
							<div>
								<input type="text" placeholder="예)010xxxxxxxx">
							</div>
						</div>
					</div>

					<div class="tm_hr my-3"></div>

					<div class="pe-4">
						<div class="room_name">할인 수단(포인트)</div>
						<div class="d-flex mt-2">
							<div class="w-50">총액</div>
							<div class="w-50 host_modal">
								<span>OOO,OOO</span> 원
							</div>
						</div>
						<div class="d-flex mt-2">
							<div class="w-50">
								현재 포인트 <span>OO</span> P
							</div>
							<div class="w-50 host_modal">
								<input type="text" value="0" style="width: 70%"> P
							</div>
						</div>
					</div>

					<div class="tm_hr my-3"></div>

					<div class="pe-4">
						<div class="room_name">결제 수단</div>
						<div class="mt-2">
							<select name="sel1" id="sel1">
							</select> <select name="sel2" id="sel2" style="display: none">
							</select>
						</div>
						<div>
							<div class="payagrAll_box" style="visibility: hidden;">
								<label><input type="checkbox" name="checkAll"
									id="checkAll"> 전체 동의</label>
							</div>
							<div class="payagr_box">
								<label><input type="checkbox" name="agreement"
									id="payagr1" value="payagr1"> <a href="#">숙소이용규칙 및
										취소/환불 규정 동의</a><span>(필수)</span></label>
							</div>
							<div class="payagr_box">
								<label><input type="checkbox" name="agreement"
									id="payagr2" value="payagr2"> <a href="#">개인정보 수집 및
										이용 동의</a><span>(필수)</span></label>
							</div>
							<div class="payagr_box">
								<label><input type="checkbox" name="agreement"
									id="payagr3" value="payagr3"> <a href="#">개인정보 제 3자
										제공 동의 </a><span>(필수)</span></label>
							</div>
						</div>

					</div>



				</div>
				<div class="w-25">
					<div style="background: #FAFAFA">
						<div class="ps-2">
							<div>
								<div class="rev_small">숙소 이름</div>
								<div>OOOOO 호텔</div>
							</div>
							<div>
								<div class="rev_small">객실 타입 / 기간</div>
								<div>OOOOOOO방 / 1박</div>
							</div>
							<div>
								<div class="rev_small">체크인</div>
								<div>${startDate}XXXX-XX-XX (월) 15:00</div>
							</div>
							<div>
								<div class="rev_small">체크아웃</div>
								<div>${endDate}XXXX-XX-XX (수) 12:00</div>
							</div>
						</div>
						<div class="tm_hr w-75 my-3"></div>
						<div class="ps-2">
							<div>결제하실 금액</div>
							<div>OOO,OOO원</div>
						</div>
						<div class="paybox">
							<button class="w-100 mt-2" type="submit" id="paybtn"
								disabled="disabled">결제하기</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>


<script type="text/javascript">


// 체크박스
const form = document.querySelector("#payForm");
const checkAll = document.querySelector("#checkAll");
const checkBoxes = document.querySelectorAll(".payagr_box");
const submitButton = document.querySelector("#paybtn");

const agreements = {
	payagr1: false,
	payagr2: false,
	payagr3: false,
};

form.addEventListener('submit', (e) => e.preventDefault());

checkBoxes.forEach((item) => item.addEventListener('input', toggleCheckbox));

function toggleCheckbox(e) {
	const { checked, id } = e.target;
	agreements[id] = checked;
	this.parentNode.classList.toggle('active');
	checkAllStatus();
	toggleSubmitButton();
}

function checkAllStatus() {
	const { payagr1, payagr2, payagr3 } = agreements;
	if ( payagr1 && payagr2 && payagr3 ) {
		checkAll.checked = true;
	} else {
		checkAll.checked = false;
	}
}

function toggleSubmitButton() {
	const { payagr1, payagr2, payagr3 } = agreements;
	if ( payagr1 && payagr2 && payagr3 ) {
		submitButton.disabled = false;
	} else {
		submitButton.disabled = true;
	}
}


checkAll.addEventListener('click', (e) => {
	const { checked } = e.target;
	if (checked) {
		checkBoxes.forEach((item) => {
			item.checked = true;
			agreements[item.id] = true;
			item.parentNode.classList.add('active');
		});
	} else {
		checkBoxes.forEach((item) => {
			item.checked = false;
			agreements[item.id] = false;
			item.parentNode.classList.remove('active');
		});
	}
	toggleSubmitButton();
});





//결제 방식
$( document ).ready(function(){
	   
	var sel1 = {
    	" ":"결제수단 선택",
    	"CARD":"카드결제",
        "EASY":"간편결제"
    };
    
    var sel2_1 = {
    	" ":"결제카드 선택",
    	"CARD1": "신한카드",
        "CARD2": "농협카드",
        "CARD3": "국민카드",
        "CARD4": "우리카드"
    };
    
    var sel2_2 = {
    	" ":"간편결제 선택",
    	"EASY1": "카카오페이",
        "EASY2": "네이버페이",
        "EASY3": "PAYCO",
        "EASY4": "MATE페이"
    };
    
   //sel1에 서버에서 받아온 값을 넣기위해..
   // map배열과 select 태그 id를 넘겨주면 option 태그를 붙여줌.
   // map[키이름] = 그 키에 해당하는 value를 반환한다.
   //retOption(데이터맵, select함수 id)
   function retOption(mapArr, select){
    	var html = '';
    	var keys = Object.keys(mapArr);
    	for (var i in keys) {
    	    html += "<option value=" + "'" + keys[i] + "'>" + mapArr[keys[i]] + "</option>";
    	}
        
        $("select[id='" + select +"']").html(html);
   }
   
   $("select[id='sel1']").on("change", function(){
    	var option = $("#sel1 option:selected").val();
        var subSelName = '';
    	if(option == "CARD") {
        	subSelName = "sel2_1";
        } else if(option == "EASY"){
        	subSelName = "sel2_2";
        } else{
        	$("#sel2").hide();
        	return;
        }
        $("#sel2").show();
        retOption(eval(subSelName), "sel2");
    })
   retOption(sel1, "sel1");
});

</script>

