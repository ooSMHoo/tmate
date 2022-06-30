<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lodging2.css?after"
	type="text/css">


<div class="whole">
	<div class="whole2">

		<form method="post" id="payForm" name="payForm">
			<div class="d-flex mt-5 w-100">
				<div class="w-75 p-3">

					<div class="pe-4">
						<div class="h5"><strong>예약자 정보</strong> </div>
						<div class="mt-3">
							<div class="mb-1">예약자 이름</div>
							<div>
								<input type="hidden" name="memberId" value="${memberId}">
								<input class="resinput mb-2" type="text" name="resName" placeholder=" 예)홍길동">
							</div>
						</div>
						<div class="mt-2">
							<div class="mb-1">생년월일</div>
							<div>
								<input class="resinput mb-2" type="text" name="resBirth" placeholder=" 예)19901225">
								<input type="hidden" name="roomPeople" value="${roomPeople}">
							</div>
						</div>
						<div class="mt-2">
							<div class="mb-1">휴대폰 번호</div>
							<div>
								<input class="resinput mb-2" type="text" name="resPhone" placeholder=" 예)010xxxxxxxx">
							</div>
						</div>
					</div>

					<div class="tm_hr my-3"></div>

					<div class="pe-4">
						<div class="h5"><strong>할인수단</strong> </div>
						<div class="d-flex mt-3">
							<div class="w-50">구매총액</div>
							<div class="w-50 host_modal h5 me-2 mb-1">
								<strong><span id="totalPrice">${dto.totalPrice}</span>원</strong> 
								<input type="hidden" name="resTotalcost" value="${dto.totalPrice}">
							</div>
						</div>
						<div class="d-flex mt-2">
							<div class="w-50 py-2">
								현재 포인트 <span id="nowPoint"> ${point}</span> P
							</div>
							<div class="w-50 host_modal">
								<input type="text" name="resPoint" value="0" id="inputPoint" class="resinput2"> P
							</div>
						</div>
					</div>

					<div class="tm_hr my-3"></div>

					<div class="pe-4 mt-2">
						<div class="h5"><strong>결제수단</strong> </div>
						<div class="mt-3">
							<select class="resinput2" name="sel1" id="sel1"> </select> 
							<select class="resinput2" name="sel2" id="sel2" style="display: none"></select>
							<input class="resinput2" type="hidden" name="payCode">
						</div>
						<div>
							<div class="payagrAll_box" style="visibility: hidden;">
								<label><input type="checkbox" name="checkAll"
									id="checkAll"> 전체 동의</label>
							</div>
							<div class="payagr_box">
								<label><input class="" type="checkbox" name="agreement"
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
					<div class="revForm" style="background: #f5f9ff">
						<div class="ps-2">
							<div>
								<div class="rev_small pt-2">숙소 이름</div>
								<div class="rev_con">${dto.lodgName}</div>
							</div>
							<div>
								<div class="rev_small">객실 타입 / 기간</div>
								<div class="rev_con">${dto.roomName} / ${dto.night}박</div>
								<input type="hidden" name="roomNum" value="${dto.roomNum}">
							</div>
							<div>
								<div class="rev_small">체크인</div>
								<div class="rev_con">${startDate}&nbsp;${dto.lodgCin_time}:00
									<input type="hidden" name="resCin_date" value="${startDate}"></div>
							</div>
							<div>
								<div class="rev_small">체크아웃</div>
								<div class="rev_con">${endDate}&nbsp;${dto.lodgCout_time}:00
								<input type="hidden" name="resCout_date" value="${endDate}"></div>
							</div>
						</div>
						<div class="tm_hr w-80 my-3"></div>
						<div class="ps-2">
							<div class="rev_con"><strong>총 결제 금액</strong> </div>
							<div class="rev_con my-2"> <span class="h4" id="payPrice"></span>원 
							<input type="hidden" name="payCost">
							<input type="hidden" name="roomPrice"  value="${dto.roomPrice}">
							</div>
							
						</div>
						<div class="paybox">
							<button class="btn w-100 mt-2 pay_btn" id="paybtn" onclick="payGo()"
								disabled="disabled"><strong>결제하기 </strong> </button>
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
    	" ":" 결제수단 선택",
    	"CARD":" 카드결제",
        "EASY":" 간편결제"
    };
    
    var sel2_1 = {
    	" ":"결제카드 선택",
    	"CARD1": " 하나카드",
        "CARD2": " SC제일카드",
        "CARD3": " 국민카드",
        "CARD4": " 신한카드",
        "CARD5": " 외환카드",
        "CARD6": " 우리카드",
        "CARD7": " 한국시티카드"
    };
    
    var sel2_2 = {
    	" ":"간편결제 선택",
    	"EASY1": " 카카오페이",
        "EASY2": " 네이버페이",
        "EASY3": " PAYCO",
        "EASY4": " MATE페이"
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
       		$('input[name=payCode]').val('1');
        } else if(option == "EASY"){
        	subSelName = "sel2_2";
            $('input[name=payCode]').val('2');
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

<script type="text/javascript">

$('document').ready(function(){
	var $total = Number($('#totalPrice').text());
	$('#payPrice').text($total);
	$('input[name=payCost]').val($total);
});


$("#inputPoint").change(function(){   
	var $point = Number($('#inputPoint').val());
	var $total = Number($('#totalPrice').text());
	
	if( $point > ${point} ) {
		alert("입력하신 포인트가 잔액보다 많습니다");
		$('#inputPoint').val("0");
		$('#payPrice').text($total);
		$('#inputPoint').focus();
		return; 
	}
	
	if( $("#inputPoint").val().length == 0 ){
		$('#inputPoint').val("0");
	}
	
	var $pay = $total - $point;
	
	$('#payPrice').text($pay);
	$('input[name=payCost]').val($pay);
});


</script>


<script type="text/javascript">
function payGo() {
	const f = document.payForm;
	let str;
	
	str = f.resName.value;
	if( !str ) {
		alert("예약자 이름을 입력해주세요.");
		f.resName.focus();
		return;
	}
	
	str = f.resBirth.value;
	if( !str ) {
		alert("생년월일을 입력해주세요.");
		f.resBirth.focus();
		return;
	}
	
	if( !/^\d{8}$/.test(str) ) {
        alert("생년월일은 8자리 숫자만 입력해주세요. ");
        f.resBirth.focus();
        return;
    }
	
	str = f.resPhone.value;
	if( !str ) {
		alert("전화번호를 입력해주세요.");
		f.resPhone.focus();
		return;
	}
	
	
	if( !/^\d{11}$/.test(str) ) {
        alert("전화번호는 숫자만 가능합니다. ");
        f.resPhone.focus();
        return;
	}

    f.action = "${pageContext.request.contextPath}/reservation/reservation";
   
    f.submit();
}
	
	

</script>
