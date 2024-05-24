<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/project/resources/css/font.css">
<link rel="stylesheet" href="/project/resources/css/space-style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function search() {
		alert("검색");
	}
	
	var postScroll = true;
	var offset = 0;
	var limit = 20;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
	
	$(document).ready(function() {
		
		//게시글 목록 출력
		showList(limit, offset);
		
		if(postScroll === true){
			$(window).scroll(scrollHandler);
		}
		
		function scrollHandler(){
			//스크롤이 화면 맨 아래에 닿으면 실행
			if(postScroll === true &&  $(window).scrollTop() == $(document).height() - $(window).height()){ 
				offset += limit;			
				showList(limit, offset);
			}
		}
		
		function showList(limit, offset){
			postScroll = true;
			let data = {limit : limit, offset : offset};
			$.ajax({
				method : "get",
				url : "/project/facilityListData",
				data : data,				 
				success : function(data){
					//받아온 데이터가 없으면 스크롤 멈춤
					if(data.length == 0){
						postScroll = false;
					}else if(data.length < 20){ //받아온 데이터가 20개 아래면 스크롤 멈춤
						let str = '';
						for(let i=0;i<data.length;i++){
							let item = data[i];						
							str = `<div class="item">
									<div class="badge">
			                        	<span class="status1">\${item.service_status}</span>
			                        	<span class="pay">\${item.payment}</span>
			                        </div>
			                        <div class="badge2">
		                            	<span class="bdlocal">\${item.region_name}</span>
		                        	</div>
		                        <a href="/project/facility/\${item.facilityID}">
		                        <div class="thumbnail-out">
		                            <div class="thumbnail-in">
		                                <img src="\${item.image}" alt="">
		                            </div>
		                        </div>
		                        </a>
			                    <a href="/project/facility/\${item.facilityID}">
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
	                                <span class="rating">0.0</span>
	                            </div>
	                            <div class="like">
	                                <span class="basil--heart-outline"></span> <span class="footer-font">12</span>
	                            </div>
	                        </div>
	                    </div>
							</div>`;
							
							$(".item-list").append(str);
						}
						postScroll = false;
					}else{
					let str = '';
					for(let i=0;i<data.length;i++){
						let item = data[i];						
						str = `<div class="item">
								<div class="badge">
		                        	<span class="status1">\${item.service_status}</span>
		                        	<span class="pay">\${item.payment}</span>
		                        </div>
		                        <div class="badge2">
	                            	<span class="bdlocal">\${item.region_name}</span>
	                        	</div>
	                        <a href="/project/facility/\${item.facilityID}">
	                        <div class="thumbnail-out">
	                            <div class="thumbnail-in">
	                                <img src="\${item.image}" alt="">
	                            </div>
	                        </div>
	                        </a>
		                    <a href="/project/facility/\${item.facilityID}">
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
                                <span class="rating">0.0</span>
                            </div>
                            <div class="like">
                                <span class="basil--heart-outline"></span> <span class="footer-font">12</span>
                            </div>
                        </div>
                    </div>
						</div>`;
						
						$(".item-list").append(str);
					}
					}
				}
			});
			
			 
		}

		$(".filter").click(function() {
			$(".filter-wrap").css("display", "flex");
			$("body").addClass("scrollLock");
		});

		$(".close").click(function() {
			$(".filter-wrap").css("display", "none");
			$("body").removeClass("scrollLock");
		});

		$(".filter-button").click(function() {
			$(".filter-wrap").css("display", "none");
			$("body").removeClass("scrollLock");
		});

		//찜하기		
		$(document).on("click",".like",function(){
			$(this).children('.basil--heart-outline').toggleClass("full");
		});
		
		
		
		
	});
