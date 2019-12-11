<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../mainActivity/navbar.jsp"/>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	String con_id = (String)session.getAttribute("con_id");
	String con_name = (String)session.getAttribute("con_name");
	String con_day = (String)session.getAttribute("con_day");
	String con_open = (String)session.getAttribute("con_open");
	String con_close = (String)session.getAttribute("con_close");
	int amount = (Integer.valueOf((String)session.getAttribute("amount")));
	int con_price = (Integer.valueOf((String)session.getAttribute("con_price")));
	String member_id = (String)session.getAttribute("id");
	String con_image = (String)session.getAttribute("con_image");
	
	System.out.println("Con_id = " + con_id);
	System.out.println("Memberid = " + member_id);
	System.out.println("amount = " + amount);
	System.out.println("con_image = " + con_image);
	%>

<link rel="stylesheet" href="assets/css/purchase.css">
<style>
.describe {
	width: 66%;
	float: left;
}

.image {
	width: 33%;
	float: right;
}

hr {
	margin: 0;
}

.pur .title h2 {
	font-weight: bolder;
}

.pur_card {
	padding: 0 10%;
	display: block;
}

.policy {
	padding: 0 10%;
	display: block;
}

.pur_card .credit {
	width: 100%;
	display: inline-block;
}

.pur_card .credit input[id=card_id] {
	padding: 1%;
	width: 70%;
}

.pur_card .credit input[id=card_mmyy] {
	width: 12%;
}

.pur_card .credit input[id=card_cvv] {
	width: 12%;
}

.purchasetotal {
	padding: 10%;
}

.reserverbtn {
	clear: both;
}

#gray {
	color: #a9afb4;
}

.price {
	float: right;
	font-weight: bolder;
}

.credit #input-box {
	box-sizing: border-box;
	border: 1px solid grey;
	display: flex;
	padding: 2%;
	height: 50px;
	width: 100%;
}

.credit #input-box #cardicon {
	height: 25px;
	width: 8%;
	margin: auto;
}

.credit #input-box #cardicon img {
	width: 100%;
	height: auto;
	vertical-align: top;
}
</style>
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
		})
		
	})

	/* 카드 유효성 검사 */
	$(document).ready(function() {
		$("#payment").click(function() {
			if ($.trim($("#card_id").val()) == '') {
				alert('카드번호를 입력해주세요.');
				$("#card_id").focus();
				return false;
			}

			if ($.trim($("#card_mmyy").val()) == '') {
				alert('카드 유효기간을 입력해주세요.');
				$("#card_mmyy").focus();
				return false;
			}

			if ($.trim($("#card_cvv").val()) == '') {
				alert('카드뒷면 CVV를 입력해주세요.');
				$("#card_cvv").focus();
				return false;
			}
		})
	})

	/* function validatecardnumber(cardnumber) {

		//빈칸과 대시 제거
		cardnumber = cardnumber.replace(/[-]/g, '');
		var pattern = /^(5[1-5]\d{14})|(4\d{12}(\d{3})?)|(3[47]\d{13})|6011\d{12})|((30[0-5]|36\d|38\d)\d{11})$/

	} */

	function check() {

		var cardnumber = document.getElementById("card_id");
		var cardmmyy = document.getElementById("card_mmyy");
		var cardcvv = document.getElementById("card_cvv");

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

/* 	 카드 번호 입력시 4자리숫자 입력 후 자동 띄어쓰기 
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
		document.getElementById('card_id').oninput = function() {
			this.value = cardnumber_format(this.value)
		}
	} */
</script>
	

		<form method="post" action="BookAddAction.bk">
			<div id="detail">
				<div>
					<a href="Reserve_Background.jsp" id="goback">◀ Go back</a>
				</div>
				<div class="purchasetotal">
					<div class="pur title">
						<h2><%=con_name %></h2>
					</div>
					<!-- 결제detail -->
					<div class="pur describe">
						<hr>
						<div>
							<h5 id="gray"><%=con_day %><%=con_open%> ~ <%=con_close %></h5>
						</div>
						<hr>
						<div>
							<h5 id="gray">
								Ticket price<span class="price pricetag" id="gray">￦<%=con_price%>(x<%=amount%>)</span>
							</h5>
						</div>
						<hr>
						<div>
							<h5 id="gray">
								Ticket booking fee<span class="price booingtag" id="gray">￦4000(x<%=amount %>)</span>
							</h5>
						</div>
						<hr>
						<div>
							<h4>
								<strong>TOTAL:</strong>
							</h4>
						</div>
						<div>
							<h3>
								<strong>￦<%=(con_price+4000)*amount%></strong>
							</h3>
						</div>
					</div>
					<!-- //결제detail -->


					<!-- 결제detail_image 그림 end -->
					<div class="pur image">
						<img src="../image/<%=con_image %>" style="width: 150px; height: 195px;">
					</div>
					<!-- //결제detail_image 그림 end -->
				</div>

				<hr style="margin: 0 10%; clear: both;">
				<br> <br>


				<div class="pur_card">
					<div>
						<div>
							<div class="credit">
								<div>신용카드</div>
								<div id="input-box">
									<i id="cardicon"><img src="../reserve/image/card-img.png"></i>
									<input type="text" id="card_id" class="creditcard number" name="card_id" placeholder="Card Number" onkeyup="validatecardnumber" required> &nbsp; 
									<input type="text" id="card_mmyy" class="creditcard mmyy" name="card_mmyy" placeholder="MM/YY" required> 
									<input type="text" id="card_cvv" class="creditcard cvv" name="card_cvv" placeholder="CVV" required>
								</div>
								<div id="card_message"></div>
							</div>
							<div class="save_credit">
								<a onclick="window.open('CardAddAction.bk','card_save','width=430, height=500, location=no, status=no, scrollbars=yes');">Save Credit Card</a>
							</div>
						</div>
					</div>
				</div>

				<div class="policy">
					<div>
						<div>
							<div>
								<i class="policy lock"><img src="#"></i>
							</div>
							<div>
								<div>
									<img src="#">visa
								</div>
								<div>
									<img src="#">master
								</div>
								<div>
									<img src="#">american Express
								</div>
							</div>
						</div>

						<div>
							<a href="#">Terms and conditions of use</a>
						</div>
						<div>
							<a href="#">Privacy policy</a>
						</div>

					</div>
				</div>
				
				
				<!-- hidden input 값 넘기기위해 사용 -->
				<input type="hidden" name="con_id" id="con_id" value="<%=con_id%>">
				<input type="hidden" name="con_name" id="con_name" value="<%=con_name%>">
				<input type="hidden" name="con_day" id="con_day" value="<%=con_day%>">
				<input type="hidden" name="con_open" id="con_open" value="<%=con_open%>">
				<input type="hidden" name="con_close" id="con_close" value="<%=con_close%>">
				<input type="hidden" name="amount" id="amount" value="<%=amount%>">
				<input type="hidden" name="con_price" id="con_price" value="<%=con_price%>">
				<input type="hidden" name="member_id" id="member_id" value="<%=member_id%>">
				<input type="hidden" name="con_image" id="con_image" value="<%=con_image%>">
	
				<!-- PAY 버튼  -->
				<div id="layer_fixed" class="reserverbtn">
					<button type="submit" class="btn btn-info sub" id="payment">PAY</button>
				</div>
				<!-- //PAY end-->
			</div>
		</form>


<jsp:include page="../mainActivity/footer.jsp"/>