$(function() {
	$(".concert_day").each(function(index, item){
		// d-day 계산
		var concert_day = $(this).text();
		var arr = concert_day.split("-");
		
		var today = new Date();	// 오늘 날짜
		var date = new Date(arr[0], arr[1]-1, arr[2]);	// 콘서트 날짜
		
		var diff = date - today;	// 콘서트 날짜 - 오늘 날짜 = d-day 계산
		var currDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨

		var dd = parseInt(diff/currDay) + 1;	// 일수 차이

		if(dd <= 5){
			$(this).prev().children().html("마감임박");
		}else{
			$(this).prev().children().html("D-" + dd);
		}
	});
	
	// 시간 형태 변환
	$(".concert_time").each(function(index, item){
		var time = $(this).text();
		var t1 = time.slice(0, 2);
		var t2 = time.slice(2, 4);
		var t3 = time.slice(-4, -2);
		var t4 = time.slice(-2);
		$(this).text(t1 + ":" + t2 + " - " + t3 + ":" + t4);
	});
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	$(".concert_price").each(function(index, item){
		var price = $(this).text();
		$(this).text(numberWithCommas(price) + "원");
	});
	
			// 필터 삭제시
			$(".filter_btn").click(function() {
				$(this).parent().css('display', 'none');

				// date
				var date = "";
					if ($("div.button.special.date").css('display') != 'none') {
							date += $("div.button.special.date").text();
					}else{
						date = "";
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
						"search_date" : date,
						"search_local" : local,
						"search_genre" : genre
					},
					dataType : "json",
					success : function(data) {
						console.log(data.flistsize);
						if(data.flistsize > 0){
						$("#count").html("총 <strong>" + data.flistsize + "</strong>개");
						
						$(".fbox").remove();
						output = "";
						
						$(data.flist).each(function(index, item){
							/* d-day 계산 */
							var concert_day = item.concert_day;
							
							var month_index = concert_day.indexOf("월");
							var month = concert_day.substring(0, month_index);
							
							var date_index = concert_day.indexOf(",");
							var date = concert_day.substring(month_index+2, date_index);
							
							var year = concert_day.substring(date_index+1, concert_day.length);
							
							month = month.length == 1 ? "0" + month : month;
							date = date.length == 1? "0" + date : date;
							
							var d = year + "-" + month + "-" + date;
							
							var today = new Date();	// 오늘 날짜
							
							var arr = d.split("-");
							var date = new Date(arr[0], arr[1]-1, arr[2]);	// 콘서트
							var diff = date - today;	// 콘서트 날짜-오늘 날짜 = d-day
							var currDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 *
							var dd = parseInt(diff/currDay) + 1;	// d-day
							
							if(dd <= 5){
								dd = "마감임박";
							}else{
								dd = "D - " + dd;
							}
							/* d-day end */
							
							/* 시간 형태 변환 */
							var open = item.concert_open;
							var close = item.concert_close;
							var t1 = open.slice(0, 2);
							var t2 = open.slice(2, 4);
							var t3 = close.slice(0, 2);
							var t4 = close.slice(2, 4);
							
							var time = t1 + ":" + t2 + " - " + t3 + ":" + t4;
							/* 시간 end */
							
							output += "<li class='box fbox'>";
							output += "<div class='finfo'>";
							output += "<input type='hidden' name='concert_id' value='" + item.concert_id + "'>";
							output += "<div class='concert_img'>";
							output += "<img src='concertupload/" + item.concert_image + "' alt='' />";
							output += "</div>";
							
							output += '<div class = "fsubject">';
							output += "<h4 style='display: inline-block'>" + item.concert_name + "</h4>";
							output += "<p>" + item.concert_musician + "</p>";
							output += "</div>";
							
							output += "<table>";
							output += "<tr><th>공연 일시</th>";
							output += "<td class='d_day'><div>" + dd + "</div></td>";
							output += "<td class='concert_day'>" + d + "</td></tr>";
							
							output += "<tr><th colspan=2>공연 시간</th>";
							output += "<td class = 'concert_time'>" + time + "</td></tr>";
							
							output += "<tr><th colspan=2>공연 장소</th>";
							output += "<td>" + item.local_name + "</td></tr>";
							
							output += "<tr><th colspan=2>공연 가격</th>";
							output += "<td class = 'concert_price'>";
							output += numberWithCommas(item.concert_price) + "원</td></tr>";
							
							output += "<tr><th colspan=2>장르</th>";
							output += "<td>" + item.genre_name + "</td></tr></table>"
						
							output += "<a href='ConcertDetailAction.co?detail_concert=" + item.concert_id + "' ";
							output += "class='button icon fa-search fit' style = 'background: #06243c;'>상세보기</a>";
								
							output += "</div></li>";
						}); // each end
					 	$(".fout").append(output);
						}else{
							$("#count").remove();
							$(".fbox").remove();
							$("body").append("<div style='margin: 100px; text-align: center; font-size: 50px'>검색 결과가 존재하지 않습니다.</div>");
						}
					} // success end
				}); // ajax end
			}); // $(".filter_btn").click end
		});