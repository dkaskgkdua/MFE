<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page ="../mainActivity/navbar.jsp"/>
<title>마이 페이지</title>

</head>
<body>
<div id="main">
<section class="wrapper style2">
					<div class="inner">
						<header>
							<h2>My Page</h2>
						</header>
						<!-- Tabbed Video Section -->
							<div class="flex flex-tabs">
								<ul class="tab-list">
									<li><a href="#" data-tab="tab-1" class="active">My Tickets</a></li>
									<li><a href="#" data-tab="tab-2">My Favorites</a></li>
									<li><a href="#" data-tab="tab-3">My Info</a></li>
									<li><a href="#" data-tab="tab-4">Counseling</a></li>
									
									

								</ul>
								<div class="tabs">

									<!-- Tab 1 -->
										<div class="tab tab-1 flex flex-3 active">
											<jsp:include page ="booklist.jsp"/>
										</div>

									<!-- Tab 2 -->
										<div class="tab tab-2 flex flex-3">
											<jsp:include page ="likelist.jsp"/>
										</div>

									<!-- Tab 3 -->
										<div class="tab tab-3 flex flex-3">
											<jsp:include page ="../member/updateForm.jsp"/>
										</div>
										
									<!-- Tab 4 -->
									<div class="tab tab-4 flex flex-3">
										<jsp:include page ="counseling.jsp"/>
									</div>

								</div>
							</div>
					</div>
				</section>
</div>


</body>
</html>