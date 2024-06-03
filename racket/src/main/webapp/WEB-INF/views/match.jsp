<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/matchjoin.css" />
 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style>
* {
	padding: 0px;
	margin: 0px;
}

#wrap {
	width: 1240px;
	margin: 0 auto;
	box-sizing: border-box;
	padding-left: 45px;
	padding-right: 45px;
}

/* 최 상단바 */
#outer-nav {
	border: 1px solid rgb(255, 255, 255);
	background-color: #edfbff;
	width: 99.9%;
	/*99퍼로 하면 스크롤바 사라짐*/
	height: 120px;
}

#outer-board {
	margin: 0 auto;
	margin-top: 19px;
	/* border: 1px solid black; */
	width: 1000px;
	height: 100px;
}

/* 검색창 관련 */
.search-area {
	display: flex;
	align-items: center;
	margin-left: auto;
}

.search {
	width: 400px;
	background-image: linear-gradient(to left, #FBB9AB 0%, #68D2E8 100%);
	height: 35px;
	border-radius: 20px;
	margin: 0 auto;
	display: flex;
	overflow: hidden;
	padding: 2px;
}

.search-in {
	display: flex;
	align-items: center;
	border-radius: 25px;
	background: #fff;
	width: 100%;
}

.search-in>input {
	height: 31px;
	border: none;
	margin-left: 15px;
	font-size: 16px;
	width: 350px;
	font-family: 'Pretendard';
	font-weight: 300;
}

.search-in>input:focus {
	outline: none;
}

.search-in>button {
	display: flex;
	border: none;
	height: 100%;
	align-items: center;
	background: transparent;
}

.tabler--search {
	display: inline-block;
	width: 1.4em;
	height: 1.4em;
	background-repeat: no-repeat;
	background-size: 100% 100%;
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath fill='none' stroke='%23FBB9AB' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M3 10a7 7 0 1 0 14 0a7 7 0 1 0-14 0m18 11l-6-6'/%3E%3C/svg%3E");
}

/* 검색창 끝 */
#event-box {
	/* border: 1px solid black; */
	width: 500px;
	margin: 0 auto;
	height: 40px;
	margin-top: 20px;
	text-align: center;
}

.event {
	font-size: 17px;
	display: inline-block;
	margin: 25px;
	margin-top: 0px;
	padding: 0 0 14px 0;
}

.event:hover {
	border-bottom: 5px solid rgb(0, 255, 166);
	cursor: pointer;
}

.event:nth-child(1) {
	border-bottom: 5px solid rgb(0, 255, 166);
}

#top-nav {
	font-weight: bold;
	text-align: center;
	margin-top: 60px;
}

#ad {
	border: 1px solid black;
	height: 150px;
	margin-top: 20px;
}

#ranking {
	border: 1px solid black;
	height: 350px;
	margin-top: 20px;
}

#ranking_box {
	/* border: 1px solid black; */
	height: 300px;
	width: 1100px;
	margin: 0 auto;
	margin-top: 20px;
}

#rankword {
	/* border: 1px solid black; */
	height: 40px;
	width: 1100px;
	margin: 0 auto;
}

#rankingList {
	display: flex;
	justify-content: space-between;
	/* border: 1px solid black; */
	height: 270px;
	width: 1100px;
}

.r_box {
	/* 	border: 1px solid black; */
	height: 265px;
	width: 200px;
	box-sizing: border-box;
	cursor: pointer;
}

.r_img {
	/* 	border: 1px solid black; */
	height: 200px;
	width: 200px;
}

.r_img img {
	width: 100%;
	height: 100%;
	object-fit: fill;
}

/* 공지사항 바 */
#lightning {
	background-color: #bdf2ff;
	cursor: pointer;
	display: inline-block;
	width: 49%;
	height: 60px;
	line-height: 60px;
	font-size: 20px;
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
}

/* 문의하기 바*/
#club {
	background-color: #e4f9ff;
	cursor: pointer;
	display: inline-block;
	width: 49%;
	height: 60px;
	line-height: 60px;
	font-size: 20px;
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
}

/* 검색창 바 */
/* #search-nav {
            background-color: #ffd8d8;
            padding: 10px;
            text-align: right;

            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        } */

/*  art-1 공지사항 글목록 */
#board {
	width: 100%;
	border-collapse: collapse;
}

#board td, th {
	border-bottom: 1.2px solid #c9c9c9;
	padding: 8px;
	height: 50px;
}

/* 개별 글 a태그 */
#board td a {
	text-decoration: none;
	color: black;
}

#board td a:hover {
	text-decoration: underline;
}

/* 첫번째 행 설정 */
#board th {
	border-top: 1.2px solid #c9c9c9;
	border-bottom: 1.2px solid #2718ff;
}

