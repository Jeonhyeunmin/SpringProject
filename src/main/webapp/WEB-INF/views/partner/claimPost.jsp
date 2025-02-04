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
    	@font-face { /*눈누 기초고딕 - 두꺼운 네모 딱딱 고딕*/
		    font-family: 'NoonnuBasicGothicRegular';
		    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
			}
      body {
		    font-family: 'NoonnuBasicGothicRegular';
		    margin: 0;
		    padding: 0;
			}
			.grid-container {
		    display: grid;
		    grid-template-columns: repeat(4, 1fr);
		    gap: 20px;
		    padding: 10px;
		  }
		
		  .grid-item {
		    position: relative;
		    overflow: hidden;
		    text-align: center;
		  }
		  
		  .grid-item:hover {
		    cursor: pointer;
		  }
		
		
		  .grid-item img {
		    width: 100%;
		    height: auto;
		    object-fit: cover;
		  }
		  
	    .grid-item:hover img {
		    opacity: 0.3;
		  }
		  
		  .grid-item .overlay-buttons {
		    position: absolute;
		    top: 50%;
		    left: 50%;
		    transform: translate(-50%, -50%);
		    display: none;
		    gap: 10px;
		    z-index: 2;
		  }
		
		  .grid-item:hover .overlay-buttons {
		    display: flex;
		  }
		
		  .overlay-buttons a {
		    background-color: #fff;
		    color: #333;
		    border: 1px solid #ddd;
		    padding: 10px 15px;
		    font-size: 14px;
		    border-radius: 5px;
		    cursor: pointer;
		    transition: background-color 0.3s, transform 0.3s;
		    text-decoration: none;
		  }
		
		  .overlay-buttons a:hover {
		    background-color: #e74c3c;
		    color: #fff;
		    transform: scale(1.1);
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
		    cursor: pointer;
		  }
		
		  .grid-item .price {
		    font-size: 18px;
		    font-weight: bold;
		    color: #e74c3c;
		    margin: 5px 0;
		  }
		
		  .grid-item .company-category {
		    font-size: 14px;
		    color: #555;
		    margin-top: 5px;
		  }
		
		  .grid-item .rating {
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    gap: 5px;
		    font-size: 14px;
		    margin-top: 10px;
		    color: #777;
		  }
		
		  .grid-item .rating i {
		    color: #f1c40f;
		  }

    </style>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
	<h3 class="text-start mt-4" style="font-weight: bold;">신고된 글 <font color="red" size="2px"> * 신고된 글은 고객에게 보이지 않습니다 수정 후 관리자에게 문의 바랍니다.</font></h3>
	<div class="grid-container">
  	<c:if test="${empty vos}">신고된 게시글이 없습니다.</c:if>
  	<c:if test="${!empty vos}">
		  <c:forEach var="vo" items="${vos}" varStatus="st">
		    <div class="grid-item">
		      <c:if test="${vo.discount != 0}">
		      	<div class="discount-badge">${vo.company} ${vo.discount}%</div>
		      </c:if>
		      <div class="moveContent">
		        <img src="${ctp}/category/${vo.thumbnail}" alt="Thumbnail">
		        <div class="overlay-buttons">
		          <a href="${ctp}/shop/shopUpdate?idx=${vo.idx}" target="partner" ><i class="fa-solid fa-pencil-alt"></i>게시물 수정</a>
	        	</div>
		      </div>
		      <div class="info">
		        <div class="title" onclick="window.open('${ctp}/shop/shopContent?idx=${vo.idx}')">${vo.title}</div>
		        <div class="price"><fmt:formatNumber value="${vo.price}" pattern="#,##0"/>원</div>
		        <div class="company-category">${vo.company} | ${fn:toUpperCase(vo.category)}</div>
		        <c:if test="${vo.reviewCnt != 0}">
			        <div class="rating">
			          <i class="fa-solid fa-star"></i>
			          ${vo.star}점 | ${vo.reviewCnt}개
			        </div>
		        </c:if>
		      </div>
		    </div>
		  </c:forEach>
	  </c:if>
	</div>
  
</body>
</html>