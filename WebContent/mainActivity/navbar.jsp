<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- Scripts -->


<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://kenwheeler.github.io/slick/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
<script type="text/javascript"
	src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
<link rel="stylesheet" href="assets/css/main.css?ver=6" />
<script src="js/searchlist.js"></script>
<script src="js/filterlist.js"></script>
<style>

	/* 필터 css */
	#datepicker {
	color: black;
}

input[type="button"].local, input[type="button"].genre, #all_local,
	#all_genre {
	background-color: #1d171752 !important;
	color: black !important;
	outline: none !important;
	margin : 1px;
}

.table_f td {
	padding: 0px !important;
}

input[type="button"].local, input[type="button"]#all_local {
	width: 85px
}

#filter_btn {
	background-color: #31315f;
	width: 50%;
	height : 40px;
	float : left;
}
#filter_btn:hover{background-color: #2f2f5a}

#filter_cancel {
	width: 50%;
	height : 40px;
	font-weight : bold;
}

#genre {
	width: 60%
}

input[type="button"].genre, input[type="button"]#all_genre {
	width: 110px
}
.user{
	color : white;
}
.logog{
	color : black;
}


</style>
<header id="header">
	<h1>
		<a href="main.net">MFE</a>
	</h1>
	<div>
		<button type="button" class="btn btn-secondary" data-toggle="modal"
			data-target="#filter_Modal">
			<span class="glyphicon glyphicon-tasks" aria-hidden="true"></span>
		</button>
		<!--  검색 텍스트 -->
		<form class="search_Text" id="searchForm" method="post"
			action="searchword.co">
			<input class="search_Text" type="text" name="search_Text"
				id="search_Text" placeholder="search...">
		</form>
		<button id="search_Button" type="button" class="btn btn-secondary">
			<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
		</button>
		<c:if test="${!empty id}">
			<c:choose>
				<c:when test="${id=='admin@mfe.com'}">
					<button id="adminMode_Button" type="button"
						class="btn btn-secondary">
						<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
					</button>
					<button type="button" class="btn btn-secondary" data-toggle="modal"
						data-target="#account_Modal">
						<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
					</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn btn-secondary" data-toggle="modal"
						data-target="#account_Modal">
						<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
					</button>
				</c:otherwise>
			</c:choose>
		</c:if>
		<c:if test="${empty id}">
			<button id = "nav_login_button" type="button" class="btn btn-secondary" data-toggle="modal"
				data-target="#login_Modal">
				<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
			</button>
		</c:if>
		<a class="global" href="#menu"><span
			class="glyphicon glyphicon-th-large" aria-hidden="true"></span></a>
	</div>
</header>
<!-- 옆으로 확장되는 네비게이션 바 -->
<nav id="menu">
	<ul class="links">
		<li><a href="BoardList.bo" class="dropdown-toggle"
			data-toggle="dropdown" role="button" aria-expanded="false">자유게시판</a></li>
		<li><a href="ReviewList.rv" class="dropdown-toggle" data-toggle="dropdown"
			role="button" aria-expanded="false">리뷰게시판</a></li>
		<li><a href="#" class="dropdown-toggle" data-toggle="dropdown"
			role="button" aria-expanded="false">고객센터 </a></li>
	</ul>
