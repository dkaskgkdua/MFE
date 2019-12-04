<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



	
	<div class="container">
		<!-- 게시글이 있는 경우 -->
		<c:if test="${listcount > 0}">
			<table class="table">
				<caption>예매내역</caption>
				<thead>
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
					<c:set var="num"  value="${listcount-(page-1)*10}" />
					<c:forEach var="b"  items="${booklist}">
					<tr>
						
						<td>
							<div>${b.book_id}</div>
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
		</c:if>
		
		<!-- 게시글이 없는 경우 -->
		<c:if test="${listcount == 0}">
			<font size=5>예매내역이 없습니다.</font>
		</c:if>
		</div>
		
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