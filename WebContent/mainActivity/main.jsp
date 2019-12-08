<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Music For Everyone</title>
<jsp:include page="navbar.jsp" />
<style>
.main_concert_image:hover {
	-webkit-transform: scale(1.1);
	-moz-transform: scale(1.1);
	-ms-transform: scale(1.1);
	-o-transform: scale(1.1);
	transform: scale(1.1);
}

.main_concert_image {
	overflow: hidden;
}
</style>
</head>
<body>
	<!-- 헤더 -->

	<section id="banner">
		<div class="inner">
			<header>
				<h1>Music For Everyone</h1>
				<p>다양한 공연을 즐기세요</p>
			</header>
			<a href="#main" class="button big alt scrolly">Start</a>
		</div>
	</section>
	<div id="main">
		<form id="detail_concert_form" action="book.bk" method="post"
			style="display: none">
			<input id="detail_concert" type="text" name="detail_concert">
		</form>
		<section class="listWrapper">
			<c:choose>
				<c:when test="${!empty id}">
					<!--  로그인이 된 경우 -->
					<h4>맞춤형 콘서트</h4>
					<div class="slider">
						<c:forEach var="custom_concert" items="${custom_concert_list}">
							<div class="item">
								<img class="main_concert_image"
									src="concertupload/${custom_concert.concert_image}"
									alt="${custom_concert.concert_id}">
								<button type="button" class="btn btn-secondary heart heart_button">
									<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
								</button>
							</div>
						</c:forEach>
					</div>
				</c:when>
				<c:otherwise>
					<!-- 로그인이 안된경우 -->
					<h4>최신 콘서트</h4>
					<div class="slider">
						<c:forEach var="last_concert" items="${last_concert_list}">
							<div class="item">
								<img class="main_concert_image"
									src="concertupload/${last_concert.concert_image}"
									alt="${last_concert.concert_id}">
								<button type="button" class="btn btn-secondary heart heart_button">
									<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
								</button>
							</div>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>


		</section>

		<section class="listWrapper">
			<h4>발라드 콘서트</h4>
			<div class="slider">
				<c:forEach var="balad_concert" items="${balad_concert_list}">
					<div class="item">
						<img class="main_concert_image"
							src="concertupload/${balad_concert.concert_image}"
							alt="${balad_concert.concert_id}">
						<button type="button" class="btn btn-secondary heart heart_button">
							<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
						</button>
					</div>
				</c:forEach>
			</div>
		</section>

		<section class="listWrapper">
			<h4>댄스 콘서트</h4>
			<div class="slider">
				<c:forEach var="dance_concert" items="${dance_concert_list}">
					<div class="item">
						<img class="main_concert_image"
							src="concertupload/${dance_concert.concert_image}"
							alt="${dance_concert.concert_id}">
						<button type="button" class="btn btn-secondary heart heart_button">
							<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
						</button>
					</div>
				</c:forEach>
			</div>
		</section>

		<section class="listWrapper">
			<h4>랩/힙합 콘서트</h4>
			<div class="slider">
				<c:forEach var="rap_concert" items="${rap_concert_list}">
					<div class="item">
						<img class="main_concert_image"
							src="concertupload/${rap_concert.concert_image}"
							alt="${rap_concert.concert_id}">
						<button type="button" class="btn btn-secondary heart heart_button">
							<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
						</button>
					</div>
				</c:forEach>
			</div>
		</section>
		
		<section class="listWrapper">
			<h4>R&amp;B/Soul 콘서트</h4>
			<div class="slider">
				<c:forEach var="rb_concert" items="${rb_concert_list}">
					<div class="item">
						<img class="main_concert_image"
							src="concertupload/${rb_concert.concert_image}"
							alt="${rb_concert.concert_id}">
						<button type="button" class="btn btn-secondary heart heart_button">
							<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
						</button>
					</div>
				</c:forEach>
			</div>
		</section>
		
		<section class="listWrapper">
			<h4>인디 콘서트</h4>
			<div class="slider">
				<c:forEach var="indi_concert" items="${indi_concert_list}">
					<div class="item">
						<img class="main_concert_image"
							src="concertupload/${indi_concert.concert_image}"
							alt="${indi_concert.concert_id}">
						<button type="button" class="btn btn-secondary heart heart_button">
							<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
						</button>
					</div>
				</c:forEach>
			</div>
		</section>
		
		<section class="listWrapper">
			<h4>락/메탈 콘서트</h4>
			<div class="slider">
				<c:forEach var="rock_concert" items="${rock_concert_list}">
					<div class="item">
						<img class="main_concert_image"
							src="concertupload/${rock_concert.concert_image}"
							alt="${rock_concert.concert_id}">
						<button type="button" class="btn btn-secondary heart heart_button">
							<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
						</button>
					</div>
				</c:forEach>
			</div>
		</section>
		
		<section class="listWrapper">
			<h4>트로트 콘서트</h4>
			<div class="slider">
				<c:forEach var="tro_concert" items="${tro_concert_list}">
					<div class="item">
						<img class="main_concert_image"
							src="concertupload/${tro_concert.concert_image}"
							alt="${tro_concert.concert_id}">
						<button type="button" class="btn btn-secondary heart heart_button">
							<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
						</button>
					</div>
				</c:forEach>
			</div>
		</section>
		
		<section class="listWrapper">
			<h4>EDM 콘서트</h4>
			<div class="slider">
				<c:forEach var="edm_concert" items="${edm_concert_list}">
					<div class="item">
						<img class="main_concert_image"
							src="concertupload/${edm_concert.concert_image}"
							alt="${edm_concert.concert_id}">
						<button type="button" class="btn btn-secondary heart heart_button">
							<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
						</button>
					</div>
				</c:forEach>
			</div>
		</section>

	</div>


	<!-- Footer -->
	<footer id="footer">
		<div class="inner">
			<div class="flex flex-3">
				<div class="col">
					<h3>Contact us</h3>
					<ul class="alt">
						<li><a href="#">dkaskgkdua@mfe.com</a></li>
						<li><a href="#">press@mfe.com</a></li>
						<li><a href="#">Enjoy Your Life!</a></li>
					</ul>
				</div>
				<div class="col">
					<h3>MFE</h3>
					<ul class="alt">
						<li><a href="#">We are hiring!</a></li>
						<li><a href="#">MFE Zone</a></li>
					</ul>
				</div>
				<div class="col">
					<h3>Legal</h3>
					<ul class="alt">
						<li><a href="#">FAQ</a></li>
						<li><a href="#">Terms of Use</a></li>
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="#">Cookies Policy</a></li>
						<li><a href="#">Giveaways T&C's</a></li>
						<li><a href="#">Vouchers T&C's</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="copyright">
			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon fa-snapchat"><span
						class="label">Snapchat</span></a></li>
			</ul>
			&copy; Untitled. Design: <a href="https://templated.co">MFE-TEAM</a>.
			Images: <a href="https://unsplash.com">Coverr</a>. Video: <a
				href="https://coverr.co">Coverr</a>.
		</div>
	</footer>



	<script>
		//슬릭 이벤트
		$.noConflict();
		var array = new Array();
		<c:forEach var="likey" items="${likey_list}">
			array.push("${likey}");
		</c:forEach>

		$(".main_concert_image").each(
				function(index, item) {
					$.each(array, function(index2, item2) {
						if ($(item).attr("alt") == item2) {
							$(item).next().children('span').removeClass(
									'glyphicon-heart-empty');
							$(item).next().children('span').addClass(
									'glyphicon-heart');
						}
					})
				})
		$('.slider').slick({
			centerMode : true,
			slidesToShow : 11,
			infinite : true,
			slidesToscroll : 10,
			responsive : [ {
				breakpoint : 1800,
				settings : {
					centerMode : true,
					infinite : true,
					slidesToShow : 10,
					slidesToscroll : 9
				}
			}, {
				breakpoint : 1600,
				settings : {
					centerMode : true,
					infinite : true,
					slidesToShow : 8,
					slidesToscroll : 7
				}
			}, {
				breakpoint : 1400,
				settings : {
					centerMode : true,
					infinite : true,
					slidesToShow : 7,
					slidesToscroll : 6
				}
			}, {
				breakpoint : 1200,
				settings : {
					centerMode : true,
					infinite : true,
					slidesToShow : 6,
					slidesToscroll : 5
				}
			}, {
				breakpoint : 1000,
				settings : {
					centerMode : true,
					infinite : true,
					slidesToShow : 5,
					slidesToscroll : 4
				}
			}, {
				breakpoint : 850,
				settings : {
					centerMode : true,
					infinite : true,
					slidesToShow : 4,
					slidesToscroll : 3
				}
			}, {
				breakpoint : 700,
				settings : {
					centerMode : true,
					infinite : true,
					slidesToShow : 3,
					slidesToscroll : 3
				}
			}, {
				breakpoint : 550,
				settings : {
					arrows : false,
					centerMode : true,
					infinite : true,
					slidesToShow : 2,
					slidesToscroll : 3
				}
			}, {
				breakpoint : 400,
				settings : {
					arrows : false,
					centerMode : true,
					infinite : true,
					slidesToShow : 2,
					centerPadding : '10px',
					slidesToscroll : 3
				}
			} ]
		}); //슬릭 이벤트 종료

		/* 찜하기 클릭*/
		$(".heart").click(
				function() {
					if ("${id}" != "") { // id가 널이 아님
						if ($(this).children('span').hasClass(
								"glyphicon-heart-empty") === true) { // 하트모양이 비어 있을 때(찜하기)
							$(this).children('span').removeClass(
									'glyphicon-heart-empty');
							$(this).children('span')
									.addClass('glyphicon-heart');
							insertHeart($(this).prev().attr("alt"));
						} else { // 하트모양이 차 있을 때(찜 취소)
							$(this).children('span').removeClass(
									'glyphicon-heart');
							$(this).children('span').addClass(
									'glyphicon-heart-empty');
							deleteHeart($(this).prev().attr("alt"));
						}
					} else { //id가 널임(로그인 창으로)
						$('#nav_login_button').trigger('click');
					}
				});
		// 이미지 클릭시
		$(".main_concert_image").click(function() {
			// alt값을 가져와서 숨긴 input에다가 값을 넣는다.
			$("#detail_concert").val($(this).attr("alt"));
			// input이 담긴 폼을 submit 한다. (콘서트 id 값을 들고 감)
			$("#detail_concert_form").submit();
		})

		function insertHeart(concert_id) {
			$.ajax({
				type : "post",
				url : 'likeyAdd.lo',
				data : {
					"concert_id" : concert_id
				},
				success : function() {
					alert("삽입 성공");
				},
				error : function() {
					alert("에러");
				}
			});
		};
		function deleteHeart(concert_id) {
			$.ajax({
				type : "post",
				url : 'likeyDelete.lo',
				data : {
					"concert_id" : concert_id
				},
				success : function() {
					alert("삭제 성공");
				},
				error : function() {
					alert("에러");
				}
			});
		};
	</script>
</body>
</html>