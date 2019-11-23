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
      <!-- Header -->
         <header id="header">
            <h1><a href="#">MFE <span>by</span></a></h1>
            <div>
            <button type ="button" class = "btn btn-secondary"><span class = "glyphicon glyphicon-tasks" aria-hidden="true"></span></button>
            <!--  �˻� �ؽ�Ʈ -->
        	 <input class = "search_Text"type="text" id ="search_Text" placeholder = "search...">
            <button id = "search_Button" type ="button" class = "btn btn-secondary"><span class = "glyphicon glyphicon-search" aria-hidden="true"></span></button>
            <button type ="button" class = "btn btn-secondary" data-toggle="modal" data-target="#login_Modal"><span class = "glyphicon glyphicon-user" aria-hidden="true"></span></button>
            <a href="#menu">Menu</a>
            </div>
         </header>

      <!-- Nav -->
         
         <nav id="menu">
         	
            <ul class="links">
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">---��ȸ������ �������� �κ�--- </a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">�α���1 </a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">ȸ������</a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Ŀ�´�Ƽ</a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">������ </a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">------ȸ�� --------</a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">���������� </a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Ƽ�ϰ���</a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">��ٱ���</a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">���� </a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Ŀ�´�Ƽ</a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">������ </a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">�α׾ƿ� </a></li>
            </ul>
         </nav>

       
        <div id="main">
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
                     <h3>Vestibullum</h3>
                     <ul class="alt">
                        <li><a href="#">Nascetur nunc varius commodo.</a></li>
                        <li><a href="#">Vis id faucibus montes tempor</a></li>
                        <li><a href="#">Massa amet lobortis vel.</a></li>
                        <li><a href="#">Nascetur nunc varius commodo.</a></li>
                     </ul>
                  </div>
                  <div class="col">
                     <h3>Lobortis</h3>
                     <ul class="alt">
                        <li><a href="#">Nascetur nunc varius commodo.</a></li>
                        <li><a href="#">Vis id faucibus montes tempor</a></li>
                        <li><a href="#">Massa amet lobortis vel.</a></li>
                        <li><a href="#">Nascetur nunc varius commodo.</a></li>
                     </ul>
                  </div>
                  <div class="col">
                     <h3>Accumsan</h3>
                     <ul class="alt">
                        <li><a href="#">Nascetur nunc varius commodo.</a></li>
                        <li><a href="#">Vis id faucibus montes tempor</a></li>
                        <li><a href="#">Massa amet lobortis vel.</a></li>
                        <li><a href="#">Nascetur nunc varius commodo.</a></li>
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
               &copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Coverr</a>. Video: <a href="https://coverr.co">Coverr</a>.
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
        				<form action="#" id = "login_form">
						 <fieldset>
					    	<div class = "form-group">
								<label for ="login_id" class="modalBlack">���̵�</label>
								<input type="text" class="form-control" id="login_id"
								   placeholder = "Enter id" name="login_id" required maxLength="12">
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
        			<button type="submit" class="btn btn-primary" >�α���</button>
         			<button type="button" class="btn btn-danger" data-dismiss="modal">���</button>
         			<button type="button" class="btn btn-info" data-dismiss="modal" data-toggle="modal" data-target="#addMember_Modal"> ȸ������</button>
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
        				<form action="#" id = "addMember_form">
						 <fieldset>
					    	<div class = "form-group">
								<label for ="addMember_id" class="modalBlack">���̵�</label>
								<input type="text" class="form-control" id="addMember_id"
								   placeholder = "Enter id" name="addMember_id" required maxLength="12">
								<span id = "addMember_id_message"></span>
							</div>
							<div class = "form-group">
								<label for ="addMember_pass" class="modalBlack">��й�ȣ</label>
								<input type="password" class="form-control" id="addMember_pass"
								   placeholder = "Enter password" name="addMember_pass" required>
							</div>
							<div class = "form-group">
								<label for = "addMember_name" class="modalBlack">�̸�</label>
								<input type="text" id = "addMember_name" name = "addMember_name" placeholder="Enter name" required maxLength="15">
							</div>
							<div class = "form-group">
								<label for = "addMember_age" class="modalBlack">����</label>
								<input type="text" id = "addMember_age" name = "addMember_age" placeholder="Enter age" required maxLength="2">
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
      // ȸ������ id üũ
      
      	$(document).ready(function(){
			$("#addMember_id").on('keyup', function() {
				//ó���� pattern�� �������� ���� ��� �޽��� ��� ��
				// ������ �����͸� �Է��ص� ��� ���� ������ ����ϹǷ�
				// �̺�Ʈ ������ ������ ����д�.
				$("addMember_id_message").empty();
				// \w => [A-Za-z0-9_]
				var pattern = /^\w+@\w*[.]\w{3}$/;
				var id =$("#addMember_id").val();
				
				if(!pattern.test(id)) {
					$("#addMember_id_message").css('color', 'red')
										.html("�̸��� �������� �����ּ���.");
					return;
				}
				$.ajax({
					url : "../idCheckServlet",
					type : 'post',
					data : {"id": id},
					success : function(rdata) {
						if(rdata == -1) {
							$("#addMember_id_message").css('color', 'green').html(
									"��� ������ ���̵� �Դϴ�.");
						} else {
							$("#addMember_id_message").css('color', 'blue').html(
									 "������� ���̵� �Դϴ�.");
						}
					}//if
				});//ajax
				
			});// keyup
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
		     $.noConflict();
		
		     $('.slider').slick({
		    	  centerMode: true,
		    	  slidesToShow: 10,
		    	  infinite :true,
		    	  slidesToscroll : 8,
		    	  responsive: [
		    	    {
		    	      breakpoint: 768,
		    	      settings: {
		    	        arrows: false,
		    	        centerMode: true,
		    	        slidesToShow: 7
		    	      }
		    	    },
		    	    {
		    	      breakpoint: 480,
		    	      settings: {
		    	        arrows: false,
		    	        centerMode: true,
		    	        slidesToShow: 3
		    	      }
		    	    }
		    	  ]
		    	});
      	});
         </script>
 
 

   </body>
</html>