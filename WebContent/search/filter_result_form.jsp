<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Filter Result</title>
<style>
.fout {
	padding: 50px;
	text-align: center;
}

.flist {
	display: table;
	width: 100%;
	min-width: 756px;
	margin: -20px 0 0;
}

.fbox {
	width: 25%;
	display: inline-block;
	margin: 20px 0 20px;
	color: #757575;
	vertical-align: top;
	margin: 20px 40px;
	padding: 0 !important;
}

.finfo {
	height: 1200px;
	padding: 20px 30px;
}

button.filter_btn {
	padding: 0;
	margin-left: 6px;
	position: relative;
	top: 5px;
}

button.filter_btn:hover {
	background-color: transparent;
}

.filter_btn img {
	height: 25px;
}

#count {
	float: right;
	margin-right: 180px;
}

/* 검색결과 */
.concert_img {
	width: 100%;
	height: 600px;
	margin-bottom: 20px
}

.concert_img img {
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 100%;
	height: 100%;
}

.fsubject {
	height: 150px;
}

table tr th {
	width: 24%
}

td {
	text-align: left;
}

.deadline {
	display: inline-block;
	background: red;
	font-size: 12px;
	font-weight: bold;
	color: black;
	border-radius: 0.2em;
	padding: 0.15em;
}

.d_day {
	width: 27%
}

.d_day div {
	background: red;
	text-align: center;
	color: white;
	font-weight: 600;
}

div .button.special {
	margin: 5px 10px;
	opacity: 1 !important;
	background: #06243c !important;
	width: 140px;
}

div .button.special:hover {
	cursor: default;
}
</style>
</head>
<body>
	<!-- Header -->
	<jsp:include page="../mainActivity/navbar.jsp" />

	<!-- 검색 필터 -->
	<div style="text-align: center; padding: 30px; margin: 40px;">
		<c:if test="${!empty search_date }">
			<div class="button special date">
				${search_date }
				<button class="filter_btn">
					<img src="images/X.png">
				</button>
			</div>
			<br>
		</c:if>

		<c:if test="${!empty search_local }">
			<c:forEach var="l" items="${search_local }">
				<div class="button special local">
					${l }
					<button class="filter_btn">
						<img src="images/X.png">
					</button>
				</div>
			</c:forEach>
			<br>
		</c:if>

		<c:if test="${!empty search_genre }">
			<c:forEach var="g" items="${search_genre }">
				<div class="button special genre">
					${g }
					<button class="filter_btn">
						<img src="images/X.png">
					</button>
				</div>
			</c:forEach>
		</c:if>
	</div>



	<!-- 검색 결과 -->
	<c:if test="${!empty flist }">
		<div id="count">
			총 <strong>${flistsize }</strong>개
		</div>

		<div class="fout">
			<ul class="flist">

				<c:forEach var="flist" items="${flist}">
					<li class="box fbox">
						<div class="finfo">
							<input type="hidden" name="concert_id"
								value="${flist.concert_id}">

							<div class="concert_img">
								<img src="concertupload/${flist.concert_image }" alt="" />
							</div>
							
							<div class = "fsubject">
								<h4 style="display: inline-block">${flist.concert_name }</h4>
								<p>${flist.concert_musician }</p>
							</div>
							
							<table>
								<tr>
									<th>공연 일시</th>
									<td class='d_day'><div></div></td>
									<td class="concert_day">${flist.concert_day }</td>
								</tr>
								<tr>
									<th colspan=2>공연 시간</th>
									<td class = "concert_time">${flist.concert_open } - ${flist.concert_close }</td>
								</tr>
								<tr>
									<th colspan=2>공연 장소</th>
									<td>${flist.local_name }</td>
								</tr>
								<tr>
									<th colspan=2>공연 가격</th>
									<td class = 'concert_price'>${flist.concert_price }</td>
								</tr>
								<tr>
									<th colspan=2>장르</th>
									<td>${flist.genre_name }</td>
								</tr>
							</table>

							<a
								href="ConcertDetailAction.co?detail_concert=${flist.concert_id }"
								class="button icon fa-search fit" style = "background: #06243c;">상세보기</a>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>

	<c:if test="${empty flist }">
		<div style="margin: 100px; text-align: center; font-size: 50px">
			${none }</div>
	</c:if>
<script src="js/filterlist.js"></script>

</body>
</html>