/* 첫번째, 두번째 열 설정 */
#board td:nth-child(1), #board td:nth-child(2) {
	text-align: center;
	width: 170px;
}

/* 네번째 열 설정 */
#board td:nth-child(4) {
	text-align: center;
	width: 250px;
}

/* 세번째 열 설정 */
#board td:nth-child(3) {
	padding-left: 50px;
	text-align: left;
}

/* art-2 문의하기 글목록 */
#board-2 {
	box-sizing: border-box;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	/* align-items: center; */
	width: 100%;
	background-color: #fff;
	border-top: 1.2px solid #c9c9c9;
	height: 1100px;
	padding: 20px;
}

#local-box {
	/* border: 1px solid black; */
	width: 100%;
	margin: 0 auto;
	height: 40px;
	margin-top: 10px;
	margin-bottom: 10px;
	text-align: center;
}

.local {
	font-size: 17px;
	display: inline-block;
	margin: 25px;
	margin-top: 0px;
	padding: 0 0 14px 0;
	color: #a0a0a0;
}

.local:hover {
	cursor: pointer;
}

.local:nth-child(1) {
	color: black;
	font-weight: bold;
}

.box-link {
	box-sizing: border-box;
	display: flex;
	margin: 10px;
	margin-top: 10px;
	border: 1px solid rgb(199, 199, 199);
	border-radius: 9px;
	height: 230px;
	width: 500px;
	padding: 23px;
	text-decoration: none;
	color: black;
	background-color: #ffffff;
}
/* .box-1 {
	box-sizing: border-box;
	display: flex;
	margin: 10px;
	margin-top: 10px;
	border: 1px solid black;
	border-radius: 10px;
	height: 230px;
	width: 500px;
	padding: 23px;
} */
.thumbnail {
	/* border: 1px solid black; */
	height: 180px;
	width: 140px;
	margin: 0px;
}

.thumbnail img {
	width: 100%;
	height: 100%;
	object-fit: fill;
}

.box-1-textarea {
	box-sizing: border-box;
	/* border: 1px solid black; */
	height: 180px;
	width: 310px;
	margin: 0px;
	padding: 5px;
}

.rounded {
	margin-top: 10px;
	border-radius: 15px;
	padding: 3px;
	background-color: #f0f0f0;
}

.viewimg {
	height: 20px;
	width: 20px;
}

.box-2-textarea {
	box-sizing: border-box;
	/* border: 1px solid black; */
	height: 180px;
	width: 310px;
	margin: 0px;
	padding: 5px;
}

/* 임시 페이징 형태 */
.paging {
	margin: 50px;
	text-align: center;
	font-size: 17px;
}

/* 초기 상태 */
#art-2 {
	display: none;
}

/* 폰트, 강조, 사이즈 */
.johwesu {
	color: #9c9c9c;
	font-size: 12px;
}

.magamill {
	color: #00c8ff;
	font-weight: bold;
}

/* 조인 부분 */
.joinshow_container {
    width: 100%;
    height: 100%;
    border: 1px solid #d3eaff;
    position: relative;
    font-size: 10pt;
}

.joinshow:hover {
    background-color: #d3eaff;
    transition: 0.3s;
    cursor: pointer;
}

.joinshow {
    display: flex;
    justify-content: space-between;
    height: 80px;
    border-bottom: 1px solid #d3eaff;
}

.joindetails {
	border-bottom:1px solid  #9dd0ff;
    width: 100%;
    height: 50px;
    display: flex;
    justify-content: space-between;
    background-color: #d8f9ee;
    
}

.joindetails > :nth-child(1){
	margin-right: auto;
	width:20%;
}
.joindetails > :nth-child(2){
	width: 40%;
	
}
.joindetails > :nth-child(3){
	width: 20%
	text-align: center;
}
.joindetails > :nth-child(4){
	width: 20%;
	text-align: center;
}


.joinhidden {


    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: black;
    opacity: 0.3;
    z-index: 1000;
    display: none;
}

.createjoin {
    margin: 0 auto;
    width: 800px;
    height: auto;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 1001;
    background-color: #edfbff;
    display: flex;
    flex-direction: column;
    display: none;
    padding: 5px;
    border-radius: 3px;
    
    
}

.textdiv{
	margin-top: 20px;
}
.createjoin textarea {
    margin: 0 auto;
    width: 80%;
    height: 20px;
}

.createjoin button {
    position: absolute;
    bottom: 0;
    right: 0;
}

.joinshow > :nth-child(1) {
	width: 10%;
}

.joinshow > :nth-child(2) {
	width: 10%;
	text-align: center;
}

.joinshow > :nth-child(3) {
	
	width: 50%;
	text-align:center;
}

