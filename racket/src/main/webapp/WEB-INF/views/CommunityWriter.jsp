<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />
    <script src="${pageContext.request.contextPath}/resources/js/summernote-lite.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/summernote-lite.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote-lite.css">
    <style>
        * {
            box-sizing: border-box;
        }

        .container {
            width: 1240px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
        }

        .content_container {
            width: 80%;
            height: 100%;
            margin: 0 auto;
        }

        .border_title {
            width: 100%;
            height: 80px;
            border: 1px solid #d3eaff;
            display: flex;
            align-items: center;
            font-size: 20pt;
            font-weight: bold;
            margin: 0 auto;
            margin-bottom: 30px;
        }

        .border_content {
            width: 100%;
            height: 100%;
            border: 1px solid #d3eaff;
            margin: 0 auto;
            padding: 10px;
            margin-bottom: 30px;
        }

        .title {
            width: 100%;
            height: 100%;
            margin-bottom: 40px;
        }

        .title input {
            border: none;
            border: 2px solid black;
            border-radius: 5px;
            border-color: rgb(140, 140, 140);
            padding-left: 10px;
        }

        .controller {
            width: 100%;
            margin: 0 auto;
            border-top: 1px solid #d3eaff;
            padding-top: 10px;
            display: flex;
            margin-bottom: 30px;
        }

        .controller button {
            border: none;
            background: none;
            background-position: center;
            background-size: 100% 100%;
            width: 70px;
            height: 30px;
            cursor: pointer;
        }

        .controller :nth-child(1) {
            margin: 0 auto;
        }

        .controller :nth-child(2) {
            margin-right: 0 auto;
        }
    </style>
</head>

<body>
    <div class="container">
    <form action="/racket/insertPost" method="post">
        <div class="content_container">
        <input type="hidden" name="user_id" value="jungkiwon" >
            <div class="border_title">
                <h1 style="margin-left: 15px;">후기 게시판</h1>
                <input type="hidden" name="board_name"  value="후기 게시판">
            </div>

            <div class="border_content">
                <div class="title">
                    <span style="font-weight: bold; font-size: 10pt;">제목</span>
                    <input type="text" style="width: 600px;" name="post_title">
                </div>
                <div class="content">
                    <textarea name="post_content" id="summernote"></textarea>
                </div>
            </div>
            <div class="controller">
                <button style="background-image:url(${pageContext.request.contextPath}/resources/img/글등록.png);"></button>
              <a href="/racket/Review">
                <button type="button" style="background-image:url(${pageContext.request.contextPath}/resources/img/취소.png);"></button>
              </a>
            </div>
        </div>
        </form>
    </div>
</body>
<!-- summernote 관련 -->
<script>
$(document).ready(function () {
    $('#summernote').summernote({
        height: 1000,
        minHeight: 1000,
        focus: false,
        lang: "ko-KR",
        placeholder: "누구든지 영리목적의 광고성 정보를 본 게시판에 게시할 수 없습니다. 이를 위반할 경우 게시자 동의 없이 광고성 정보가 삭제됨은 물론, 정보통신망법에 의해 과태료가 부과될 수 있음을 유념하시기 바랍니다.",
        toolbar: [
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
            ['color', ['forecolor', 'color']],
            ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert', ['picture', 'link', 'video']],
            ['view', ['fullscreen', 'codeview', 'help']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
        fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],
        callbacks: {
            onImageUpload: function(files) {
                for (var i = 0; i < files.length; i++) {
                    imageUploader(files[i]);
                }
            }
        }
    });

    function imageUploader(file) {
        var data = new FormData();
        data.append("file", file);

        $.ajax({
            url: '/racket/imgUpload',
            type: 'POST',
            data: data,
            contentType: false,
            processData: false,
            success: function(response) {
                $('#summernote').summernote('insertImage', response);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('Upload failed:', textStatus, errorThrown);
            }
        });
    }
});
</script>
<!--  -->
</html>