<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Search Result</title>
<style>
.box {
	width: 42%;
	text-align: center;
	width: 48%;
	float: left;
	margin: 0px;
}

.table-wrapper img {
	width: 95%;
	height: 240px;
}

.filter {
	width: 30px;
}
</style>
</head>

<body>
	<!-- Header -->
	<jsp:include page="../mainActivity/navbar.jsp" />

	<!-- 검색 필터 -->
	<div style="text-align: center; padding: 30px;">
		<c:if test="${!empty search_date }">
			<a href="#" class="button special">${search_date }<img src = "images/X.png"></a>
			<br>
		</c:if>
		<c:if test="${!empty search_local }">
			<c:forEach var="l" items="${search_local }">
				<a href="#" class="button special">${l }</a>
			</c:forEach>
			<br>
		</c:if>
		<c:if test="${!empty search_genre }">
			<c:forEach var="g" items="${search_genre }">
				<a href="#" class="button special">${g }</a>
			</c:forEach>
		</c:if>
	</div>

	<!-- 검색 결과 -->
	<c:if test="${!empty flist }">
		<c:forEach var="flist" items="${flist}">
			<div class="box">
				<div class="table-wrapper">
					<input type="hidden" name="concert_id" value="${flist.concert_id}">
					<img src="images/${flist.concert_image }" alt="" />
					<h4>${flist.concert_name }</h4>
					<p>${flist.concert_musician }</p>
					<table>
						<tr>
							<th>공연 일시</th>
							<td>${flist.concert_day }&nbsp;&nbsp;&nbsp;${flist.concert_open }
								- ${flist.concert_close }</td>
						</tr>
						<tr>
							<th>공연 장소</th>
							<td>${flist.local_name }</td>
						</tr>
						<tr>
							<th>공연 가격</th>
							<td>${flist.concert_price }</td>
						</tr>
						<tr>
							<th>장르</th>
							<td>${flist.genre_name }</td>
						</tr>
					</table>
					<a href="#" class="button special icon fa-search fit">상세보기</a>
				</div>
			</div>
		</c:forEach>
	</c:if>

	<c:if test="${empty flist }">
		<div style="margin: 100px; text-align: center; font-size: 50px">검색
			결과가 없습니다.</div>
	</c:if>
</body>
</html>