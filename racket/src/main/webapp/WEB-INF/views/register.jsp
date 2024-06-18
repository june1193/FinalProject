<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
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
/* 입력 div */
.wrap_input1 {
    margin-bottom: 10px;
}
.input1 {
    border: 1px solid #CCC;
    background-color: white;
    height: 40px;
    text-align: center;
}
#div_id {
    border-radius: 10px 10px 0px 0px;
    border-bottom: none;
}
#div_pwdchk {
    border-radius: 0px 0px 10px 10px;
    border-top: none;
}
.wrap_input2 {
    margin-bottom: 10px;
}
.input2 {
    border: 1px solid #CCC;
    background-color: white;
    height: 40px;
}

#div_nickname {
    border-radius: 10px 10px 0px 0px;
    border-bottom: none;
}
#div_name {
    border-radius: 0px;
    border-top: none;
    border-bottom: none;
}
#div_date {
    border-radius: 0px;
    border-top: none;
    border-bottom: none;
}
#div_mail {
    border-radius: 0px 0px 10px 10px;
    border-top: none;
}
/* 입력 */
input[type="text"],
input[type="password"] {
    width: 99%;
    border-radius: 10px;
    padding: 10px;
    border: 0px;
    box-sizing: border-box;
    font-size: 15px;
    outline: none;
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
</style>
<body>
    <div class="BigWrap">
        <form id="registerForm" action="/racket/registerUser" method="post" onsubmit="return validateForm()">
            <h2>회원가입</h2>
            <div class="wrap_input1">
                <div class="input1" id="div_id">
                    <input type="text" id="inputId" name="userId" placeholder="아이디를 입력해주세요" required>
                </div>
                <div class="input1" id="div_pwd">
                    <input type="password" id="inputPwd" name="password" placeholder="비밀번호를 입력해주세요" required>
                </div>
                <div class="input1" id="div_pwdchk">
                    <input type="password" id="inputPwdchk" name="passwordConfirm" placeholder="비밀번호를 다시 입력해주세요" required>
                </div>
            </div>
            
            <div class="wrap_input2">
                <div class="input2" id="div_nickname">
                    <input type="text" id="inputnickName" name="userNickname" placeholder="사용하실 닉네임을 입력해주세요" required>
                </div>
                <div class="input2" id="div_name">
                    <input type="text" id="inputName" name="userName" placeholder="성함을 입력해주세요" required>
                </div>
                <div class="input2" id="div_date">
                    <input type="text" id="inputDate" name="birthday" placeholder="생년월일을 입력해주세요 (예: 20240613)" required>
                </div>
                <div class="input2" id="div_mail">
                    <input type="text" id="inputMail" name="userEmail" placeholder="이메일 주소를 입력해주세요" required>
                </div>
            </div>

            성별:
            <input type="radio" name="sex" value="남">남성
            <input type="radio" name="sex" value="여">여성
            <br><br>

            운동:
            <input type="radio" name="exercise" value="배드민턴">배드민턴
            <input type="radio" name="exercise" value="탁구">탁구
            <input type="radio" name="exercise" value="테니스">테니스
            <br><br>

            운동 수준:
            <input type="radio" name="userLevel" value="1">초급
            <input type="radio" name="userLevel" value="2">중급
            <input type="radio" name="userLevel" value="3">고급
            <br><br>

            <input type="submit" value="가입하기">
        </form>
    </div>

    <script>
        function validateForm() {
            var pwd = document.getElementById("inputPwd").value;
            var pwdchk = document.getElementById("inputPwdchk").value;

            if (pwd !== pwdchk) {
                alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
                return false;
            }

            var date = document.getElementById("inputDate").value;
            if (!/^\d{8}$/.test(date)) {
                alert("날짜 형식이 올바르지 않습니다. YYYYMMDD 형식으로 입력해주세요.");
                return false;
            }

            // 날짜에 "000000"을 추가하여 datetime 형식으로 변환
            var dateTime = date + "000000";
            console.log("Datetime 형식으로 변환된 값: " + dateTime);

            // dateTime 값을 서버로 전송할 수 있도록 hidden input으로 추가
            var hiddenDateTimeInput = document.createElement("input");
            hiddenDateTimeInput.type = "hidden";
            hiddenDateTimeInput.name = "userDateTime";
            hiddenDateTimeInput.value = dateTime;
            document.getElementById("registerForm").appendChild(hiddenDateTimeInput);

            return true;
        }

        // -------------------하이라이트 효과 아이디
        const targetDivId = document.getElementById("div_id");
        const targetInputId = document.getElementById("inputId");
        targetInputId.addEventListener("focus", function() {
            targetDivId.style.border = "2px solid #42a0f8";
        });
        targetInputId.addEventListener("blur", function() {
            targetDivId.style.border = "1px solid #CCC";
            targetDivId.style.borderBottom = "none";
        });

        // -------------------하이라이트 효과 비밀번호
        const targetDivPwd = document.getElementById("div_pwd");
        const targetInputPwd = document.getElementById("inputPwd");
        targetInputPwd.addEventListener("focus", function() {
            targetDivPwd.style.border = "2px solid #42a0f8";
        });
        targetInputPwd.addEventListener("blur", function() {
            targetDivPwd.style.border = "1px solid #CCC";
        });

        // -------------------하이라이트 효과 비밀번호 확인
        const targetDivPwdchk = document.getElementById("div_pwdchk");
        const targetInputPwdchk = document.getElementById("inputPwdchk");
        targetInputPwdchk.addEventListener("focus", function() {
            targetDivPwdchk.style.border = "2px solid #42a0f8";
        });
        targetInputPwdchk.addEventListener("blur", function() {
            targetDivPwdchk.style.border = "1px solid #CCC";
            targetDivPwdchk.style.borderTop = "none";
        });

        // -------------------하이라이트 효과 닉네임
        const targetDivNickName = document.getElementById("div_nickname");
        const targetInputNickName = document.getElementById("inputnickName");
        targetInputNickName.addEventListener("focus", function() {
            targetDivNickName.style.border = "2px solid #42a0f8";
        });
        targetInputNickName.addEventListener("blur", function() {
            targetDivNickName.style.border = "1px solid #CCC";
            targetDivNickName.style.borderBottom = "none";
        });

        // -------------------하이라이트 효과 이름
        const targetDivName = document.getElementById("div_name");
        const targetInputName = document.getElementById("inputName");
        targetInputName.addEventListener("focus", function() {
            targetDivName.style.border = "2px solid #42a0f8";
        });
        targetInputName.addEventListener("blur", function() {
            targetDivName.style.border = "1px solid #CCC";
            targetDivName.style.borderBottom = "none";
            targetDivName.style.borderTop = "none";
        });

        // -------------------하이라이트 효과 날짜
        const targetDivDate = document.getElementById("div_date");
        const targetInputDate = document.getElementById("inputDate");
        targetInputDate.addEventListener("focus", function() {
            targetDivDate.style.border = "2px solid #42a0f8";
        });
        targetInputDate.addEventListener("blur", function() {
            targetDivDate.style.border = "1px solid #CCC";
            targetDivDate.style.borderBottom = "none";
            targetDivDate.style.borderTop = "none";
        });

        // -------------------하이라이트 효과 이메일 주소
        const targetDivMail = document.getElementById("div_mail");
        const targetInputMail = document.getElementById("inputMail");
        targetInputMail.addEventListener("focus", function() {
            targetDivMail.style.border = "2px solid #42a0f8";
        });
        targetInputMail.addEventListener("blur", function() {
            targetDivMail.style.border = "1px solid #CCC";
            targetDivMail.style.borderTop = "none";
        });
    </script>
</body>
</html>