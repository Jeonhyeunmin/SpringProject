<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" href="${ctp}/main/favicon.png">
<title>Min's</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/0c69fdf2c0.js" crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/include/bs5.jsp" />

	<!-- Swiper CSS -->
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />

	<!-- Swiper JS -->
	<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

<style>
	<!-- Custom CSS for Scrollbar Position -->
	/* swiper-container에 상대 위치 설정 */
	.swiper {
	    position: relative;
	}
	
	
	.swiper-interior {
    overflow-x: hidden;  /* 가로 스크롤 숨기기 */
	}
	
	.swiper-wrapper {
	    width: 100%;  /* swiper-wrapper 너비를 100%로 설정 */
	}
	
	a:hover{
		text-decoration: none;
	}
	.mainImgCrop img {
	  width: 100%;
	  height: 800px;
	}
	
	.interiorImgCrop {
      background: #fff;
      overflow: hidden;
      text-align: center;
      text-decoration: none;
      position: relative;
      width: 100%;
      height: 400px; /* 원하는 높이 설정 */
      display: flex;
      align-items: center;
      justify-content: center;
  }

  .interiorImgCrop img {
      width: 100%;
      height: 100%;
      object-fit: cover; /* 이미지 크기에 따라 자르기 */
      transition: transform 0.2s ease-in-out; /* 부드러운 확대 효과 */
  }

  .interiorImgCrop img:hover {
      transform: scale(1.1); /* 마우스를 올렸을 때 확대 */
  }
	.interiorImgCrop{
		background: #fff;
      overflow: hidden;
      text-align: center;
      text-decoration: none;
	}
	.mainImgText {
		position: absolute;
		bottom: 40%;
		left: 4.5%;
		color: white;
	}
	.titleEng{
	  font-family: 'TTBookendBatangR';
	  font-size: 25px;
	}
	
	.titleKor{
	  font-family: 'Chosunilbo_myungjo';
	  font-weight: 400;
	  font-size: 40px;
	}
	
	/*tobBtn*/
	h6 {
			position: fixed;
			right: 1rem;
			bottom: -50px;
			transition: 0.7s ease;
		}
		h6.on {
			opacity: 0.8;
			cursor: pointer;
			bottom: 0;
		}
		
		
		
</style>
<script>
	'use strict'
//화살표클릭시 화면 상단이동(부드럽게)
	$(window).scroll(function(){
  	if($(this).scrollTop() > 100){
     $("#topBtn").addClass("on");
  }
  else{
     $("#topBtn").removeClass("on");
  }
  $("#topBtn").click(function() {
			window.scrollTo({top:0, behavior: "smooth"});	
		});
	});
	
</script>
</head>
<!-- <body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false"> -->
<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/include/mainHeader.jsp" />
	<!-- 본문 영역 -->
