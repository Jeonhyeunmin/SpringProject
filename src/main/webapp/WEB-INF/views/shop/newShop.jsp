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
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f9f9f9;
      }
      .new-container{
      	max-width: 2500px;
      	margin: 0 6%;
      }
      .page-header {
        width: 100%;
        padding: 20px 0;
        text-align: center;
        margin: auto;
        margin-bottom: 20px;
      }
      .page-header h2 {
        font-size: 24px;
        font-weight: bold;
        margin: 0;
      }
      
  		@font-face {
		    font-family: 'Tenada';
		    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-2@1.0/Tenada.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
			}
			
			@font-face { /*눈누 기초고딕 - 두꺼운 네모 딱딱 고딕*/
		    font-family: 'NoonnuBasicGothicRegular';
		    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
			}
			
			.filter-section{
			  font-family: 'NoonnuBasicGothicRegular';
			}
      .page-header .breadcrumb {
      	font-size: 14px;
	      color: #555;
	      margin-top: 2%;
	      margin-left: 19.5%;
		    background-color: #fff;
		    font-family: 'Tenada';
      }
      .breadcrumb a {
        text-decoration: none;
        padding: 0 5px;
      }
      .button-group {
        display: flex;
        justify-content: center;
        gap: 10px;
        text-align: center;
        margin: auto 19%;
        border-top: 1px solid black;
        border-bottom: 1px solid #ddd;
        width: 70%;
        justify-content: flex-start;
        padding-left: 30px;
        margin-bottom: 50px;
      }
      .button-group-ul {
        list-style: none;
        padding: 0;
        margin: 0;
      }
      .button-group-ul li {
        display: inline;
      }
      .grid-container {
      	font-family: 'NoonnuBasicGothicRegular';
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 20px;
        margin: 20px 15%;
        padding: 10px;
        max-width: 1350px;
      }
      .grid-item {
        position: relative;
        overflow: hidden;
        text-align: center;
      }
      .grid-item img {
        width: 100%;
        height: auto;
        object-fit: cover;
      }
      .grid-item:hover img {
        opacity: 0.3;
      }
      .grid-item .info {
        padding: 15px;
      }
      .grid-item .title {
        font-size: 16px;
        font-weight: bold;
        color: #333;
        margin-bottom: 10px;
		    white-space: nowrap;
		    overflow: hidden;
		    text-overflow: ellipsis;
      }
      .grid-item .price {
        font-size: 18px;
        font-weight: bold;
        color: #e74c3c;
      }
      .filter-section {
		    margin: 20px 15%;
		    padding: 15px 20px;
		    display: flex;
		    gap: 20px;
		    align-items: center;
		    justify-content: space-between;
		    background-color: #f5f5f5; /* 배경색 추가 */
		    border-radius: 10px; /* 둥근 모서리 */
		    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 약간의 그림자 */
		  }
		
		  .filter-section input,
		  .filter-section select {
		    padding: 12px 15px;
		    font-size: 14px;
		    border: 1px solid #ddd;
		    border-radius: 5px;
		    width: 100%;
		    box-sizing: border-box;
		    transition: border-color 0.3s, box-shadow 0.3s;
		  }
		
		  .filter-section input:focus,
		  .filter-section select:focus {
		    border-color: #007bff; /* 포커스 시 테두리 색 */
		    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* 포커스 시 그림자 */
		    outline: none;
		  }
		
		  .filter-section label {
		    font-size: 14px;
		    color: #555;
		    font-weight: bold;
		  }
		
		  .filter-group {
		    display: flex;
		    flex-direction: column;
		    gap: 5px; /* 필터 그룹 간격 */
		    width: 30%; /* 각 필터 크기 */
		  }
      
      			
		  .discount-badge {
		    position: absolute;
		    top: 10px;
		    left: 10px;
		    background-color: #e1c699;
		    color: #fff;
		    font-size: 12px;
		    padding: 5px 8px;
		    border-radius: 5px;
		  }
		  
    </style>
    <script>
    	function filterProducts() {
    	  var searchKeyword = $('#searchInput').val().toLowerCase();
    	  var category = $('#categoryFilter').val();
    	  var price = $('#priceFilter').val();
    	  // Ajax 요청 보내기
    	  $.ajax({
    	    url: "${ctp}/shop/filterProducts",
    	    type: 'get',
    	    dataType: 'json',
    	    data: {
    	      search: searchKeyword,
    	      category: category,
    	      price: price
    	    },
    	    success: function (products) {
  	    	  renderProducts(products);
    	    },
    	    error: function (xhr, status, error) {
    	        console.error('Ajax 요청 중 오류 발생:', error);
    	        console.error('응답 내용:', xhr.responseText); // 서버에서 반환된 HTML 내용 확인
    	        alert('요청 처리 중 오류가 발생했습니다. 관리자에게 문의하세요.');
    	    }
    	  });
    	}


	
    	function renderProducts(products) {
  		  var container = $('.grid-container');
  		  container.empty(); // 기존 상품 제거

  		  if (!Array.isArray(products) || products.length === 0) {
  		    container.append('<div>상품이 없습니다.</div>');
  		    return;
  		  }

  		  products.forEach(function (product) {
  		    var itemHtml = '' +
  		      '<div class="grid-item" onclick="location.href=\'${ctp}/shop/shopContent?idx=' + product.idx + '\'">' +
  		        '<img src="${ctp}/category/' + product.thumbnail + '" alt="Thumbnail">' +
  		        '<div class="info">' +
  		          '<div class="title">' + product.title + '</div>' +
  		          '<div class="price">' + product.price.toLocaleString() + '원</div>' +
  		        '</div>' +
  		      '</div>';
  		    container.append(itemHtml);
  		  });
  		}
    	
    	$(document).ready(function () {
        $('#keyword').on('keyup', function (event) {
          if (event.keyCode === 13) {
        	  filterProducts();
          }
        });
	    });
    </script>
