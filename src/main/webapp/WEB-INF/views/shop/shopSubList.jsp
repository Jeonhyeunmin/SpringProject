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
	    	/* 상단 제목 및 경로 */
		    .page-header {
				    width: 100%;
				    padding: 20px 0;
				    text-align: center;
				    margin: auto;
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
		      margin-left: 19.5%;
			    background-color: #fff;
		    }
		    
		    .breadcrumb a{
		    	text-decoration: none;
		    	padding: 0 5px;
		    }
				.button-group {
				  display: flex;
				  justify-content: center;
				  gap: 10px;
				  font-family: 'ChosunGu';
				  font-weight: light;
				  text-align: center;
			    margin: auto 19%;
				  border-top: 1px solid black;
				  border-bottom: 1px solid #ddd;
					width: 70%;
					justify-content: flex-start;
					padding-left: 30px;
					margin-bottom: 50px;
				}
				.button-group button{
					background-color: transparent;
					padding: 30px;
					border: none;
					transition: all 0.3s;
				}
				.button-group button:hover{
					background-color: #eee;
					transform: scale(1.05);
					
				}
				.button-group-ul{
					list-style: none;
					padding: 0;
					margin: 0;
					text-align: left;
				}
				.button-group-ul li{
					display: inline;
					width: 100px;
				}
				
				.grid-container {
			    display: grid;
			    grid-template-columns: repeat(4, 1fr);
			    gap: 20px;
			    margin: 20px 15% 0 18.5%;
			    padding: 10px;
			    max-width: 1350px;
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
			
			  .overlay-buttons button {
			    background-color: #fff;
			    color: #333;
			    border: 1px solid #ddd;
			    padding: 10px 15px;
			    font-size: 14px;
			    border-radius: 5px;
			    cursor: pointer;
			    transition: background-color 0.3s, transform 0.3s;
			  }
			
			  .overlay-buttons button:hover {
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
			  }
			  .grid-item .title:hover {
			    text-decoration: underline;
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
<body>
	 <!-- 상단 제목 및 경로 -->
  <div class="page-header">
    <div class="breadcrumb">HOME > <a href="${ctp}/shop/shopList?category=${category}">${fn: toUpperCase(category)}</a> > <a href="${ctp}/shop/shopMainList?mainCategory=${mainCategory}">${fn: toUpperCase(mainCategory)}</a> > <a href="${ctp}/shop/shopSubList?subCategory=${subCategory}">${fn: toUpperCase(subCategory)}</a></div>
    <h2>${fn: toUpperCase(mainCategory)}</h2>
  </div>
  
  <div class="button-group">
  	<ul class="button-group-ul">
  		<c:forEach var="BrandList" items="${BrandList}" varStatus="st">
  			<li><button type="button" onclick="location.href='${ctp}/shop/shopSubList?subCategory=${subCategory}&company=${BrandList}'">${BrandList}(${BrandCnt[st.index]})</button></li>
			</c:forEach>
  	</ul>
	</div>
  <div class="button-group">
  	<ul class="button-group-ul">
			<li><button type="button" onclick="">많이팔린순</button></li>
			<li><button type="button" onclick="">최근등록순</button></li>
			<li><button type="button" onclick="">낮은가격순</button></li>
			<li><button type="button" onclick="">높은가격순</button></li>
			<li><button type="button" onclick="">상품평개수순</button></li>
			<li><button type="button" onclick="location.href='${ctp}/shop/shopInput'">등록</button></li>
  	</ul>
	</div>
	
	<div class="grid-container">
	  <c:forEach var="vo" items="${vos}" varStatus="st">
	    <div class="grid-item" onclick="location.href='${ctp}/shop/shopContent?idx=${vo.idx}'">
	      <c:if test="${vo.discount != 0}">
	      	<div class="discount-badge">${vo.company} ${vo.discount}%</div>
	      </c:if>
	      <div class="moveContent">
	        <img src="${ctp}/category/${vo.thumbnail}" alt="Thumbnail">
	        <div class="overlay-buttons">
	          <button type="button" onclick="window.open('${ctp}/shop/shopContent?idx=${vo.idx}')" ><i class="fa-solid fa-eye"></i>새창</button>
	          <button type="button"><i class="fa-solid fa-heart"></i>찜</button>
        </div>
	      </div>
	      <div class="info">
	        <div class="title">${vo.title}</div>
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
	</div>
  
  
  
</body>
</html>