<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
   <head>
      <title>Music For Everyone</title>
<script>
	$(function(){
		// 추천버튼 클릭시(추천 추가 또는 추천 제거)
		$("#rec_update").click(function(){
			$.ajax({
				url: "/expro/RecUpdate.do",
                type: "POST",
                data: {
                    no: ${content.board_no},
                    id: '${id}'
                },
                success: function () {
			        recCount();
                },
			})
		})
		
		// 게시글 추천수
	    function recCount() {
			$.ajax({
				url: "/expro/RecCount.do",
                type: "POST",
                data: {
                    no: ${content.board_no}
                },
                success: function (count) {
                	$(".rec_count").html(count);
                },
			})
	    };
	    recCount(); // 처음 시작했을 때 실행되도록 해당 함수 호출
</script>
   </head>
   <body>
      <!-- 헤더 -->
         <jsp:include page="navbar.jsp"/>
       	<section id="banner">
       		<div class ="inner">
       			<header>
       				<h1>Music For Everyone</h1>
       				<p>다양한 공연을 즐기세요</p>
       			</header>
       			<a href="#main" class="button big alt scrolly">Start</a>
       		</div>
       	</section>
        <div id="main">
        <section class = "listWrapper">
           <h4>맞춤형 콘서트</h4>
          <div class="slider">
     		<div class="item"><img src="http://picsum.photos/id/239/550/550">
				<c:if test="${ id == null }">
				<button type="button" class="btn btn-secondary heart" id="rec_update">
					<span class="glyphicon glyphicon-heart-empty rec_count" aria-hidden="true"></span>
				</button>				
			</c:if>
			<c:if test="${ id != null }">
				<button type="button" class="btn btn-secondary heart" id="rec_update">
					<span class="glyphicon glyphicon-heart-empty rec_count" aria-hidden="true"></span>
				</button>
			</c:if>
			</div>
     		<div class="item"><img src="http://picsum.photos/id/240/550/550"><button type ="button" class = "btn btn-secondary heart"><span class = "glyphicon glyphicon-heart-empty" aria-hidden="true"></span></button></div>
     		<div class="item"><img src="http://picsum.photos/id/241/550/550"><button type ="button" class = "btn btn-secondary heart"><span class = "glyphicon glyphicon-heart-empty" aria-hidden="true"></span></button></div>
     		<div class="item"><img src="http://picsum.photos/id/242/550/550"><button type ="button" class = "btn btn-secondary heart"><span class = "glyphicon glyphicon-heart-empty" aria-hidden="true"></span></button></div>
     		<div class="item"><img src="http://picsum.photos/id/243/550/550"><button type ="button" class = "btn btn-secondary heart"><span class = "glyphicon glyphicon-heart-empty" aria-hidden="true"></span></button></div>
     		<div class="item"><img src="http://picsum.photos/id/244/550/550"><button type ="button" class = "btn btn-secondary heart"><span class = "glyphicon glyphicon-heart-empty" aria-hidden="true"></span></button></div>
     		<div class="item"><img src="http://picsum.photos/id/244/550/550"><button type ="button" class = "btn btn-secondary heart"><span class = "glyphicon glyphicon-heart-empty" aria-hidden="true"></span></button></div>
     		<div class="item"><img src="http://picsum.photos/id/239/550/550"><button type ="button" class = "btn btn-secondary heart"><span class = "glyphicon glyphicon-heart-empty" aria-hidden="true"></span></button></div>
     		<div class="item"><img src="http://picsum.photos/id/249/550/550"><button type ="button" class = "btn btn-secondary heart"><span class = "glyphicon glyphicon-heart-empty" aria-hidden="true"></span></button></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"><button type ="button" class = "btn btn-secondary heart"><span class = "glyphicon glyphicon-heart-empty" aria-hidden="true"></span></button></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"><button type ="button" class = "btn btn-secondary heart"><span class = "glyphicon glyphicon-heart-empty" aria-hidden="true"></span></button></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"><button type ="button" class = "btn btn-secondary heart"><span class = "glyphicon glyphicon-heart-empty" aria-hidden="true"></span></button></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"><button type ="button" class = "btn btn-secondary heart"><span class = "glyphicon glyphicon-heart-empty" aria-hidden="true"></span></button></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"><button type ="button" class = "btn btn-secondary heart"><span class = "glyphicon glyphicon-heart-empty" aria-hidden="true"></span></button></div>
   	     </div>
   	     </section>
		<section class = "listWrapper">
		 <h4>힙합 콘서트</h4>
          <div class="slider">
     		<div class="item"><img src="http://picsum.photos/id/239/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/240/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/241/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/242/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/243/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/244/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/244/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/239/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/249/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
   	     </div>
   	     </section>
   	     <section class = "listWrapper">
          <div class="slider">
     		<div class="item"><img src="http://picsum.photos/id/239/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/240/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/241/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/242/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/243/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/244/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/244/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/239/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/249/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
   	     </div>
   	     </section>
   	     <section class = "listWrapper">
          <div class="slider">
     		<div class="item"><img src="http://picsum.photos/id/239/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/240/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/241/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/242/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/243/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/244/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/244/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/239/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/249/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
   	     </div>
   	     </section>
   	     <section class = "listWrapper">
          <div class="slider">
     		<div class="item"><img src="http://picsum.photos/id/239/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/240/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/241/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/242/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/243/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/244/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/244/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/239/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/249/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
   	     </div>
   	     </section>
   	     <section class = "listWrapper">
          <div class="slider">
     		<div class="item"><img src="http://picsum.photos/id/239/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/240/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/241/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/242/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/243/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/244/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/244/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/239/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/249/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
   	     </div>
   	     </section>
   	     </div>
  				
           

        

      <!-- Footer -->
         <footer id="footer">
            <div class="inner">
               <div class="flex flex-3">
                  <div class="col">
                     <h3>Contact us</h3>
                     <ul class="alt">
                        <li><a href="#">dkaskgkdua@mfe.com</a></li>
                        <li><a href="#">press@mfe.com</a></li>
                        <li><a href="#">Enjoy Your Life!</a></li>
                     </ul>
                  </div>
                  <div class="col">
                     <h3>MFE</h3>
                     <ul class="alt">
                        <li><a href="#">We are hiring!</a></li>
                        <li><a href="#">MFE Zone</a></li>
                     </ul>
                  </div>
                  <div class="col">
                     <h3>Legal</h3>
                     <ul class="alt">
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">Terms of Use</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Cookies Policy</a></li>
                        <li><a href="#">Giveaways T&C's</a></li>
                        <li><a href="#">Vouchers T&C's</a></li>
                     </ul>
                  </div>
               </div>
            </div>
            <div class="copyright">
               <ul class="icons">
                  <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
                  <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                  <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                  <li><a href="#" class="icon fa-snapchat"><span class="label">Snapchat</span></a></li>
               </ul>
               &copy; Untitled. Design: <a href="https://templated.co">MFE-TEAM</a>. Images: <a href="https://unsplash.com">Coverr</a>. Video: <a href="https://coverr.co">Coverr</a>.
            </div>
         </footer>
         
       

         <script>
      
      	$(document).ready(function(){
			//슬릭 이벤트
		     $.noConflict();
		
		     $('.slider').slick({
		    	  centerMode: true,
		    	  slidesToShow: 9,
		    	  infinite :true,
		    	  slidesToscroll : 8,
		    	  responsive: [
		    		{
				       breakpoint: 1600,
				       settings: {
				    	 centerMode: true,
				    	 infinite :true,
				    	 slidesToShow: 8,
				    	 slidesToscroll : 7
				       }
				    },
		    		{
			    	   breakpoint: 1400,
			    	   settings: {
			    	     centerMode: true,
			    	     infinite :true,
			    	     slidesToShow: 7,
			    	     slidesToscroll : 6
			    	   }
			    	 },
			    	 {
				       breakpoint: 1200,
				       settings: {
				         centerMode: true,
				    	 infinite :true,
				    	 slidesToShow: 6,
				    	 slidesToscroll : 5
				       }
				    },
		    	    {
		    	      breakpoint: 1000,
		    	      settings: {
		    	        centerMode: true,
		    	        infinite :true,
		    	        slidesToShow: 5,
		    	        slidesToscroll : 4
		    	      }
		    	    },
		    	    {
		    	      breakpoint: 850,
		    	      settings: {
		    	        centerMode: true,
		    	        infinite :true,
		    	        slidesToShow: 4,
		    	        slidesToscroll : 3
		    	      }
		    	    },
		    	    {
			    	  breakpoint: 700,
			    	  settings: {
			    	    centerMode: true,
			    	    infinite :true,
			    	    slidesToShow: 3,
			    	    slidesToscroll : 3
			    	  }
			    	},
			    	{
				      breakpoint: 550,
				      settings: {
				        arrows: false,
				    	centerMode: true,
				    	infinite :true,
				    	slidesToShow:2,
				    	slidesToscroll : 3
				      }
				    },
				    {
					  breakpoint: 400,
					  settings: {
					    arrows: false,
					    centerMode: true,
					    infinite :true,
					    slidesToShow: 1,
					    slidesToscroll : 3
					  }
					}  
		    	  ]
		    });  //슬릭 이벤트 종료
		     
      	});
         </script>
   </body>
</html>