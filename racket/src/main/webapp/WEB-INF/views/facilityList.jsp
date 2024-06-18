<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/racket/resources/css/font.css">
<link rel="stylesheet" href="/racket/resources/css/space-style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"> 
<link rel="stylesheet" href="/racket/resources/css/chat-style.css">
<link rel="stylesheet" href="/racket/resources/css/footer-style.css">
<link rel="stylesheet" href="/racket/resources/css/header-style.css">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
<script>
	var postScroll = true;
	var offset = 0;
	var limit = 20;  
	var option = {};
	var search = '';
	
	$(document).ready(function() {	
		
		//검색
		$("input[name='search']").keyup(function(event) {
	        if (event.which === 13) {
	            $(".search-btn").click();
	        }
    	});
		$(".search-btn").click(function(){
	        search = $("input[name='search']").val();
	        console.log(search);
			if(search == ''){
				alert("검색어를 입력해주세요");
			}
		});
		
		//필터링 
		//.sport > ul > li input, #submit
		$(".form ul > li > input,.search-btn, #submit").click(function(){
			$(".item-list").children().remove();
			offset = 0;
			limit = 20;
	        
			search = $("input[name='search']").val();
			
			//종목
			var sport = $("input[name='sport']:checked").val();
			//지역
			var checkList = [];
	        $("input[name='ck-box']:checked").each(function() {
	        	checkList.push($(this).val());
	        });
	        //접수상태
	        var statusList = [];
	        $("input[name='status']:checked").each(function() {
	        	statusList.push($(this).val());
	        });
	        //이용대상
	        var targetList = [];
	        $("input[name='target']:checked").each(function() {
	        	targetList.push($(this).val());
	        });
	        //이용요금
	        var paymentList = [];
	        $("input[name='payment']:checked").each(function() {
	        	paymentList.push($(this).val());
	        });
	        
	        option = {
	        		sport : sport,
	        		region : checkList,
	        		status : statusList,
	        		target : targetList,
	        		payment : paymentList,
	        		search : search
	        };
	        
	        showList(limit,offset, option);
	        

		});
        
		//페이지 처음 로드할때 '전체' 탭 포커스
		$(".sport > ul > li:first-child input").prop("checked",true);
		
		//초기화
		$(".reset").click(function(){
			$(".item-list").children().remove();
			$(".data-count > .count").empty();
			$(".sport > ul > li:first-child input").prop("checked",true);
			$("input[name='ck-box'], input[name='status'],input[name='target'],input[name='payment']").prop("checked",false);
			$("input[name='search']").val('');
			offset = 0;
			limit = 20;
			option = {
	        		sport : 'all'
	        };
			showList(limit,offset, option);
		});
		
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

		//게시글 목록 출력
		showList(limit, offset,option);
		
		if(postScroll === true){
			$(window).scroll(scrollHandler);
		}
		
		function scrollHandler(){
			//스크롤이 화면 맨 아래에 닿으면 실행
			if(postScroll === true &&  $(window).scrollTop() == $(document).height() - $(window).height()){ 
				offset += limit;			
				showList(limit, offset, option);
			}
		}
		
		//시설 랜더
		function render(data){
			let str = '';
			for(let i=0;i<data.facility.length;i++){
				let item = data.facility[i];	
				let status = getStatus(item.service_status);
				let pay = item.payment == '무료' ? 'free':'pay';
				let like = item.liked == '0' ? '':'full';
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
                        <span class="basil--heart-outline \${like}"></span> <span class="footer-font">\${item.count}</span>
                    </div>
                </div>
            </div>
				</div>`;
				
				$(".item-list").append(str);
			}
		}
		
		//시설 목록 요청
		function showList(limit, offset, option){
			postScroll = true;
			
			let data = {limit : limit, offset : offset, options : option};
			let dataJOSN = JSON.stringify(data);
			$.ajax({
				method : "post",
				url : "/racket/facilityListData",
				dataType : "json",
				data : dataJOSN,
				contentType : "application/json",
				success : function(data){
					console.log(data);
					var count = data.count;
					$(".data-count > .count").empty();
					$(".data-count > .count").append(count);
					//받아온 데이터가 없으면 스크롤 멈춤
					if(data.facility.length == 0){
						postScroll = false;
					}else if(data.facility.length < 20){ //받아온 데이터가 20개 아래면 스크롤 멈춤		
						render(data);
						postScroll = false;
					}else{
						render(data);
					}
				}
			});
			
			 
		}
		//찜하기		
		$(document).on("click",".like",function(){
			let click = $(this); 
			let facID = click.attr('id');
			$.ajax({
				method : "get",
				url : "/racket/facility/"+facID+"/bookmark",
				success : function(data){
					if(data === -1){
						alert("로그인 후 이용 가능합니다.")
					}else{
						click.children('.basil--heart-outline').toggleClass("full");
						click.children(".footer-font").empty();
						click.children(".footer-font").append(data);
					}
				}
			});
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
        <%@ include  file="header.jsp"  %>
        <section>
            <div class="space-content">
                <h4>시설 찾기</h4>
	                <div class="search-area">
	                    <div class="search">
	                        <div class="search-in">
	                            <input type="text" placeholder="시설명을 입력하세요" name="search">
	                            <button class="search-btn">
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
										<input type="radio" name="sport" class="select-input" id="select-input1" value="all">
	                                	<label for="select-input1" class="select-category">전체</label>
									</li>
									<li>
										<input type="radio" name="sport" class="select-input" id="select-input2" value="배드민턴">
	                                	<label for="select-input2" class="select-category">배드민턴</label>
									</li>
									<li>
										<input type="radio" name="sport" class="select-input" id="select-input3" value="탁구">
	                                	<label for="select-input3" class="select-category">탁구</label>
									</li>
									<li>
										<input type="radio" name="sport" class="select-input" id="select-input4" value="테니스">
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
											<input type="checkbox" name="ck-box" class="select-input" id="select-input5" value="강남구">
		                                	<label for="select-input5" class="select-category">강남구</label>
										</li>
										<li>
											<input type="checkbox" name="ck-box" class="select-input" id="select-input6" value="강동구">
		                                	<label for="select-input6" class="select-category">강동구</label>
										</li>
										<li>
											<input type="checkbox" name="ck-box" class="select-input" id="select-input7" value="강서구">
		                                	<label for="select-input7" class="select-category">강서구</label>
										</li>
										<li>
											<input type="checkbox" name="ck-box" class="select-input" id="select-input8" value="고양시">
		                                	<label for="select-input8" class="select-category">고양시</label>
										</li>
										<li>
											<input type="checkbox" name="ck-box" class="select-input" id="select-input9" value="광진구">
		                                	<label for="select-input9" class="select-category">광진구</label>
										</li>
										<li>
											<input type="checkbox" name="ck-box" class="select-input" id="select-input10" value="구로구">
		                                	<label for="select-input10" class="select-category">구로구</label>
										</li>
										<li>
											<input type="checkbox" name="ck-box" class="select-input" id="select-input11" value="동대문구">
		                                	<label for="select-input11" class="select-category">동대문구</label>
										</li>
										<li>
											<input type="checkbox" name="ck-box" class="select-input" id="select-input12" value="동작구">
		                                	<label for="select-input12" class="select-category">동작구</label>
										</li>
										<li>
											<input type="checkbox" name="ck-box" class="select-input" id="select-input13" value="마포구">
		                                	<label for="select-input13" class="select-category">마포구</label>
										</li>
										<li>
											<input type="checkbox" name="ck-box" class="select-input" id="select-input14" value="서초구">
		                                	<label for="select-input14" class="select-category">서초구</label>
										</li>
										<li>
											<input type="checkbox" name="ck-box" class="select-input" id="select-input15" value="성동구">
		                                	<label for="select-input15" class="select-category">성동구</label>
										</li>
										<li>
											<input type="checkbox" name="ck-box" class="select-input" id="select-input16" value="성북구">
		                                	<label for="select-input16" class="select-category">성북구</label>
										</li>
										<li>
											<input type="checkbox" name="ck-box" class="select-input" id="select-input17" value="송파구">
		                                	<label for="select-input17" class="select-category">송파구</label>
										</li>
										<li>
											<input type="checkbox" name="ck-box" class="select-input" id="select-input18" value="양천구">
		                                	<label for="select-input18" class="select-category">양천구</label>
										</li>
										<li>
											<input type="checkbox" name="ck-box" class="select-input" id="select-input19" value="용산구">
		                                	<label for="select-input19" class="select-category">용산구</label>
										</li>
										<li>
											<input type="checkbox" name="ck-box" class="select-input" id="select-input20" value="종로구">
		                                	<label for="select-input20" class="select-category">종로구</label>
										</li>
										<li>
											<input type="checkbox" name="ck-box" class="select-input" id="select-input21" value="중구">
		                                	<label for="select-input21" class="select-category">중구</label>
										</li>
									</ul>
								</div>
							</div>
	
							
						</div>
						<div class="form">
							<div class="form-label">이용요금</div>
							<div class="form-group">
								<ul>
									<li>
										<input type="checkbox" name="payment" class="select-input" id="select-input30" value="무료">
	                                	<label for="select-input30" class="select-category">무료</label>
									</li>
									<li>
										<input type="checkbox" name="payment" class="select-input" id="select-input31" value="유료">
	                                	<label for="select-input31" class="select-category">유료</label>
									</li>
								</ul>
							</div>						
						</div>
						<div class="form">
							<div class="form-label">접수상태</div>
							<div class="form-group">
								<ul>
									<li>
										<input type="checkbox" name="status" class="select-input" id="select-input22" value="접수중">
	                                	<label for="select-input22" class="select-category">접수중</label>
									</li>
									<li>
										<input type="checkbox" name="status" class="select-input" id="select-input23" value="접수종료">
	                                	<label for="select-input23" class="select-category">접수종료</label>
									</li>
									<li>
										<input type="checkbox" name="status" class="select-input" id="select-input24" value="안내중">
	                                	<label for="select-input24" class="select-category">안내중</label>
									</li>
									<li>
										<input type="checkbox" name="status" class="select-input" id="select-input25" value="예약일시중지">
	                                	<label for="select-input25" class="select-category">예약일시중지</label>
									</li>
									<li>
										<input type="checkbox" name="status" class="select-input" id="select-input26" value="예약마감">
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
										<input type="checkbox" name="target" class="select-input" id="select-input27" value="제한없음">
	                                	<label for="select-input27" class="select-category">제한없음</label>
									</li>
									<li>
										<input type="checkbox" name="target" class="select-input" id="select-input28" value="성인">
	                                	<label for="select-input28" class="select-category">성인</label>
									</li>
									<li>
										<input type="checkbox" name="target" class="select-input" id="select-input29" value="어르신">
	                                	<label for="select-input29" class="select-category">어르신</label>
									</li>
								</ul>
							</div>						
						</div>					
						<button class="f-btn" type="button">필터</button>
	               	</div>
	               	<div class="f-footer">
							<input type="button" class="reset" value="초기화">
							<button id="submit" type="button">검색</button>
					</div>
            </div>
            <div class="item-wrap">
            	<div class="data-count">
            		<!-- <span class="mdi--paper"></span> -->
            		<span class="typcn--home"></span>
            		총 <span class="count"></span>건
            	</div>
                <div class="item-list">
                
               
            	</div>
            </div>
      </section>
      <jsp:include page="footer.jsp"></jsp:include>
    </div>
    <jsp:include page="popup.jsp"></jsp:include>
</body>
</html>