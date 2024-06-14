<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
    <h1>로그인 성공</h1>
    <p>환영합니다, <c:out value="${user.userNickname}"/>님!</p>
    <p><a href="/racket/login">로그인화면으로</a></p>
    <p><a href="/racket/logout">로그아웃</a></p>
    <form action="/racket/withdraw" method="post">
        <button type="submit">회원탈퇴</button>
    </form>
    <p><a href="/racket/logout">닉네임 변경</a></p>
    <p><a href="/racket/passwordChanger">비밀번호 변경</a></p>
</body>
</html>