<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix ="c"  uri = "http://java.sun.com/jsp/jstl/core" %>


<script>
$(function() {
	var sel = "${search_field}";
	$("#viewcount").val(sel).prop("selected", true);
})

</script>
<div class = "container">
<form class = "search_member size" action = "adminPage.net">
	<div class = "input-group select-wrapper">
		
		<select id = "viewcount" name = "search_field">
			<option value = "0">ID</option>
			<option value = "1" selected>이름</option>
			<option value = "2">주소</option>
			<option value = "3">성별</option>
		</select>
		<input id = "search_word" name = "search_word" type="text" class = "form-control"
				placeholder = "Search" value="${search_word}">
		<button id = "search_btn" class= "btn btn-primary small" type="submit">검색</button>
	</div>
</form>


<%-- 회원이 있는 경우 --%>
<c:if test ="${listcount > 0 }">
	<table class = "table">
		<caption>회원 목록</caption>
		<tr>
			<th colspan = "2">MVC 회원 목록 - list</th>
			<th colspan = "1">
				<font size=3>회원 수 : ${listcount }</font>
			</th>
		</tr>
		<tr>
			<th width = "10%">번호</th>
			<th width = "40%">아이디</th>
			<th width = "30%">이름</th>
			<th width = "20%">삭제</th>
		</tr>
	<c:set var ="num" value = "${listcount-(page-1)*3}"/>  <%-- listAction에 limit 변경시 곱하는 값도 같이 변경해야함 --%>
	<c:forEach var ="m" items="${totallist}">
		<tr>
			<td>
			<c:out value="${num }"/><%-- num 출력 --%>
			<c:set var = "num" value ="${num-1}"/> <%-- num = num-1 의미함 --%>
			</td>
			<td>
				<div>
					<a><button type ="button" class = "btn memberDetail" data-toggle="modal" data-target="#member_view_Modal">${m.id}</button></a>
						<%--
					 <a href="member_info.net?id=${m.id }">
					 	${m.id}
					 </a>
					  --%>
				</div>
			</td>
			<td>
				<div>${m.name}</div>
			</td>
			<td>
				<c:if test="${m.id != 'admin@mfe.com'}">
					<a href="member_delete.net?id=${m.id}">삭제</a>
					<%-- onclick = "delchk(); 붙여도 가능 --%>
				</c:if>
			</td>
		</tr>
	</c:forEach>
	</table>
	
	<div class="center-block">
         <div class="row">
            <div class="col huWidth">
               <ul class="pagination huWidth">
                  <c:if test="${page <= 1 }">
                     <li class="page-item">
                     <a class="page-link" href="#">이전&nbsp;</a>
                     </li>
                  </c:if>
                  <c:if test="${page > 1 }">
                     <li class="page-item">
                     <a href="adminPage.net?page=${page-1}&search_field=${search_field}&search_word=${search_word}"
                        class="page-link">이전</a>&nbsp;
                     </li>
                  </c:if>
                  
                  <c:forEach var="a" begin="${startpage }" end="${endpage }">
                     <c:if test="${a == page }">
                        <li class="page-item">
                           <a class="page-link current" href="adminPage.net?page=${a }&search_field=${search_field}&search_word=${search_word}">${a }</a>
                        </li>
                     </c:if>
                     <c:if test="${a != page }">
                        <li class="page-item">
                           <a href="adminPage.net?page=${a }&search_field=${search_field}&search_word=${search_word}"
                              class="page-link">${a }</a>
                        </li>
                     </c:if>
                  </c:forEach>
                  
                  <c:if test="${page >= maxpage }">
                     <li class="page-item">
                        <a class="page-link" href="#">&nbsp;다음</a>
                     </li>
                  </c:if>
                  <c:if test="${page < maxpage }">
                     <li class="page-item">
                        <a href="adminPage.net?page=${page+1}&search_field=${search_field}&search_word=${search_word}"
                           class="page-link">&nbsp;다음</a>
                     </li>
                  </c:if>
               </ul>
            </div>
         </div>
      </div> 
</c:if>
<!--  회원이 없는 경우 -->
<c:if test ="${listcount == 0 }">
	<font size =5>등록된 회원이 없습니다.</font>
</c:if><br>
</div>
<!--  회원 상세정보 -->
<div class="modal" id="member_view_Modal" tabindex="-1" role = "dialog" aria-labelledby="viewLabel">
    		<div class="modal-dialog" role = "document">
     			 <div class="modal-content">
      
      			  <!-- Modal Header -->
      			  <div class="modal-header">
      			    <h4 class="modal-title" id= "viewLabel">회원 상세 정보</h4>
     			    <button type="button" class="close" data-dismiss="modal">&times;</button>
      			  </div>
        
        		  <!-- Modal body -->
       			  <div class="modal-body">
        			
						<table class = "table size">
							<tr>
								<td>아이디</td>
								<td id = "view_id"></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td id = "view_pass"></td>
							</tr>
							<tr>
								<td>이름</td>
								<td id = "view_name"></td>
							</tr>
							<tr>
								<td>주소</td>
								<td id = "view_address"></td>
							</tr>
							<tr>
								<td>폰번호</td>
								<td id = "view_phone_number"></td>
							</tr>
							<tr>
								<td>선호장르</td>
								<td id = "view_preference"></td>
							</tr>
							<tr>
								<td>성별</td>
								<td id = "view_gender"></td>
							</tr>
						</table>
					
    	    	</div>
    		  </div>
    		</div>
  		</div>
