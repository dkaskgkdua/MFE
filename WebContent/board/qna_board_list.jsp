<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../mainActivity/navbar.jsp" />
<script src="js/boardlist.js">
	
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="rows ">
		<span class="sp">목록 갯수</span> <select class="form-control"
			id="viewcount">
			<option value="1">1</option>
			<option value="3">3</option>
			<option value="5">5</option>
			<option value="7">7</option>
			<option value="10" selected>10</option>
		</select>
	</div>

	<div class="container">
		<font size=3>글 개수 : ${listcount }</font>


		<%-- 게시글이 있는 경우 --%>
		<c:if test="${listcount > 0 }">
			<c:forEach var="b" items="${boardlist}">
				<!-- 답글인 경우 -->
				<c:if test="${b.BOARD_RE_LEV != 0}">
					<tr>
						<!-- 들여쓰기 -->
						<c:forEach var="a" begin="0" end="${b.BOARD_RE_LEV*2}" step="1">
								&nbsp;
							</c:forEach>
						<td rowspan=2><img src='images/AnswerLine.gif'></td>
						<td><a href="BoardDetailAction.bo?num=${b.BOARD_NUM }"> <font
								size=4>${b.BOARD_SUBJECT }</font>
						</a></td>
						<td><a href="BoardDetailAction.bo?num=${b.BOARD_NUM }"> <font
								size=3>${b.BOARD_CONTENT }</font></a></td>
					</tr>
				</c:if>

				<!-- 원문인 경우 -->
				<c:if test="${b.BOARD_RE_LEV ==0}">
					<c:set var="num" value="${listcount-(page-1)*10}" />
					<div>
						<font size=2> 글번호 &nbsp;<c:out value="${num }" />
						</font>
					</div>

					<c:set var="num" value="${num-1}" />

					<div>
						<font size=3>${b.BOARD_NAME }</font> <font size=2>${b.BOARD_DATE}</font>
					</div>
					<div>
						<a href="BoardDetailAction.bo?num=${b.BOARD_NUM }"> <strong><font
								size=4>${b.BOARD_SUBJECT }</font></strong>
						</a>
					</div>
					<div class="board_content">
						<a href="BoardDetailAction.bo?num=${b.BOARD_NUM }"> <font
							size=2>${b.BOARD_CONTENT }</font>
						</a>
					</div>
				</c:if>
			</c:forEach>
		</c:if>

		<!--  게시글이 없는 경우 -->
		<c:if test="${listcount == 0 }">
			<tr>
				<td colspan="5"
					style="text-align: center; height: 150px; line-height: 150px;">등록된
					글이 없습니다.</td>
			</tr>
		</c:if>
	</div>

	<button id="addBoard_Button" type="button"
		class="btn btn-info float-right">글쓰기</button>


	<c:if test="${listcount != 0 }">
		<div class="center-block">
			<div class="row">
				<div class="col">
					<ul class="pagination">
						<c:if test="${page <= 1 }">
							<li class="page-item"><a class="page-link" href="#">이전&nbsp;</a>
							</li>
						</c:if>
						<c:if test="${page > 1 }">
							<li class="page-item"><a href="BoardList.bo?page=${page-1 }"
								class="page-link">이전</a> &nbsp;</li>
						</c:if>

						<c:forEach var="a" begin="${startpage }" end="${endpage }">
							<c:if test="${a == page }">
								<li class="page-item"><a class="page-link" href="#">${a }</a>
								</li>
							</c:if>
							<c:if test="${a != page }">
								<li class="page-item"><a href="BoardList.bo?page=${a }"
									class="page-link">${a }</a></li>
							</c:if>
						</c:forEach>

						<c:if test="${page >= maxpage }">
							<li class="page-item"><a class="page-link" href="#">&nbsp;다음</a>
							</li>
						</c:if>
						<c:if test="${page < maxpage }">
							<li class="page-item"><a href="BoardList.bo?page=${page+1 }"
								class="page-link">&nbsp;다음</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</c:if>

</body>
</html>