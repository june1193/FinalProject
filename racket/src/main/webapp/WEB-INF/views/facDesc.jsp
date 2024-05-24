<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/project/resources/css/font.css">
<link rel="stylesheet" href="/project/resources/css/spaceDesc-style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
	
	    //서브 탭 메뉴 전환
	    $(".sub-tab > li").click(function(){
	        $(".sub-tab > li").removeClass("active");
	        $(this).addClass("active");
	        let val = $(this).attr('id');
	        if(val == 'detail'){
	            $(".sub-review").css("display","none"); //백에서 할땐 remove로 바꾸기?
	            $(".sub-desc").css("display","block");
	        }else if(val == 'review'){
	            $(".sub-review").css("display","block");
	            $(".sub-desc").css("display","none");
	        }
	    });
	
	    //후기 작성 버튼
	    $(document).on("click", ".item-review", function(){
	        $(".sub-tab > li").removeClass("active");
	        $(".sub-tab > .review").addClass("active");
	        $(".sub-review").css("display","block");
	        $(".sub-desc").css("display","none");
	        $("textarea").focus();
	    });
	
	    //댓글 수정
	    $(".edit").click(function (){
	        let sb = $(this).parent().parent().parent();
	        let text = sb.children("p").text();
	        sb.empty();
	        let $textarea = $("<textarea class='edit-area' rows='3' cols='30'></textarea>");
	        $textarea.val(text); // 텍스트 값 설정
	        sb.append($textarea);
	        sb.append("<button>수정</button>");
	        $textarea.focus();
	    });
	});
</script>
</head>
<body>
    <div class="wrap">
        <div class="sub-main">
        	<div class="title-area">
        		<h4>${facility.facName }</h4>
        		<div class="badge">
        			<c:choose>
                			<c:when test="${facility.service_status == '접수중'}">
                				<span class="status1">${facility.service_status }</span>
                			</c:when>
                			<c:when test="${facility.service_status == '접수종료' }">
                				<span class="status2">${facility.service_status }</span>
                			</c:when>
                			<c:when test="${facility.service_status == '예약마감' }">
                				<span class="status3">${facility.service_status }</span>
                			</c:when>
                			<c:when test="${facility.service_status == '예약일시중지' }">
                				<span class="status4">${facility.service_status }</span>
                			</c:when>
                			<c:when test="${facility.service_status == '안내중' }">
                				<span class="status5">${facility.service_status }</span>
                			</c:when>
                		</c:choose>
                		<span class="${facility.payment == '무료' ? 'free' : 'pay'}">${facility.payment}</span>   
        		</div>
        	</div>
            <div class="sub">
                <div class="sub-visual">
                    <div class="space-img">
                        <img src="${facility.image }" alt="">
                    </div>
                    <div class="map">
    
                    </div>
                </div>
                <div class="sub-right">
                    <div class="desc">
                        <ul class="space-desc">
                            <li>
                                <span>지역</span> ${facility.region_name }
                            </li>
                            <li>
                                <span>대상</span> ${facility.service_target }
                            </li>
                            <li>
                                <span>장소</span> ${facility.place }
                            </li>
                            <li>
                                <span>이용기간</span> ${facility.service_start_day } ~ ${facility.service_end_day }
                            </li>
                            <li>
                                <span>접수기간</span> ${facility.reception_start_date } ~ ${facility.reception_end_date }
                            </li>
                            <li>
                                <span>이용요금</span> ${facility.payment }
                            </li>
                            <li>
                                <span>이용시간</span> ${facility.service_start_time } ~ ${facility.service_end_time }
                            </li>
                            <li>
                                <span>문의전화</span> ${facility.tel_num }
                            </li>
                        </ul>
                    </div>
                    <div class="match-btn">
                        <button>매칭 찾기</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="sub-content">
            <ul class="sub-tab">
                <li class="detail active" id="detail">
                    <div class="text">
                        상세정보 ▼
                    </div>
                </li>
                <li class="review" id="review">
                    <div class="text">
                        방문후기 ▼
                    </div>
                </li>
            </ul>
            <div class="sub-desc">          
                <ul>
                    <li>
                        <span>상세설명</span>
                        <div class="text">
                            ${facility.details }
                        </div>
                    </li>
                </ul>
            </div>
            <div class="sub-review">
                <form action="">
                    <div class="write-review">
                        <div class="profile">
                            <div class="img-in">
                                <img src="GG31ezdaIAAr6WH.jpg" alt="">
                            </div>
                            <span>뽁아리</span>
                        </div>
                        <div class="sa">
                            <div class="rating">
                                ☆☆☆☆☆
                            </div>
                            <div class="speech-bubble sb-writer">
                                <textarea name="" id="" cols="30" rows="10"></textarea>
                            </div>
                        </div>

                        <button>등록</button>
                    </div>
                    
                </form>
                <ul>
                    <li>
                        <div class="profile">
                                <div class="img-in">
                                    <img src="GG31ezdaIAAr6WH.jpg" alt="">
                                </div>
                            <span>뽁아리</span>
                        </div>
                        <div class="sa2">
                            <div class="rating">
                                ☆☆☆☆☆
                            </div>
                            <div class="speech-bubble">
                                <p>야경이 너무 멋져서 좋았어요 또 가고싶어요!!!</p>
                                <div class="sb-footer">
                                    <span class="date">2024.05.09 10:40</span>
                                    <div class="sb-icon">
                                        <span class="fluent--slide-text-edit-20-regular edit"></span>
                                        <span class="mingcute--delete-2-fill delete"></span>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </li>
                    <li>
                        <div class="profile">
                            <div class="img-in">
                                <img src="리빗.jpg" alt="">
                            </div>
                        <span>리빗</span>
                    </div>
                    <div class="speech-bubble">
                        <div class="sb-footer">
                            <span class="date">2024.05.09 10:53</span>
                            <div class="sb-icon">
                                <span class="fluent--slide-text-edit-20-regular edit"></span>
                                <span class="mingcute--delete-2-fill delete"></span>
                            </div>
                        </div>
                        <p>Cookin' like a chef I'm a 5 star 미슐랭 미의 정점을 찍고 눈에 보여 Illusion Whoo 첨 느꼈지 이런 감정 놀랄 거야 Gonna shock 바로 감전 자물쇠 따 싹 다 Unlock Idea bank 머릿속을 털어 털어</p>
                    </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>