.joinshow > :nth-child(4) {
	width: 20%;
}
.joinshow > :nth-child(5) {
	width: 10%;
}

</style>
<!-- 옵션값 정의  -->
<script>						
		function changeValue(){
								
								
								let option =  document.querySelector('#sprots').value;
								if(option == "테니스"){
									
									$.ajax({
							            url: 'machjoinTennis',  // 서버 엔드포인트 URL
							            type: 'GET',  // 요청 방식
							            dataType: 'json',  // 반환받을 데이터 타입
							            success: function(data) {
											
							            	
							            	
							            	let uniqueRegions = new Set(); // 중복 제거용 Set 객체
							            	let regionOption = $('#region');
							            	let innerhtml = '<option value="" disabled selected>선택하세요</option>';
							            	regionOption.empty();
							            	let hiddenURL = $('#placeURL');
							            	
							            	regionOption.append(innerhtml);
							            	for(let i=0 ; i < data.length ; i++){
							            		
							            		
							            		
							            		let items = data[i];
							            		if(!uniqueRegions.has(items.region_name)){ //Set 에 region_name 이 없다면 has (검증)
							            			uniqueRegions.add(items.region_name); // Set 에 추가 add (추가)
							            			
							            			let itemstr = "<option  value='"  + items.region_name +"'>"   +  items.region_name  + "</option> ";
								            		regionOption.append( itemstr);
							            			
							            		}
							            		
							            		
							            	}
							                $('#region').change(function() {
							                    let selectedRegion = $(this).val();
							                    let placeOption = $('#place'); // place select 태그
							                    placeOption.empty(); // 기존 옵션 제거
							                    placeOption.append(innerhtml); // 첫번째 옵션 다시생성
							                   
							                    
							                    	
							                    data.forEach(item => {
							                        if (item.region_name === selectedRegion) {
							                            let optionStr = "<option value='" + item.place + "'>" + item.place + "</option>";
							                            placeOption.append(optionStr);
							                        }
							                        	
							                    });
							                });
							                
							                //여기서부터 복사 ( 장소 주소 받아오기 )
							                let placeOption = $('#place');
							                placeOption.change(function(){
							                	
							                	let selectPlace = $(this).val();
							                	data.forEach(item =>{
							                		if( item.place === selectPlace){
							                			hiddenURL.val(item.facilityID);
							                			alert("test :" + item.facilityID);
							                		}
							                		
							                	});
							                });
							            	

							            },
							            error: function(err) {
							              
							                console.log(err)
							            }
							        });
									
								}else if(option == "탁구" ){
									
									$.ajax({
							            url: 'matchjoinTableTennis',  // 서버 엔드포인트 URL
							            type: 'GET',  // 요청 방식
							            dataType: 'json',  // 반환받을 데이터 타입
							            success: function(data) {
											
							            	let uniqueRegions = new Set(); // 중복 제거용 Set 객체
							            	let regionOption = $('#region');
							            	let innerhtml = '<option value="" disabled selected>선택하세요</option>';
							            	regionOption.empty();
							            	let hiddenURL = $('#placeURL');
							            	regionOption.append(innerhtml);
							            	for(let i=0 ; i < data.length ; i++){
							            		
							            		
							            		
							            		let items = data[i];
							            		if(!uniqueRegions.has(items.region_name)){ //Set 에 region_name 이 없다면 has (검증)
							            			uniqueRegions.add(items.region_name); // Set 에 추가 add (추가)
							            			
							            			let itemstr = "<option  value='"  + items.region_name +"'>"   +  items.region_name  + "</option> ";
								            		regionOption.append( itemstr);
							            			
							            		}
							            		
							            		
							            	}
							                $('#region').change(function() {
							                    let selectedRegion = $(this).val();
							                    let placeOption = $('#place'); // place select 태그
							                    placeOption.empty(); // 기존 옵션 제거
							                    placeOption.append(innerhtml); // 첫번째 옵션 다시생성
							                   
							                    
							                    	
							                    data.forEach(item => {
							                        if (item.region_name === selectedRegion) {
							                            let optionStr = "<option value='" + item.place + "'>" + item.place + "</option>";
							                            placeOption.append(optionStr);
							                        }
							                    });
							                });
							                
							                let placeOption = $('#place');
							                placeOption.change(function(){
							                	
							                	let selectPlace = $(this).val();
							                	data.forEach(item =>{
							                		if( item.place === selectPlace){
							                			hiddenURL.val(item.facilityID);
							                			alert("test :" + item.facilityID);
							                		}
							                		
							                	});
							                });
							            		
		
							            },
							            error: function(err) {
							              
							                console.log(err)
							            }
							        });
									
								}else{
									
									$.ajax({
							            url: 'matchjoinbadminton',  // 서버 엔드포인트 URL
							            type: 'GET',  // 요청 방식
							            dataType: 'json',  // 반환받을 데이터 타입
							            success: function(data) {
											
							            	let uniqueRegions = new Set(); // 중복 제거용 Set 객체
							            	let regionOption = $('#region');
							            	let innerhtml = '<option value="" disabled selected>선택하세요</option>';
							            	regionOption.empty();
							            	let hiddenURL = $('#placeURL');
							            	regionOption.append(innerhtml);
							            	for(let i=0 ; i < data.length ; i++){
							            		
							            		
							            		
							            		let items = data[i];
							            		if(!uniqueRegions.has(items.region_name)){ //Set 에 region_name 이 없다면 has (검증)
							            			uniqueRegions.add(items.region_name); // Set 에 추가 add (추가)
							            			
							            			let itemstr = "<option  value='"  + items.region_name +"'>"   +  items.region_name  + "</option> ";
								            		regionOption.append( itemstr);
							            			
							            		}
							            		
							            		
							            	}
							                $('#region').change(function() {
							                    let selectedRegion = $(this).val();
							                    let placeOption = $('#place'); // place select 태그
							                    placeOption.empty(); // 기존 옵션 제거
							                    placeOption.append(innerhtml); // 첫번째 옵션 다시생성
							                   
							                    
							                    	
							                    data.forEach(item => {
							                        if (item.region_name === selectedRegion) {
							                            let optionStr = "<option value='" + item.place + "'>" + item.place + "</option>";
							                            placeOption.append(optionStr);
							                        }
							                    });
							                });
							                
							                let placeOption = $('#place');
							                placeOption.change(function(){
							                	
							                	let selectPlace = $(this).val();
							                	data.forEach(item =>{
							                		if( item.place === selectPlace){
							                			hiddenURL.val(item.facilityID);
							                			alert("test :" + item.facilityID);
							                		}
							                		
							                	});
							                });

							            },
							            error: function(err) {
							              
							                console.log(err)
							            }
							        });
									
								}
		}
