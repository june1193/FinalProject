<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>없는디요</title>
    <style>
        /* 컨테이너 스타일 */
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
            text-align: center;
        }
        /* 제출 버튼 */
        input[type="submit"] {
            width: 50%;
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
    </style>
</head>
<body>

<div class="container">
    <h3>입력해주신 정보로 가입된 아이디가 존재하지 않습니다!<h3>
        <input type="submit" value="홈으로">
</div>

</body>
</html>