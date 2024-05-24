<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/racket/resources/css/font.css">
<link rel="stylesheet" href="/racket/resources/css/space-style2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function search() {
		alert("검색");
	}
	
	var postScroll = true;
	var offset = 0;
	var limit = 20;  
	var url2 = '';
	
	$(document).ready(function() {
		//종목 탭
		$(".sport > ul > li input").on("click", function(){
		    $(".sport > ul > li input").prop("checked", false);		    

		    $(this).prop("checked", true);

		    let sport = $(this).val();
		    
		});
		
		$(".sport > ul > li:first-child input").prop("checked",true);
		url = "facilityList2";
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
		
		//showList(limit, offset, url) url = "/project/facilityListData";
		function showList(limit, offset){
			postScroll = true;
			
			let data = {limit : limit, offset : offset};
			$.ajax({
				method : "get",
				url : "/racket/facilityListData", //url
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
		
		//필터 더보기
		$(".f-btn").click(function(){
			$(".f-area").toggleClass("unfold");
		});
		
		//지역 더보기
		$(".local-label").click(function(){
			$(this).toggleClass("on");
		});
		

		
	});
</script>
</head>
<body>
    <div id="wrap">
        <header>
        </header>
        <section>
            <div class="space-content">
                <h4>시설 찾기</h4>
                <form id="form">
	                <div class="search-area">
	                    <div class="search">
	                        <div class="search-in">
	                            <input type="text" placeholder="시설명을 입력하세요">
	                            <button onclick="search()">
	                                <span class="tabler--search"></span>
	                            </button>
	                        </div>
	                        
	                    </div>
	                </div>
	                <div class="f-area">
						<div class="form">
							<div class="form-label">종목</div>
							<div class="form-group sport">
								<ul>
									<li>
										<input type="checkbox" class="select-input" id="select-input1" value="">
	                                	<label for="select-input1" class="select-category">전체</label>
									</li>
									<li>
										<input type="checkbox" class="select-input" id="select-input2" value="배드민턴">
	                                	<label for="select-input2" class="select-category">배드민턴</label>
									</li>
									<li>
										<input type="checkbox" class="select-input" id="select-input3" value="탁구">
	                                	<label for="select-input3" class="select-category">탁구</label>
									</li>
									<li>
										<input type="checkbox" class="select-input" id="select-input4" value="테니스">
	                                	<label for="select-input4" class="select-category">테니스</label>
									</li>
								</ul>
							</div>						
						</div>
						<div class="form">
							<div class="form-label local-label">
								지역
							</div>
							<div class="local-area">
								<div class="form-group">
									<ul>
										<li>
											<input type="checkbox" class="select-input" id="select-input5" value="강남구">
		                                	<label for="select-input5" class="select-category">강남구</label>
										</li>
										<li>
											<input type="checkbox" class="select-input" id="select-input6" value="강동구">
		                                	<label for="select-input6" class="select-category">강동구</label>
										</li>
										<li>
											<input type="checkbox" class="select-input" id="select-input7" value="강서구">
		                                	<label for="select-input7" class="select-category">강서구</label>
										</li>
										<li>
											<input type="checkbox" class="select-input" id="select-input8" value="고양시">
		                                	<label for="select-input8" class="select-category">고양시</label>
										</li>
										<li>
											<input type="checkbox" class="select-input" id="select-input9" value="광진구">
		                                	<label for="select-input9" class="select-category">광진구</label>
										</li>
										<li>
											<input type="checkbox" class="select-input" id="select-input10" value="구로구">
		                                	<label for="select-input10" class="select-category">구로구</label>
										</li>
										<li>
											<input type="checkbox" class="select-input" id="select-input11" value="동대문구">
		                                	<label for="select-input11" class="select-category">동대문구</label>
										</li>
										<li>
											<input type="checkbox" class="select-input" id="select-input12" value="동작구">
		                                	<label for="select-input12" class="select-category">동작구</label>
										</li>
										<li>
											<input type="checkbox" class="select-input" id="select-input13" value="마포구">
		                                	<label for="select-input13" class="select-category">마포구</label>
										</li>
										<li>
											<input type="checkbox" class="select-input" id="select-input14" value="서초구">
		                                	<label for="select-input14" class="select-category">서초구</label>
										</li>
										<li>
											<input type="checkbox" class="select-input" id="select-input15" value="성동구">
		                                	<label for="select-input15" class="select-category">성동구</label>
										</li>
										<li>
											<input type="checkbox" class="select-input" id="select-input16" value="성북구">
		                                	<label for="select-input16" class="select-category">성북구</label>
										</li>
										<li>
											<input type="checkbox" class="select-input" id="select-input17" value="송파구">
		                                	<label for="select-input17" class="select-category">송파구</label>
										</li>
										<li>
											<input type="checkbox" class="select-input" id="select-input18" value="양천구">
		                                	<label for="select-input18" class="select-category">양천구</label>
										</li>
										<li>
											<input type="checkbox" class="select-input" id="select-input19" value="용산구">
		                                	<label for="select-input19" class="select-category">용산구</label>
										</li>
										<li>
											<input type="checkbox" class="select-input" id="select-input20" value="종로구">
		                                	<label for="select-input20" class="select-category">종로구</label>
										</li>
										<li>
											<input type="checkbox" class="select-input" id="select-input21" value="중구">
		                                	<label for="select-input21" class="select-category">중구</label>
										</li>
									</ul>
								</div>
							</div>
	
							
						</div>
						<div class="form">
							<div class="form-label">접수기간</div>
							<div class="form-group">
								<input type="date"> ~ <input type="date">
							</div>						
						</div>
						<div class="form">
							<div class="form-label">접수상태</div>
							<div class="form-group">
								<ul>
									<li>
										<input type="checkbox" class="select-input" id="select-input22" value="접수중">
	                                	<label for="select-input22" class="select-category">접수중</label>
									</li>
									<li>
										<input type="checkbox" class="select-input" id="select-input23" value="접수종료">
	                                	<label for="select-input23" class="select-category">접수종료</label>
									</li>
									<li>
										<input type="checkbox" class="select-input" id="select-input24" value="안내중">
	                                	<label for="select-input24" class="select-category">안내중</label>
									</li>
									<li>
										<input type="checkbox" class="select-input" id="select-input25" value="예약일시중지">
	                                	<label for="select-input25" class="select-category">예약일시중지</label>
									</li>
									<li>
										<input type="checkbox" class="select-input" id="select-input26" value="예약마감">
	                                	<label for="select-input26" class="select-category">예약마감</label>
									</li>
								</ul>
							</div>						
						</div>
						<div class="form">
							<div class="form-label">이용대상</div>
							<div class="form-group">
								<ul>
									<li>
										<input type="checkbox" class="select-input" id="select-input27" value="제한없음">
	                                	<label for="select-input27" class="select-category">제한없음</label>
									</li>
									<li>
										<input type="checkbox" class="select-input" id="select-input28" value="성인">
	                                	<label for="select-input28" class="select-category">성인</label>
									</li>
									<li>
										<input type="checkbox" class="select-input" id="select-input29" value="어르신">
	                                	<label for="select-input29" class="select-category">어르신</label>
									</li>
								</ul>
							</div>						
						</div>
						<div class="form">
							<div class="form-label">이용요금</div>
							<div class="form-group">
								<ul>
									<li>
										<input type="checkbox" class="select-input" id="select-input30" value="무료">
	                                	<label for="select-input30" class="select-category">무료</label>
									</li>
									<li>
										<input type="checkbox" class="select-input" id="select-input31" value="유료">
	                                	<label for="select-input31" class="select-category">유료</label>
									</li>
								</ul>
							</div>						
						</div>					
						<button class="f-btn" type="button">필터</button>
	               	</div>
	               	<div class="f-footer">
							<input type="reset" value="초기화">
							<button id="submit">검색</button>
					</div>
               	</form>
            </div>
            <div class="item-wrap">
                <div class="item-list">
                
               
            	</div>
            </div>
      </section>
    </div>
</body>
</html>