</script>

<script>

				/* nav 클릭 로직 함수 */
                function section_One() {
                    document.querySelectorAll(".event:nth-child(1)")[0].style.borderBottom = "5px solid rgb(0, 255, 166)";
                    document.querySelectorAll(".event:nth-child(2)")[0].style.borderBottom = "5px solid #edfbff";
                    document.querySelectorAll(".event:nth-child(3)")[0].style.borderBottom = "5px solid #edfbff";
                    document.querySelectorAll(".event:nth-child(4)")[0].style.borderBottom = "5px solid #edfbff";
                }

                function section_Two() {
                    document.querySelectorAll(".event:nth-child(1)")[0].style.borderBottom = "5px solid #edfbff";
                    document.querySelectorAll(".event:nth-child(2)")[0].style.borderBottom = "5px solid rgb(0, 255, 166)";
                    document.querySelectorAll(".event:nth-child(3)")[0].style.borderBottom = "5px solid #edfbff";
                    document.querySelectorAll(".event:nth-child(4)")[0].style.borderBottom = "5px solid #edfbff";
                }

                function section_Three() {
                    document.querySelectorAll(".event:nth-child(1)")[0].style.borderBottom = "5px solid #edfbff";
                    document.querySelectorAll(".event:nth-child(2)")[0].style.borderBottom = "5px solid #edfbff";
                    document.querySelectorAll(".event:nth-child(3)")[0].style.borderBottom = "5px solid rgb(0, 255, 166)";
                    document.querySelectorAll(".event:nth-child(4)")[0].style.borderBottom = "5px solid #edfbff";
                }

                function section_Four() {
                    document.querySelectorAll(".event:nth-child(1)")[0].style.borderBottom = "5px solid #edfbff";
                    document.querySelectorAll(".event:nth-child(2)")[0].style.borderBottom = "5px solid #edfbff";
                    document.querySelectorAll(".event:nth-child(3)")[0].style.borderBottom = "5px solid #edfbff";
                    document.querySelectorAll(".event:nth-child(4)")[0].style.borderBottom = "5px solid rgb(0, 255, 166)";
                }

                // 공지사항 클릭했을 때 호출되는 함수
                function ArtOne() {
                    document.getElementById("art-1").style.display = "block";
                    document.getElementById("art-2").style.display = "none";
                    document.getElementById("lightning").style.backgroundColor = "#bdf2ff";
                    document.getElementById("club").style.backgroundColor = "#e4f9ff";
                }

                // 문의하기 클릭했을 때 호출되는 함수
                function ArtTwo() {
                    document.getElementById("art-1").style.display = "none";
                    document.getElementById("art-2").style.display = "block";
                    document.getElementById("lightning").style.backgroundColor = "#e4f9ff";
                    document.getElementById("club").style.backgroundColor = "#bdf2ff";
                }
                
                //마감일 계산 함수1
                function getRemainingDays(deadline, elementId) {
                    console.log("deadline: " + deadline);
                    var today = new Date();
                    var deadlineDate = new Date(deadline);
                    console.log("deadlineDate: " + deadlineDate);
                    var timeDiff = deadlineDate.getTime() - today.getTime();
                    console.log("timeDiff: " + timeDiff);
                    var daysRemaining = Math.ceil(timeDiff / (1000 * 3600 * 24));
                    console.log("daysRemaining: " + daysRemaining);

                    var element = document.getElementById(elementId);
                    if (element) {
                        element.innerHTML = daysRemaining;
                    } else {
                        console.error(`Element with ID '${elementId}' not found.`);
                    }
                }

                //마감일 계산 함수2
                function getRemainingDays2(deadline, elementId) {
                    console.log("deadline: " + deadline);
                    var today = new Date();
                    var deadlineDate = new Date(deadline);
                    console.log("deadlineDate: " + deadlineDate);
                    var timeDiff = deadlineDate.getTime() - today.getTime();
                    console.log("timeDiff: " + timeDiff);
                    var daysRemaining = Math.ceil(timeDiff / (1000 * 3600 * 24));
                    console.log("daysRemaining: " + daysRemaining);

                    var element = document.getElementById(elementId);
                    if (element) {
                        element.innerHTML = daysRemaining;
                    } else {
                        console.error(`Element with ID '${elementId}' not found.`);
                    }
                }
				
                /* 지역선택 함수 */
                function local_One() {
                    document.querySelectorAll(".local:nth-child(1)")[0].style.color = "#000000";
                    document.querySelectorAll(".local:nth-child(2)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(3)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(4)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(5)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(6)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(7)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(8)")[0].style.color = "#a0a0a0";
                    
                    document.querySelectorAll(".local:nth-child(1)")[0].style.fontWeight = "bold";
                    document.querySelectorAll(".local:nth-child(2)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(3)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(4)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(5)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(6)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(7)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(8)")[0].style.fontWeight = "normal";
                    
                }
                
                function local_Two() {
                    document.querySelectorAll(".local:nth-child(1)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(2)")[0].style.color = "#000000";
                    document.querySelectorAll(".local:nth-child(3)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(4)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(5)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(6)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(7)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(8)")[0].style.color = "#a0a0a0";
                    
                    document.querySelectorAll(".local:nth-child(1)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(2)")[0].style.fontWeight = "bold";
                    document.querySelectorAll(".local:nth-child(3)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(4)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(5)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(6)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(7)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(8)")[0].style.fontWeight = "normal";
                }
                
                function local_Three() {
                    document.querySelectorAll(".local:nth-child(1)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(2)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(3)")[0].style.color = "#000000";
                    document.querySelectorAll(".local:nth-child(4)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(5)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(6)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(7)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(8)")[0].style.color = "#a0a0a0";
                    
                    document.querySelectorAll(".local:nth-child(1)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(2)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(3)")[0].style.fontWeight = "bold";
                    document.querySelectorAll(".local:nth-child(4)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(5)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(6)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(7)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(8)")[0].style.fontWeight = "normal";
                }
                
                function local_Four() {
                    document.querySelectorAll(".local:nth-child(1)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(2)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(3)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(4)")[0].style.color = "#000000";
                    document.querySelectorAll(".local:nth-child(5)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(6)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(7)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(8)")[0].style.color = "#a0a0a0";
                    
                    document.querySelectorAll(".local:nth-child(1)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(2)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(3)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(4)")[0].style.fontWeight = "bold";
                    document.querySelectorAll(".local:nth-child(5)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(6)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(7)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(8)")[0].style.fontWeight = "normal";
                }
                
                function local_Five() {
                    document.querySelectorAll(".local:nth-child(1)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(2)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(3)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(4)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(5)")[0].style.color = "#000000";
                    document.querySelectorAll(".local:nth-child(6)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(7)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(8)")[0].style.color = "#a0a0a0";
                    
                    document.querySelectorAll(".local:nth-child(1)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(2)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(3)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(4)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(5)")[0].style.fontWeight = "bold";
                    document.querySelectorAll(".local:nth-child(6)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(7)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(8)")[0].style.fontWeight = "normal";
                }
                
                function local_Six() {
                    document.querySelectorAll(".local:nth-child(1)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(2)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(3)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(4)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(5)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(6)")[0].style.color = "#000000";
                    document.querySelectorAll(".local:nth-child(7)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(8)")[0].style.color = "#a0a0a0";
                    
                    document.querySelectorAll(".local:nth-child(1)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(2)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(3)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(4)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(5)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(6)")[0].style.fontWeight = "bold";
                    document.querySelectorAll(".local:nth-child(7)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(8)")[0].style.fontWeight = "normal";
                }
                
                function local_Seven() {
                    document.querySelectorAll(".local:nth-child(1)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(2)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(3)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(4)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(5)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(6)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(7)")[0].style.color = "#000000";
                    document.querySelectorAll(".local:nth-child(8)")[0].style.color = "#a0a0a0";
                    
                    document.querySelectorAll(".local:nth-child(1)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(2)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(3)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(4)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(5)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(6)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(7)")[0].style.fontWeight = "bold";
                    document.querySelectorAll(".local:nth-child(8)")[0].style.fontWeight = "normal";
                }
                
                function local_Eight() {
                    document.querySelectorAll(".local:nth-child(1)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(2)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(3)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(4)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(5)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(6)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(7)")[0].style.color = "#a0a0a0";
                    document.querySelectorAll(".local:nth-child(8)")[0].style.color = "#000000";
                    
                    document.querySelectorAll(".local:nth-child(1)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(2)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(3)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(4)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(5)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(6)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(7)")[0].style.fontWeight = "normal";
                    document.querySelectorAll(".local:nth-child(8)")[0].style.fontWeight = "bold";
                }
                
                /* 인기모집공고 div 클릭했을 때 폼 제출하는 함수 */
                function submitForm(p_num) {
                	console.log("clicked!!");
                    // 해당하는 폼을 선택합니다.
                    var form = document.getElementById('form_' + p_num);
                    // 폼을 제출합니다.
                    form.submit();
                }
            </script>

