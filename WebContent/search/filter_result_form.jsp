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
	margin: 100px;
}

.table-wrapper img {
	width: 95%;
	height: 240px;
}

.filter {
	width: 30px;
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

	<!-- 검색 필터 -->
	<div style="text-align: center; padding: 30px; margin: 40px;">
		<c:if test="${!empty search_date }">
			<div class="button special date">
				${search_date }
				<button class="filter_btn" style="padding: 0px; float: right;">
					<img src="images/X.png" style="width: 40px; height: 40px;">
				</button>
			</div>
			<br>
		</c:if>

		<c:if test="${!empty search_local }">
			<c:forEach var="l" items="${search_local }">
				<div class="button special local">
					${l }
					<button class="filter_btn" style="padding: 0px; float: right;">
						<img src="images/X.png" style="width: 40px; height: 40px;">
					</button>
				</div>
			</c:forEach>
			<br>
		</c:if>

		<c:if test="${!empty search_genre }">
			<c:forEach var="g" items="${search_genre }">
				<div class="button special genre">
					${g }
					<button class="filter_btn" style="padding: 0px; float: right;">
						<img src="images/X.png" style="width: 40px; height: 40px;">
					</button>
				</div>
			</c:forEach>
		</c:if>
	</div>

	<!-- 검색 결과 -->
		<c:if test="${!empty flist }">
			<div class = "out" style = "box-sizing : inline-block; width : 100%;">
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
								<td id = "concert_day">
									${flist.concert_day }&nbsp;&nbsp;&nbsp;${flist.concert_open }- ${flist.concert_close }
								</td>
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
			</div>
		</c:if>
		
		<c:if test="${empty flist }">
		<div style="margin: 100px; text-align: center; font-size: 50px">검색 결과가 없습니다.</div>
	</c:if>

	<script>
		$(function() {
			$(".filter_btn").click(function() {
				$(this).parent().css('display', 'none');

				// date
				var date = "";
					if ($("div.button.special.date").css('display') != 'none') {
							date += $("div.button.special.date").text();
					}
					
				// local
				var local = "";
					$("div.button.special.local").each(function() {
						a = $(this).text().trim();
						if ($(this).css('display') != 'none') {
							local += a + ",";
						}
					});
				if(local == null || local == "")
					local += "전국,";
				console.log(local);

				// genre
				var genre = "";
				$("div.button.special.genre").each(function() {
						a = $(this).text().trim();
						if ($(this).css('display') != 'none') {
							genre += a + ",";
						}
					});
				if(genre == null || genre == "")
					genre += "모든 장르,";
				console.log(genre);

				$.ajax({
					type : "post",
					url : "filterdelete.co",
					data : {
						"search_date" : $("div.button.special.date").text(),
						"search_local" : local,
						"search_genre" : genre
					},
					dataType : "json",
					success : function(data) {
						output = "";
						$(".box").remove();
						$(data.flist).each(function(index, item){
							output += "<div class='box'>";
							output += "<div class='table-wrapper'>";
							output += "<input type='hidden' name='concert_id' value='" + item.concert_id + "'>";
							output += "<img src='images/" + item.concert_image + "' alt='' />";
							output += "<h4>" + item.concert_name + "</h4>";
							output += "<p>" + item.concert_musician + "</p>";
							output += "<table>";
							output += "<tr><th>공연 일시</th>";
							
							var concert_day = item.concert_day;
							
							var month_index = concert_day.indexOf("월");
							var month = concert_day.substr(0, month_index);
							
							var date_index = concert_day.indexOf(",");
							var date = concert_day.substr(month_index+2, date_index-3);
							
							var year = concert_day.substring(concert_day.length-4);
							
							month = month.length == 1 ? "0" + month : month;
							date = date.length == 1? "0" + date : date;
							
							var d = year + "-" + month + "-" + date;
							
							output += "<td>" + d + "&nbsp;&nbsp;&nbsp;" 
							output += item.concert_open + " - " + item.concert_close + "</td></tr>";
							output += "<tr><th>공연 장소</th>";
							output += "<td>" + item.local_name + "</td></tr>";
							output += "<tr><th>공연 가격</th>";
							output += "<td>" + item.concert_price + "</td></tr>";
							output += "<tr><th>장르</th>";
							output += "<td>" + item.genre_name + "</td></tr></table></div></div>";
						}); // each end
						$(".out").append(output);
					} // success end
				}); // ajax end
			}); // $(".filter_btn").click end
		});
	</script>
</body>
</html>