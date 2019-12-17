<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix ="c"  uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page ="../mainActivity/navbar.jsp"/>
<link rel="stylesheet" type="text/css"
	href="assets/css/board.css" />
 

<meta charset="UTF-8">
<title>리뷰 게시판</title>
</head>
<body> 
<script src="js/reviewlist.js"></script>
<c:if test ="${listcount > 0 }">
	<div class = "rows ">
		<span class = "sp">목록 갯수</span>
		<br>
		<select class = "form-control"  id = "viewcount3" >
			<option value = "1">1</option>
			<option value = "3">3</option>
			<option value = "5">5</option>
			<option value = "7">7</option>
			<option value = "10" selected>10</option>
		</select>
	</div>

<div class = "container">
<%-- 게시글이 있는 경우 --%>
	<table class = "table">
	<thead>
		<tr>
			<th colspan = "3">리뷰 게시판</th>
			<th colspan = "3">
				<font size=3>글 개수 : ${listcount }</font>
			</th>
		</tr>
		<tr>
			<th><div>번호</div></th>
			<th><div>콘서트</div></th>
			<th><div>제목</div></th>
			<th><div>작성자</div></th>
			<th><div>날짜</div></th>
			<th><div>조회수</div></th>
		</tr>
	</thead>
	<tbody>
	<c:set var ="num" value = "${listcount-(page-1)*10}"/>
	<c:forEach var ="r" items="${reviewlist}">	
		<tr>
			<td>
				<c:out value="${num }"/>
				<c:set var = "num" value ="${num-1}"/> 
			</td>
			<td>
				<div>
					<img src='images/${r.concert_image }'/>
				</div>
			</td>
			<td>
				<a href="ReviewDetailAction.rv?num=${r.review_id }">
					${r.review_title}
				</a>
			</td>
			<td>
				<div>${r.member_id}</div>
			</td>
			<td>
				<div>${r.review_date}</div>
			</td>
			<td>
				<div>${r.review_readcount}</div>
			</td>
		</tr>
	</c:forEach>
	</tbody>
	</table> 
	
	</div>
	
	<div class="center-block">
         <div class="row">
            <div class="col">
               <ul class="pagination">
                  <c:if test="${page <= 1 }">
                     <li class="page-item">
                     <a class="page-link" href="#">이전&nbsp;</a>
                     </li>
                  </c:if>
                  <c:if test="${page > 1 }">
                     <li class="page-item">
                     <a href="ReviewList.rv?page=${page-1 }"
                        class="page-link">이전</a>&nbsp;
                     </li>
                  </c:if>
                  
                  <c:forEach var="a" begin="${startpage }" end="${endpage }">
                     <c:if test="${a == page }">
                        <li class="page-item">
                           <a class="page-link" href="#">${a }</a>
                        </li>
                     </c:if>
                     <c:if test="${a != page }">
                        <li class="page-item">
                           <a href="ReviewList.rv?page=${a }"
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
                        <a href="ReviewList.rv?page=${page+1 }"
                           class="page-link">&nbsp;다음</a>
                     </li>
                  </c:if>
               </ul>
            </div>
         </div>
      </div> 
</c:if>
 
<!--  게시글이 없는 경우 -->
<c:if test ="${listcount == 0 }">
	<font size =5>등록된 글이 없습니다.</font>
</c:if>
<button id = "addReview_Button" type = "button" class = "btn btn-info">글쓰기</button>
</body>
</html>