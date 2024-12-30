<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <style>
        body {
				    font-family: Arial, sans-serif;
				    margin: 0;
				    padding: 0;
				    background-color: #f9f9f9;
				}
        .brand-container {
				    display: flex;
				    max-width: 1000px;
				    margin: auto;
				    margin-bottom: 30px; /* new-arrivals-container와 간격 추가 */
				    text-align: center;
				    justify-content: center;
				}
        .category-menu {
            width: 30%;
            height: 496px;
				    display: flex;
				    flex-direction: column;
				    color: black;
				    border-top: 1px solid black;
				    padding: 20px; /* 패딩 추가로 콘텐츠 간격 확보 */
				    box-sizing: border-box; /* 패딩과 너비를 합산하지 않도록 설정 */
        }
        .category-menu h3 {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
            text-align: center;
            top: 10px;
            border-bottom: 1px solid #eee;
            padding: 25px;
            padding-top: 10px;
        }
        .category-menu ul {
            list-style: none;
            padding: 10px;
            margin: 0;
            text-align: center;
        }
        .category-menu ul li {
            margin-bottom: 20px;
        }
        .category-menu ul li a {
            text-decoration: none;
            font-size: 14px;
        }
        .category-menu ul li a:hover {
            color: #e74c3c;
        }
        .swiper-container {
				    margin: 0 auto;
				    position: relative;
				    width: 70%;
				}
				
				.swiper {
				    width: 100%;
				    height: 400px; /* 슬라이더의 높이를 설정 */
				}
				
				.swiper-slide {
				    display: flex;
				    justify-content: center;
				    align-items: center;
				    overflow: hidden; /* 초과 이미지를 숨기기 위해 사용 */
				}
				
				.swiper-slide img {
				    width: 100%; /* 슬라이더의 너비를 채움 */
				    height: 100%; /* 슬라이더의 높이를 채움 */
				    object-fit: cover; /* 이미지가 잘리지 않으면서 공간을 채우도록 설정 */
				}

				.button-container {
				    position: absolute;
				    bottom: -1;
				    left: 0;
				    width: 100%;
				    display: flex;
				    z-index: 10; /* 버튼이 이미지 위에 렌더링되도록 설정 */
				    background-color: rgba(0, 0, 0, 0.5); /* 버튼 배경에 반투명 효과 추가 (선택사항) */
				}
				
				.control-button {
				    flex: 1;
				    padding: 30px;
				    font-size: 18px;
				    font-weight: bold;
				    text-align: center;
				    background-color: #333;
				    color: white;
				    border: none;
				    cursor: pointer;
				    transition: background-color 0.3s ease;
				}
				
				.control-button:hover {
				    background-color: #e74c3c;
				}
				
				.control-button.active {
            background-color: #e74c3c; /* Hover 색상을 선택되었을 때에도 유지 */
        }
        
	    	/* 상단 제목 및 경로 */
		    .page-header {
				    width: 100%;
				    padding: 20px 0;
				    text-align: center;
				    margin-bottom: 20px; /* 브랜드 컨테이너와의 간격 */
				}
		
		    .page-header h2 {
		      font-size: 24px;
		      font-weight: bold;
		      margin: 0;
		    }
		
		    .page-header .breadcrumb {
		      font-size: 14px;
		      color: #555;
		      margin-top: 2%;
		      margin-left: 19%;
			    background-color: #fff;
		    }
		    .breadcrumb a{
		    	text-decoration: none;
		    }
	
				.new-arrivals-container {
				    display: flex;
				    flex-direction: row;
				    width: 1200px;
				    margin: auto;
				    margin-top: 0; /* 위의 섹션과의 간격 */
				    padding: 20px;
				    overflow: hidden;
				    padding-top: 10px;
				}
				
				.brand-buttons {
				    width: 20%;
				    border-top: 1px solid #ddd;
				}
				
				.brand-buttons ul {
				    list-style: none;
				    padding: 0;
				    margin: 0;
				}
				
				
				.brand-buttons .brand-button {
				    width: 100%;
				    padding: 28px;
				    background-color: #fff;
				    border: none;
				    border-bottom: 1px solid #ddd;
				    cursor: pointer;
				    text-align: center;
				    font-size: 18px;
				    font-weight: bold;
				    transition: all 0.3s;
				}
				
				.brand-buttons .brand-button:hover {
				    color: black;
				    transform: scale(1.05);
				    border-top: 1px solid #ddd;
				}
				
				.product-display {
				    width: 100%;
				    background-color: #fff;
				    display: flex;
				    flex-direction: column;
				    justify-content: center;
				    overflow: hidden;
				    margin-left: 10px;
				}
				
				.product-display .swiper-container {
				    width: 100%;
				}
				
				.swiper-container {
				    width: 100%;
				}
				
				.product-card {
				    display: flex;
				    flex-direction: column;
				    align-items: center;
				    text-align: center;
				    background-color: #fff;
				    padding: 15px;
				    border: 1px solid #ddd;
				    border-radius: 10px;
				    height: 90%; 
				}
				
				.product-card img {
				    width: 100%;
				    height: auto;
				    max-width: 250px;
				    border-radius: 5px;
				    margin-bottom: 15px;
				}
				
				.product-info h4 {
				    font-size: 16px;
				    margin: 5px 0;
				    color: #333;
				}
				
				.product-info p {
				    font-size: 14px;
				    font-weight: bold;
				    color: #e74c3c;
				    margin-top: 5px;
				}
				
				.new-arrivals-title{
					font-size: 22px;
          font-weight: bold;
          margin-bottom: 10px;
          text-align: center;
          top: 10px;
          border-bottom: 1px solid #eee;
          padding: 25px;
          padding-top: 10px;
					
				}
								
								

    </style>
