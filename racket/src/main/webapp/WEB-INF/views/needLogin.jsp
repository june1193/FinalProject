<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
body {
    display: flex;
    justify-content: center; /* 수평 가운데 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
    min-height: 100vh; /* 최소 높이를 화면 전체 높이로 설정하여 화면 크기에 따라 중앙 정렬되도록 함 */
    margin: 0;
    background-color: #f5f5f5;
}

#centerbox {
    width: 90%;
    margin: 20px auto;
    padding: 10px;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    text-align: center;
}
        
        /* 로그인 메시지 스타일 */
        #login-message {
            text-align: center;
            margin-bottom: 20px;
        }
        
        #login-message p {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        
        #login-message button {
            margin: 0 10px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
        #login-message button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div id="centerbox">
    <div id="login-message">
        <p>로그인이 필요한 페이지입니다</p>
        <button id="login-btn">로그인</button>
        <button id="signup-btn">회원가입</button>
    </div>
    
    <script>
    document.getElementById("login-btn").addEventListener("click", function() {
        window.location.href = "/racket/login";
    });
</script>
</div>
</body>
</html>