<div class="swiper">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<div class="mainImgCrop">
					<img src="${ctp}/main/main.jpg" alt="Slide 1" />
				</div>
			</div>
			<div class="swiper-slide">
				<div class="mainImgCrop">
					<img src="${ctp}/main/main1.jpg" alt="Slide 2" />
				</div>
				<div class="mainImgText">
					<div class="titleEng">MAGICAL HOLIDAYS</div>
					<div class="titleKor">꿈같은 연말 준비</div>
					<div class="titleKor">~60% 브랜드 행사 + 뷰티쿠폰까지</div>
				</div>
			</div>
			<div class="swiper-slide">
				<div class="mainImgCrop">
					<img src="${ctp}/main/main2.jpg" alt="Slide 3" />
				</div>
				<div class="mainImgText">
					<div class="titleEng">FAMILY SALE</div>
					<div class="titleKor">랩 / 에고이스트 / 플라스틱 아일랜드</div>
					<div class="titleKor">UP TO 70% + 추가쿠폰</div>
				</div>
			</div>
			<div class="swiper-slide">
				<div class="mainImgCrop">
					<img src="${ctp}/main/main3.jpg" alt="Slide 4" />
				</div>
				<div class="mainImgText">
					<div class="titleKor">페리가모 홀리데이 기프트</div>
					<div class="titleKor">스페셜 캔디참 오너먼트 & 엽서 증정</div>
				</div>
			</div>
			<div class="swiper-slide">
				<div class="mainImgCrop">
					<img src="${ctp}/main/main4.jpg" alt="Slide 5" />
				</div>
				<div class="mainImgText">
					<div class="titleKor">노스페이스 키즈 방한대전</div>
					<div class="titleKor">한파대비, 인기패딩 / 부츠 특가전</div>
				</div>
			</div>
			<div class="swiper-slide">
				<div class="mainImgCrop">
					<img src="${ctp}/main/main5.jpg" alt="Slide 6" />
				</div>
				<div class="mainImgText">
					<div class="titleKor">조말론 런던, 라메르, 맥 외</div>
					<div class="titleKor">정품 증정부터 상품권, 추가 할인까지</div>
				</div>
			</div>
			<div class="swiper-slide">
				<div class="mainImgCrop">
					<img src="${ctp}/main/main6.jpg" alt="Slide 7" />
				</div>
				<div class="mainImgText">
					<div class="titleKor">스포츠 시그니쳐 100</div>
					<div class="titleKor">나이키 / 아디다스 / 뉴발란스 등</div>
					<div class="titleKor">인기 스포츠 브랜드 총 결산</div>
				</div>
			</div>
			<div class="swiper-slide">
				<div class="mainImgCrop">
					<img src="${ctp}/main/main7.jpg" alt="Slide 8" />
				</div>
				<div class="mainImgText">
					<div class="titleKor">랄프로렌 in WINTER</div>
					<div class="titleKor">롤로 아이코닉 베스트셀러</div>
				</div>
			</div>
			<div class="swiper-slide">
				<div class="mainImgCrop">
					<img src="${ctp}/main/main8.jpg" alt="Slide 9" />
				</div>
				<div class="mainImgText">
					<div class="titleKor">힐링 패스포트</div>
					<div class="titleKor">춥고 지친 일상으로부터 떠나는 마음의 여행</div>
				</div>
			</div>
			<div class="swiper-slide">
				<div class="mainImgCrop">
					<img src="${ctp}/main/main9.jpg" alt="Slide 10" />
				</div>
				<div class="mainImgText">
					<div class="titleKor">HYEUNDAI x DIESEL</div>
					<div class="titleKor">UP TO 40% OFF + 추가 쿠폰</div>
				</div>
			</div>
			<div class="swiper-slide">
				<div class="mainImgCrop">
					<img src="${ctp}/main/main10.jpg" alt="Slide 11" />
				</div>
				<div class="mainImgText">
					<div class="titleEng">PREMIUM STYLING</div>
					<div class="titleKor">노스페이스 눕시</div>
					<div class="titleKor">같이 입어요! 성인 & 키즈 눕시, 패밀리 룩 완성</div>
				</div>
			</div>
			<div class="swiper-slide">
				<div class="mainImgCrop">
					<img src="${ctp}/main/main11.jpg" alt="Slide 12" />
				</div>
				<div class="mainImgText">
					<div class="titleKor">백화점 아웃도어 아우터 페어</div>
					<div class="titleKor">노스페이스 / 블랙야크 / 디스커버리 외</div>
					<div class="titleKor">인기브랜드 UO TO 80%</div>
				</div>
			</div>
	 </div>
</div>


<!-- Swiper 초기화 스크립트 -->
<script>
	var swiper = new Swiper('.swiper', {
		  slidesPerView: 1,  // 한 번에 보일 슬라이드 개수
		  spaceBetween: 0,   // 슬라이드 간격
		  centeredSlides: true, // 슬라이드가 중앙에 오지 않도록 설정
		  loop: true,         // 무한 루프
		  loopAdditionalSlides: 1,
		  autoplay: {
		    delay: 2500,      // 자동으로 슬라이드 전환 (밀리초 단위)
		    disableOnInteraction: false
		  }
		});
</script>

	<!-- 위로가기 버튼 -->
  <h6 id="topBtn" class="text-right mr-3"><font color="#af9e84"><i class="fa-solid fa-circle-chevron-up fa-2x"></i></font></h6>					




<!-- footer -->
<%-- <jsp:include page="/WEB-INF/views/include/mainFooter.jsp" /> --%>
</body>
</html>
