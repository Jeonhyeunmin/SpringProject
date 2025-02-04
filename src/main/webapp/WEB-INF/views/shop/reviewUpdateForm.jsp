<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <style>
  	@font-face { /*눈누 기초고딕 - 두꺼운 네모 딱딱 고딕*/
	    font-family: 'NoonnuBasicGothicRegular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
		}
		
    body {
      font-family: 'NoonnuBasicGothicRegular';
      font-family: Arial, sans-serif;
    }
    .review-card {
      max-width: 800px;
      padding: 20px;
    }
    .review-card img {
      max-width: 150px;
      border-radius: 5px;
    }
    .review-header {
      display: flex;
      align-items: center;
      gap: 20px;
      margin-bottom: 20px;
    }
    .review-header .product-info h4 {
      margin: 0;
      font-size: 18px;
      font-weight: bold;
      margin-bottom: 20px;
    }
    .review-header .product-info p {
      margin: 0;
      color: #999;
      font-size: 14px;
    }
    .star-rating {
    	direction: rtl;
      margin-top: 40px;
      text-align: left;
    }
    .star-rating input {
      display: none;
    }
    .star-rating label {
      font-size: 32px;
      color: #ccc;
      cursor: pointer;
    }
    .star-rating input:checked ~ label,
    .star-rating label:hover,
    .star-rating label:hover ~ label {
      color: #ff9800;
    }
    textarea {
      resize: none;
    }
    .form-footer {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-top: 20px;
    }
    .form-footer .btn {
      width: 48%;
    }
    .review-notice {
      font-size: 15px;
      color: #555;
      margin-top: 10px;
      text-align: left;
    }
  </style>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
  <div class="container">
    <form method="post" name="reviewForm">
	    <div class="review-card">
	      <!-- Header -->
	      <div class="review-header">
	        <img src="${ctp}/category/${shopVO.thumbnail}" alt="${shopVO.title}">
	        <div class="product-info">
	          <h4>${shopVO.title}</h4>
	          <p>${shopVO.company}</p>
			      <!-- 별점 -->
		        <div class="star-rating">
		          <input type="radio" id="star5" name="star" value="5" ${reviewVO.star == 5 ? 'checked' : ''}>
		          <label for="star5"><i class="fa-solid fa-star"></i></label>
		          <input type="radio" id="star4" name="star" value="4" ${reviewVO.star == 4 ? 'checked' : ''}>
		          <label for="star4"><i class="fa-solid fa-star"></i></label>
		          <input type="radio" id="star3" name="star" value="3" ${reviewVO.star == 3 ? 'checked' : ''}>
		          <label for="star3"><i class="fa-solid fa-star"></i></label>
		          <input type="radio" id="star2" name="star" value="2" ${reviewVO.star == 2 ? 'checked' : ''}>
		          <label for="star2"><i class="fa-solid fa-star"></i></label>
		          <input type="radio" id="star1" name="star" value="1" ${reviewVO.star == 1 ? 'checked' : ''}>
		          <label for="star1"><i class="fa-solid fa-star"></i></label>
		        </div>
	        </div>
	      </div>
	        <!-- 리뷰 내용 -->
	        <div class="mb-3">
	          <label for="reviewContent" class="form-label">상세리뷰</label>
	          <textarea id="reviewContent" name="content" class="form-control" rows="5">${reviewVO.content}</textarea>
	        </div>
	        <!-- 안내문구 -->
	        <div class="review-notice">
	          <p>상품 품질과 관계 없는 내용은 비공개 처리될 수 있습니다.</p>
	          <p>상품평은 삭제 전까지 <strong style="color: red;">해당 게시물 상품평</strong>에서 수정 및 삭제가 가능합니다.</p>
	        </div>
	        <!-- 하단 버튼 -->
	        <div class="form-footer">
	          <button type="button" class="btn btn-secondary" onclick="closeReviewUpdateForm()">취소하기</button>
	          <button type="button" onclick="reviewCheck()" class="btn btn-primary">수정하기</button>
	        </div>
	        <!-- Hidden fields -->
	        <input type="hidden" id="mid" name="mid" value="${sMid}">
	        <input type="hidden" id="shopIdx" name="shopIdx" value="${shopVO.idx}">
	        <input type="hidden" id="reviewIdx" name="reviewIdx" value="${reviewVO.idx}">
	    </div>
    </form>
  </div>
</body>
</html>
