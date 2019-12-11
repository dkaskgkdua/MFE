<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../mainActivity/navbar.jsp" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String con_id = (String) session.getAttribute("con_id");
	String con_name = (String) session.getAttribute("con_name");
	String con_day = (String) session.getAttribute("con_day");
	String con_open = (String) session.getAttribute("con_open");
	String con_close = (String) session.getAttribute("con_close");
	int amount = (Integer.valueOf((String) session.getAttribute("amount")));
	int con_price = (Integer.valueOf((String) session.getAttribute("con_price")));
	String member_id = (String) session.getAttribute("id");
	String con_image = (String) session.getAttribute("con_image");

	System.out.println("Con_id = " + con_id);
	System.out.println("Memberid = " + member_id);
	System.out.println("amount = " + amount);
	System.out.println("con_image = " + con_image);
%>


<style type="text/css">
.gray {
	color: #a9afb4;
}

#order_finish {
	overflow: hidden;
	width: 550px;
	margin: 0 auto;
	padding-bottom: 40px;
	background: #fff;
}

#order_finish>.title {
	padding: 25px 0;
	text-align: center;
}

#order_finish>.title h3 {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	padding-left: 40px;
	background: url('../_img/order_finish/finish.png') no-repeat left center/30px
		auto;
	font-size: 25px;
	text-align: center;
}

#order_finish .prdInfo {
	padding: 30px 15px;
}

#order_finish .prdInfo:after {
	display: block;
	clear: both;
	content: '';
}

#order_finish .prdInfo .name {
	margin-bottom: 20px;
	font-size: 24px;
	font-weight: bold;
}

#order_finish .prdInfo .info {
	float: left;
	width: 65%;
	padding-right: 25px;
}

#order_finish .prdInfo .info>p {
	margin: 5px 0;
	padding-left: 25px;
	background-size: 17px auto;
	background-repeat: no-repeat;
	background-position: left center;
	font-size: 16px;
}

#order_finish .prdInfo .info .date {
	background-image: url('../_img/order/calendar.png');
}

#order_finish .prdInfo .info .prc {
	background-image: url('../_img/order/price.png');
}

#order_finish .prdInfo .info .prc .price {
	float: right;
	font-size: 16px;
}

#order_finish .prdInfo .info .total_prc {
	padding-left: 0;
	font-size: 20px;
}

#order_finish .prdInfo .info .total_prc strong {
	font-size: 24px;
}

#order_finish .prdInfo .img {
	float: right;
	width: 35%;
}

#order_finish .prdInfo .img img {
	max-width: 100%;
	height: auto;
}

#order_finish .btn_col {
	margin: 30px 0;
	font-size: 0;
	text-align: center;
}

#order_finish .btn_col .box_btn {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	margin: 0 5px;
}

#order_finish .btn_col .box_btn>* {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	width: 200px;
	height: 40px;
	border: 1px solid #31b0d5;
	background: #31b0d5;
	color: #fff;
	font-size: 14px;
	line-height: 40px;
}

#order_finish .btn_col .box_btn.white>* {
	border-color: #ddd;
	background: #fff;
	color: #333;
}

@media ( min-width : 320px) and (max-width: 767px) {
	.container {
		padding: 0;
	}
	#order_finish {
		width: 100%;
	}
	#order_finish .btn_col:after {
		display: block;
		clear: both;
		content: '';
	}
	#order_finish .btn_col .box_btn {
		display: block;
		float: left;
		width: 49%;
		margin: 0;
	}
	#order_finish .btn_col .box_btn:last-child {
		float: right;
	}
	#order_finish .btn_col .box_btn>* {
		width: 100%;
	}
}
</style>

<c:set var="c" value="${cdata}" />
<div id="order_finish">
	<div class="title">
		<h3>결제가 완료되었습니다.</h3>
	</div>
	<!-- 공연 정보 -->
	<div class="prdInfo">
		<p class="name"><%=con_name%></p>
		<!-- 공연명 -->
		<div class="info">
			<p class="date gray"><%=con_day%>,
				<%=con_open%>
				~
				<%=con_close%></p>
			<!-- 공연일시 -->
			<p class="prc gray">
				Ticket price<span class="price pricetag gray">￦<%=con_price%>(x<%=amount%>)
				</span>
			</p>
			<!-- 공연금액(수량) -->
			<p class="prc gray">
				Ticket booking fee<span class="price booingtag gray">￦4000 (x<%=amount%>)
				</span>
			</p>
			<!-- 공연금액 수수료(수량) -->
			<p class="total_prc">
				TOTAL : <strong>￦<%=(con_price + 4000) * amount%></strong>
			</p>
			<!-- 공연총금액 -->
		</div>
		<div class="img">
			<img src="images/<%=con_image%>">
		</div>
		<!-- 공연이미지 -->
	</div>
	<!-- //공연 정보 -->
	<!-- 결제 정보 -->
	<div class="payInfo">
		<p class="title">Card</p>
	</div>
	<!-- //결제 정보 -->
	<div class="btn_col">
		<div class="box_btn white">
			<a href="/main.net">메인으로</a>
		</div>
		<div class="box_btn">
			<a href="mypage.jsp">예매내역확인</a>
		</div>
	</div>
</div>

<jsp:include page="../mainActivity/footer.jsp" />