function show() {
	if ($('#filevalue').text() == '') {
		// 파일 이름이 있는 경우 remove 이미지를 보이게 하고 없는 경우는 보이지 않게 한다.
		$(".remove").css('display', 'none');
	} else {
		$(".remove").css('display', 'inline-block');
	}
};

$(function() {
	var check = 0;

	$("form").submit(function() {
		if ($.trim($("#board_pass").val()) == "") {
			alert("비밀번호를 입력하세요");
			$("input:eq(1)").focus();
			return false;
		}
		if ($.trim($("#board_subject").val()) == "") {
			alert("제목을 입력하세요");
			$("input:eq(2)").focus();
			return false;
		}

		if (check == 0) {
			value = $('#filevalue').text();
			html = "<input type='text' value = '" + value + "' name='check'>";
			$(this).append(html);
		}
	});

	$('#upfile').change(function() {
		check++;
		var inputfile = $(this).val().split('\\');
		$('#filevalue').text(inputfile[inputfile.length - 1]);
		show();
	});

	$('.remove').click(function() {
		$('#filevalue').text('');
		$(this).css('display', 'none');
	});

	// 남은 글자 수 표시
	$("#board_content").keyup(function() {
		var content = $(this).val();
		$("#counter").html(content.length + '/500');
	});
	// 남은 글자 수 표시
	$("#board_content").keyup(function() {
		var content = $(this).val();
		$("#counter").html(content.length + '/500');
	});
	
	CKEDITOR.replace('board_content', {height : 500});
});
