<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page ="../mainActivity/navbar.jsp"/>
<title>관리자 페이지</title>

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
									<li><a href="#" data-tab="tab-1" class="active">회원 관리</a></li>
									<li><a href="#" data-tab="tab-2">자유게시판 관리</a></li>
									<li><a href="#" data-tab="tab-3">고객센터(상담)</a></li>
								</ul>
								<div class="tabs">

									<!-- Tab 1 -->
										<div class="tab tab-1 flex flex-3 active">
											<jsp:include page ="../member/member_list.jsp"/>
										</div>

									<!-- Tab 2 -->
										<div class="tab tab-2 flex flex-3">
											<!-- Video Thumbnail -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic06.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- Video Thumbnail -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic05.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- Video Thumbnail -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic04.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- Video Thumbnail -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic03.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- Video Thumbnail -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic02.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- Video Thumbnail -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic01.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
										</div>

									<!-- Tab 3 -->
										<div class="tab tab-3 flex flex-3">
											<!-- Video Thumbnail -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic03.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- Video Thumbnail -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic02.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- Video Thumbnail -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic01.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- Video Thumbnail -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic06.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- Video Thumbnail -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic05.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- Video Thumbnail -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic04.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
										</div>

								</div>
							</div>
					</div>
				</section>
</div>


</body>
</html>