<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Search Result</title>
<style>
#search_word{
width: 100%;
    text-align: center;
    margin-top: 100px;
    font-size: 30px;}
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

.filter_btn img {
	width: 25px;
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
	margin: 3px;
	padding-right: 0px;
}
</style>
</head>

<body>
	<!-- Header -->
	<jsp:include page="../mainActivity/navbar.jsp" />

	<!-- 검색 결과 -->
	<c:if test="${!empty list }">
		<div id="search_word">
			<strong>${search_word }</strong>의 검색 결과입니다
		</div>

		<span id="count"> 총 <strong>${count }</strong>개
		</span>



		<div class="fout">
			<ul class="flist">
				
			<c:forEach var="list" items="${list}">
				<li class="box fbox">
						<div class="finfo">
							<input type="hidden" name="concert_id"
								value="${list.concert_id}">

							<div class="concert_img">
								<img src="concertupload/${list.concert_image }" alt="" />
							</div>
							
							<div class = "fsubject">
								<h4 style="display: inline-block">${list.concert_name }</h4>
								<p>${list.concert_musician }</p>
							</div>
							<table>
								<tr>
									<th>공연 일시</th>
									<td class='d_day'><div></div></td>
									<td class="concert_day">${list.concert_day }</td>
								</tr>
								<tr>
									<th colspan=2>공연 시간</th>
									<td class = "concert_time">${list.concert_open } - ${list.concert_close }</td>
								</tr>
								<tr>
									<th colspan=2>공연 장소</th>
									<td>${list.local_name }</td>
								</tr>
								<tr>
									<th colspan=2>공연 가격</th>
									<td class = 'concert_price'>${list.concert_price }</td>
								</tr>
								<tr>
									<th colspan=2>장르</th>
									<td>${list.genre_name }</td>
								</tr>
							</table>

							<a
								href="ConcertDetailAction.co?detail_concert=${list.concert_id }"
								class="button icon fa-search fit" style = "background: #06243c;">상세보기</a>
						</div>
						</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>

	<c:if test="${empty list }">
		<div style="margin: 100px; text-align: center; font-size: 50px">${none }</div>
	</c:if>
<script src="js/searchlist.js"></script>

</body>
</html>