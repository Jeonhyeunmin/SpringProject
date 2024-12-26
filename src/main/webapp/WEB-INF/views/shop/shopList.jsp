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
        .container {
            display: flex;
            width: 90%;
            max-width: 1200px;
            margin: auto;
        }
        .category-menu {
            width: 20%;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .category-menu h3 {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .category-menu ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .category-menu ul li {
            margin-bottom: 10px;
        }
        .category-menu ul li a {
            text-decoration: none;
            color: #333;
            font-size: 14px;
        }
        .category-menu ul li a:hover {
            color: #e74c3c;
        }
        .swiper-container {
            width: 80%;
            margin-left: 20px;
        }
        .swiper {
            width: 100%;
            height: 400px;
        }
        .swiper-slide {
            display: flex;
            justify-content: center;
            align-items: center;
            background: #f4f4f4;
        }
        .swiper-slide img {
            width: auto;
            height: 100%;
            object-fit: contain;
        }
        .swiper-pagination-bullet {
            background: #333 !important;
            opacity: 0.8 !important;
        }
        .button-container {
            text-align: center;
            margin-top: 10px;
        }
        .control-button {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 8px 16px;
            font-size: 14px;
            font-weight: bold;
            border-radius: 5px;
            margin: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .control-button:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
      <!-- 카테고리 메뉴 -->
      <div class="category-menu">
        <h3>뷰티</h3>
        <ul>
        	<c:forEach var="vo" items="${vos}" varStatus="st">
          	<li><a href="#">${vo.subCategory}</a></li>
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
            <button class="control-button" onclick="goToSlide(0)">Chanel</button>
            <button class="control-button" onclick="goToSlide(1)">Whoo</button>
            <button class="control-button" onclick="goToSlide(2)">Hera</button>
            <button class="control-button" onclick="goToSlide(3)">Dior</button>
            <button class="control-button" onclick="goToSlide(4)">Clarins</button>
          </div>
      </div>

    <script>
        // Swiper 초기화
        const swiper = new Swiper('.swiper', {
            slidesPerView: 1,
            loop: true,
            autoplay: {
                delay: 3000,
                disableOnInteraction: false,
            },
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
        });

        // 특정 슬라이드로 이동하는 함수
        function goToSlide(index) {
            swiper.slideToLoop(index); // Swiper의 slideToLoop 메서드로 슬라이드 이동
        }
    </script>
</body>
</html>