</head>
<body>
  <div class="page-header">
    <div class="breadcrumb"><a href="${ctp}">HOME</a> > NEW ARRIVAL</div>
  </div>
	<div class="new-container">
    <!-- 상단 제목 및 경로 -->
    <div style="text-align: center; margin-bottom: 20px;"><h2 style="font-weight: bold;">NEW ARRIVAL</h2></div>

    <!-- 검색 및 필터 -->
    <div class="filter-section">
		  <input type="text" id="searchInput" placeholder="검색어를 입력하세요" onkeyup="filterProducts()"/>
		  <select id="categoryFilter" onchange="filterProducts()">
		    <option value="">카테고리 선택</option>
		    <c:forEach var="category" items="${category}">
		      <option value="${category}">${category}</option>
		    </c:forEach>
		  </select>
		  <select id="priceFilter" onchange="filterProducts()">
		    <option value="">가격 범위 선택</option>
		    <option value="low">0 ~ 50,000원</option>
		    <option value="mid">50,000 ~ 100,000원</option>
		    <option value="high">100,000원 이상</option>
		  </select>
		</div>

    <!-- 상품 목록 -->
    <div class="grid-container">
    	<c:if test="${empty vos}"><div style="height: 1000px"></div></c:if>
      <c:forEach var="vo" items="${vos}" varStatus="st">
        <div class="grid-item" onclick="location.href='${ctp}/shop/shopContent?idx=${vo.idx}'">
          <c:if test="${vo.discount != 0}">
            <div class="discount-badge">${vo.company} ${vo.discount}%</div>
          </c:if>
          <img src="${ctp}/category/${vo.thumbnail}" alt="Thumbnail">
          <div class="info">
            <div class="title">${vo.title}</div>
            <div class="price"><fmt:formatNumber value="${vo.price}" pattern="#,##0" />원</div>
          </div>
      </div>
      </c:forEach>
    </div>
	</div>
</body>
</html>
