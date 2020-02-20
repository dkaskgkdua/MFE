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
			});