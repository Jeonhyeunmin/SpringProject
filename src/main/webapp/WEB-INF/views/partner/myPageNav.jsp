<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  
  <style type="text/css">
    html, body {
      height: 100%;
      margin: 0;
      padding: 0;
      font-family: 'Arial', sans-serif;
    }

    .menu-container {
      width: 250px;
      background: #f8f9fa;
      padding: 20px;
      height: 100%;
      box-shadow: 2px 0 6px rgba(0, 0, 0, 0.1);
    }

    .menu-container .menu-title {
      font-size: 16px;
      font-weight: bold;
      color: #333;
      margin-bottom: 15px;
      border-bottom: 1px solid #ddd;
      padding-bottom: 5px;
    }

    .menu-container ul {
      list-style: none;
      padding: 0;
      margin: 0 0 20px 0;
    }
    
    .menu-container ul li {
      margin-bottom: 10px;
    }

    .menu-container ul li a {
      display: block;
      text-decoration: none;
      color: #333;
      font-size: 14px;
      padding: 8px 10px;
      border-radius: 5px;
      transition: all 0.3s ease;
    }

    .menu-container ul li a:hover {
      background-color: #e1c699;
      color: white;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    .logo{
    	color: #e1c699 !important;
    	font-size: 30px;
    	margin-bottom: 10px;
    }
    .logo a{
    	text-decoration: none;
    }
  </style>
  <script type="text/javascript">
		function shopInput() {
		  if ("${vo.accept}" == "NO") {
		    alert("관리자 승인 후 상품 등록이 가능합니다.");
		    return false;
		  }

		  const url = "${ctp}/shop/shopInput";
		  window.open(url, "partner");
		}
		
  </script>
</head>
<body>
  <div class="menu-container">
		<div class="logo"><a href="${ctp}/partner/content" target="partner">Min's</a></div>
    <div class="menu-section">
      <div class="menu-title">상품관리</div>
      <ul>
        <li><a href="${ctp}/partner/shopList" target="partner">상품리스트</a></li>
        <li><a href="javascript:shopInput()">상품등록</a></li>
      </ul>
    </div>

    <div class="menu-section">
      <div class="menu-title">판매관리</div>
      <ul>
        <li><a href="${ctp}/partner/orderList" target="partner">주문목록</a></li>
        <li><a href="${ctp}/partner/adjustment" target="partner">정산</a></li>
        <li><a href="${ctp}/partner/exchange" target="partner">환불 및 반품</a></li>
      </ul>
    </div>
    
    <div class="menu-section">
      <div class="menu-title">고객관리</div>
      <ul>
        <li><a href="${ctp}/partner/partnerReviewList" target="partner" >리뷰</a></li>
        <li><a href="${ctp}/partner/claimPost" target="partner">신고된 글</a></li>
      </ul>
    </div>

    <div class="menu-section">
      <div class="menu-title">계정관리</div>
      <ul>
        <li><a href="${ctp}/partner/partnerUpdate" target="partner">계정 정보</a></li>
        <li><a href="">정산 계좌 관리</a></li>
      </ul>
    </div>
  </div>
</body>
</html>