<!-- 매치생성 DB등록 -->

</head>





<body>

	<!-- 최 상단바 -->
	<nav>
		<div id="outer-nav">
			<div id="outer-board">

				<div class="search-area">
					<div class="search">
						<div class="search-in">
							<input type="text" placeholder="찾으시는 클럽이 있나요?">
							<button>
								<span class="tabler--search"></span>
							</button>
						</div>
					</div>
				</div>

				<div id="event-box">
					<div class="event" onclick=section_One()>전체</div>
					<div class="event" onclick=section_Two()>테니스</div>
					<div class="event" onclick=section_Three()>탁구</div>
					<div class="event" onclick=section_Four()>배드민턴</div>
				</div>

			</div>
		</div>
	</nav>

	<div id=wrap>

		<div id="ad">스탬프 광고</div>


		<!-- 인기모집공고 -->
		<div id="ranking">
			<div id="ranking_box">
				<div id="rankword">
					<h3>인기 모집 공고</h3>
				</div>

				<div id="rankingList">
					<c:forEach var="club" items="${r_data}">
						<!-- p_num으로 어떤 게시글 가져올지 판별하기 위해 -->
						<div class="r_box" onclick="submitForm('${club.p_num}')">
							<div class="r_img">
								<img src="resources/images/${club.club_thumbnail}"
									alt="Thumbnail">
							</div>
							<p>${club.p_title}</p>
							<p class="johwesu">조회수: ${club.views}</p>
							<form id="form_${club.p_num}" action="updateViews" method="post">
								<input type="hidden" name="p_num" value="${club.p_num}">
								<!-- submitForm함수가 호출된 뒤(폼 전송) form에서 action은 updateViews이지만 updateViews는 다시 C_detail로 보낸다 -->
								<input type="hidden" name="targetUrl" value="C_detail">
							</form>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>


		<!-- 선택창 -->
		<nav>
			<div id="top-nav">
				<div id="lightning" onclick=ArtOne()>번개모임</div>
				<div id="club" onclick=ArtTwo()>클럽</div>
			</div>
		</nav>



		<!--전체 섹션  -->
		<section>

			<!-- 번개모임 -->
			<article id="art-1">
			<div class="joinshow_container">
				<!-- 보여지는 뷰 -->
				<c:forEach var="items" items="${main}">
				<div class="joinshow" onclick="joindetails(this)" data-matchnum="${items.match_num}" style="align-items: center;" >
					<div class="j1">${items.sprots}</div>
					<div class="j2">${items.region}</div>
					<div class="j3">
						<a href="/racket/facility/${items.facilityID}" onclick="event.stopPropagation()">${items.place}</a>
					</div>
					<div class="j4"> ${items.matchdate}</div>
					<div class="j5" style="display: flex;  align-items: center;">모집인원:${items.membersu}
						<div style="display: flex; width: 30%; margin-left: auto;"><button onclick="joinMatch(this)">참여</button></div>
					</div>
				</div>
				</c:forEach>
			</div>
			<!-- 게시물 조인 스크립트 -->
			<script>
				function joinMatch(button){
				
					event.stopPropagation();
				 datadiv = button.parentElement.parentElement.parentElement;
				 let match_num = parseInt( datadiv.getAttribute('data-matchnum') , 10 );
				 
				 alert(match_num);
					let jsondata = { 
							"user_Id" : "duckgu" ,
							"match_num" : 	match_num
							
					};
					
				 	$.ajax({
						
						url: "/racket/insertMatchDetail" ,
						type: "POST" ,
						data: JSON.stringify(jsondata) ,
						contentType: "application/json",
						dataType: "json" ,
						
						success: function(data){
									
				                alert("참여했습니다.");
				                
				                location.reload();
								},

						error: function(err){
							console.log(err);
						}
					
				}); 
					
					
					
				}
			</script>
			<div class="createjoin">
							<div style="margin-left: auto; margin-bottom: 30px;">
								<a onclick="createjoinclose()" style="cursor: pointer;">닫기</a>
							</div>
							<div style="display: flex; margin-bottom: 30px; flex-direction: column;">
								<div style="margin: 0 auto; justify-content: space-between;">
									<input type="date" id="matchdate"> 
									<input type="hidden" name="date" id="realDate">
									<input type="time" id="matchhhour" name="matchhhour">
									<select id="sprots" onchange="changeValue()" name="sport">
										<option value="" disabled selected>선택하세요</option>
										<option value="테니스">테니스</option>
										<option value="탁구">탁구</option>
										<option value="배드민턴">배드민턴</option>
									</select>
									
									<select id="region" name="region">
											<option value="" disabled selected>선택하세요</option>
									</select> 
									<select id="place" name="place">
										<option value="" disabled selected>선택하세요</option>
									</select>
									<input type="hidden" id="placeURL"></input>
								<select id="membersu" name="membersu">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
								</select>
							</div>

						<div class="textdiv">
							<textarea name="intro" id="intro" placeholder="간단한 번개 소개글을 입력해 보세요." style="display: block; margin: 0 auto;"></textarea>
							<button onclick="matchform()">등록</button>
						</div>
					</div>
				</div>
	<!-- 번개모임 상세보기
                <div class="joindetails">
                    <div>종목</div>
                    <div>프로필사진</div>
                    <div>아이디</div>
                    <div>나이</div>
                    <div>구력</div>
                </div>
                 -->
	<!-- 번개등록 div -->

	<div style="display: flex; margin-top: 10px;">
		<button style="margin-left: auto;" onclick="createjoin()">번개등록</button>
	</div>

	<!-- 번개생성 투명도 스타일 부여용 -->
	<div class="joinhidden"></div>


	<!-- 번개모임 상세보기 -->
    <script>
        // div 클릭 시 플레이어 상세 정보 호출
        function joindetails(buttonElement) {

            let existingDetails = buttonElement.nextElementSibling;

            var matchNumStr = buttonElement.dataset.matchnum;
            var matchNum = parseInt(matchNumStr, 10);

            $.ajax({
                url: "/racket/getMatchDetail",
                type: "GET",
                data: { num: matchNum },
                dataType: "json",
                success: function(data) {
                    console.log(data);

                    // 기존 상세 정보 제거
                    let joindetails = $('.joindetails');
                    if (joindetails.length > 0) {
							joindetails.remove();
							
							return;
                        
                    } else {
                        // 데이터 순회하여 HTML 요소 추가
                        data.forEach(function(item) {
                            let tempDiv = document.createElement('div');
                            
                            
                            tempDiv.innerHTML = `
                                <div class="joindetails" style="height:auto; align-items: center;">
                                    <div class="jd1"><img src="${pageContext.request.contextPath}/resources/img/냥이1.jpg" style="width:100px; height:100px;"></div>
                                    <div class="jd2">닉네임 : <%= "${item.user_Nickname}"%></div>
                                    <div class="jd3">나이 : <%="${item.birthday}"%></div>
                                    <div class="jd4">구력 : <%="${item.user_Level}"%></div>
                                    
                                </div>
                            `;
                            buttonElement.insertAdjacentElement('afterend', tempDiv.firstElementChild);
                        });
                        
                    }
                },
                error: function(err) {
                    console.log(err);
                }
            });
        }
    </script>

	<!-- 번개모임 생성하기 -->
	<script>

    let togglecreatejoin = document.querySelector('.createjoin');
    let hidden = document.querySelector('.joinhidden');
    function createjoin() {

        hidden.style.display = 'block';
        togglecreatejoin.style.display = 'flex';
    }
    function createjoinclose() {
        hidden.style.display = 'none';
        togglecreatejoin.style.display = 'none';
    }
