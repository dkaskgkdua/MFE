		$(function() {
			var check = 0;

			$("form")
					.submit(
							function() {
								if ($.trim($("#board_pass").val()) == "") {
									alert("비밀번호를 입력하세요");
									$("#board_pass").focus();
									return false;
								}
							});
			
			// 남은 글자 수 표시
			$("#board_content").keyup(function() {
				var content = $(this).val();
				$("#counter").html(content.length + '/500');
				
				if(content.length >= 500){
					$(this).val(content.substr(0, 500));
					$("#counter").css('background', 'red');
				}else{
					$("#counter").css('background', 'rgba(255, 0, 0, 0.5)');
				}
			});
		});