</nav>
<!--  필터 모달 -->
<div class="modal" id="filter_Modal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">조건별 검색</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<form method="post" action="searchfilter.co" id="filter_form">
				<!-- Modal body -->
				<div class="modal-body">
					<div class="container uniform">
						<fieldset>
							<div class="form-group">
								<label for="datepicker" class="modalBlack">날짜별</label> <input
									type="date" name="search_date" id="datepicker">
							</div>
							<div class="table-wrapper">
								<label for="local" class="modalBlack">지역별</label> <input
									type="hidden" name="search_local" id="search_local">
								<table class = "table_f" id="local">
									<tr>
										<td><input type='button' class='local' value="서울"></td>
										<td><input type='button' class='local' value="경기"></td>
										<td><input type='button' class='local' value="인천"></td>
										<td><input type='button' class='local' value="부산"></td>
										<td><input type='button' class='local' value="대구"></td>
										<td><input type='button' class='local' value="대전"></td>
									</tr>
									<tr>
										<td><input type='button' class='local' value="경남"></td>
										<td><input type='button' class='local' value="전남"></td>
										<td><input type='button' class='local' value="충남"></td>
										<td><input type='button' class='local' value="광주"></td>
										<td><input type='button' class='local' value="울산"></td>
										<td><input type='button' class='local' value="경북"></td>
									</tr>
									<tr>
										<td><input type='button' class='local' value="전북"></td>
										<td><input type='button' class='local' value="충북"></td>
										<td><input type='button' class='local' value="강원"></td>
										<td><input type='button' class='local' value="제주"></td>
										<td><input type='button' class='local' value="세종"></td>
										<td><input type='button' id="all_local" value="전국"></td>
									</tr>
								</table>
							</div>

							<div class="form-group">
								<label for="genre" class="modalBlack">장르별</label> <input
									type="hidden" name="search_genre" id="search_genre">
								<table class = "table_f" id="genre">
									<tr>
										<td><input type='button' class='genre' value="balad"></td>
										<td><input type='button' class='genre' value="rock"></td>
										<td><input type='button' class='genre' value="rap"></td>
									</tr>
									<tr>
										<td><input type='button' class='genre' value="R&B/Soul"></td>
										<td><input type='button' class='genre' value="jazz"></td>
										<td><input type='button' class='genre' value="classic"></td>
									</tr>
									<tr>
										<td><input type='button' class='genre' value="pop"></td>
										<td><input type='button' class='genre' value="EDM"></td>
										<td><input type='button' id="all_genre" value="모든 장르"></td>
									</tr>
								</table>
							</div>
							<!-- Modal footer -->
							<input type="submit" id="filter_btn" class="btn btn-primary"
								value='검색'> <input class="btn btn-danger"
								id="filter_cancel" data-dismiss="modal" value='취소'>

						</fieldset>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<!--  로그인 모달 -->
<div class="modal" id="login_Modal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title logog">로그인</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="container uniform">
					<form method="post" action="loginProcess.net" id="login_form">
						<fieldset>
							<div class="form-group">
								<label for="login_id" class="modalBlack">아이디</label> <input
									type="text" class="form-control" id="login_id"
									placeholder="Enter id" name="login_id" required maxLength="30">
								<span id="login_id_message"></span>
							</div>
							<div class="form-group">
								<label for="modal_pass" class="modalBlack">비밀번호</label> <input
									type="password" class="form-control" id="login_pass"
									placeholder="Enter password" name="login_pass" required>
							</div>
							<div class="6u$ 12u$(small)">
								<input type="checkbox" id="login_remember" name="login_remember"
									checked> <label for="login_remember">Remember
									me</label>
							</div>

						</fieldset>
					</form>
				</div>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button id="login_button" type="submit" class="btn btn-primary">로그인</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-info" data-dismiss="modal"
					data-toggle="modal" data-target="#addMember_Modal">회원가입</button>
			</div>

		</div>
	</div>
</div>

<!--  계정 모달 -->
<div class="modal right fade" id="account_Modal" tabindex="-1"
	role="dialog" aria-labelledby="accountLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title user" id="accountLabel">${id }님</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="container uniform">
					<form method="post" action="#" id="account_form">
						<fieldset>
							<br>
							<div class="accountDiv">
								<a href="mypage.bk">마이페이지</a>
							</div>
							<div class="accountDiv">
								<a href="logOut.net">로그아웃</a>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 회원가입 모달 -->