</head>
<body>
	 <!-- 상단 제목 및 경로 -->
  <div class="page-header">
    <div class="breadcrumb">HOME > <a href="${ctp}/shop/shopList?category=${category}">${fn: toUpperCase(category)}</a></div>
    <h2>${fn: toUpperCase(category)}</h2>
  </div>
  
  
	<div class="brand-container">
  	<!-- 카테고리 메뉴 -->
		<div class="category-menu">
	    <h3>${fn: toUpperCase(category)}</h3>
	    <ul>
	      <c:forEach var="mainCategoryList" items="${mainCategoryList}" varStatus="st">
          <li><a href="${ctp}/shop/shopMainList?mainCategory=${mainCategoryList}">${mainCategoryList}</a></li>
	      </c:forEach>
	    </ul>
		</div>
    <!-- 슬라이더 -->
    <div class="swiper-container">
	    <div class="swiper">
		    <div class="swiper-wrapper">
	        <c:forEach var="file" items="${files}">
            <div class="swiper-slide">
              <img src="${ctp}/${category}/${file}">
            </div>
	        </c:forEach>
		    </div>
			</div>
      <!-- 버튼 -->
      <div class="button-container">
      	<c:forEach var="file" items="${files}" varStatus="st">
          <button class="control-button" onclick="goToSlide(${st.index})">${fn: substring(file, 0, fn:indexOf(file, "."))}</button>
        </c:forEach>
      </div>
    </div>
	</div>

  <script>
      // Swiper 초기화
      const swiper = new Swiper('.swiper', {
        slidesPerView: 1,
        spaceBetween: 0,
        loop: true,
        autoplay: {
          delay: 3000,
          disableOnInteraction: false,
        }
      });

      // 특정 슬라이드로 이동하는 함수
      function goToSlide(index) {
        swiper.slideToLoop(index); // Swiper의 slideToLoop 메서드로 슬라이드 이동
      }
  </script>
  
  <h3 class="new-arrivals-title">New Arrivals</h3>
  <div class="new-arrivals-container">
    <!-- 왼쪽 브랜드 버튼 -->
    <div class="brand-buttons">
      <ul>
	      <c:forEach var="brand" items="${brands}" varStatus="st">
          <li>
            <button class="brand-button" data-brand="${brand}">
              ${brand}
            </button>
          </li>
	      </c:forEach>
      </ul>
    </div>

    <!-- 오른쪽 상품 영역 -->
    <div class="product-display">
      <div class="swiper-wrapper brand-swiper">
        <div class="swiper-wrapper">
          <c:forEach var="product" items="${products}">
            <div class="swiper-slide" data-brand="${product.company}">
              <div class="product-card">
                <img src="${ctp}/category/${product.thumbnail}" alt="${product.company}">
                <div class="product-info">
                  <h4>${product.title}</h4>
                  <p>${product.price}원</p>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
    </div>
	</div>

  
  <script>
    // Swiper 초기화
    const brandSwiper = new Swiper('.brand-swiper', {
        slidesPerView: 3,
        spaceBetween: 20,
        loop: false, // 브랜드 변경 시 필터링되므로 loop 비활성화
    });

    // 브랜드 버튼 클릭 이벤트
    const brandButtons = document.querySelectorAll('.brand-button');
    brandButtons.forEach(button => {
        button.addEventListener('click', () => {
            const selectedBrand = button.getAttribute('data-brand');

            // 모든 슬라이드 숨기기
            const slides = document.querySelectorAll('.brand-swiper .swiper-slide');
            slides.forEach(slide => {
                if (slide.getAttribute('data-brand') === selectedBrand) {
                    slide.style.display = 'block'; // 선택된 브랜드만 표시
                } else {
                    slide.style.display = 'none';
                }
            });

            // Swiper 업데이트
            brandSwiper.update();
        });
    });
</script>
  
</body>
</html>