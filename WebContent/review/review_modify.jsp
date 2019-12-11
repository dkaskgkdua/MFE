<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page ="../mainActivity/navbar.jsp"/>
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<script src="js/writeform2.js" charset="UTF-8"></script>
<title>리뷰 수정 페이지</title>
<style>
.container {
	margin : 0 auto;
	width : 70%;
	height : 70%;
	background : white;
	margin-top : 100px;
}
label {
	color : black !important;
}
h1 {
	font-size : 1.5rem;
	text-align  :center;
	color : #1a92b9;
}
#upfile{display:none}

</style>
</head>
<body>
<div class = "container">
<form action="ReviewModifyAction.rv" method="post" name ="modifyform" enctype="multipart/form-data" >
	<input type="hidden" name = "REVIEW_ID" value="${reviewbean.review_id}">
	<h1>리뷰 수정</h1>
	<div class="form-group">
		<label for="member_id">글쓴이</label>
		<input type="text" class="form-control" value="${reviewbean.member_id}" readOnly>
	</div>
	<div class = "form-group">
		<label for="review_pass">비밀번호</label>
		<input name = "REVIEW_PASS" id = "review_pass" type="password" maxlength="30"
			   class = "form-control" placeholder ="Enter review_pass" value="">
	</div>
	<div class="form-group">
		<label for="review_title">제목</label>
		<input type="text" name="REVIEW_TITLE" id="review_title" maxlength="100"
			   class="form_control" value="${reviewbean.review_title}">
	</div>
	<div class="form-group">
		<label for="review_content">내용</label>
		<textarea name = "REVIEW_CONTENT" id="review_content"
				  class = "form-control" rows="15">${reviewbean.review_content}</textarea>
	</div>

	<div class="form-group">
		<button type="submit" class="btn btn-primary">수정</button>
		<button type="reset" class="btn btn-danger" onClick="history.go(-1)">취소</button>
	</div>
</form>
</div>
</body>
</html>