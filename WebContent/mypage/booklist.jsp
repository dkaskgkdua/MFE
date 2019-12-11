<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <script src="js/booklist.js"></script>
		<!-- 게시글이 있는 경우 -->
		<c:if test="${listcount > 0}">
			<div class = "rows ">
				<span class = "sp">목록 갯수</span>
				<select class = "form-control"  id = "viewcount" >
					<option value = "1">1</option>
					<option value = "3">3</option>
					<option value = "5">5</option>
					<option value = "7">7</option>
					<option value = "10" selected>10</option>
				</select>
			</div>
			
		<div class="container">
			<table class="table">
				<thead>
					<tr>
						<th colspan = "4">예매내역</th>
						<th colspan = "3">
							<font size=3>예매 목록 개수 : ${listcount }</font>
						</th>
					</tr>
					<tr>
						<th width="10%" class="th">예매번호</th>
						<th width="20%" class="th">예매일</th>
						<th width="25%" class="th">공연명</th>
						<th width="20%" class="th">관람일시</th>
						<th width="5%" class="th">매수</th>
						<th width="10%" class="th">티켓번호</th>
						<th width="10%" class="th">예매취소</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="num" value="${listcount-(page-1)*10 }"/>
					<c:forEach var="b"  items="${booklist}">
					<tr>
						<td>
							<div><c:out value="${num }"/></div>
							<c:set var="num" value="${num-1 }"/>
						</td>
						<td>
							<div>${b.book_date}</div>
						</td>
						<td>
							<div><a href="#" id="concert_detail">${b.concert_name}</a></div>	
						</td>
						<td>
							<div>${b.concert_day}</div>	
						</td>
						<td>
							<div>${b.book_amount}</div>
						</td>
						<td>
							<div>${b.book_eticket}</div>
						</td>
						<td>
							<div>
								<a href = "#">
									<button class = "btn btn-danger" data-toggle = "modal" data-target = "#myModal">삭제</button>
								</a>
							</div>
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
	                     <a href="mypage.bk?page=${page-1 }"
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
	                           <a href="mypage.bk?page=${a }"
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
	                        <a href="mypage.bk?page=${page+1 }"
	                           class="page-link">&nbsp;다음</a>
	                     </li>
	                  </c:if>
	               </ul>
	            </div>
	         </div>
	      </div> 
		</c:if>
		
		<!-- 게시글이 없는 경우 -->
		<c:if test="${listcount == 0}">
			<font size=5>예매내역이 없습니다.</font>
		</c:if>
		<br>
		
		
	<div class="modal" id="myModal">
      <div class="modal-dialog">
         <div class="modal-content">
            <!-- Modal body -->
            <div class="modal-body">
               <form name="deleteForm" action="BookDeleteAction.bk"
                  method="post">
                  <input type="hidden" name="num" value="${param.num}">

                  <div class="form-group">
                     <label for="pwd">비밀번호</label> 
                        <input type="password"
                        class="form-control" placeholder="Enter password"
                        name="member_password" id="member_password">
                  </div>
                  <button type="submit" class="btn btn-primary" >Submit</button>
                   <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
               </form>
            </div>
         </div>
      </div>
   </div>	