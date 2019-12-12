<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<script src="js/writeform2.js" charset="UTF-8"></script>
<jsp:include page ="../mainActivity/navbar.jsp"/>
<style>
tr.center-block {
	text-align : center
}
h1{
	font-size:1.5rem; 
	text-align:center; 
	color:#1a92b9
}
.container{
	margin : auto;
	margin-top : 3%;
	width : 70%;
	height : 70%;
}
label{
	font-weight:bold;
}
img{
	width:20px;
}

</style>

</head>
<body>
<div class="container">
<form action = "ReviewAddAction.rv" method="post"
		enctype="multipart/form-data" name= "reviewform">
	<h1>리뷰 작성하기</h1>
	<div class="form-group">
		<label for="member_id">글쓴이</label>
		<input name="MEMBER_ID" id="member_id" value="${id}"
				readOnly type="text" size="10" maxlength="30"
				class ="form-control"
				placeholder="Enter id">
	</div>
	<div class="form-group">
		<label for="review_pass">비밀번호</label>
		<input name="REVIEW_PASS" id="review_pass" 
				type="password" size="10" maxlength="30"
				class ="form-control"
				placeholder="Enter password" value="">
	</div>		
	<div class="form-group">
		<label for="review_title">제목</label>
		<input name="REVIEW_TITLE" id="review_title" 
				type="text" size="50" maxlength="100"
				class ="form-control"
				placeholder="Enter review_title" value="">
	</div>	
	<div class="form-group">
		<label for="review_content">내용</label>
		<textarea name="REVIEW_CONTENT" id="review_content"
				  cols="67" rows="10" class="form-control"></textarea>
	</div>
	
	<div class="form-group">
		<button type=submit class="btn btn-primary">등록</button>
		<button type=reset class="btn btn-danger">취소</button>
	</div>
		
</form>
</div>
</body>
</html>