<div class="modal" id="addMember_Modal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">회원가입</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="container">
					<form action="joinProcess.net" id="addMember_form" method="post">
						<fieldset>
							<div class="form-group">
								<label for="addMember_id" class="modalBlack">아이디</label> <input
									type="text" class="form-control" id="addMember_id"
									placeholder="Enter id" name="addMember_id" required> <span
									id="addMember_id_message"></span>
							</div>
							<div class="form-group">
								<label for="addMember_pass" class="modalBlack">비밀번호</label> <input
									type="password" class="form-control" id="addMember_pass"
									placeholder="Enter password" name="addMember_pass" required
									maxLength="12">
							</div>
							<div class="form-group">
								<label for="addMember_name" class="modalBlack">이름</label> <input
									type="text" id="addMember_name" class="form-control"
									name="addMember_name" placeholder="Enter name" required
									maxLength="15">
							</div>
							<div class="form-group">
								<label for="addMember_address" class="modalBlack">주소</label> <input
									type="text" id="addMember_address" class="form-control"
									name="addMember_address" placeholder="Enter address" required>
							</div>
							<div class="form-group">
								<label for="addMember_phone_number" class="modalBlack">전화번호</label>
								<input type="text" id="addMember_phone_number"
									class="form-control" name="addMember_phone_number"
									placeholder="Enter birthday" required>
							</div>
							<div class="form-group">
								<label class="modalBlack">선호장르</label> <input type="checkbox"
									id="addMember_preference_balad" name="addMember_preference"
									value="balad" checked> <label
									for="addMember_preference_balad">발라드</label> <input
									type="checkbox" id="addMember_preference_rock"
									name="addMember_preference" value="rock"> <label
									for="addMember_preference_rock">락/메탈</label> <input
									type="checkbox" id="addMember_preference_rap"
									name="addMember_preference" value="rap"> <label
									for="addMember_preference_rap">랩/힙합</label> <input
									type="checkbox" id="addMember_preference_jazz"
									name="addMember_preference" value="jazz"> <label
									for="addMember_preference_jazz">재즈/소울</label> <input
									type="checkbox" id="addMember_preference_classic"
									name="addMember_preference" value="classic"> <label
									for="addMember_preference_classic">클래식</label> <input
									type="checkbox" id="addMember_preference_pop"
									name="addMember_preference" value="pop"> <label
									for="addMember_preference_pop">팝</label> <input type="checkbox"
									id="addMember_preference_edm" name="addMember_preference"
									value="EDM"> <label for="addMember_preference_edm">EDM</label>
							</div>

							<div class="u$(small)">
								<div>
									<label for="male" class="modalBlack">성별</label>
								</div>
								<input type="radio" id="male" name="addMember_gender" value="1"
									checked> <label for="male" class="modalBlack">남</label>
								<input type="radio" id="female" name="addMember_gender"
									value="2"> <label for="female" class="modalBlack">여</label>
							</div>
							<button type="submit" class="btn btn-primary">회원가입</button>
						</fieldset>
					</form>
				</div>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			</div>

		</div>
	</div>
</div>

