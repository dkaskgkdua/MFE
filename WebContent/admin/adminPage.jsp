<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix ="c"  uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page ="../mainActivity/navbar.jsp"/>
<title>관리자 페이지</title>
<style>
	.center-block {
		display : flex;
		justify-content:center; /* 가운데 정렬 */
	}
	.table {
		background-color : white !important;
	}
	th, td {
		color : black !important;
		text-align : center !important;
	}
	li .current {
		background: #bfbebe !important;
	}
	.search_member {
		margin-top : 5%;
		margin-left : 20%;
	}
	.size {
		width : 100%;
	}
	#viewcount {
		float : left;
		width : 100px;
		height : 40px;
		font-size : 10pt;
	}
	#search_word {
		float : left;
		width : 40%;
		height : 40px;
		margin-left : 1%;
		
	}
	#search_btn {
		float : left;
		width : 50px;
		height : 40px;
		margin-left : 1%;
		
	}
	table caption{
		caption-side:top;
		text-align:center;  
		font-size : 30pt;
		font-weight:bold;
		color : white;
	}
	
	.huWidth {
		width : 100% !important;
	}
	.memberDetail{
		color : black !important;
	}
	.memberDetail:hover {
		background-color : white !important;
		color : #5426f3 !important;
	}
	.rows {
		margin-top : 2%;
		width : 24%;
		float : right;
		margin-bottom : 2%;
	}
	#viewcount2 {
		display : inline;
		width : 30%;
		height : 28px;
	}
	.sp {
		display : inline;
	}
	.gray { 
		background : gray;
	}
</style>
 <script src="js/adminJS.js"></script>
</head>
<body>
<div id="main">
<section class="wrapper style2">
					<div class="inner">
						<header>
							<h2>MFE 관리자 페이지</h2>
							<p>관리자 아자아자아자!</p>
						</header>
						<!-- Tabbed Video Section -->
							<div class="flex flex-tabs">
								<ul class="tab-list">
								<c:if test="${page != null}"> 
									<li><a href="#" data-tab="tab-1" class="active">회원 관리</a></li>
								</c:if>
								
									<li><a  id = "boardTab" href="#" data-tab="tab-2">자유게시판 관리</a></li>
									<li><a href="#" data-tab="tab-3">콘서트 관리</a></li>
									<li><a href="#" data-tab="tab-4">고객센터(상담)</a></li>
								</ul>
								<div class="tabs">

									<!-- Tab 1 -->
										<div class="tab tab-1 flex flex-3 active">
											<jsp:include page ="./member_list.jsp"/>
										</div>

									<!-- Tab 2 -->
										<div class="tab tab-2 flex flex-3">
											<jsp:include page ="./admin_board.jsp"/>
										</div>
									<!-- Tab 3 -->
										<div class="tab tab-3 flex flex-3">
											
										</div>
									<!-- Tab 4 -->
										<div class="tab tab-4 flex flex-3">
											
										</div>

								</div>
							</div>
					</div>
				</section>
</div>


</body>
</html>