<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>

	function popupOpen(chat){
		var popUrl = "/racket/"+chat+".jsp";	//팝업창에 출력될 페이지 URL	
		var popOption = "width=418, height=476, resizable=no, scrollbars=no, status=no, toolbar=no, menubar=no,location=no;";    
		//팝업창 옵션(optoin)		
		window.open(popUrl,"_blank",popOption);
		
	}
</script>

	<div class="wrap">
        <div class="chatt-wrap">
            <div class="chatt-badminton">
                <a href="javascript:popupOpen('b-chat');" title="배드민턴방"><span class="fluent-emoji-high-contrast--badminton"></span></a>
            </div>
            <div class="chatt-pingpong">
                <a href="javascript:popupOpen('tt-chat');" title="탁구방"><span class="fa6-solid--table-tennis-paddle-ball"></span></a>
            </div>
            <div class="chatt-tennis">
                <a href="javascript:popupOpen('t-chat');" title="테니스방"><span class="ic--round-sports-tennis"></span></a>
            </div>   
            <div class="chatting-popup" title="채팅방">
                <span class="fluent--chat-24-filled"></span>
            </div>
        </div>
	</div>
