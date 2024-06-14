<!-- login.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script>
    // 페이지가 로드될 때 세션 체크를 수행하고 경고 메시지를 표시합니다.
    window.onload = function() {
        var isLoggedIn = <%= session.getAttribute("loggedInUser") != null %>;
        if (isLoggedIn) {
            alert("이미 로그인되어 있습니다.");
            // 로그인 성공 페이지로 리다이렉트합니다.
            window.location.href = "/racket/success";
        }
    };
</script>
</head>
<style>
.BigWrap {
    width: 400px;
    background-color: #f8f5f5be;
    border: 1px solid black;
    margin: 0 auto;
    border-radius: 5px;
    padding: 20px;
}
/* 입력 */
input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 10px;
    margin: 5px 0;
    border: 1px solid #cccccc;
    border-radius: 4px;
    box-sizing: border-box;
}
/* 제출 버튼 */
input[type="submit"] {
    width: 100%;
    background-color: #42a0f8;
    color: white;
    padding: 10px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
/* 제출 버튼 호버 효과 */
input[type="submit"]:hover {
    background-color: #3b92e2;
}
/* 온클릭 버튼 */
input[type="button"] {
    width: 100%;
    background-color: #42a0f8;
    color: white;
    padding: 10px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
/* 온클릭 버튼 효과 */
input[type="button"]:hover {
    background-color: #3b92e2;
}
</style>
<body>
    <div class="BigWrap">
        <form action="loginCheck" method="post">
            <h2>로그인</h2>

            아이디:
            <input type="text" id="username" name="username" placeholder="사용자 이름을 입력하세요" required>

            비밀번호:
            <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required>

            <input type="submit" value="로그인">
        </form>
        
        <input type = "button" value="회원가입" onclick="window.location.href='/racket/register'">
        
        <input type = "button" value="아이디 찾기" onclick="window.location.href='/racket/FindID'">
        
        <input type="button" value="비밀번호 찾기" onclick="window.location.href='/racket/FindPasswordByID'">
        
        
    </div>
</body>
</html>