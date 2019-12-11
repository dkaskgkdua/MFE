<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../mainActivity/navbar.jsp" />
<!-- <link rel="stylesheet" href="assets/css/back.css"> -->
<style>
.sp-quantity div {
	display: inline;
}
</style>
<script type="text/javascript">
	$(document).click(function() {
		$('#myTab a').click(function(e) {
			e.preventDefault()
			$(this).tab('show')
		});
		
		$(".ddd").on("click", function () {
		    var $button = $(this);
		    var oldValue = $button.closest('.sp-quantity').find("input.quntity-input").val();

		    if ($button.text() == "+") {
		        var newVal = parseInt(oldValue) + 1;
		    } else {
		        // Don't allow decrementing below zero
		        if (oldValue > 0) {
		            var newVal = parseInt(oldValue) - 1;
		        } else {
		            newVal = 0;
		        }
		    }
		    $button.closest('.sp-quantity').find("input.quntity-input").val(newVal);
		});
		
	})
	
	$(function(){
		 $(".sp-minus").click(function() {
				var amount = $(this).find('input').val();
				location.href = "ConcertDetailAction.co?id=" + CONCERT_ID
			}); *
	})
</script>


	<c:set var="c" value="${cdata}" />
	
	<!-- 중단 : 공연 상세내용/공연장위치/좌석 예약안내/기타 등등 -->
	<div class="container">
		<form method="post" action="purchaseProcess.bk">
			<div id="detail">

				<!-- 공연 이미지:썸네일 -->
				<div class="Thumbnail">
					<div class="imageWrap">
						<img src="images/${c.concert_image}">
						<input type="hidden" id="con_image" name="con_image" value="${c.concert_image}">
					</div>
					<!-- //공연 이미지:썸네일 end -->
					<!-- 공연 타이틀/인기도/날짜(in썸네일)-->
					<div class="concertTitle">
						<dl>
							<dt>★★Popular★★</dt>
							<dd>${c.concert_name}<input type="hidden" id="con_name" name="con_name" value="${c.concert_name }">
							</dd>
							<dd>${c.concert_day },${c.concert_open} ~ ${c.concert_close} 
								<input type="hidden" id="con_day" name="con_day" value="${c.concert_day}"> 
								<input type="hidden" id="con_open" name="con_open" value="${c.concert_open}"> 
								<input type="hidden" id="con_close" name="con_close" value="${c.concert_close}">
								<input type="hidden" id="con_price" name="con_price" value="${c.concert_price}">
								<input type="hidden" id="con_id" name="con_id" value="${c.concert_id}">
							</dd>
							<dd>#${c.genre_id }, #${c.local_id}</dd>
							<!-- 해당 코드 번호에 맞는 장르, 지역을 구분하여 text로 표기 하는 기능 넣기 -->
						</dl>
					</div>
				</div>
				<!-- //공연 타이틀/인기도/날짜:(in썸네일) end-->


				<!-- 상세페이지 중단 : 공연 상세내용/공연장위치/좌석 예약안내/기타 등등 -->
				<div class="content">
					<div role="tabpanel">

						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active">
								<a href="#concert-info" id="myTab" aria-controls="concert-info" role="tab" data-toggle="tab">공연 안내</a>
							</li>
							<li role="presentation">
								<a href="#profile" id="myTab" aria-controls="profile" role="tab" data-toggle="tab">좌석안내</a>
							</li>
							<li role="presentation">
								<a href="#messages" id="myTab" aria-controls="messages" role="tab" data-toggle="tab">공연장 정보</a>
							</li>
							<li role="presentation"> 
								<a href="#settings" id="myTab" aria-controls="settings" role="tab" data-toggle="tab">예매유의사항</a>
							</li>
						</ul>
						<!-- //Nav tabs end -->

						<!-- Tab panes -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="concert-info">
								<div>
									<h3>예매 전 유의사항</h3>
								</div>
								<ul>
									<li>티켓 구매 후 티켓을 재 판매하는 행위는 금지되어 있습니다.<br> 불법 거래된 티켓은
										주최측의 권한으로 사전 통보 없이 취소 처리되며, 공연 당일 현장에 티켓을 소지하고 오더라도 <br>
										공연장 입장이 불가함을 알려드립니다.<br>
									</li>
								</ul>
								<div>
									<h3>예매 안내</h3>
								</div>
								<ul>
									<li>회차당 <strong>1인 4매</strong>까지 구매 가능합니다.
									</li>
									<li>본 공연은 <strong>만 7세 이상 관람가</strong>로, 관람 연령 미만은 티켓을 소지
										하였어도 입장이 불가합니다.
									</li>
									<li>취소마감시간 이후로는 어떠한 사유로도 티켓 환불이 되지 않습니다.<br> <b>*취소
											마감 시간 : 2020년 2월 1일(토) 공연-> 1월 31일(금) 오후 5시까지</b><br>
									</li>
									<li>본 공연의 공식 지정 예매처가 아닌 다른 경로를 통한 구매 또는 취득한 티켓으로 인해<br>
										발생한 피해와 책임은 전적으로 당사자에게 있으며, 공연의 주최/주관사/협력사/예매처에서는 어떠한 책임도 지지
										않습니다.
									</li>
									<li>천재지변이나 주최측의 사정으로 공연이 취소 될경우, 구매금액은 취소 수수료 없이 전액 환불
										됩니다.</li>
								</ul>
							</div>
							<div role="tabpanel" class="tab-pane" id="profile">
								<div class="concert_reserve">
									<div class="concert_date">
										<div>${c.concert_open}</div>
										<div>${c.concert_close}</div>
										<div>${c.concert_price}</div>

									</div>
								</div>
								<div class="sp-quantity">
									<div class="sp-minus fff">
										<a class="ddd" href="#" data-multi="-1">-</a>
									</div>
									<div class="sp-input">
										<input type="text" class="quntity-input" name="amount" id="amount" value="1" />
									</div>
									<div class="sp-plus fff">
										<a class="ddd" href="#" data-multi="1">+</a>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane" id="messages">대중교통수단
								안내 지하철 국철 1호선 부평역에서 인천지하철 동막방면으로 환승하여 예술회관역하차 6번 출구 버스 예술회관역 정류장
								시내버스 (파랑) 41 : 원창동 - 율도 - 인천의료원 - 동인천역 - 주안역 - 율도 - 예술회관역 -
								신세계백화점 21 : 한화단지 - 논현사거리 - 남동구청 - 신세계백화점 - 예술회관역 - 제물포역 - 만석비치타운
								77 : 금곡동 - 검단파출소 - 경서동 입구 - 가좌고등학교 - 동암역 - 신세계백화점 - 예술회관역 문화예술회관
								정류장 마을버스 (초록) 523 : 옥련사거리 - 송도역 - 연수중학교 - 선학역 - 문화예술회관 - 주안도서관 -
								주안역 534 : 인천대공원 - 만수종합시장 - 간석오거리 - 문화예술회관 - 신세계백화점 신세계백화점 정류장
								(인천터미널) : 인천시청 방면 도보10분 시내버스 (파랑) : 3, 4, 6, 6-1, 11, 13, 21-1,
								27, 35, 36, 38 마을버스 (초록) : 514, 514-1, 520 좌석버스 : 111 광역버스 :
								1400, 2400 인천시청 정류장 : 터미널방면 도보 20분 혹은 지하철로 1정거장 "예술회관역" 하차 광역버스
								1600 : 연안여객터미널-제물포역-인천시청-합정역-신촌-서울역(파출소 앞) 1601 :
								용현동-제물포역-인천시청-부천시청-합정역-신촌-서울역(파출소 앞) 9100 : 대우아파트(용현동)-인천시청
								후문-서초역-강남역-양재시민의숲-석바위 2400번:
								인천종합터미널->현대아파트->4공단->여의도환승센터->마포경찰서->종로1가->종근당(충정로역)->
								공덕역->영등포시장역->부평시장입구 ※ 1400, 2400번은 인천종합터미널 하차 도보 10분 ※ 1600,
								1601, 9100번은 인천시청에서 하차하여 지하철로 1정거장 "예술회관역" 6번 출구 이용 혹은 도보 20분
								찾아오시는길 (자가운전) 경인고속국도 도화IC → 도화초교사거리(주안역방면 우회전) → 주안역 →
								주원사거리(인천시청방면 우회전) → 인천시청역 → 예술회관역 → 예술회관 주차장(우회전) 제2경인고속국도 남동IC
								→ 남동경찰서사거리(종합터미널 방면 좌회전) → 종합터미널 → 중앙공원사거리(종합문화예술회관방면 우회전) →
								예술회관 주차장(우회전)</div>
							<div role="tabpanel" class="tab-pane" id="settings">
								예매취소 시 유의사항 <br> ① 예매 후 7일까지 취소 시에는 취소수수료가 없습니다. <br>
								② 관람일 기준은 아래와 같이 취소수수료가 적용됩니다. <br> ①번과 ②번 모두 해당되는 경우, ②번
								기준이 우선 적용됩니다.<br> ~관람일 10일전까지 : 뮤지컬/콘서트/클래식 장당 4,000원,
								연극/전시 등 장당 2,000원 (단, 최대 티켓금액의 10% 한도) <br> 관람일 9일전~관람일
								7일전까지 : 티켓금액의 10% <br> 관람일 6일전~관람일 3일전까지 : 티켓금액의 20% <br>
								관람일 2일전~관람일 1일전까지 : 티켓금액의 30% <br> 위 ② 번의 경우에도 예매 당일 밤 12시
								이전 취소 시에는 취소수수료가 없습니다. <br> (취소기간 내에 한함) 취소 시 예매수수료는 예매 당일
								밤 12시 이전까지 환불되며, 그 이후 기간에는 환불되지 않습니다. <br> 웹 취소가능시간 이후에는
								취소가 불가합니다. 단, 관람일 당일 취소가능 한 상품의 경우 관람일 당일 취소 시에는 티켓금액의 90%가
								과금됩니다. <br> 상품의 특성에 따라서, 취소수수료 정책이 달라질 수 있습니다.(각 상품 예매 시
								취소수수료 확인) 배송 및 반송처리 된 티켓의 배송료는 환불되지 않습니다.<br> 금주 주말 (토/일)공연
								취소를 원할 경우 내사수령 바랍니다.<br> 우편으로 보낼 시 우체국이 토요일 근무를 안하는 관계로
								수취인(인터파크)수령이 불가능하여 취소처리가 되지 않을 수 있습니다. <br> 취소는 관람일 하루
								전(평일/주말/공휴일 오후 5시, 토요일 오전 11시 이전)까지 직접 취소가 가능하며, 배송이 시작된 티켓의 경우
								티켓이 인터파크 티켓 고객센터로 공연 전일까지 반송되어야 취소가능하며, 취소수수료는 도착일자 기준으로 부과됩니다.
								(※ 단, 배송료는 환불되지 않으며 일괄배송 상품의 경우 취소에 대한 자세한 문의는 고객센터로 문의해주시기
								바랍니다.) (공연 전일이 휴일인 경우, 휴일 전날까지) <br> 반송이 확인되지 않은 티켓은 현장에서도
								수령하실 수 없으며, 공연 관람 및 환불이 불가합니다. <br> 티켓 반송 주소 (08375) 서울특별시
								구로구 디지털로31길 61 신세계아이앤씨디지털센터 2층 ㈜ 인터파크 티켓 고객센터 환불담당자<br> 예매
								및 예매취소, 티켓 반송 서비스는 소비자기본법에 따른 소비자분쟁해결기준(공정위 고시)에 따릅니다.
							</div>
						</div>
						<!-- //Tab panes end -->

						<!-- 예약하기 버튼  -->
						<div id="layer_fixed" class="reserverbtn">

							<button type="submit" class="btn btn-info">${c.concert_price} 원</button>
						</div>
						<!-- //예약하기 버튼 end-->
					</div>
				</div>
				<!-- //상세페이지 end 중단 : 공연 상세내용/공연장위치/좌석 예약안내/기타 등등 -->
			</div>
		</form>
	</div>
<jsp:include page="../mainActivity/footer.jsp" />