<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경</title>
    <style>
        .BigWrap {
            width: 400px;
            height: auto;
            background-color: #f8f5f5be;
            border: 1px solid black;
            margin: 0 auto;
            border-radius: 5px;
            padding-top: 10px;
            padding-left: 30px;
            padding-right: 30px;
            padding-bottom: 20px;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"],
        button.cancle {
            width: 100%;
            padding: 10px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"] {
            background-color: #42a0f8;
            color: white;
        }
        button.cancle {
            background-color: rgb(255, 255, 255);
            border: 1px solid #ccc;
            color: black;
        }
        input[type="submit"]:hover {
            background-color: #3b92e2;
        }
        button.cancle:hover {
            background-color: #ececec;
        }
        .BigWrap p {
            font-size: 13px;
        }
    </style>
    <script>
        function validateForm() {
            var oldPassword = document.getElementById("oldPassword").value;
            var newPassword = document.getElementById("newPassword").value;
            var confirmNewPassword = document.getElementById("confirmNewPassword").value;

            if (oldPassword === newPassword) {
                alert("기존 비밀번호와 새로운 비밀번호가 같을 수 없습니다.");
                return false;
            }

            if (newPassword !== confirmNewPassword) {
                alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <div class="BigWrap">
        <form action="/racket/changePassword" method="post" onsubmit="return validateForm()">
            <h2>비밀번호 변경</h2>
            <p>
                안전한 비밀번호로 내 정보를 보호하세요<br>
                다른 아이디/사이트에서 사용한 적 없는 비밀번호 또는<br>
                이전에 사용한 적 없는 비밀번호가 안전합니다.
            </p>
            
            <input type="password" id="oldPassword" name="oldPassword" placeholder="기존 비밀번호를 입력하세요" required>
            
            <input type="password" id="newPassword" name="newPassword" placeholder="새로운 비밀번호를 입력하세요" required>
            
            <input type="password" id="confirmNewPassword" name="confirmNewPassword" placeholder="새로운 비밀번호를 다시 입력하세요" required>
        
            <input type="submit" value="비밀번호 변경">
            
            <button type="button" class="cancle" onclick="window.history.back();">취소</button>
        </form>
    </div>
</body>
</html>