<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/racket/resources/css/mypage-css.css">
<link rel="stylesheet" href="font.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	.match_warp{
		width:100%;
		height:300px;
		
		
		border: 1px solid black;
	}
	
	.match_detail{
		width:100%;
		height:auto;
		display: flex;
		border-bottom: 1px solid black;
		align-items: center;
		text-align: center;
		
	}
	.match_detail > :nth-child(1) {
	width:10%;
	border-right: 1px solid black;
	
}
	.match_detail > :nth-child(2) {
	width:30%;
	text-align: center;
	border-right: 1px solid black;
}
	.match_detail > :nth-child(3) {
	width:10%;
	text-align: center;
	border-right: 1px solid black;
	margin-left: 200px;
}
	.match_detail > :nth-child(4) {
	width:50%;
	
}

</style>

<script>
        $(document).ready(function(){
            $(".tab > ul > li").click(function(){
                $(".tab >  ul > li").removeClass("active");
                $(this).addClass("active");
                let val = $(this).attr('id');
                if(val == 'my-facility'){
                    $(".fluent--task-list-square-24-regular").removeClass("active");
                    $(".heart-outline").addClass("active");
                    $(".match-con").css("display","none");
                    $(".fac-con").css("display","block");
                }else if(val == 'match-list'){
                    $(".heart-outline").removeClass("active");
                    $(".fluent--task-list-square-24-regular").addClass("active");
                    $(".match-con").css("display","block");
                    $(".fac-con").css("display","none");
                }
            });
            
            var session = $("input[name='uId']").val();
            var userId = "${user.user_ID}";
            
    		//status 클래스
    		function getStatus(service_status){
    			let status = '';
    			if(service_status == '접수중'){
    				status = "status1";
    			}else if(service_status == '접수종료'){
    				status = "status2";
    			}else if(service_status == '안내중'){
    				status = "status5";
    			}else if(service_status == '예약일시중지'){
    				status = "status4";
    			}else {
    				status = "status3";
    			}
    			return status;
    		}
            
            //시설 랜더
            function render(data){
            	let str = '';
            	for(let i=0;i<data.length;i++){
            		let item = data[i];
            		let status = getStatus(item.service_status);
    				let pay = item.payment == '무료' ? 'free':'pay';
    				str = `
    					<div class="item">
    							<div class="badge">
    	                        	<span class="\${status}">\${item.service_status}</span>
    	                        	<span class="\${pay}">\${item.payment}</span>
    	                        </div>
    	                        <div class="badge2">
    	                        	<span class="bdlocal">\${item.region_name}</span>
    	                    	</div>
    	                    <a href="/racket/facility/\${item.facilityID}">
    	                    <div class="thumbnail-out">
    	                        <div class="thumbnail-in">
    	                            <img src="\${item.image}" alt="">
    	                        </div>
    	                    </div>
    	                    </a>
    	                    <a href="/racket/facility/\${item.facilityID}">
    	                    <div class="desc">
    	                        <span>\${item.minclassname}</span>
    	                        <div class="text-con">
    	                            <h3>\${item.facName}</h3>
    	                        </div>
    	                        
    	                        <div class="location-div">
    	                            <span class="fluent--location-20-regular"></span>
    	                            <span class="location">\${item.place}</span>
    	                        </div>
    	                    </div>
    	                </a>
    	                <div class="item-footer">
    	                <div class="it-footer-icon">
    	                    <div class="star">
    	                        <span class="mage--star"></span>
    	                        <span class="rating">\${item.rating}</span>
    	                    </div>
    	                    <div class="like" id="\${item.facilityID}">
    	                        <span class="basil--heart-outline full"></span> <span class="footer-font">\${item.count}</span>
    	                    </div>
    	                </div>
    	            </div>
    					</div>`;
    				$(".item-list").append(str);
				}
            }
            
    		//찜하기 관련
    		$(document).on("click",".like",function(){
    			let click = $(this); 
    			let facID = click.attr('id');
    			let uID = $("input[name='uId']").val();
    			$.ajax({
    				method : "get",
    				url : "/racket/facility/"+facID+"/bookmark",
    				success : function(data){
    					if(data === -1){
    					}else{
    						click.children('.basil--heart-outline').toggleClass("full");
    						if(userId != session ){ //session랑 user_id랑 다르면(=다른사람이 북마크한거 찜한거임)
    							click.children(".footer-font").empty();
    							click.children(".footer-font").append(data);
    						}else{
    							//마이페이지 찜하기 관련
    							$(".item-list").empty();    					
        						$.ajax({
        							method : "get",
        							url : "/racket/mypage/"+session+"/update", //session으로 변경
        							success: function(data){
        								console.log(data);
        								//내가 찜한 시설이 있을 경우 시설 출력
        								if(data.facList.length > 0){
        									render(data.facList);
        								}else{ //찜한 시설이 없는 경우
        									let str = `<p class="non-bookmark">
        		                    			<span class="pepicons-print--heart"></span> <span>→</span> <span class="pepicons-print--heart-filled"></span>
        			                    		</p>
        			                    		<p class="non-bookmark2">마음에 드는 시설을 담아보세요!</p>
        			                    		<div class="non-bookmark-link">
        			                    			<a href="/racket/facilityList">시설 구경하기</a>
        			                    		</div>`;
        									$(".fac-con").append(str);
        								}
        								
        							},
        							error : function(err){
        								console.log(err);
        							}
        							
        						});
    						}
    						
    					}
    				}
    			});
    		});

        });
    </script>
