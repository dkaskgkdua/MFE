<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.gray {color: #a9afb4;}
#order {overflow:hidden; width:550px; margin:0 auto; padding-bottom:40px; background:#fff;}
#order .btn_back {padding:15px;}
#order .btn_back a {display:inline-block; *display:inline; *zoom:1; padding-left:20px; background:url('../_img/order/btn_back.png') no-repeat left center/16px auto;}
#order .btn_back a:hover {background-image:url('../_img/order/btn_back_hover.png');}
#order .purchasetotal {padding:30px 15px;}
#order .purchasetotal h2 {margin-bottom:20px; font-size:24px; font-weight:bold;}
#order .purchasetotal .pur:after {display:block; clear:both; content:'';}
#order .purchasetotal .pur .describe {float:left; width:65%; padding-right:25px;}
#order .purchasetotal .pur .describe > p {margin:5px 0; padding-left:25px; background-size:17px auto; background-repeat:no-repeat; background-position:left center; font-size:16px;}
#order .purchasetotal .pur .describe .date {background-image:url('../_img/order/calendar.png');}
#order .purchasetotal .pur .describe .prc {background-image:url('../_img/order/price.png');}
#order .purchasetotal .pur .describe .prc .price {float:right; font-size:16px;}
#order .purchasetotal .pur .describe .total_prc {padding-left:0; font-size:20px;}
#order .purchasetotal .pur .describe .total_prc strong {font-size:24px;}
#order .purchasetotal .pur .image {float:right; width:35%;}
#order .purchasetotal .pur .image img {max-width:100%; height:auto;}
#order .method {padding:30px 15px; border-top:1px dashed #eee;}
#order .method h3 {margin-bottom:20px; font-size:16px;}
#order .method .pur_method .title {padding:15px 15px 15px 70px; border:1px solid #b5b5b5; background-repeat:no-repeat; background-size:30px auto; background-position:left 20px center; font-size:16px;}
#order .method .pur_method:last-of-type {margin-top:-1px;}
#order .method .pur_method .pur_cont {display:none; padding:15px; border:1px solid #b5b5b5; border-top:0;}
#order .method .pur_method .pur_cont .save {margin:5px 0; font-size:0;}
#order .method .pur_method .pur_cont .save input[type="checkbox"] {display:inline-block; *display:inline; *zoom:1; margin:0; vertical-align:middle;}
#order .method .pur_method .pur_cont .save label {display:inline-block; *display:inline; *zoom:1; margin-left:5px; font-size:14px; font-weight:normal; vertical-align:middle;}
#order .method .pur_card .pur_cont {display:block;}
#order .method .pur_card .title {background-image:url('../_img/order/card.png');}
#order .method .pur_card .input-box {display:flex; width:100%;}
#order .method .pur_card .input-box input {height:50px; padding:0 10px; font-size:14px; line-height:50px;}
#order .method .pur_card .input-box input#cardnumber {width:70%;}
#order .method .pur_card .input-box input#cardmmyy {width:70px; margin:0 10px;}
#order .method .pur_card .input-box input#cardcvv {width:70px;}
#order .method .pur_paypal .title {background-image:url('../_img/order/paypal.png');}
#order .agree {padding-bottom:50px; text-align:center;}
#order .agree li a {font-size:14px;}
#order .reserverbtn {position:fixed; left:50%; bottom:0; width:550px; margin-left:-275px;}
#order .reserverbtn button {width:100%; height:40px; padding:0; border-radius:0; line-height:40px;}
#order .layer_agree {display:none; position:fixed; left:50%; top:50%; z-index:50; width:500px; height:250px; margin:-125px 0 0 -250px; background:#fff;}
#order .layer_agree h3 {height:50px; border-bottom:1px solid #eee; font-size:20px; text-align:center; line-height:50px;}
#order .layer_agree .close {display:block; position:absolute; right:0; top:0; width:50px; height:50px; background:url('../_img/button/close.png') no-repeat center/20px auto; color:transparent; font-size:0; opacity:1;}
#order .layer_agree .inner {overflow-y:auto; height:200px; padding:10px;}
#dimmed {display:none; position:fixed; left:0; top:0; bottom:0; z-index:10; width:100%; height:100%; background-color:rgba(0,0,0,0.5);}

@media (min-width: 320px) and (max-width: 767px) {
	.container {padding:0;}
	#order {width:100%;}
	#order .reserverbtn {left:0; width:100%; margin-left:0;}
	#order .layer_agree {left:0; top:0; width:100vw; height:100vh; margin:0;}
	#order .layer_agree .inner {height:90vh;}
}
</style>
<body>
<div id="order">
	<div class="btn_back"><a href="Reserve_Background.jsp" id="goback">Go back</a></div>
	<div class="purchasetotal">
		<h2>Hot Chip's New Year's Eve House Party</h2> <!-- 공연명 -->
		<div class="pur">
			<!-- 결제detail -->
			<div class="describe">
				<p class="date gray">31st December 2019, 8pm-5am</p> <!-- 공연일시 -->
				<p class="prc gray">Ticket price<span class="price pricetag gray">￦96,000 (x1)</span></p> <!-- 공연금액(수량) -->
				<p class="prc gray">Ticket booking fee<span class="price booingtag gray">￦4,000 (x1)</span></p> <!-- 공연금액 수수료(수량) -->
				<p class="total_prc">TOTAL : <strong>￦100,000</strong></p> <!-- 공연총금액 -->
			</div>
			<!-- //결제detail -->
			<!-- 결제detail_image 그림 end -->
			<div class="image"><img src="_img/_temp/midimg0.jpg"></div> <!-- 공연이미지 -->
			<!-- //결제detail_image 그림 end -->
		</div>
	</div>
	<div class="method">
		<h3>Choose a way to pay</h3>
		<!-- credit -->
		<div class="pur_card pur_method">
			<p class="title">Card</p>
			<div class="credit pur_cont">
				<div id="input-box" class="input-box">
					<input type="text" id="cardnumber" class="creditcard number" name="credit" placeholder="Card Number" onkeyup="validatecardnumber" required>
					<input type="text" id="cardmmyy" class="creditcard mmyy" name="credit" placeholder="MM/YY" required> 
					<input type="text" id="cardcvv" class="creditcard cvv" name="credit" placeholder="CVV" required>
				</div>
				<div id="card_message" class="card_message"></div>
				<div class="save"><input type="checkbox" id="save_credit" name="save_credit"><label for="save_credit">Save Credit Card</label></div>
			</div>
		</div>
		<!-- //credit -->
		<!-- paypal -->
		<!--
		<div class="pur_paypal pur_method">
			<p class="title">Paypal</p>
			<div class="paypal pur_cont"></div>
		</div>
		-->
		<!-- //paypal -->
	</div>
	<ul class="agree">
		<li><a href="#" onclick="layer_agree('terms'); return false;">Terms and conditions of use</a></li>
		<li><a href="#" onclick="layer_agree('privacy'); return false;">Privacy policy</a></li>
	</ul>
	<!-- PAY 버튼  -->
	<div id="layer_fixed" class="reserverbtn">
		<button type="submit" class="btn btn-info sub" id="payment">PAY</button>
	</div>
	<!-- //PAY end-->
	<!-- layer_agree -->
	<div id="layer_terms" class="layer_terms layer_agree">
		<h3>Terms and conditions of use</h3>
		<a href="#" onclick="layer_agree('terms'); return false;" class="close">close</a>
		<div class="inner">
			Terms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of use Terms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of useTerms and conditions of use
		</div>
	</div>
	<div id="layer_privacy" class="layer_privacy layer_agree">
		<h3>Privacy policy</h3>
		<a href="#" onclick="layer_agree('privacy'); return false;" class="close">close</a>
		<div class="inner">
			Privacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policyPrivacy policy
		</div>
	</div>
	<!-- //layer_agree -->
	<div id="dimmed"></div>
</div>
<script type="text/javascript">
	/* 확인 alert */
	$(function() {
		/* goback 클릭시 확인 alert */
		$("#goback").click(function(event) {
			var answer = confirm("결제를 취소하시겠습니까?");
			console.log(answer);//취소를 클릭한 경우 -false
			if (!answer) {//취소를 클릭한 경우
				event.preventDefault();
			}
		})

		/* pay 클릭시 확인 alert */
		$(".reserverbtn .sub").click(function(event) {
			var answer = confirm("결제를 진행하시겠습니까?");
			console.log(answer);//취소를 클릭한 경우 -false
			if (!answer) {//취소를 클릭한 경우
				event.preventDefault();
			}
		});
	});

	// 약관동의 레이어
	function layer_agree(layer_name) {
		var layer_name = $('#layer_'+layer_name);
		if (layer_name.css('display') == 'none') {
			layer_name.show();
			$('#dimmed').show();
		} else {
			layer_name.hide();
			$('#dimmed').hide();
		}
	}

	/* 카드 유효성 검사 */
	$(document).ready(function() {
		$("#payment").click(function() {
			if ($.trim($("#cardnumber").val()) == '') {
				alert('카드번호를 입력해주세요.');
				$("#cardnumber").focus();
				return false;
			}

			if ($.trim($("#cardmmyy").val()) == '') {
				alert('카드 유효기간을 입력해주세요.');
				$("#cardmmyy").focus();
				return false;
			}

			if ($.trim($("#cardcvv").val()) == '') {
				alert('카드뒷면 CVV를 입력해주세요.');
				$("#cardcvv").focus();
				return false;
			}
		})
	})
	
	function validatecardnumber(cardnumber) {
   
        //빈칸과 대시 제거
        cardnumber = cardnumber.replace(/[-]/g,'');
        var pattern = /^(5[1-5]\d{14})|(4\d{12}(\d{3})?)|(3[47]\d{13})|6011\d{12})|((30[0-5]|36\d|38\d)\d{11})$/
     
    }

	function check() {

		var cardnumber = document.getElementById("cardnumber");
		var cardmmyy = document.getElementById("cardmmyy");
		var cardcvv = document.getElementById("cardcvv");
		
		
		if (cardnumber.value.length == 16) {
			if (!isNaN(cardnumber.value)) { //16자리가 모두 숫자인경우
				cardmmyy.focus();
			} else { //16자리가 숫자가 아닌경우
				alert("숫자로 입력하세요");
				cardnumber.value = ''; //앞자리 모두 초기화
				cardnumber.focus(); //앞자리에 포커스
			}
		}
		
		if (cardmmyy.value.length == 4) {
			if (!isNaN(cardnumber.value)) { //4자리가 모두 숫자인경우
				cardcvv.focus();
			} else { //16자리가 숫자가 아닌경우
				alert("숫자로 입력하세요");
				cardmmyy.value = ''; //앞자리 모두 초기화
				cardmmyy.focus(); //앞자리에 포커스
			}
		}
		
		if (cardcvv.value.length == 3) {
			if (!isNaN(cardcvv.value)) { //4자리가 모두 숫자인경우
				
				
			} else { //16자리가 숫자가 아닌경우
				alert("숫자로 입력하세요");
				cardcvv.value = ''; //앞자리 모두 초기화
				cardcvv.focus(); //앞자리에 포커스
			}
		}

	}

	/* 카드 번호 입력시 4자리숫자 입력 후 자동 띄어쓰기 */
	function cardnumber_format(value) {
		var v = value.replace(/\s+/g, '').replace(/[^0-9]/gi, '')
		var matches = v.match(/\d{4,16}/g);
		var match = matches && matches[0] || ''
		var parts = []
		for (i = 0, len = match.length; i < len; i += 4) {
			parts.push(match.substring(i, i + 4))
		}
		if (parts.length) {
			return parts.join(' ')
		} else {
			return value
		}
	}

	onload = function() {
		document.getElementById('cardnumber').oninput = function() {
			this.value = cardnumber_format(this.value)
		}
	}
</script>

</body>
</html>