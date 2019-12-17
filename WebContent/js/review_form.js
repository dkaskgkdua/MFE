$(document).ready(function() {
	
	$("form").submit(function() {
		if($.trim($("#review_pass").val()) == "") {
			alert("비밀번호를 입력하세요");
			$("input:eq(1)").focus();
			return false;
		}
		if($.trim($("#review_title").val()) == "") {
			alert("제목을 입력하세요");
			$("input:eq(2)").focus();
			return false;
		}
		
	
	});

});