<script>
	$(function() {
		$('#adminMode_Button').click(function() {
			location.href = 'adminPage.net';
		});
		var idCheck = false;

		$('#login_button').click(function() {
			$('#login_form').submit();
		})

		// ID keyup 이벤트(중복 확인)
		$("#addMember_id").on(
				'keyup',
				function() {
					$("addMember_id_message").empty();
					// \w => [A-Za-z0-9_]
					var pattern = /^\w+@\w*[.]\w{3}$/;
					var id = $("#addMember_id").val();

					if (!pattern.test(id)) {
						$("#addMember_id_message").css('color', 'red').html(
								"이메일 형식으로 맞춰주세요.");
						idCheck = false;
						return;
					}
					$.ajax({
						url : "idcheck.net",
						data : {
							"id" : id
						},
						success : function(rdata) {
							if (rdata == -1) {
								$("#addMember_id_message")
										.css('color', 'green').html(
												"사용 가능한 아이디 입니다.");
								idCheck = true;
							} else {
								$("#addMember_id_message").css('color', 'blue')
										.html("사용중인 아이디 입니다.");
								idCheck = false;
							}
						}//if
					});//ajax
				});// ID keyup 이벤트 종료

		$('#login_form').submit(function() {
			location.href = 'loginProcess.net';
		});
		// 회원가입 유효성 검사
		$('#addMember_form').submit(function() {
			if ($('#addMember_id').val() == "") {
				alert("ID를 입력하세요");
				$('#addMember_id').focus();
				return false;
			}
			if (idCheck == false) {
				alert("ID 중복되었습니다.");
				return false;
			}

			if ($('#addMember_pass').val() == "") {
				alert("비밀번호를 입력하세요");
				$('#addMember_pass').focus();
				return false;
			}
			if ($('#addMember_name').val() == "") {
				alert("이름을 입력하세요");
				$('#addMember_name').focus();
				return false;
			}

			if ($('input[type=radio]:checked').length == 0) {
				alert("성별을 선택하세요");
				return false;
			}

		}); //회원가입 유효성 검사 종료

		// 검색 버튼 이벤트
		$('#search_Text').hide();

		$('#search_Button').click(function() {
			$('#search_Text').toggle();
			$('#search_Button').hide();
			$('#search_Text').focus();
		});
		$('#search_Text').blur(function() {
			$('#search_Button').show();
			$('#search_Text').val('');
			$('#search_Text').hide();
		});
		// 검색 이벤트 종료

		// 검색어 엔터시
		$("#search_Text").keydown(function(key) {
			if (key.keyCode == 13) { // 엔터치면
				$("#searchForm").submit();
				var search_Text = $("#search_Text").val();
				location.href = "searchword.co"
			}
		});
<%--
	 $.datepicker.setDefaults({
		dateFormat: 'yyyy-MM-dd',	// 2019-11-30 형식으로 지정
		 toString(date, format) {
	  		let day = ("0" + date.getDate()).slice(-2);	// 한자리수 앞에 0 삽입 ex) 01
	   		let month = ("0" + (date.getMonth() + 1)).slice(-2);
	   		let year = date.getFullYear();
	  		 return `${year}-${month}-${day}`;
	  		 },
	   
   	showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
   	showMonthAfterYear: true //년도 먼저 나오고, 뒤에 월 표시    
	}); 
	$("#datepicker").datepicker();  
	--%>
	// filter 클릭시 색상 변함
		$(".local").css('opacity', '0.5');
		$(".local").each(function(index, item) {
			$(this).click(function() {
				var status = $(this).css('opacity');
				if (status == '0.5') {
					$(this).css('opacity', '1');
					if ($("#all_local").css('opacity') == 1) {
						$("#all_local").css('opacity', '0.5');
					}
				} else {
					$(this).css('opacity', '0.5');
				}
			});
		});

		// filter 클릭시 색상 변함
		$(".genre").css('opacity', '0.5');
		$(".genre").each(function(index, item) {
			$(this).click(function() {
				var status = $(this).css('opacity');
				if (status == '0.5') {
					$(this).css('opacity', '1');
					if ($("#all_genre").css('opacity') == 1) {
						$("#all_genre").css('opacity', '0.5');
					}
				} else {
					$(this).css('opacity', '0.5');
				}
			});
		});
		// 전체 지역 클릭시 다른 지역은 해제되게 하기
		$("#all_local").css("opacity", '0.5');
		$("#all_local").click(function() {
			var status = $(this).css('opacity');
			if (status == '0.5') {
				$(this).css('opacity', '1');
				$(".local").each(function(index, item) {
					$(".local").css('opacity', '0.5');
				});
			} else {
				$(this).css('opacity', '0.5');
			}
		});

		// 모든 장르 클릭시 다른 장르는 해제되게 하기
		$("#all_genre").css("opacity", '0.5');
		$("#all_genre").click(function() {
			var status = $(this).css('opacity');
			if (status == '0.5') {
				$(this).css('opacity', '1');
				$(".genre").each(function(index, item) {
					$(".genre").css('opacity', '0.5');
				});
			} else {
				$(this).css('opacity', '0.5');
			}
		});

		// <input type = "hidden" name = "search_local" id = "search_local">
		// <input type = "hidden" name = "search_genre" id = "search_genre">								
		$("#filter_btn").click(function() {
			var search_local = "";
			var search_genre = "";

			$(".local").each(function(index, item) {
				if ($(this).css('opacity') == 1)
					search_local += $(this).val() + ",";
			});

			$(".genre").each(function(index, item) {
				if ($(this).css('opacity') == 1)
					search_genre += $(this).val() + ",";
			});

			if ($("#all_local").css('opacity') == 1)
				search_local = $("#all_local").val() + ",";

			if ($("#all_genre").css('opacity') == 1)
				search_genre = $("#all_genre").val() + ",";

			if (search_local == null || search_local == "") {
				search_local = "전국,";
			}
			if (search_genre == null || search_genre == "") {
				search_genre = "모든 장르,";
			}
			$("#search_local").val(search_local); // text에 넣음
			$("#search_genre").val(search_genre);
		});

	});
</script>