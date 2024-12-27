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
            display: flex;
            justify-content: center;
            align-items: flex-start;
            height: 100vh;
            background-color: #f9f9f9;
        }
        .brand-container {
            display: flex;
            max-width: 1200px;
            margin: auto;
            height: 400px;
        }
        .category-menu {
            width: 20%;
            height: 496px;
            display: flex;
            flex-direction: column;
            color: black;
            border-top: 1px solid black;
        }
        .category-menu h3 {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
            text-align: center;
            top: 10px;
            border-bottom: 1px solid #eee;
            padding: 25px;
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
				    width: 80%; /* 컨테이너 너비 */
				    margin: 0 auto;
				    position: relative;
				}
				
				.swiper {
				    width: 100%;
				    height: 400px; /* 슬라이더의 높이를 설정 */
				}
				
				.swiper-slide {
				    display: flex;
				    justify-content: center;
				    align-items: center;
				    background: #f4f4f4;
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
		      background-color: #f9f9f9;
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
		      margin-top: 5px;
		    }
	

    </style>
</head>
<body>
	 <!-- 상단 제목 및 경로 -->
  <div class="page-header">
    <div class="breadcrumb">HOME > ${fn: toUpperCase(category)}</div>
    <h2>${fn: toUpperCase(category)}</h2>
  </div>
  
  
	<div class="brand-container">
  	<!-- 카테고리 메뉴 -->
		<div class="category-menu">
	    <h3>${fn: toUpperCase(category)}</h3>
	    <ul>
	      <c:forEach var="mainCategoryList" items="${mainCategoryList}" varStatus="st">
	          <li><a href="#">${mainCategoryList}</a></li>
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
   		// 활성 버튼 설정 함수
      function setActiveButton(button) {
        const buttons = document.querySelectorAll('.control-button');
        buttons.forEach(btn => btn.classList.remove('active'));
        button.classList.add('active');
      }
  </script>
</body>
</html>
