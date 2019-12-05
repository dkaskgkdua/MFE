<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script>
$(function() {
	
	var chat = "${num}";
	
	chat.forEach(function(item) {
		var num = item;
		$(".h").eq(num).hide();
		
		$(".chat_detail").eq(num).click(function() {
			if(close==0){
				$(".h").eq(num).show();
				close=1;
			} else if(close==1){
				$(".h").eq(num).hide();
				close=0;
			}
		
		})
	})
	
	
	
	<%--
	$(".h").hide();
	var close = 0;
	$(".chat_detail").click(function() {
		if(close==0){
			$(".h").show();
			close=1;
		} else if(close==1){
			$(".h").hide();
			close=0;
		}
	
	})--%>
	
});
</script>
<div class="container">
		<!-- 게시글이 있는 경우 -->
		<c:if test="${chatlistcount > 0}">
			<table class="table">
				<caption>예매내역</caption>
				<thead>
					<tr>
						<th>채팅번호</th>
						<th>상담날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="num" value="${chatlistcount-(page-1)*10 }"/>
					<c:forEach var="c"  items="${chatlist}">
					<tr>
						
						<td>
							<div><c:out value="${num }"/></div>
							<c:set var="num" value="${num-1 }"/>
						</td>
						<td>
							<button class = "btn chat_detail">${c.chat_log_date}</button>	
						</td>
					</tr>
					</c:forEach>
					<c:forEach var="c"  items="${chatlist}">
					<tr class="h">
						<td>
							<div>
		                  		${c.chat_log_answer }
		                  	</div>
		                </td>
		                <td>
	                 	 	<div>
		                 	 	${c.chat_log_content }
		                 	</div>
		                </td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>

		<!-- 게시글이 없는 경우 -->
		<c:if test="${chatlistcount == 0}">
			<font size=5>채팅내역이 없습니다.</font>
		</c:if>
		</div>
