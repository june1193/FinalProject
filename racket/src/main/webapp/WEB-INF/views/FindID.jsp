<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <style>
        .BigWrap {
            width: 400px;
            height: 370px;
            background-color: #f8f5f5be;
            border: 1px solid black;
            margin: 0 auto;
            border-radius: 5px;
            padding-top: 10px;
            padding-left: 30px;
            padding-right: 30px;
        }

        /* 입력 */
        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="passwordchk"],
        input[type="name"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
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

        .text1 {
            font-size: 14px;
            margin-bottom: 15px;
        }

        .banner {
            height: 100px;
            width: 300px;
            margin: 0 auto;
            background-color: #d2e4f5;
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="BigWrap">
        <form action="/racket/FindID" method="post">
            <h2>아이디 찾기</h2>
            <div class="text1">
                본인확인을 위한 성함과 이메일을 적어주세요.<br>
                가입시 입력했던 성함과 이메일 주소가 같아야 인증번호를 받을 수 있습니다.
            </div>
            이름:
            <input type="text" name="name" placeholder="이름을 입력하세요" required>
            이메일:
            <input type="email" name="email" placeholder="이메일 주소를 입력하세요" required>
            <input type="submit" value="다음">
        </form>
        <c:if test="${not empty error}">
            <div style="color: red;">${error}</div>
        </c:if>
    </div>
</body>
</html>