<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
   <head>
      <title>Music For Everyone</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	  
	  <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
      <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
      <script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
	  <link rel="stylesheet" href="assets/css/main.css" />
   </head>
   <body>
      <!-- ��� -->
         <header id="header">
            <h1><a href="#">MFE <span>by</span></a></h1>
            <div>
            <button type ="button" class = "btn btn-secondary"><span class = "glyphicon glyphicon-tasks" aria-hidden="true"></span></button>
            <!--  �˻� �ؽ�Ʈ -->
        	 <input class = "search_Text"type="text" id ="search_Text" placeholder = "search...">
            <button id = "search_Button" type ="button" class = "btn btn-secondary"><span class = "glyphicon glyphicon-search" aria-hidden="true"></span></button>
            <jsp:include page="navbar.jsp"/>
            <a class = "global"href="#menu"><span class = "glyphicon glyphicon-globe" aria-hidden="true"></span></a>
            </div>
         </header>

      <!-- ������ Ȯ��Ǵ� �׺���̼� �� -->
         
         <nav id="menu">
            <ul class="links">
               <li><a href="BoardList.bo" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">�����Խ���</a></li>
               <li><a href="BoardWrite.bo" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">�Խ��� �ۼ�(�ӽ�)</a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">����Խ���</a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">������ </a></li>
            </ul>
         </nav>

       	<section id="banner" data-video="../images/banner">
       		<div class ="inner">
       			<header>
       				<h1>Music For Everyone</h1>
       				<p>�پ��� ������ ��⼼��</p>
       			</header>
       			<a href="#main" class="button big alt scrolly">Start</a>
       		</div>
       	</section>
        <div id="main">
        <section class = "listWrapper">
           <h4>������ �ܼ�Ʈ</h4>
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
		 <h4>���� �ܼ�Ʈ</h4>
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
         
         <!--  �α��� ��� -->
         <div class="modal" id="login_Modal">
    		<div class="modal-dialog">
     			 <div class="modal-content">
      
      			  <!-- Modal Header -->
      			  <div class="modal-header">
      			    <h4 class="modal-title">�α���</h4>
     			    <button type="button" class="close" data-dismiss="modal">&times;</button>
      			  </div>
        
        		  <!-- Modal body -->
       			  <div class="modal-body">
        			  <div class="container uniform">
        				<form method = "post" action="loginProcess.net" id = "login_form" >
						 <fieldset>
					    	<div class = "form-group">
								<label for ="login_id" class="modalBlack">���̵�</label>
								<input type="text" class="form-control" id="login_id"
								   placeholder = "Enter id" name="login_id" required maxLength="30">
								<span id = "login_id_message"></span>
							</div>
							<div class = "form-group">
								<label for ="modal_pass" class="modalBlack">��й�ȣ</label>
								<input type="password" class="form-control" id="login_pass"
								   placeholder = "Enter password" name="login_pass" required>
							</div>
							<div class="6u$ 12u$(small)">
								<input type="checkbox" id="login_remember" name="login_remember" checked>
								<label for="login_remember">Remember me</label>
							</div>
							
						</fieldset>
						</form>
        			</div>
    	    	</div>
        
        <!-- Modal footer -->
       			 <div class="modal-footer">
        			<button id = "login_button" type="submit" class="btn btn-primary" >�α���</button>
         			<button type="button" class="btn btn-danger" data-dismiss="modal">���</button>
         			<button type="button" class="btn btn-info" data-dismiss="modal" data-toggle="modal" data-target="#addMember_Modal"> ȸ������</button>
     			 </div>
        
    		  </div>
    		</div>
  		</div>
         
          <!--  ���� ��� -->
         <div class="modal" id="account_Modal">
    		<div class="modal-dialog">
     			 <div class="modal-content">
      
      			  <!-- Modal Header -->
      			  <div class="modal-header">
      			    <h4 class="modal-title">���� ����</h4>
     			    <button type="button" class="close" data-dismiss="modal">&times;</button>
      			  </div>
        
        		  <!-- Modal body -->
       			  <div class="modal-body">
        			  <div class="container uniform">
        				<form method = "post" action="#" id = "account_form" >
						 <fieldset>
					    	<a href="#">My page</a>
					    	<a href="logOut.net">Logout</a>
         					<button type="button" class="btn btn-danger" data-dismiss="modal">���</button>
						</fieldset>
						</form>
        			</div>
    	    	</div>
    		  </div>
    		</div>
  		</div>
         
         <!-- ȸ������ ��� -->
		<div class="modal" id="addMember_Modal">
    		<div class="modal-dialog">
     			 <div class="modal-content">
      
      			  <!-- Modal Header -->
      			  <div class="modal-header">
      			    <h4 class="modal-title">ȸ������</h4>
     			    <button type="button" class="close" data-dismiss="modal">&times;</button>
      			  </div>
        
        		  <!-- Modal body -->
       			  <div class="modal-body">
        			  <div class="container">
        				<form action="joinProcess.net" id = "addMember_form" method="post">
						 <fieldset>
					    	<div class = "form-group">
								<label for ="addMember_id" class="modalBlack">���̵�</label>
								<input type="text" class="form-control" id="addMember_id"
								   placeholder = "Enter id" name="addMember_id" required>
								<span id = "addMember_id_message"></span>
							</div>
							<div class = "form-group">
								<label for ="addMember_pass" class="modalBlack">��й�ȣ</label>
								<input type="password" class="form-control" id="addMember_pass"
								   placeholder = "Enter password" name="addMember_pass" required maxLength="12">
							</div>
							<div class = "form-group">
								<label for = "addMember_name" class="modalBlack">�̸�</label>
								<input type="text" id = "addMember_name" class="form-control" name = "addMember_name" placeholder="Enter name" required maxLength="15">
							</div>
							<div class = "form-group">
								<label for = "addMember_address" class="modalBlack">�ּ�</label>
								<input type="text" id = "addMember_address"  class="form-control" name = "addMember_address" placeholder="Enter address" required>
							</div>
							<div class = "form-group">
								<label for = "addMember_phone_number" class="modalBlack">��ȭ��ȣ</label>
								<input type="text" id = "addMember_phone_number" class="form-control" name = "addMember_phone_number" placeholder="Enter birthday" required>
							</div>
							<div class = "form-group">
								<label class ="modalBlack">��ȣ�帣</label>
								<input type="checkbox" id="addMember_preference_balad" name="addMember_preference" value = "balad" checked>
								<label for="addMember_preference_balad">�߶��</label>
								<input type="checkbox" id="addMember_preference_rock" name="addMember_preference" value = "rock">
								<label for="addMember_preference_rock">��/��Ż</label>
								<input type="checkbox" id="addMember_preference_rap" name="addMember_preference" value ="rap">
								<label for="addMember_preference_rap">��/����</label>
								<input type="checkbox" id="addMember_preference_jazz" name="addMember_preference" value = "jazz">
								<label for="addMember_preference_jazz">����/�ҿ�</label>
								<input type="checkbox" id="addMember_preference_classic" name="addMember_preference" value = "classic">
								<label for="addMember_preference_classic">Ŭ����</label>
								<input type="checkbox" id="addMember_preference_pop" name="addMember_preference" value="pop">
								<label for="addMember_preference_pop">��</label>
								<input type="checkbox" id="addMember_preference_edm" name="addMember_preference" value="EDM">
								<label for="addMember_preference_edm">EDM</label>
							</div>
							
							<div class="u$(small)">
								<div><label for="male" class = "modalBlack">����</label></div>
								<input type="radio" id = "male" name="addMember_gender" value="1" checked>
								<label for="male" class ="modalBlack">��</label>
								<input type="radio" id = "female" name="addMember_gender" value="2">
								<label for="female" class ="modalBlack">��</label>
							</div>
						</fieldset>
						</form>
        			</div>
    	    	</div>
        
        <!-- Modal footer -->
       			 <div class="modal-footer">
        			<button type="submit" class="btn btn-primary">ȸ������</button>
         			 <button type="button" class="btn btn-danger" data-dismiss="modal">���</button>
     			 </div>
        
    		  </div>
    		</div>
  		</div>
      <!-- Scripts -->
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/jquery.scrolly.min.js"></script>
         <script src="assets/js/skel.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>
         <script>
      
      	$(document).ready(function(){
      		var idCheck = false;
      		
      		$('#login_button').click(function() {
      			$('#login_form').submit();
      		})
      		
      		// ID keyup �̺�Ʈ(�ߺ� Ȯ��)
			$("#addMember_id").on('keyup', function() {
				$("addMember_id_message").empty();
				// \w => [A-Za-z0-9_]
				var pattern = /^\w+@\w*[.]\w{3}$/;
				var id =$("#addMember_id").val();
				
				if(!pattern.test(id)) {
					$("#addMember_id_message").css('color', 'red')
										.html("�̸��� �������� �����ּ���.");
					idCheck = false;
					return;
				}
				$.ajax({
					url : "idcheck.net",
					data : {"id": id},
					success : function(rdata) {
						if(rdata == -1) {
							$("#addMember_id_message").css('color', 'green').html(
									"��� ������ ���̵� �Դϴ�.");
							idCheck=true;
						} else {
							$("#addMember_id_message").css('color', 'blue').html(
									 "������� ���̵� �Դϴ�.");
							idCheck=false;
						}
					}//if
				});//ajax
			});// ID keyup �̺�Ʈ ����
			$('#login_form').submit(function() {
				loginProcess.net
			})
			// ȸ������ ��ȿ�� �˻�
			$('#addMember_form').submit(function() {
				if($('#addMember_id').val()=="") {
					alert("ID�� �Է��ϼ���");
					$('#addMember_id').focus();
					return false;
				}
				if(idCheck == false) {
					alert("ID �ߺ��Ǿ����ϴ�.");
					return false;
				}
				
				if($('#addMember_pass').val()=="") {
					alert("��й�ȣ�� �Է��ϼ���");
					$('#addMember_pass').focus();
					return false;
				}
				if($('#addMember_name').val()=="") {
					alert("�̸��� �Է��ϼ���");
					$('#addMember_name').focus();
					return false;
				}
				if($('#addMember_age').val() =="") {
					alert("���̸� �Է��ϼ���.");
					$('#addMember_age').focus();
					return false;
				}
				if(!$.isNumeric($("input[name='age']").val())) {
					alert("���̴� ���ڷ� �Է��ϼ���");
					$("input[name='age']").val('');
					$("input[name='age']").focus();
					return false;
				}
				
				if($('input[type=radio]:checked').length==0) {
					alert("������ �����ϼ���");
					return false;
				}
			
			}); //ȸ������ ��ȿ�� �˻� ����
			
			
			// �˻� ��ư �̺�Ʈ
			$('#search_Text').hide();
			
			$('#search_Button').click(function() {
				$('#search_Text').toggle();
				$('#search_Button').hide();
				$('#search_Text').focus();
			});
			$('#search_Text').blur(function() {
				$('#search_Button').show();
				$('#search_Text').val('');
				$('#search_Text').hide();
			});
			// �˻� �̺�Ʈ ����
			
			//���� �̺�Ʈ
		     $.noConflict();
		
		     $('.slider').slick({
		    	  centerMode: true,
		    	  slidesToShow: 10,
		    	  infinite :true,
		    	  slidesToscroll : 8,
		    	  responsive: [
		    	    {
		    	      breakpoint: 980,
		    	      settings: {
		    	        arrows: false,
		    	        centerMode: true,
		    	        infinite :true,
		    	        slidesToShow: 7,
		    	        slidesToscroll : 6
		    	      }
		    	    },
		    	    {
		    	      breakpoint: 480,
		    	      settings: {
		    	        arrows: false,
		    	        centerMode: true,
		    	        slidesToShow: 3,
		    	        slidesToscroll : 2
		    	      }
		    	    }
		    	  ]
		    });  //���� �̺�Ʈ ����
		     
      	});
         </script>
   </body>
</html>