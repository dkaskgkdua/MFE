<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title></title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/reserve.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>
<!-- 파일로 옮김 -->
<script>
	function cont_tab(no) {
		$('#detail .content .cont_tab li a').each(function(idx) {
			var cnt = $('#detail .content .cont' + idx);
			if (no == idx) {
				$(this).addClass('active');
				cnt.show();
			} else {
				$(this).removeClass('active');
				cnt.hide();
			}
		});
	}
	
</script>
<body>

	<!-- 상단 : 네비게이션 바 부분 -->
	<header>
		<div class="menubar">
			<a class="logo">NAV BAR</a> <a class="icon">ICON</a>
		</div>
	</header>
	<!-- //상단 : 네비게이션 바 부분 -->
	<!-- 중단 : 공연 상세내용/공연장위치/좌석 예약안내/기타 등등 -->
	<div class="container">
		<div id="detail">

			<div class="Thumbnail">
				<!-- 공연 이미지:썸네일 -->
				<div class="imageWrap">
					<img src="../reserve/image/1.jpg">
				</div>
				<!-- //공연 이미지:썸네일 -->
				<!-- 공연 타이틀/인기도/날짜:썸네일-->
				<div class="concertTitle">
					<dl>
						<dt>★★Popular★★</dt>
						<dd>유키구라모토와 친구들 크리스마스콘서트</dd>
						<dd>Christmas funkin concert</dd>
					</dl>
				</div>
				<!-- //공연 타이틀/인기도/날짜:썸네일-->
			</div>

			<div class="content">

				<ul class="cont_tab">
					<li><a href="#" onclick="cont_tab(0); return false;"
						class="btn btn-info">상세내용</a></li>
					<li><a href="#" onclick="cont_tab(1); return false;"
						class="btn btn-warning">유의사항</a></li>
					<li><a href="#" onclick="cont_tab(2); return false;"
						class="btn btn-success">공연장 안내</a></li>
					<li><a href="#" onclick="cont_tab(3); return false;"
						class="active btn btn-danger">날짜 & 좌석선택</a></li>
				</ul>

				<div class="cont cont0">
					<h3>상세내용</h3>
					<div>
						Date and time: New Year's Eve - 31st December, 8pm-2am<br>
						Venue: Market Hall Victoria<br> Age requirement: 18+ with
						valid ID<br> Music: 90s covers &amp; 90s Ibiza-inspired Dance
						& Pop classics
					</div>
				</div>
				<div class="cont cont1">
					<h3>유의사항</h3>
					<div>
						Join us for a tantalising New Year's Eve party full of food,
						frolics and fun!<br> Fever is taking over Market Hall
						Victoria, which you may know from its days as Superclub Pacha,<br>
						to bring you London's biggest Throwback 90s NYE Extravaganza!<br>
						Alongside the amazing street food traders, the venue boasts a
						rooftop bar<br> where you can take in views of the city and
						play party games.<br> We will keep you entertained with
						throwback Bingo, a live band playing 90s covers<br> (yes,
						they do take requests), and of course DJs spinning 90s Ibiza,
						dance and pop classics till 2am.
					</div>
				</div>
				<div class="cont cont2">
					<h3>공연장 안내</h3>
					<div>
						Join us for a tantalising New Year's Eve party full of food,
						frolics and fun!<br> Fever is taking over Market Hall
						Victoria, which you may know from its days as Superclub Pacha,<br>
						to bring you London's biggest Throwback 90s NYE Extravaganza!<br>
						Alongside the amazing street food traders, the venue boasts a
						rooftop bar<br> where you can take in views of the city and
						play party games.<br> We will keep you entertained with
						throwback Bingo, a live band playing 90s covers<br> (yes,
						they do take requests), and of course DJs spinning 90s Ibiza,
						dance and pop classics till 2am.
					</div>
				</div>

				<div class="cont cont3">
					<h3>날짜 & 좌석 선택</h3>
					
					<div class="contsel_date">
						<div>
							<div></div>
						</div>
					</div>
					
					<div class="contsel_tab">
						<div class="tab0">General Admission (Early Bird) from 8:00
							pm for £25.00</div>
						<div class="tab1">General Admission from 8:00 pm for £29.00</div>
						<div class="tab2">General Admission from 8:30 pm for £35.00</div>
						<div class="tab3">General Admission from 9:00 pm for £60.00</div>
						<div class="tab4">General Admission from 9:30 pm for £90.00</div>
					</div>
					
					<div class="contsel_quen">
						<div class="quentity decrase">-</div>
						<div class="quentity num">수량 표시</div>
						<div class="quentity increase">+</div>
					</div>
				</div>
			</div>
			<!-- 예약하기 버튼  -->
			<div id="layer_fixed" class="reserverbtn">
				<button type="button" onclick="reserve()" class="btn btn-info">예
					약 하 기</button>
			</div>
			<!-- //예약하기 버튼  -->
		</div>
	</div>

	<!-- //중단 : 공연 상세내용/공연장위치/좌석 예약안내/기타 등등 -->
	<!-- footer -->
	<footer>footer</footer>
	<!-- //footer -->
</body>
</html>