<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix ="c"  uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="WebSocket.*" %>
    
<!DOCTYPE HTML>

<html>

<style>
#messageTextArea {background:#ebecf0; color:black;
font-family :'나눔고딕', 'Malgun Gothic', sans-serif;
font-size:15px;
border-radius: 7px;
}
#chat { position:fixed; right:0 ; bottom:8em ; z-index:999 !important;
width:300px;
    height:400px;
}

.chat{float:right; margin-right:10%;
position:fixed; right:0 ; bottom:5em ; z-index:999 !important
}
#chatbar {background:#2565ae; color:white;
border-radius: 7px;
font-family :'나눔고딕', 'Malgun Gothic', sans-serif; text-align:center;
}
#textMessage {background:white; color:black;
border-radius: 7px;
font-family :'나눔고딕', 'Malgun Gothic', sans-serif; }
#sendbox {float:right;}
#send{background:#2565ae; color:white;  }
#send:hover {background:#4fc3f7}
#dis{background:red; color:white; }
</style>
   <head>
      <title>Music For Everyone</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   </head>
   <body>
      <!-- 헤더 -->
         <jsp:include page="navbar.jsp"/>
       	<section id="banner">
       		<div class ="inner">
       		<script>
       		$(document).ready(function() {
    	         $("#textMessage").keydown(function(key) {
    	             if (key.keyCode == 13) {
    	             	sendMessage();
    	             	return false;
    	                
    	             }
    	         });
    	     });
       		

     		function sendMessage() {
     			
     			message = document.getElementById("textMessage");
     			id = "${id}";
     			//messageTextArea.value += id+ "(님) : " +  message.value + "\n"; 
     			
     			//웹소켓으로 textMessage객체의 값을 보낸다.
     		   
     			webSocket.send(id+"(님) : "+ message.value);
               
     			//textMessage객체의 값 초기화
     			message.value = "";
     			

     		}
     		     		
     		
     		//웹소켓 종료
     		function disconnect() {
     			webSocket.close();
     		}
     		
       		
     		$(document).ready(function() {
       		$(".chat").on({
       	        "click" : function() {
       	            if ($(this).attr("src") == "images/open1.png") {
       	                $(".chat").attr("src", "images/cancel.png");
       	                $("#_chatbox").css("visibility", "visible");
       	                
       	             webSocket = new WebSocket("ws://localhost:8088/te/websocket?"+'${id}');
                     
                     messageTextArea = document.getElementById("messageTextArea");
             		
             		//웹 소켓이 연결되었을 때 호출되는 이벤트
             		webSocket.onopen = function(message) {
             			
             			messageTextArea.value += "상담이 시작됩니다..\n";
             		};
             		//웹 소켓이 닫혔을 때 호출되는 이벤트
             		webSocket.onclose = function(message) {
             			messageTextArea.value += "상담이 종료되었습니다.\n";            			
             		};
             		//웹 소켓이 에러가 났을 때 호출되는 이벤트
             		webSocket.onerror = function(message) {
             			messageTextArea.value += "error...\n";
             		};
             		//웹 소켓에서 메시지가 날라왔을 때 호출되는 이벤트
             		webSocket.onmessage = function(message) {
                 
             			messageTextArea.value +=  message.data + "\n";

             		};
       	            	
       	        		
       	                
       	                
       	            } else if ($(this).attr("src") == "images/cancel.png") {
       	                $(".chat").attr("src", "images/open1.png");
       	                $("#_chatbox").css("visibility", "hidden");
       	                disconnect();
       	            }
       	        }
       	    });
     		});
     		
     		//채팅내용이 많아지면 스크롤바가 자동으로 내려감
     		window.setInterval(function() {
     	        var elem = document.getElementById('messageTextArea');
     	        elem.scrollTop = elem.scrollHeight;
     	    }, 0);
       		
       		</script>
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
     		<div class="item"><img src="http://picsum.photos/id/239/550/550"><button type ="button" class = "btn btn-secondary heart"><span class = "glyphicon glyphicon-heart-empty" aria-hidden="true"></span></button></div>
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
  <c:choose>
   <c:when test="${id!=null && !id.equals('admin@mfe.com')}">
   <section>
      <!-- 채팅 부분 -->     
      <div id="chat">
  
	<div id="_chatbox" style="visibility:hidden;" >
			<!-- 결과 메시지 보여주는 창 -->
			<div id="chatbar">고객 상담</div>
			<textarea id="messageTextArea" class="idc" rows="10" cols="50"></textarea>						
			<div><input id="textMessage" type="text" ></div>			
			<div id="sendbox">
		
				<input onclick="sendMessage()" id="send" value="보내기" type="button">
				
				</div>
		</div>

	
	</div>	
	<img class="chat"  src="images/open1.png" />
	</section>	
	</c:when>
	</c:choose>

        

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