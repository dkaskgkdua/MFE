<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(function() {
	$('.chat_detail').hide();
	$('.chat_date').each(function(index, item){
		var i=1;
		$('.chat_date').eq(index).click(function(){
			if(i==1){
				$('.chat_detail').eq(index).show();
				i=0;
			} else {
				$('.chat_detail').eq(index).hide();
				i=1;
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

	<div class="container container2">
			<table class="table t2">
				<thead>
					<tr>
						<th>상담내역</th>
						<th>
							<font size=3>채팅 목록 개수 : ${chatlistcount }</font>
						</th>
					</tr>
					<tr>
						<th width="30%">채팅번호</th>
						<th width="70%">상담날짜</th>
					</tr>
				</thead>
				<tbody class="tb2">
					<c:set var="num" value="${chatlistcount-(page2-1)*5 }"/>
					<c:forEach var="c"  items="${chatlist}">
					<tr>
						
						<td>
							<div><c:out value="${num }"/></div>
							<c:set var="num" value="${num-1 }"/>
						</td>
						<td>
							<div>
								<button class="chat_date">${c.chat_log_date}</button>
							</div>
						</td>
					</tr>
					<tr class="chat_detail">
						<td>
							<div>
		                  		관리자 : ${c.chat_log_answer }
		                  	</div>
		                </td>
		                <td>
	                 	 	<div>
		                 	 	${id } : ${c.chat_log_content }
		                 	</div>
		                </td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			

		<div class="center-block block2">
	         <div class="row">
	            <div class="col huWidth">
	               <ul class="pagination huWidth pa2">
	                  <c:if test="${page2 <= 1 }">
	                     <li class="page-item">
	                     <a class="page-link" href="#">이전&nbsp;</a>
	                     </li>
	                  </c:if>
	                  <c:if test="${page2 > 1 }">
	                     <li class="page-item">
	                     <a href="mypage.bk?page2=${page2-1 }"
	                        class="page-link">이전</a>&nbsp;
	                     </li>
	                  </c:if>

	                  <c:forEach var="a" begin="${startpage2 }" end="${endpage2 }">
	                     <c:if test="${a == page2 }">
	                        <li class="page-item">
	                           <a class="page-link" href="#">${a }</a>
	                        </li>
	                     </c:if>
	                     <c:if test="${a != page2 }">
	                        <li class="page-item">
	                           <a href="mypage.bk?page2=${a }"
	                              class="page-link">${a }</a>
	                        </li>
	                     </c:if>
	                  </c:forEach>

	                  <c:if test="${page2 >= maxpage2 }">
	                     <li class="page-item">
	                        <a class="page-link" href="#">&nbsp;다음</a>
	                     </li>
	                  </c:if>
	                  <c:if test="${page2 < maxpage2 }">
	                     <li class="page-item">
	                        <a href="mypage.bk?page2=${page2+1 }"
	                           class="page-link">&nbsp;다음</a>
	                     </li>
	                  </c:if>
	               </ul>
	            </div>
	         </div>
	      </div> 

		</c:if>
</div>
		<!-- 게시글이 없는 경우 -->
		<c:if test="${chatlistcount == 0}">
			<font size=5>상담내역이 없습니다.</font>
		</c:if>