</script>
</head>
<body>
    <div id="wrap">
        <header>
        </header>
        <div class="filter-wrap">
            <div class="close">
                <span class="iconamoon--close"></span>
            </div>
            <div class="filter-tap">
                <div class="filter-in">
                <div class="local">
                    <h2>지역</h2>
                    <ul class="select">
                        <li>
                            <div class="input-wrap">
                                <input type="checkbox" class="select-input" id="select-input01" value="1">
                                <label for="select-input01" class="select-category">강남구</label>
                            </div>
                        </li>
                        <li>
                            <div class="input-wrap">
                                <input type="checkbox" class="select-input" id="select-input02" value="2">
                                <label for="select-input02" class="select-category">강동구</label>
                            </div>
                        </li>
                        <li>
                            <div class="input-wrap">
                                <input type="checkbox" class="select-input" id="select-input03" value="3">
                                <label for="select-input03" class="select-category">강서구</label>
                            </div>
                        </li>
                        <li>
                            <div class="input-wrap">
                                <input type="checkbox" class="select-input" id="select-input04" value="4">
                                <label for="select-input04" class="select-category">고양시</label>
                            </div>
                        </li>
                        <li>
                            <div class="input-wrap">
                                <input type="checkbox" class="select-input" id="select-input05" value="5">
                                <label for="select-input05" class="select-category">구로구</label>
                            </div>
                        </li>
                        <li>
                            <div class="input-wrap">
                                <input type="checkbox" class="select-input" id="select-input06" value="6">
                                <label for="select-input06" class="select-category">광진구</label>
                            </div>
                        </li>
                        <li>
                            <div class="input-wrap">
                                <input type="checkbox" class="select-input" id="select-input07" value="7">
                                <label for="select-input07" class="select-category">동대문구</label>
                            </div>
                        </li>
                        <li>
                            <div class="input-wrap">
                                <input type="checkbox" class="select-input" id="select-input08" value="8">
                                <label for="select-input08" class="select-category">동작구</label>
                            </div>
                        </li>
                        <li>
                            <div class="input-wrap">
                                <input type="checkbox" class="select-input" id="select-input09" value="9">
                                <label for="select-input09" class="select-category">마포구</label>
                            </div>
                        </li>
                        <li>
                            <div class="input-wrap">
                                <input type="checkbox" class="select-input" id="select-input10" value="10">
                                <label for="select-input10" class="select-category">서초구</label>
                            </div>
                        </li>
                        <li>
                            <div class="input-wrap">
                                <input type="checkbox" class="select-input" id="select-input11" value="11">
                                <label for="select-input11" class="select-category">성동구</label>
                            </div>
                        </li>
                        <li>
                            <div class="input-wrap">
                                <input type="checkbox" class="select-input" id="select-input12" value="12">
                                <label for="select-input12" class="select-category">성북구</label>
                            </div>
                        </li>
                        <li>
                            <div class="input-wrap">
                                <input type="checkbox" class="select-input" id="select-input13" value="13">
                                <label for="select-input13" class="select-category">송파구</label>
                            </div>
                        </li>
                        <li>
                            <div class="input-wrap">
                                <input type="checkbox" class="select-input" id="select-input14" value="14">
                                <label for="select-input14" class="select-category">양천구</label>
                            </div>
                        </li>
                        <li>
                            <div class="input-wrap">
                                <input type="checkbox" class="select-input" id="select-input15" value="15">
                                <label for="select-input15" class="select-category">용산구</label>
                            </div>
                        </li>
                        <li>
                            <div class="input-wrap">
                                <input type="checkbox" class="select-input" id="select-input16" value="16">
                                <label for="select-input16" class="select-category">종로구</label>
                            </div>
                        </li>
                        <li>
                            <div class="input-wrap">
                                <input type="checkbox" class="select-input" id="select-input16" value="17">
                                <label for="select-input17" class="select-category">중구</label>
                            </div>
                        </li>
                    </ul>
                    
                </div>
                <div class="category">
                    <h2>종목</h2>
                    <ul class="select">
                        <li>
                            <div class="input-wrap">
                                <input type="checkbox" class="select-input" id="select-input18" value="18">
                                <label for="select-input18" class="select-category">배드민턴</label>
                            </div>
                        </li>
                        <li>
                            <div class="input-wrap">
                                <input type="checkbox" class="select-input" id="select-input19" value="19">
                                <label for="select-input19" class="select-category">탁구</label>
                            </div>
                        </li>
                        <li>
                            <div class="input-wrap">
                                <input type="checkbox" class="select-input" id="select-input20" value="20">
                                <label for="select-input20" class="select-category">테니스</label>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="filter-button">
                필터 적용
            </div>
            </div>
        </div>

        <section>
            <div class="space-content">
                <h4>시설 찾기</h4>
                <div class="search-area">
                	<div class="tap-menu">

                	</div>
                    <div class="search">
                        <div class="search-in">
                            <input type="text" placeholder="시설명을 입력하세요">
                            <button onclick="search()">
                                <span class="tabler--search"></span>
                            </button>
                        </div>
                        
                    </div>
                    <div class="filter">
                        <button>
                            <span class="system-uicons--filtering"></span>
                        </button>
                    </div>
                </div>
            </div>
            <div class="item-wrap">
                <div class="item-list">
                
               
            	</div>
            </div>
      </section>
    </div>
</body>
</html>