</script>

	<!-- 페이징 -->
	<div class="paging">[ 1 2 3 4 5 ]</div>

	</article>




	<!-- 클럽 -->

	<article id="art-2">


		<div id="board-2">

			<div id="local-box">
				<div class="local" onclick=local_One()>전체</div>
				<div class="local" onclick=local_Two()>용산구</div>
				<div class="local" onclick=local_Three()>서대문구</div>
				<div class="local" onclick=local_Four()>강남구</div>
				<div class="local" onclick=local_Five()>종로구</div>
				<div class="local" onclick=local_Six()>관악구</div>
				<div class="local" onclick=local_Seven()>영등포구</div>
				<div class="local" onclick=local_Eight()>송파구</div>
			</div>

			<!-- 한줄 단위 -->
			<c:forEach var="club" items="${data}" varStatus="status">
				<c:choose>
					<c:when test="${status.index % 2 == 0}">
						<form action="updateViews" method="post" class="update-views-form">
							<input type="hidden" name="p_num" value="${club.p_num}">
							<input type="hidden" name="targetUrl" value="C_detail"> <a
								href="#" class="box-link"
								onclick="this.closest('form').submit(); return false;">
								<div class="box-1-textarea">
									<span class="rounded">${club.region}</span> <span
										class="rounded">${club.sport}</span>
									<h3>${club.c_name}</h3>
									<p>${club.p_title}</p>
									<br> <span class="magamill"> D-<span
										id="d_day_${status.index}"></span>
									</span> <span class="johwesu">조회수: ${club.views}</span>
								</div>
								<div class="thumbnail">
									<img src="resources/images/${club.club_thumbnail}" alt="이미지 설명">
								</div>
							</a>
						</form>
					</c:when>
					<c:otherwise>
						<form action="updateViews" method="post" class="update-views-form">
							<input type="hidden" name="p_num" value="${club.p_num}">
							<input type="hidden" name="targetUrl" value="C_detail"> <a
								href="#" class="box-link"
								onclick="this.closest('form').submit(); return false;"> <!-- a태그의 부모요소중 가장 가까운 폼태그를 찾아서 전송함. return false는 a태그 링크의 기본 동작(페이지 이동)을 막음. -->
								<div class="box-2-textarea">
									<span class="rounded">${club.region}</span> <span
										class="rounded">${club.sport}</span>
									<h3>${club.c_name}</h3>
									<p>${club.p_title}</p>
									<br> <span class="magamill"> D-<span
										id="d_day2_${status.index}"></span>
									</span> <span class="johwesu">조회수: ${club.views}</span>
								</div>
								<div class="thumbnail">
									<img src="resources/images/${club.club_thumbnail}" alt="이미지 설명">
								</div>
							</a>
						</form>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- 여기까지 한줄단위 -->

			<!-- 모집공고 인덱스 모두 부여하고나서 함수호출. 안그러면 인덱스가 아직 덜 부여된 상태라 오류남-->
			<script>
					document.addEventListener('DOMContentLoaded', function() {
					    <c:forEach var="club" items="${data}" varStatus="status">
					        if (${status.index} % 2 === 0) {
					            getRemainingDays('${club.deadline}', 'd_day_${status.index}');
					        } else {
					            getRemainingDays2('${club.deadline}', 'd_day2_${status.index}');
					        }
					    </c:forEach>
					});
			
					</script>

		</div>

		<!-- 페이징 -->
		<div class="paging">[ 1 2 3 4 5 ]</div>

	</article>


	</section>

	</div>

