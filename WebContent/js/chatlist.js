$(function(){
	
})

function go(page2){
	var data2 = "page2="+page2;
	ajax(data2);
}
function ajax(data2) {
	console.log(data2)
	output="";
	
	$.ajax({
		type : "POST",
		data : data2,
		url : "mypage.bk",
		dataType : "json",
		cache : false,
		success : function(data2){
			$(".chat_detail").hide();
			
			if(data2.chatlistcount>0){
				$("tbody").remove();
				var num2 = chatlistcount-(page2-1)*5;
				console.log(num2);
				output += '<tbody>';
				$(data2.chatlist).each(
						function(index, item){
							output += '<tr><td><div>' + num2 + '</div></td>'
							output += '<td><button class="chat_date">' + item.chat_log_date + '</button></div></tr>'
							output += '<tr class="chat_detail><td><div>관리자 : ' + item.chat_log_answer + '</div></td>'
							output += '<td><div>'+ id + item.chat_log_content + '</div></td></tr>';
						});
					output += '</tbody>';
					
					$('table').append(output)
					
					$(".pagination").empty();  //페이징 처리
				    output= "";
				    
				    digit = '이전&nbsp;'
				    href="";
				    if(data2.page2 >1) {
				       href = 'href=javascript:go(' + (data2.page2 - 1) + ')';
				    }
				    setPaging(href, digit);
				
				    for (var i = data2.startpage2; i<= data2.endpage2; i++) {
					   digit = i;
					   href= "";
					   if(i != data2.page2){
					      href='href=javascript:go('+i+')';
					   }
					   setPaging(href, digit);
				    }
				    digit = '다음&nbsp;';
				    href="";
				    if(data.page < data.maxpage){
				       href='href=javascript:go('+(data.page+1)+')';
				    }
				    	setPaging(href, digit);

				    $('.pagination').append(output)
				                } //if(data.listcount) end
				    else {
				       $(".container table").remove();
				       $(".center-block").remove();
				       $(".container").append("<font size=5>등록된 글이 없습니다.</font>");
				    }	
		},
		error : function() {
				console.log('에러')
			}
		});
}

