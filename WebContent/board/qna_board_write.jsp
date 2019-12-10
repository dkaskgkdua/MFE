<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/ckeditor.js"></script>
<script src = "js/writeform.js"></script>
<style>
tr.center-block {
	text-align: center
}

h1 {
	font-size: 1.5rem;
	text-align: center;
	color: #1a92b9
}

.container {
	width: 60%
}

label {
	font-weight: bold;
	color: black !important;
}

#board_content {
	border: 0;
	overflow-y: hidden;
	background: clear;
}

#board_content:focus {
	outline: none;
}

#textarea {
	border: 1px solid #ada4a4;
	border-radius: 4px;
}

#upfile {
	display: none
}

img {
	width: 20px;
}

form {
	background: white !important;
}
</style>
</head>
<body>

<jsp:include page ="../mainActivity/navbar.jsp"/>
<div class="container">
<form action = "BoardAddAction.bo" method="post" enctype="multipart/form-data" name= "boardform">
	<h1>자유게시판 - write 페이지</h1>
	
	<div class="form-group">
		<label for="board_name">글쓴이</label>
		<input name="BOARD_NAME" id="board_name" value="${id}"
				readOnly type="text" size="10" maxlength="30"
				class ="form-control"
				placeholder="Enter board_name">
	</div>
	
	<div class="form-group">
		<label for="board_pass">비밀번호</label>
		<input name="BOARD_PASS" id="board_pass" 
				type="password" size="10" maxlength="30"
				class ="form-control"
				placeholder="Enter board_pass" value="">
	</div>		
	
	<div class="form-group">
		<label for="board_subject">제목</label>
		<input name="BOARD_SUBJECT" id="board_subject" 
				type="text" size="50" maxlength="100"
				class ="form-control"
				placeholder="Enter board_subject" value="">
	</div>	
	
	<div class="form-group">
		<label for="board_content">내용</label>
		<div id = "textarea">
			<textarea name="BOARD_CONTENT" id="board_content"
					  cols="67" rows="10" class="form-control" placeholder = "500자까지 입력 가능합니다."></textarea>
			<span id = "counter"></span>
		</div>	
	</div>
	
	<div class="form-group">
		<label for="board_file">파일 첨부</label>
		<label for="upfile">
			<img id = ig src="./images/attach.png" alt="사막"></label>
		<input type="file" id="upfile" name="BOARD_FILE">
		<span id="filevalue"></span>
	</div>		
	
	<div class="form-group">
		<button type=submit class="btn btn-primary">등록</button>
		<input type = 'button' value = "취소" class = "back" onClick = 'history.back(); return false;'>
	</div>
		
</form>
</div>

</body>
</html>