<!-- 매치 게시물 생성 부분  -->
<script>



function matchform() {

		let matchdatee = $('#matchdate').val(); // 매치날짜
		let matchhhour = $('#matchhhour').val();  // 매치시간
		
		
		
		
		let matchdate = matchdatee +" "+ matchhhour+":00"; // mysql datetime 형식
		
		
		
		let sprots = $('#sprots ').val(); // 종목
		let region = $('#region').val(); // 지역
		let place = $('#place').val(); // 시설이름
		let membersu = $('#membersu').val(); // 모집인원
		let intro = $('#intro').val();  // 소개글 
		let placeURL = $('#placeURL').val(); // 시설물 
		let user_id = "jungkiwon";
		
        let jsonObject = {
        		matchdate: matchdate,
                sprots: sprots,
                region: region,
                place: place,
                membersu: membersu,
                intro: intro,
                placeURL: placeURL,
                user_id: user_id
            };
		
        let jsonString = JSON.stringify(jsonObject);
        
		
    $.ajax({
        url: '/racket/createMatchBoard',
        method: 'POST',
        contentType: 'application/json',
    	dataType: 'text',
    	data: jsonString,
    	
        success: function(data) {
            
        	
        	alert("매치 게시물 생성 완료");
        	location.reload();
        	
        },
        error: function(err) {
           console.log(err);
        }
    });
    
     
}

</script>



</body>




</html>
