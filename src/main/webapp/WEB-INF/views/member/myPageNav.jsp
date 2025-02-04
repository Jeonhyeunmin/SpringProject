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
  	@font-face { /*눈누 기초고딕 - 두꺼운 네모 딱딱 고딕*/
	    font-family: 'NoonnuBasicGothicRegular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
		}
		
    html, body {
      height: 100%;
      margin: 0;
      padding: 0;
      overflow: hidden; 
    }

    .menu-container {
    	font-family: 'NoonnuBasicGothicRegular';
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
		function userLeavel() {
  		let ans = confirm("회원 탈퇴를 진행하시겠습니까?")
  		
  		if(ans){
  			location.href='${ctp}/member/memberUserLeave';
  		}
		}
		
  </script>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
  <div class="menu-container">
		<div class="logo"><a href="${ctp}/member/content" target="customer">Min's</a></div>
    <div class="menu-section">
      <div class="menu-title">주문현황</div>
      <ul>
        <li><a href="${ctp}/member/myOrder" target="customer">주문확인/배송조회</a></li>
      </ul>
    </div>

    <div class="menu-section">
      <div class="menu-title">MIn's 백</div>
      <ul>
      	<li><a href="${ctp}/shop/shopCart" target="_blank">장바구니</a></li>
      	<li><a href="${ctp}/member/recentView" target="customer">최근 본 상품</a></li>
      </ul>
    </div>
    
    <div class="menu-section">
      <div class="menu-title">Min's 다이어리</div>
      <ul>
        <li><a href="${ctp}/shop/couponSelect" target="customer">쿠폰</a></li>
        <li><a href="${ctp}/member/myReviewList" target="customer">상품평 관리</a></li>
      </ul>
    </div>

    <div class="menu-section">
      <div class="menu-title">나의 정보</div>
      <ul>
        <li><a href="${ctp}/member/memberUpdate" target="customer">회원정보 변경</a></li>
        <li><a href="javascript:userLeavel()">회원 탈퇴</a></li> 
      </ul>
    </div>
  </div>
</body>
</html>
