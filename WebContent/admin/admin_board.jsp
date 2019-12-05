<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix ="c"  uri = "http://java.sun.com/jsp/jstl/core" %>

<c:if test ="${listcount2 > 0 }">
	<div class = "rows ">
		<span class = "sp">목록 갯수</span>
		<select class = "form-control"  id = "viewcount2">
			<option value = "1">1</option>
			<option value = "3">3</option>
			<option value = "5">5</option>
			<option value = "7">7</option>
			<option value = "10" selected>10</option>
		</select>
	</div>

<div class = "container container2">
<%-- 게시글이 있는 경우 --%>
	<table class = "table t2">
	<thead>
		<tr>
			<th colspan = "3">MVC 게시판 - list</th>
			<th colspan = "2">
				<font size=3>글 개수 : ${listcount2 }</font>
			</th>
		</tr>
		<tr>
			<th width = "8%"><div>번호</div></th>
			<th width = "50%"><div>제목</div></th>
			<th width = "14%"><div>작성자</div></th>
			<th width = "17%"><div>날짜</div></th>
			<th width = "11%"><div>조회수</div></th>
		</tr>
	</thead>
	<tbody class = "tb2">
	<c:set var ="num" value = "${listcount2-(page2-1)*10}"/>
	<c:forEach var ="b" items="${boardlist}">	
		<tr>
			<td>
			<c:out value="${num }"/>
			<c:set var = "num" value ="${num-1}"/> 
			</td>
			<td>
				<div>
					 <c:if test ="${b.BOARD_RE_LEV != 0}"> <!-- 답글인 경우 -->
					 	<c:forEach var="a" begin="0" end ="${b.BOARD_RE_LEV*2}" step="1">
					 		&nbsp;
					 	</c:forEach>
					 	 <img src='images/AnswerLine.gif'>
					 </c:if>
					 <c:if test = "${b.BOARD_RE_LEV ==0}"> <!-- 원문인 경우 -->
					 	&nbsp;
					 </c:if>
					 <a href="BoardDetailAction.bo?num=${b.BOARD_NUM }">
					 	${b.BOARD_SUBJECT}
					 </a>
				</div>
			</td>
			<td>
				<div>${b.BOARD_NAME}</div>
			</td>
			<td>
				<div>${b.BOARD_DATE}</div>
			</td>
			<td>
				<div>${b.BOARD_READCOUNT}</div>
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
                     <a href="adminPage.net?page2=${page2-1 }"
                        class="page-link">이전</a>&nbsp;
                     </li>
                  </c:if>
                  
                  <c:forEach var="a" begin="${startpage2 }" end="${endpage2 }">
                     <c:if test="${a == page2 }">
                        <li class="page-item">
                           <a href="adminPage.net?page2=${a }" class="page-link">${a }</a>
                        </li>
                     </c:if>
                     <c:if test="${a != page2 }">
                        <li class="page-item">
                           <a href="adminPage.net?page2=${a }"
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
                        <a href="adminPage.net?page2=${page2+1 }"
                           class="page-link ">&nbsp;다음</a>
                     </li>
                  </c:if>
               </ul>
            </div>
         </div>
      </div> 
</c:if>
 
<!--  게시글이 없는 경우 -->
<c:if test ="${listcount2 == 0 }">
	<font size =5>등록된 글이 없습니다.</font>
</c:if><br>
<button id = "addBoard_Button" type = "button" class = "btn btn-info float-right">글쓰기</button>
