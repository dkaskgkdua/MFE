function go(page2){
   var limit2 = $('#viewcount2').val();
   var data = "limit2=" + limit2 + "&state=ajax&page2=" + page2;
   ajax(data);
}

function setPaging(href, digit){
   output += "<li class=page-item>";
   gray="";
   if(href==""){
      gray = "gray";
   }
   anchor = "<a class='page-link triPage " + gray + "'" + href + ">" + digit + "</a></li>";
   output += anchor;
}
function getView(member_id) {
	$.ajax({
		type: "post",
		url : 'member_info.net',
		data : {"MEMBER_ID" : member_id},
		dataType:"json",
		success:function(rdata) {
				$("#view_id").text(rdata.id);
				$("#view_pass").text(rdata.password);
				$("#view_name").text(rdata.name);
				$("#view_address").text(rdata.address);
				$("#view_phone_number").text(rdata.phone_number);
				$("#view_preference").text(rdata.preference);
				$("#view_gender").text(rdata.gender);
		}
	});
};
function ajax(data) {
	console.log(data)
	output="";
	$.ajax({
            type:"POST",
            data: data,
            url : "adminPage.net",
            dataType:"json",
            cache:false,
            success:function(data){
                    $("#viewcount2").val(data.limit2);
                    $(".t2").find("font").text("글 개수 : " + data.listcount2);
                    
                    if(data.listcount2>0) { //총갯수가 1개 이상인 경우
                    	$('.tb2').remove();
                    	var num = data.listcount2 - (data.page2 -1) * data.limit2;
                    	console.log(num)
                    	output = "<tbody class = 'tb2'>";
                    	$(data.boardlist).each(   //<c:forEach var ="b" items="${boardlist}">
                    			function(index, item) {
                    				output += '<tr><td>' + (num--) + '</td>'
                    				blank_count = item.BOARD_RE_LEV * 2 + 1;
                    				blank = '&nbsp;';
                    				for(var i =0; i<blank_count; i++) {
                    					blank += '&nbsp;&nbsp;'	
                    				}
                    				img="";
                    				if(item.BOARD_RE_LEV > 0) {
                    					img="<img src='images/AnswerLine.gif'>";
                    				}

                    				output += "<td><div>" + blank + img
                    				output += '<a href="./BoardDetailAction.bo?num=' + item.BOARD_NUM + '&page=' + data.page2 + '">'

                    				output += item.BOARD_SUBJECT + '</a></div></td>'
                    				output += '<td><div>' + item.BOARD_NAME + '</div></td>'
                    				output += '<td><div>' + item.BOARD_DATE  + '</div></td>'
                    				output += '<td><div>' + item.BOARD_READCOUNT + '</div></td></tr>'
                    			});
                    			output += '</tbody>'
                    			$('.t2').append(output) //table 완성
                    			$(".pa2").empty();  //페이징 처리
                    			output= "";
                    			digit = '이전&nbsp;'
                    			href="";
                    			if(data.page2 >1) {
                    				href = 'href=javascript:go(' + (data.page2 - 1) + ')';
                    			}
                    			setPaging(href, digit);

                    			for (var i = data.startpage2; i<= data.endpage2; i++) {
                    				digit = i;
                    				href= "";
                    				if(i != data.page2){
                    					href='href=javascript:go('+i+')';
                    				}
                    				setPaging(href, digit);
                    			}
                    			digit = '다음&nbsp;';
                    			href="";
                    			if(data.page2 < data.maxpage2){
                    				href='href=javascript:go('+(data.page2+1)+')';
                    			}
                    			setPaging(href, digit);

                    			$('.pa2').append(output)
                    } //if(data.listcount) end
                    else {
                    	$(".t2").remove();
                    	$(".block2").remove();
                    	$(".container2").append("<font size=5>등록된 글이 없습니다.</font>");
                    }
            }, //success end
            error : function() {
            	console.log('에러')
            }
	}); //ajax end
} //function ajax end
$.urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null){
       return null;
    }
    else{
       return results[1] || 0;
    }
}




$(function(){
	var tab = ($.urlParam('page2'));
	if(tab != null) {
		$('#boardTab').trigger('click');
	}
   $("#viewcount2").change(function(){
      go(1); //보여줄 페이지를 1페이지로 설정한다.
   }) //change end
   $('#addBoard_Button').click(function() {
		location.href ="BoardWrite.bo";
	});
   $(".del").click(function(event) {
		var answer = confirm("정말 삭제하시겠습니까?");
		if(!answer) {
			event.preventDefault();
		}
	});
	
	
	$('#search_btn').click(function() {
		if($("#search_word").val() == '') {
			alert("검색어를 입력하세요");
			return false;
		}
	});
	$("#viewcount").change(function() {
		selectedValue = $(this).val();
		$("#search_word").val('');
		if(selectedValue=='3') {
			$("#search_word").attr("placeholder", "여 또는 남을 입력하세요");
		}
	});
	$(".memberDetail").click(function() {
		var member_id = $(this).text();
		getView(member_id);
	});
	
});