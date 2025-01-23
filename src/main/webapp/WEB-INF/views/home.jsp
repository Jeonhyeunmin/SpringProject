<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" href="${ctp}/main/favicon.png">
<title>Min's</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
		
		.mainImgText {
			position: absolute;
			bottom: 35%;
			left: 4.5%;
			color: white;
		}
		
		@font-face {
	    font-family: 'Paperlogy-8ExtraBold';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2408-3@1.0/Paperlogy-8ExtraBold.woff2') format('woff2');
	    font-weight: 800;
	    font-style: normal;
		}
		
		@font-face { /*북엔드 바탕 - 영문*/
	    font-family: 'TTBookendBatangR';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2410-2@1.0/TTBookendBatangR.woff2') format('woff2');
	    font-weight: 400;
	    font-style: normal;
		}
		
		@font-face { /*눈누 기초고딕 - 두꺼운 네모 딱딱 고딕*/
	    font-family: 'NoonnuBasicGothicRegular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
		}
		
		.titleEng{
		  font-family: 'TTBookendBatangR';
		  font-size: 30px;
		}
		
		.titleKor{
		  font-family: 'NoonnuBasicGothicRegular';
		  font-weight: 200;
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
		
	  .best-container {
	    display: flex;
	    gap: 20px;
	    margin: 100px 2%;
	    font-family: 'Paperlogy-8ExtraBold';
		}
		
		.sidebar {
	    width: 200px;
		}
		
		.sidebar ul {
	    list-style: none;
	    padding: 0;
	    margin: 0;
		}
		
		.sidebar ul li {
	    padding: 12px;
	    cursor: pointer;
	    color: #333;
	    font-weight: bold;
	    border-left: 4px solid transparent;
	    transition: all 0.3s;
		}
		
		.sidebar ul li.active,
		.sidebar ul li:hover {
	    color: #e74c3c;
	    border-left: 4px solid #e74c3c;
		}
		
		.content {
	    flex-grow: 1;
	    display: grid;
	    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	    gap: 20px;
		}
		
		.item {
	    border: 1px solid #ddd;
	    border-radius: 4px;
	    padding: 10px;
	    text-align: left;
	    cursor: pointer;
		}
		
		.item img {
	    width: 100%;
	    height: auto;
	    border-bottom: 1px solid #ddd;
	    margin-bottom: 10px;
		}
		
		.item .title {
	    font-size: 14px;
	    color: #333;
	    margin-bottom: 5px;
	    width: 200px;
	    white-space: nowrap;       /* 줄바꿈 방지 */
      overflow: hidden;          /* 넘치는 텍스트 숨김 */
      text-overflow: ellipsis;
		}
		
		.item .price {
	    color: #e74c3c;
	    font-weight: bold;
	    margin-bottom: 5px;
		}
		
		.item .discount {
	    font-size: 12px;
	    color: #888;
	    text-decoration: line-through;
		}
		
	  .new-container {
	    display: grid;
	    grid-template-columns: repeat(3, 1fr);
	    gap: 30px; /* 카드 간의 간격 */
	    padding: 20px 10%; /* 여백 조정 */
	    margin: 0 auto;
	    font-family: 'Paperlogy-8ExtraBold';
	    max-width: 1750px;
	  }
	
	  .new-item {
	    overflow: hidden;
	    text-align: left;
	    transition: transform 0.3s, box-shadow 0.3s;
	    background-color: #fff;
	    cursor: pointer;
	    padding: 0 10px;
	    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	  }
	
	  .new-item img {
	    width: 100%;
	    height: 500px; /* 이미지 크기를 동일하게 설정 */
	    object-fit: cover;
	    margin-bottom: 10px;
	  }
	
	  .new-item .title {
	    font-size: 18px;
	    font-weight: bold;
	    color: #333;
	    margin-bottom: 10px;
	    white-space: nowrap;       /* 줄바꿈 방지 */
      overflow: hidden;          /* 넘치는 텍스트 숨김 */
      text-overflow: ellipsis;
	  }
	
	  .new-item .price {
	    font-size: 16px;
	    color: #e74c3c;
	    font-weight: bold;
	    margin-bottom: 10px;
	  }
	
	  .new-item .discount {
	    font-size: 14px;
	    color: #888;
	    text-decoration: line-through;
	    margin-bottom: 10px;
	  }
	
	  /* NEW 및 BEST 태그 스타일 */
	  .new-item .tag {
	    display: inline-block;
	    background-color: #f8f8f8;
	    color: #e74c3c;
	    font-size: 12px;
	    font-weight: bold;
	    padding: 5px 0px;
	    margin-right: 5px;
	    border-radius: 3px;
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
		
		document.addEventListener("DOMContentLoaded", function () {
	    const categories = document.querySelectorAll(".category");
	    const items = document.querySelectorAll(".item");

	    // 첫 번째 카테고리를 활성화하고 해당 제품 표시
	    if (categories.length > 0) {
        categories[0].classList.add("active");
        const firstCategory = categories[0].getAttribute("data-category");
        
        items.forEach(function (item) {
          if (item.getAttribute("data-category") === firstCategory) {
            item.style.display = "block";
          } else {
            item.style.display = "none";
          }
        });
	    }

	    // 카테고리 클릭 이벤트
	    categories.forEach(function (category) {
        category.addEventListener("click", function () {
            // 카테고리 활성화 표시
          categories.forEach(function (cat) {
              cat.classList.remove("active");
          });
          category.classList.add("active");

          // 선택된 카테고리 가져오기
          const selectedCategory = category.getAttribute("data-category");

          // 해당 카테고리 아이템만 표시
          items.forEach(function (item) {
            if (item.getAttribute("data-category") === selectedCategory || selectedCategory === "all") {
              item.style.display = "block";
            } else {
              item.style.display = "none";
            }
          });
        });
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

<div class="best-container">
	<div class="sidebar">
    <div><h3 style="font-weight: bold;">WEEKLY BEST</h3></div>
    <ul>
      <c:forEach var="subCategory" items="${subCategory}" varStatus="st">
        <li class="category ${st.first ? 'active' : ''}" data-category="${subCategory}">
          ${subCategory}
        </li>
      </c:forEach>
    </ul>
	</div>
	
	<!-- Content -->
	<div class="content">
	  <c:forEach var="vo" items="${bestVOS}" varStatus="st">
	    <div class="item" onclick="location.href='${ctp}/shop/shopContent?idx=${vo.idx}'" data-category="${vo.subCategory}" style="${vo.subCategory == subCategory[0] ? 'display: block;' : 'display: none;'}">
	      <img src="${ctp}/category/${vo.thumbnail}" alt="${vo.subCategory}${st.count}">
	      <div class="title">${vo.title}</div>
	      <div class="price"><fmt:formatNumber pattern="#,##0" value="${vo.price}"/></div>
	      <c:if test="${vo.discount != 0}"><div class="discount">${vo.discount}%</div></c:if>
	    </div>
	  </c:forEach>
	</div>
</div>

<div class="mt-4"><h2 style="font-weight: bold; margin-left: 10%;">Redefining Luxury</h2></div>
<div class="new-container">
  <c:forEach var="vo" items="${shopVOS}">
    <div class="new-item" onclick="location.href='${ctp}/shop/shopContent?idx=${vo.idx}'">
      <img src="${ctp}/category/${vo.thumbnail}" alt="${vo.title}">
      <div class="tag">
        NEW
      </div>
      <div class="title">${vo.title}</div>
      <div class="price"><fmt:formatNumber pattern="#,##0" value="${vo.price}"/>
      	<c:if test="${vo.discount != 0}">
        	<span class="discount">${vo.discount}%</span>
      	</c:if>
    	</div>
    </div>
  </c:forEach>
</div>


	<!-- 위로가기 버튼 -->
	<h6 id="topBtn" class="text-right">
		<img src="${ctp}/login/top.png" title="위로이동" width="50px" />
	</h6>					
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>
