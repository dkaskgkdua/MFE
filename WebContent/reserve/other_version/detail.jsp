<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#detail {
	overflow: hidden;
	width: 550px;
	margin: 0 auto;
	padding-bottom: 60px;
	background: #fff;
}

#detail .imgArea {
	position: relative;
}

#detail .imgArea .img img {
	max-width: 100%;
	height: auto;
}

#detail .imgArea .bg_dimmed {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background: linear-gradient(rgba(0, 0, 0, 0) 60%, rgba(4, 23, 35, 0.5)),
		-webkit-linear-gradient(top, rgba(0, 0, 0, 0) 80%,
		rgba(4, 23, 35, 0.3));
}

#detail .imgArea .txt {
	position: absolute;
	left: 0;
	bottom: 0;
	padding: 0 15px 20px;
}

#detail .imgArea .txt>* {
	color: #fff;
}

#detail .imgArea .txt .type {
	display: inline-block;
	margin-bottom: 8px;
	padding: 7px 35px 7px 14px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	background: url('../_img/detail/fire.png') no-repeat right 14px center/18px
		auto #67b8c1;
	font-size: 14px;
}

#detail .imgArea .txt h2 {
	margin-bottom: 10px;
	font-size: 29px;
}

#detail .imgArea .txt .date {
	padding-left: 23px;
	background: url('../_img/detail/calendar_w.png') no-repeat left center/16px
		auto;
	font-size: 16px;
}

#detail .infoArea {
	padding: 0 15px;
}

#detail .infoArea .type {
	margin: 20px 0 8px;
	font-size: 14px;
	font-weight: bold;
}

#detail .infoArea dl:last-of-type {
	margin-bottom: 20px;
}

#detail .infoArea dl dt {
	margin: 30px 0 10px;
	font-size: 16px;
	font-weight: bold;
}

#detail .infoArea dl:first-of-type dt {
	margin-top: 0;
}

#detail .infoArea dl dd {
	padding-left: 20px;
	background-repeat: no-repeat;
	background-position: left center;
	background-size: 15px auto;
	font-size: 16px;
}

#detail .infoArea .ticket dd {
	background-image: url('../_img/detail/ticket.png');
}

#detail .infoArea .general .time {
	background-image: url('../_img/detail/time.png');
}

#detail .infoArea .general .spot {
	background-image: url('../_img/detail/spot.png');
}

#detail .infoArea .general .age {
	background-image: url('../_img/detail/age.png');
}

#detail .infoArea .highlight dd {
	position: relative;
	padding-left: 35px;
}

#detail .infoArea .highlight dd:after {
	display: block;
	position: absolute;
	left: 20px;
	top: 9px;
	width: 5px;
	height: 5px;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border-radius: 50%;
	background: #000;
	content: '';
}

#detail .infoArea .description dd {
	padding-left: 0;
}

#detail .infoArea0 {
	padding: 0;
}

#detail .infoArea0 .type {
	margin-bottom: 30px;
	padding: 0 15px;
}

#detail .infoArea0 .tabmenu {
	height: 31px;
	margin-bottom: 30px;
	border-bottom: 1px solid #67b8c1;
	font-size: 0;
	text-align: center;
}

#detail .infoArea0 .tabmenu li {
	display: inline-block;
	width: 25%;
}

#detail .infoArea0 .tabmenu li a {
	display: block;
	height: 30px;
	font-size: 14px;
	line-height: 30px;
}

#detail .infoArea0 .tabmenu li.active {
	border: 1px solid #67b8c1;
	border-bottom: 0;
	background: #fff;
}

#detail .infoArea0 .tabmenu li.active a {
	
}

#detail .infoArea0 .tabcnt {
	display: none;
	padding: 0 15px;
}

#detail .infoArea0 .tabcnt0 {
	display: block;
}

#detail .infoArea1 {
	display: none;
}

#detail .selectArea dl dt {
	padding: 10px 15px 10px 40px;
	background-repeat: no-repeat;
	background-position: left 15px center;
	background-size: 17px;
	background-color: #eceeef;
	color: #a9afb4;
	font-size: 17px;
}

#detail .selectArea dl dd {
	padding: 10px 15px;
	font-size: 16px;
}

#detail .selectArea dl dd * {
	font-size: 16px;
}

#detail .selectArea dl dd a {
	color: #67b8c1;
}

#detail .selectArea .question dt {
	background-image: url('../_img/detail/question.png');
}