</head>
<body>
<input type="hidden" value="${sessionScope.loggedInUser.userId}" name="uId"  id="uId">
    <div id="wrap">
        <section>
            <div class="mypage-box">
                <div class="profile-box">
                    <div class="profile">
                        <div class="profile-in">
                        	<c:choose>
                        		<c:when test="${not empty user.user_Image_Url }">
                        			<img src="${user.user_Image_Url }" alt="">
                        		</c:when>
                        		<c:otherwise>
                        			<img alt="" src="/racket/resources/images/user.png">
                        		</c:otherwise>
                        	</c:choose>
                            
                        </div>                       
                    </div>
                    <div class="p-desc">
                        <h2>${user.user_Nickname }</h2>
                        <p><strong>성별</strong>${user.sex }</p>
                        <p><strong>주종목</strong>${user.exercise }</p>
                        <p><strong>급수</strong>${user.user_Level }</p>
                        <p><strong>스탬프</strong><span class="my">1</span><span>/9</span> 개</p>
                    </div>
                    <!-- sessionScope.user로 변경 -->
                    <c:if test="${sessionScope.loggedInUser.userId eq user.user_ID }">
	                    <div class="edit">
	                        <span class="solar--settings-linear"></span>프로필 수정
	                    </div>
                    </c:if> 
                    <c:choose>
                    	<c:when test="${user.exercise == '탁구' }">
                    		<img alt="" src="/racket/resources/images/탁구.png" class="icon-p">
                    	</c:when>
                    	<c:when test="${user.exercise == '테니스' }">
                    		<img alt="" src="/racket/resources/images/테니스.png" class="icon-t">
                    	</c:when>
                    	<c:otherwise>
                    		<img alt="" src="/racket/resources/images/배드민턴.png" class="icon-b">
                    	</c:otherwise>
                    </c:choose>
                              
                </div>
            </div>
        </section>
        <section>
            <div class="tab">
                <ul>
                    <li class="active" id="my-facility"><span class="heart-outline active"></span>담은 시설</li>
                    <li id="match-list"><span class="fluent--task-list-square-24-regular"></span>매칭 기록</li>
                </ul>
            </div>
            <div class="sub-con">
                <div class="fac-con">
                <c:choose>
                    	<c:when test="${not empty list.facList }">
                    <div class="item-list">
                    		<!-- 반복문 시작 -->
                    		<c:forEach var="facility" items="${list.facList }" varStatus="facStatus">
                			<div class="item">
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
                            <div class="badge2">
                                <span class="bdlocal">${facility.region_name }</span>
                            </div>
                            <a href="/racket/facility/${facility.facilityID}">
                                <div class="thumbnail-out">
                                    <div class="thumbnail-in">
                                        <img src="${facility.image }" alt="">
                                    </div>
                                </div>
                            </a>
                            <a href="/racket/facility/${facility.facilityID}">
                                <div class="desc">
                                    <span>${facility.minclassname }</span>
                                    <div class="text-con">
                                        <h3>${facility.facName }</h3>
                                    </div>
                                    
                                    <div class="location-div">
                                        <span class="fluent--location-20-regular"></span>
                                        <span class="location">${facility.place }</span>
                                    </div>
                                </div>
                            </a>
                            <div class="item-footer">
                                <div class="it-footer-icon">
                                    <div class="star">
                                        <span class="mage--star"></span>
                                        <span class="rating">${facility.rating }</span>
                                    </div>
                                    <div class="like" id="${facility.facilityID}"> 
                                    <c:set var="bookmarkList" value="${list.bookmark[facStatus.index]}" />
                                    	<c:choose>
                                    		<c:when test="${sessionScope.loggedInUser.userId eq facility.liked }">
                                    			<span class="basil--heart-outline full"></span> <span class="footer-font">${facility.count }</span>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<c:set var="loop_flag" value="false" />
                                    			<c:forEach var="item" items="${bookmarkList}">
                                    				<c:if test="${not loop_flag }">
												        <c:if test="${sessionScope.loggedInUser.userId eq item }"> 
												            <c:set var="loop_flag" value="true" />
												        </c:if>
												    </c:if>
											    </c:forEach>
											    <span class="basil--heart-outline ${loop_flag ? 'full': ''}"></span> <span class="footer-font">${facility.count}</span>
                                    		</c:otherwise>
                                    	</c:choose>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                		</c:forEach>                                 
                    </div>
                    </c:when>
                    	<c:when test="${sessionScope.loggedInUser.userId eq user.user_ID }">
                    		<p class="non-bookmark">
                    			<span class="pepicons-print--heart"></span> <span>→</span> <span class="pepicons-print--heart-filled"></span>
                    		</p>
                    		<p class="non-bookmark2">마음에 드는 시설을 담아보세요!</p>
                    		<div class="non-bookmark-link">
                    			<a href="/racket/facilityList">시설 구경하기</a>
                    		</div>
                    		
                    	</c:when>
                    	<c:otherwise>
                    		<p class="non-bookmark2-t"><span class="openmoji--sad-but-relieved-face"></span></p>
                    		<p class="non-bookmark2-b">담은 시설이 없습니다.</p>
                    	</c:otherwise>
                	</c:choose> 
                </div>
                <!-- 위에 test3 sessionScope.user로 변경 -->
                <div class="match-con">
                    <div class="match_warp">
                    	<div class="match_detail">
                    		<div>테니스</div>
                    		<div>마포구 월드컵공원 테니스장</div>
                    		<div>2024-06-07</div>
                    		<div>
                    			<div>덕구</div>
                    			<div>조패드림</div>
                    			<div>내가제일잘나가</div>
                    		</div>
                    	</div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
</html>