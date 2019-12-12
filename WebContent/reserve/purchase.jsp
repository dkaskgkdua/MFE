<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../mainActivity/navbar.jsp"/>
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
		
		/* 카드 유효성 검사 */
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
		
		 $("#book_payment").val($("#paytotal").text());
		 
		 $(".save_credit").click(function() {
				var CARD_ID = $("#card_id").val();
				var CARD_MMYY = $("#card_mmyy").val(); 
				var CARD_CVV = $("#card_cvv").val();
				$("#card_number_form").val(CARD_ID);
				senddata= "card_id="+CARD_ID+"&card_mmyy="+CARD_MMYY+"&card_cvv="+CARD_CVV +"&id=${id}";
				alert(senddata)
				$.ajax({
					url:"CardAddAction.bk",
					data:senddata,
					type:"post",
					success:function(rdata){
						if(rdata==1){
							alert("카드 등록 완료");
						}else if(rdata==2){
							alert("카드 번호 중복");
						}else {
							alert("카드 등록 실패");
						}
					}
				})
				
				
			});
	})
		
</script>
	
	<c:set var="c" value="${cdata}" />
		<form method="post" action="BookAddAction.bk">
			<div id="detail">
				<div>
					<a href="Reserve_Background.jsp" id="goback">◀ Go back</a>
				</div>
				<div class="purchasetotal">
					<div class="pur title">
						<h2>${c.concert_name}</h2>
					</div>
					<!-- 결제detail -->
					<div class="pur describe">
						<hr>
						<div>
							<h5 id="gray">${c.concert_day} ${c.concert_open} ~ ${c.concert_close}</h5>
						</div>
						<hr>
						<div>
							<h5 id="gray">
								Ticket price<span class="price pricetag" id="gray">￦${c.concert_price}(x${amount})</span>
							</h5>
						</div>
						<hr>
						<div>
							<h5 id="gray">
								Ticket booking fee<span class="price booingtag" id="gray">￦4000(x${amount})</span>
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
								<strong style="color:black" id="paytotal">${total + 4000*amount}</strong>
							</h3>
						</div>
					</div>
					<!-- //결제detail -->


					<!-- 결제detail_image 그림 end -->
					<div class="pur image">
						<img src="concertupload/${c.concert_image}" style="width: 150px; height: 195px;">
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
									<i id="cardicon"><img src="reserve/image/card-img.png"></i>
									<input type="text" id="card_id" class="creditcard number" name="card_id" placeholder="Card Number" required> &nbsp; 
									<input type="text" id="card_mmyy" class="creditcard mmyy" name="card_mmyy" placeholder="MM/YY" required> 
									<input type="text" id="card_cvv" class="creditcard cvv" name="card_cvv" placeholder="CVV" required>
								</div>
								<div id="card_message"></div>
							</div>
							<div class="save_credit">
								<a>Save Credit Card</a>
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
				<input type="hidden" name="con_id" id="con_id" value="${c.concert_id}">
				<input type="hidden" name="con_name" id="con_name" value="${c.concert_name}">
				<input type="hidden" name="con_day" id="con_day" value="${c.concert_day}">
				<input type="hidden" name="con_open" id="con_open" value="${c.concert_open}">
				<input type="hidden" name="con_close" id="con_close" value="${c.concert_close}">
				<input type="hidden" name="amount" id="amount" value="${amount}">
				<input type="hidden" name="con_price" id="con_price" value="${c.concert_price}">
				<input type="hidden" name="member_id" id="member_id" value="${id}">
				<input type="hidden" name="con_image" id="con_image" value="${c.concert_image}">
				<input type="hidden" name="card_number" id="card_number_form">
				<input type="hidden" name="book_payment" id="book_payment">
	
				<!-- PAY 버튼  -->
				<div id="layer_fixed" class="reserverbtn">
					<button type="submit" class="btn btn-info sub" id="payment">PAY</button>
				</div>
				<!-- //PAY end-->
			</div>
		</form>

	<!-- footer -->
	<footer>footer</footer>
	<!-- //footer -->
</body>
</html>