#detail .selectArea .date_session dt {
	background-image: url('../_img/detail/calendar.png');
}

#detail .selectArea .date_session dd {
	padding: 0;
}

#detail .selectArea .date_session dd>div {
	padding: 10px 0;
}

#detail .selectArea .date_session dd div ul {
	font-size: 0;
	text-align: center;
}

#detail .selectArea .date_session dd div ul li {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	background: #fff;
	color: #a9afb4;
	font-size: 14px;
	line-height: 1.2;
	vertical-align: middle;
	cursor: pointer;
}

#detail .selectArea .date_session dd div ul li * {
	color: #a9afb4;
	font-size: 14px;
	line-height: 1.2;
}

#detail .selectArea .date_session dd div ul li.active {
	background: #67b8c1;
	color: #fff;
}

#detail .selectArea .date_session dd div ul li.active * {
	color: #fff;
}

#detail .selectArea .date_session dd div ul li.inactive {
	border: 1px solid #eaeaea;
	background: #eceeef;
}

#detail .selectArea .date_session dd .date {
	border: 1px solid #eaeaea;
	border-width: 1px 0;
}

#detail .selectArea .date_session dd .date ul li {
	width: 80px;
	height: 60px;
	padding: 10px 0;
}

#detail .selectArea .date_session dd .session {
	overflow-x: visible;
	overflow-y: hidden;
	width: 100%;
	background: #f6f6f6;
	-webkit-overflow-scrolling: touch;
}

#detail .selectArea .date_session dd .session ul {
	padding: 0 50px;
}

#detail .selectArea .date_session dd .session ul li {
	width: 180px;
	height: 90px;
	margin: 0 10px;
	padding: 36px 0;
}

#detail .selectArea .date_session dd .session ul li.row2 {
	padding: 28px 0;
}

#detail .selectArea .date_session dd .session ul li .prc {
	display: none;
}

#detail .selectArea .date_session dd .qty {
	font-size: 0;
	text-align: center;
}

#detail .selectArea .date_session dd .qty>* {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	vertical-align: middle;
}

#detail .selectArea .date_session dd .qty a {
	width: 50px;
	height: 50px;
	background: #67b8c1;
	color: #fff;
	font-size: 30px;
	line-height: 50px;
}

#detail .selectArea .date_session dd .qty .buy_ea {
	width: 28%;
	height: 50px;
	border: 0;
	font-size: 18px;
	font-weight: bold;
	text-align: center;
	line-height: 50px;
}

#detail .selectArea .howtoget dt {
	background-image: url('../_img/detail/location.png');
}

#detail .selectArea .howtoget dd {
	padding: 0;
}

#detail .selectArea .howtoget dd .location .name {
	margin: 20px 0 4px;
	padding: 0 15px;
	font-size: 16px;
}

#detail .selectArea .howtoget dd .location .addr {
	margin-bottom: 8px;
	padding: 0 15px;
	color: #a9afb4;
	font-size: 14px;
}

#detail .selectArea .howtoget dd .location .map {
	overflow: hidden;
	position: relative;
	height: 0;
	padding-bottom: 56.25%;
}

#detail .selectArea .howtoget dd .location .map iframe {
	position: absolute;
	left: 0;
	top: 0;
	bottom: 0;
	width: 100%;
	height: 100%;
}

#detail .selectArea .similar dt {
	background-image: url('../_img/detail/similar.png');
}

#detail .selectArea .similar dd {
	padding: 0;
}

#detail .selectArea .similar>dd>div {
	overflow-x: visible;
	overflow-y: hidden;
	width: 100%;
	-webkit-overflow-scrolling: touch;
}

#detail .selectArea .similar>dd>div ul {
	padding: 10px 5px 20px;
	font-size: 0;
	text-align: center;
}

#detail .selectArea .similar>dd>div ul li {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	width: 250px;
	margin: 0 5px;
}

#detail .selectArea .similar>dd>div ul li .box {
	position: relative;
}

#detail .selectArea .similar>dd>div ul li .box .img img {
	max-width: 100%;
	height: auto;
}

#detail .selectArea .similar>dd>div ul li .box .prc {
	position: absolute;
	right: 0;
	top: 0;
	color: #fff;
	font-size: 14px;
	padding: 5px;
	background-color: rgba(0, 0, 0, 0.5);
}

#detail .selectArea .similar>dd>div ul li .box .txt {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	padding: 10px;
	background-color: rgba(0, 0, 0, 0.7);
	color: #fff;
	font-size: 16px;
	text-align: left;
}

