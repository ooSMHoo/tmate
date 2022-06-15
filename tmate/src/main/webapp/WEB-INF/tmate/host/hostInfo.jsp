<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reg_form.css" type="text/css">

<div>
    <div class="tm_body">
        <div class="tm_form_wrap">
            <div class="tm_form_title">
                호스트 정보
            </div>
            <div class="tm_form">
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>이메일</span>
                    </div>
                    <div class="tm_form_input_box">
                        <span>${email}</span>
                    </div>
                </div>
                <div class="tm_form_list phone_number">
                    <div class="tm_form_lable_box">
                        <span>전화번호</span>
                    </div>
                    <div class="tm_form_input_box">
                        <span>${host.mhPhone}</span>
                    </div>
                </div>       
            </div>
        </div>
    
        <div class="tm_form_wrap">
            <div class="tm_form_title">
                사업자 등록 정보
            </div>
        
            <div class="tm_form">
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>상호명 (법인명)</span>
                    </div>
                    <div class="tm_form_input_box">
                        <span>${host.mhName}</span>
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>사업자등록번호</span>
                    </div>
                    <div class="tm_form_input_box">
                        <span>${host.mhNum}</span>
                    </div>
                </div>    
                <div class="tm_form_list address">
                    <div class="tm_form_lable_box">
                        <span>업체주소</span>
                    </div>
                    <div class="tm_form_input_box">
                        <span>${host.mhAddr1}, ${host.mhAddr2}</span>
                    </div>
                </div>    
            </div>
        </div>
    
        <div class="tm_form_wrap">
            <div class="tm_form_title">
                입금 계좌 정보
            </div>
        
            <div class="tm_form">
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>거래은행</span>
                    </div>
                    <div class="tm_form_input_box">
                        <span>${bank}</span>
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>예금주</span>
                    </div>
                    <div class="tm_form_input_box">
                        <span>${host.mhAc_name}</span>
                    </div>
                </div>
                <div class="tm_form_list">
                    <div class="tm_form_lable_box">
                        <span>계좌번호</span>
                    </div>
                    <div class="tm_form_input_box">
                        <span>${host.mhAc_num}</span>
                    </div>
                </div>       
            </div>
        </div>
        <div class="tm_bottom">
        	<div class="tm_btn_style large" onclick="location.href='${pageContext.request.contextPath}/hosts/update';">수정하기</div>
    	</div>
    </div>
</div>