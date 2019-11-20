<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class ="container">
<form name = "joinform">
	<div class = "form-group">
	<label for = "id"><b>���̵�</b></label>
	<input type="text" id = "id" name = "id" placeholder="Enter id" required maxLength="12">
	<span id="message"></span>
	</div>
	<div class = "form-group">
	<label for = "pass"><b>��й�ȣ</b></label>
	<input type="text" id = "pass" name = "pass" placeholder="Enter password" required>
	</div>
	<div class = "form-group">
	<label for = "name"><b>�̸�</b></label>
	<input type="text" id = "name" name = "name" placeholder="Enter name" required maxLength="15">
	</div>
	<div class = "form-group">
	<label for = "age"><b>����</b></label>
	<input type="text" id = "age" name = "age" placeholder="Enter age" required maxLength="2">
	</div>
	
	<div class = "form-group">
		<label><b>����</b></label>
		<input type="radio" name = "gender" value="��" checked><span>����</span>
		<input type="radio" name = "gender" value="��" ><span>����</span>
	</div>
	
	<label for = "email"><b>�̸��� �ּ�</b></label>
	<input type="text" id = "email" name = "email" placeholder="Enter email" required>
	<span id ="email_message"></span>
	
	<div class = "clearfix">
		<button type = "submit" class = "submitbtn">ȸ������</button>
		<button type = "reset" class = "cancelbtn">�ٽ��ۼ�</button>
	</div>
	</form>
	</div>
</body>
</html>