#detail .fixed_buy {
	display: none;
	position: fixed;
	left: 50%;
	bottom: 0;
	width: 550px;
	height: 60px;
	margin-left: -275px;
	text-align: center;
}

#detail .fixed_buy .soldout {
	display: none;
	padding: 6px 0;
	background: #d9dcde;
	color: #000;
	font-size: 20px;
	line-height: 1.2;
}

#detail .fixed_buy .buy {
	background: #67b8c1;
	color: #fff;
	font-size: 20px;
	line-height: 60px;
	cursor: pointer;
}

#detail .fixed_buy .buy * {
	color: #fff;
	font-size: 20px;
}

@media ( min-width : 320px) and (max-width: 767px) {
	.container {
		padding: 0;
	}
	#detail {
		width: 100%;
	}
	#detail .fixed_buy {
		left: 0;
		width: 100%;
		margin-left: 0;
	}
}
</style>
<body>
	<div id="detail">
		<form name="prdFrm" method="post" action="/concert.php"
			accept-charset="utf-8">
			<div class="imgArea">
				<div class="img">
					<img src="_img/_temp/midimg0.jpg" alt="">
				</div>
				<div class="bg_dimmed"></div>
				<div class="txt">
					<p class="type">TRENDING</p>
					<h2>Hot Chip's New Year's Eve House Party</h2>
					<p class="date">Tue 31 Dec</p>
				</div>
			</div>
			<div class="infoArea infoArea0">
				<p class="type">#single #group #afterwork</p>
				<ul class="tabmenu">
					<li class="active"><a href="#"
						onclick="tabMenu(0); return false;">Ticket</a></li>
					<li><a href="#" onclick="tabMenu(1); return false;">Info</a></li>
					<li><a href="#" onclick="tabMenu(2); return false;">Highlight</a></li>
					<li><a href="#" onclick="tabMenu(3); return false;">Description</a></li>
				</ul>
				<div class="tabcnt tabcnt0">
					<dl class="ticket">
						<dt>Tickets</dt>
						<dd>General admission ticket (early bird or regular) for 1
							person</dd>
						<dd>VIP ticket for 1 person with a private bar</dd>
					</dl>
				</div>
				<div class="tabcnt tabcnt1">
					<dl class="general">
						<dt>General Info</dt>
						<dd class="time">Date and time: New Year's Eve - 31st
							December 2019, 8pm-5am</dd>
						<dd class="spot">Venue: The Steel Yard Nightclub</dd>
						<dd class="age">Age requirement: 18+ with valid ID</dd>
					</dl>
				</div>
				<div class="tabcnt tabcnt2">
					<dl class="highlight">
						<dt>Highlights</dt>
						<dd>The Steel Yard: cavernous bar and nightclub under railway
							arches in Central London</dd>
						<dd>Hot Chip 4 Hour DJ set</dd>
						<dd>2 rooms of music</dd>
						<dd>Private VIP bar available</dd>
						<dd>Giant LED screen countdown, confetti cannons, light show</dd>
					</dl>
				</div>
				<div class="tabcnt tabcnt3">
					<dl class="description">
						<dt>Description</dt>
						<dd>Bridging euphoria and melancholy with colourful melodies,
							idiosyncratic vocalisations and pounding electronic pop rhythms,
							Hot Chip has been one of the UK's most loved acts for the past
							two decades. Celebrate the end of the teenies in style with the
							Hot Chips New Year's Eve House Party at central London's best
							clubbing destination, The Steel Yard! With countdowns, confetti
							cannons, contagious rhythms and a four hour DJ set from Hot Chip,
							you won't want to miss this!</dd>
					</dl>
				</div>
			</div>
			<div class="infoArea infoArea1">
				<p class="type">#single #group #afterwork</p>
				<dl class="ticket">
					<dt>Tickets</dt>
					<dd>General admission ticket (early bird or regular) for 1
						person</dd>
					<dd>VIP ticket for 1 person with a private bar</dd>
				</dl>
				<dl class="general">
					<dt>General Info</dt>
					<dd class="time">Date and time: New Year's Eve - 31st December
						2019, 8pm-5am</dd>
					<dd class="spot">Venue: The Steel Yard Nightclub</dd>
					<dd class="age">Age requirement: 18+ with valid ID</dd>
				</dl>
				<dl class="highlight">
					<dt>Highlights</dt>
					<dd>The Steel Yard: cavernous bar and nightclub under railway
						arches in Central London</dd>
					<dd>Hot Chip 4 Hour DJ set</dd>
					<dd>2 rooms of music</dd>
					<dd>Private VIP bar available</dd>
					<dd>Giant LED screen countdown, confetti cannons, light show</dd>
				</dl>
				<dl class="description">
					<dt>Description</dt>
					<dd>Bridging euphoria and melancholy with colourful melodies,
						idiosyncratic vocalisations and pounding electronic pop rhythms,
						Hot Chip has been one of the UK's most loved acts for the past two
						decades. Celebrate the end of the teenies in style with the Hot
						Chips New Year's Eve House Party at central London's best clubbing
						destination, The Steel Yard! With countdowns, confetti cannons,
						contagious rhythms and a four hour DJ set from Hot Chip, you won't
						want to miss this!</dd>
				</dl>
			</div>
			<div class="selectArea">
				<dl class="question">
					<dt>ANY QUESTIONS ?</dt>
					<dd>
						Send us an email at <a href="mailto:hello@feverup.com">hello@feverup.com</a>
						or call us at <a href="tel:+442036086975">+44 2036 086 975</a>
					</dd>
				</dl>
				<dl class="date_session">
					<dt>SELECT DATE AND SESSION</dt>
					<dd>
						<div class="date">
							<ul>
								<li class="active">
									<div>
										<p>TUE</p>
										<p>31 DEC</p>
									</div>
								</li>
							</ul>
						</div>
						<div class="session">
							<ul>
								<li class="inactive row2">General Admission (Early Bird)
									from 8:00 pm<span class="prc">129000</span>
								</li>
								<li class="active row2">General Admission from 8:00 pm<span
									class="prc">169000</span></li>
								<li>VIP from 8:00 pm<span class="prc">259000</span></li>
							</ul>
						</div>
						<div class="qty">
							<a href="#" onclick="eaChg(2); return false;" class="minus">-</a>
							<input type="text" name="buy_ea" value="1" class="buy_ea">
							<a href="#" onclick="eaChg(1); return false;" class="plus">+</a>
						</div>
					</dd>
				</dl>
				<dl class="howtoget">
					<dt>HOW TO GET THERE?</dt>
					<dd>
						<div class="location">
							<p class="name">The Steel Yard Nightclub</p>
							<p class="addr">Allhallows Ln, EC4R 3UE</p>
							<div class="map">
								<iframe
									src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2483.1905046569955!2d-0.09274398391601278!3d51.50972087963555!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x487603542e5823e1%3A0x48ae0dd28f6bf6ae!2zQWxsaGFsbG93cyBMbiwgTG9uZG9uIEVDNFIgM1VFIOyYgeq1rQ!5e0!3m2!1sko!2skr!4v1574707882851!5m2!1sko!2skr"
									frameborder="0" style="border: 0;" allowfullscreen=""></iframe>
							</div>
						</div>
					</dd>
				</dl>
				<dl class="similar">
					<dt>SIMILAR EXPERIENCES</dt>
					<dd>
						<div>
							<ul>
								<li>
									<div class="box">
										<div class="img">
											<img src="_img/_temp/midimg1.jpg"
												alt="Live Comedy at 99 Club Leicester Square">
										</div>
										<p class="prc">From \12,000</p>
										<div class="txt">Live Comedy at 99 Club Leicester Square</div>
									</div>
								</li>
								<li>
									<div class="box">
										<div class="img">
											<img src="_img/_temp/midimg2.jpg"
												alt="NYE Night Market Party: Back to the 90s">
										</div>
										<p class="prc">From \39,000</p>
										<div class="txt">NYE Night Market Party: Back to the 90s</div>
									</div>
								</li>
								<li>
									<div class="box">
										<div class="img">
											<img src="_img/_temp/midimg3.jpg"
												alt="Japanese Saké Tasting!">
										</div>
										<p class="prc">From \45,000</p>
										<div class="txt">Japanese Saké Tasting!</div>
									</div>
								</li>
								<li>
									<div class="box">
										<div class="img">
											<img src="_img/_temp/midimg4.jpg"
												alt="Downlow: Free A$AP Rocky!">
										</div>
										<p class="prc">From \99,000</p>
										<div class="txt">Downlow: Free A$AP Rocky!</div>
									</div>
								</li>
								<li>
									<div class="box">
										<div class="img">
											<img src="_img/_temp/midimg5.jpg"
												alt="Lickable: The All Senses Christmas Cabaret">
										</div>
										<p class="prc">From \99,000</p>
										<div class="txt">Lickable: The All Senses Christmas
											Cabaret</div>
									</div>
								</li>
							</ul>
						</div>
					</dd>
				</dl>
			</div>
			<!-- 하단 구매하기 버튼 -->
			<div class="fixed_buy">
				<div class="soldout">
					SESSION SOLD OUT<br>SELECT ANOTHER SESSION
				</div>
				<div class="buy">
					<a href="">\<span class="prc"></span> - Get it
					</a>
				</div>
			</div>
			<!-- //하단 구매하기 버튼 -->
		</form>
	</div>
	<script>
		// 탭메뉴
		function tabMenu(no) {
			$('#detail .infoArea0 .tabmenu li').each(function(idx) {
				var cnt = $('#detail .infoArea0 .tabcnt' + idx);
				if (no == idx) {
					$(this).addClass('active');
					cnt.show();
				} else {
					$(this).removeClass('active');
					cnt.hide();
				}
			});
		}

		// 수량조절
		function eaChg(pm) {
			var ea = $('.qty .buy_ea').val();
			if (pm == 1) {
				ea = (Number(ea) + 1);
				$('.qty .buy_ea').val(ea);
			} else {
				if (ea <= 1) {
					return;
				}
				ea = (Number(ea) - 1);
				$('.qty .buy_ea').val(ea);
			}
		}

		$(window).scroll(function() {
			var y = $(window).scrollTop();
			var imgArea = $('#detail .imgArea').offset().top;
			var space = 100;
			if (y > imgArea + space) {
				$('#detail .fixed_buy').fadeIn();
			} else {
				$('#detail .fixed_buy').fadeOut();
			}
		});

		$(document)
				.ready(
						function() {
							// 좌석 선택 영역 스크롤 생성
							var session_item = $('#detail .selectArea .session ul li');
							if (session_item.length > 2) {
								var session_w = session_item.outerWidth();
								var session_m = session_item.outerWidth(true)
										- session_w;
								var totalW = (session_w + session_m)
										* session_item.length;
								$('#detail .selectArea .session ul').width(
										totalW);
							}

							// 금액 계산 - 초기값
							var session_active = $('#detail .selectArea .session ul li.active .prc');
							var active_prc = session_active.text();
							var priceArea = $('#detail .fixed_buy .prc');
							priceArea.html(addComma(active_prc));

							// 금액 계산 - 좌석 선택
							$('#detail .selectArea .session ul li')
									.click(
											function() {
												if ($(this)
														.hasClass('inactive') == false) { // 품절상품 아닐 때

													$(
															'#detail .fixed_buy .soldout')
															.hide();
													$('#detail .fixed_buy .buy')
															.show();

													if ($(this).hasClass(
															'active') == false) { // 다른상품 클릭할 때

														$(
																'#detail .selectArea .session ul li')
																.removeClass(
																		'active');
														$(this).addClass(
																'active');
														$(
																'#detail .qty .buy_ea')
																.val('1');

														var session_active = $('#detail .selectArea .session ul li.active .prc');
														var active_prc = session_active
																.text();
														var priceArea = $('#detail .fixed_buy .prc');
														priceArea
																.html(addComma(active_prc
																		* $(
																				'#detail .qty .buy_ea')
																				.val()));
													}
												} else { // 품절상품일 때
													$(
															'#detail .selectArea .session ul li')
															.removeClass(
																	'active');
													$('#detail .qty .buy_ea')
															.val('0');
													$(
															'#detail .fixed_buy .soldout')
															.show();
													$('#detail .fixed_buy .buy')
															.hide();
												}
											});

							// 금액 계산 - 수량 선택
							$('#detail .selectArea .qty > a')
									.click(
											function() {
												var session_active = $('#detail .selectArea .session ul li.active .prc');
												var active_prc = session_active
														.text();
												var priceArea = $('#detail .fixed_buy .prc');
												priceArea
														.html(addComma(active_prc
																* $(
																		'#detail .qty .buy_ea')
																		.val()));
											});

							// 비슷한 공연 추천영역 스크롤 생성
							var similar_item = $('#detail .selectArea .similar ul li');
							if (similar_item.length > 2) {
								var similar_w = similar_item.outerWidth();
								var similar_m = similar_item.outerWidth(true)
										- similar_w;
								var similar_totalW = (similar_w + similar_m)
										* similar_item.length;
								$('#detail .selectArea .similar ul').width(
										similar_totalW);
							}
						});
	</script>

</body>
</html>