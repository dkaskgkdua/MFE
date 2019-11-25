<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix ="c"  uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page ="header.jsp"/>
<style>
	.center-block {
		display : flex;
		justify-content:center; /* ��� ���� */
	}
</style>
<script>
	$(function() {
		$('button').click(function() {
			location.href ="BoardWrite.bo";
		});
	});
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class = "container"></div>
<%-- �Խñ��� �ִ� ��� --%>
<c:if test ="${listcount > 0 }">
	<table class = "table table-striped">
		<tr>
			<th colspan = "3">MVC �Խ��� - list</th>
			<th colspan = "2">
				<font size=3>�� ���� : ${listcount }</font>
			</th>
		</tr>
		<tr>
			<th width = "8%"><div>��ȣ</div></th>
			<th width = "50%"><div>����</div></th>
			<th width = "14%"><div>�ۼ���</div></th>
			<th width = "17%"><div>��¥</div></th>
			<th width = "11%"><div>��ȸ��</div></th>
		</tr>
	<c:set var ="num" value = "${listcount-(page-1)*10}"/>
	<c:forEach var ="b" items="${boardlist}">
		<tr>
			<td>
			<c:out value="${num }"/><%-- num ��� --%>
			<c:set var = "num" value ="${num-1}"/> <%-- num = num-1 �ǹ��� --%>
			</td>
			<td>
				<div>
					<%-- �亯�� ����տ� ���� ó�� �κ�
						 BOARD_RE_LEV, BOARD_RE_LEV, BOARD_NUM,
						 OBARD_SUBJECT, BOARD_NAME, BOARD_DATE,
						 BOARD_READCOUNT : property �̸�
					 --%>
					 <c:if test ="${b.BOARD_RE_LEV != 0}"> <!-- ����� ��� -->
					 	<c:forEach var="a" begin="0" end ="${b.BOARD_RE_LEV*2}" step="1">
					 	&nbsp;
					 	</c:forEach>
					 </c:if>
					 <c:if test = "${b.BOARD_RE_LEV ==0}"> <!-- ������ ��� -->
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
	</table>
	
	<div class="center-block">
         <div class="row">
            <div class="col">
               <ul class="pagination">
                  <c:if test="${page <= 1 }">
                     <li class="page-item">
                     <a class="page-link" href="#">����&nbsp;</a>
                     </li>
                  </c:if>
                  <c:if test="${page > 1 }">
                     <li class="page-item">
                     <a href="BoardList.bo?page=${page-1 }"
                        class="page-link">����</a>&nbsp;
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
                           <a href="BoardList.bo?page=${a }"
                              class="page-link">${a }</a>
                        </li>
                     </c:if>
                  </c:forEach>
                  
                  <c:if test="${page >= maxpage }">
                     <li class="page-item">
                        <a class="page-link" href="#">&nbsp;����</a>
                     </li>
                  </c:if>
                  <c:if test="${page < maxpage }">
                     <li class="page-item">
                        <a href="BoardList.bo?page=${page+1 }"
                           class="page-link">&nbsp;����</a>
                     </li>
                  </c:if>
               </ul>
            </div>
         </div>
      </div> 
</c:if>
<!--  �Խñ��� ���� ��� -->
<c:if test ="${listcount == 0 }">
	<font size =5>��ϵ� ���� �����ϴ�.</font>
</c:if><br>
<button type = "button" class = "btn btn-info float-right">�۾���</button>
</body>
</html>