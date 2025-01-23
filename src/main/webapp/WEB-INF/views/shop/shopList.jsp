<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
          text-align: left;
        }
        .category-menu ul li {
          margin-bottom: 20px;
        }
    		@font-face {
			    font-family: 'Freesentation-9Black';
			    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2404@1.0/Freesentation-9Black.woff2') format('woff2');
			    font-weight: 900;
			    font-style: normal;
				}	
				
				@font-face { /*눈누 기초고딕 - 두꺼운 네모 딱딱 고딕*/
			    font-family: 'NoonnuBasicGothicRegular';
			    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
			    font-weight: normal;
			    font-style: normal;
				}
        .category-menu ul li a {
        	font-family: 'NoonnuBasicGothicRegular';
        	font-weight: 400;
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
				
				@font-face { /*수트 - 네모 딱딱 고딕*/
			    font-family: 'SUIT-Regular';
			    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
			    font-weight: normal;
			    font-style: normal;
				}
				
				.control-button {
					font-family: 'SUIT-Regular';
			    flex: 1;
			    padding: 30px;
			    font-size: 20px;
			    font-weight: bold;
			    text-align: center;
			    background-color: #333;
			    color: white;
			    border: none;
			    cursor: pointer;
			    transition: background-color 0.3s ease;
			    font-weight: light;
			    white-space: nowrap;
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
		      font-size: 30px;
		      font-weight: bold;
		      margin: 0;
		    }
		
		    .page-header .breadcrumb {
		      font-size: 14px;
		      color: #555;
		      margin-top: 2%;
		      margin-left: 19.5%;
		      font-family: 'Tenada';
		    }
		    .breadcrumb a{
		    	text-decoration: none;
		    	padding: 0 5px;
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
				
						
				@font-face { /*눈누 기초고딕 - 두꺼운 네모 딱딱 고딕*/
			    font-family: 'NoonnuBasicGothicRegular';
			    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
			    font-weight: normal;
			    font-style: normal;
				}
				
				.product-display {
			    width: 100%;
			    background-color: #fff;
			    display: flex;
			    flex-direction: column;
			    justify-content: center;
			    overflow: hidden;
			    margin-left: 10px;
			    font-family: 'NoonnuBasicGothicRegular';
			    cursor: pointer;
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
				  transition: all 0.3s ease;
				  position: relative; /* 할인 배지 위치 설정을 위해 추가 */
				  height: 355px;
				}
				
				.product-card img {
				  width: 100%;
				  height: 250px;
				  max-width: 250px;
				  border-radius: 5px;
				  margin-bottom: 15px;
				  transition: all 0.3s ease;
				}
				
				.product-card img:hover {
				  transform: scale(1.05);
				}
				
				.product-info h4 {
			    font-size: 16px;
			    margin: 5px 0;
			    color: #333;
			    transition: color 0.3s ease;
				}
				
				.product-info h4:hover {
				  color: #e74c3c;
				}
				
				.product-info p {
			    font-size: 14px;
			    font-weight: bold;
			    color: #e74c3c;
			    margin-top: 5px;
				}
				
				@font-face {
			    font-family: 'Tenada';
			    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-2@1.0/Tenada.woff2') format('woff2');
			    font-weight: normal;
			    font-style: normal;
				}
				
				.new-arrivals-title{
					font-size: 30px;
          font-weight: bold;
          margin-top: 30px;
          text-align: center;
          top: 10px;
          padding: 25px;
          padding-top: 10px;
					
				}
				
				.discount-badge {
				  position: absolute;
				  top: 10px;
				  left: 10px;
				  background-color: #A31D1D;
				  color: #fff;
				  font-size: 12px;
				  padding: 5px 8px;
				  border-radius: 5px;
				  font-weight: bold;
				  z-index: 2;
				}
				
				.original-price {
				  color: #777;
				  text-decoration: line-through;
				  font-size: 14px;
				  margin-right: 5px;
				}
				
				.discounted-price {
				  color: #e74c3c;
				  font-size: 18px;
				  font-weight: bold;
				}
				
				.brand-buttons .brand-button {
				  width: 100%;
				  padding: 25px;
				  background-color: #f9f9f9;
				  border: none;
				  border-bottom: 1px solid #ddd;
				  cursor: pointer;
				  text-align: center;
				  font-size: 18px;
				  transition: all 0.3s;
				  font-family: 'NoonnuBasicGothicRegular';
				}
				
				.brand-buttons .brand-button:hover {
				  background-color: #e74c3c;
				  color: #fff;
				  transform: scale(1.05);
				}
				
				.brand-buttons .brand-button.active {
				  background-color: #e74c3c;
				  color: #fff;
				}
								

    </style>
    <script type="text/javascript">
    	
    </script>
</head>
<body>
	 <!-- 상단 제목 및 경로 -->
  <div class="page-header">
    <div class="breadcrumb"><a href="${ctp}">HOME</a> > <a href="${ctp}/shop/shopList?category=${fn: toUpperCase(category)}">${fn: toUpperCase(category)}</a></div>
    <h2>${fn: toUpperCase(category)}</h2>
  </div>
  
  
	<div class="brand-container">
  	<!-- 카테고리 메뉴 -->
		<div class="category-menu">
	    <h3>${fn: toUpperCase(category)}</h3>
	    <ul>
	      <c:forEach var="mainCategoryList" items="${mainCategoryList}" varStatus="st">
          <li><a href="${ctp}/shop/shopMainList?category=${category}&mainCategory=${mainCategoryList}">${mainCategoryList}</a></li>
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
  
  <h3 class="new-arrivals-title">Best Product</h3>
  <div class="new-arrivals-container">
    <!-- 왼쪽 브랜드 버튼 -->
    <div class="brand-buttons">
      <ul>
	      <c:forEach var="i" begin="0" end="4">
          <li>
            <button class="brand-button" data-brand="${brands[i]}">
              ${brands[i]}
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
		          <div class="product-card" onclick="location.href='${ctp}/shop/shopContent?idx=${product.idx}'">
		            <!-- 할인 배지 -->
		            <c:if test="${product.discount != 0}">
		              <div class="discount-badge">${product.discount}% 할인</div>
		            </c:if>
		            <!-- 제품 이미지 -->
		            <img src="${ctp}/category/${product.thumbnail}" alt="${product.company}">
		            <div class="product-info">
		              <h4>${product.title}</h4>
		              <!-- 할인율 계산 -->
		              <c:choose>
		                <c:when test="${product.discount > 0}">
		                  <p>
		                    <span class="original-price">
		                      <fmt:formatNumber value="${product.price}" pattern="#,##0"/>원
		                    </span>
		                    <span class="discounted-price">
		                      <fmt:formatNumber value="${product.price - (product.price * product.discount / 100)}" pattern="#,##0"/>원
		                    </span>
		                  </p>
		                </c:when>
		                <c:otherwise>
		                  <span class="discounted-price">
		                    <fmt:formatNumber value="${product.price}" pattern="#,##0"/>원
		                  </span>
		                </c:otherwise>
		              </c:choose>
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