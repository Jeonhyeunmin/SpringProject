<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <style>
    body {
      font-family: 'Roboto', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f7f7f7;
      color: #333;
    }
    .container {
      max-width: 1170px !important;
      margin: 50px auto;
      padding: 20px;
      border-radius: 10px;
      height: 800px;
    }
    
	  .info {
	    display: flex;
	    align-items: center;
	    margin-bottom: 30px;
	    padding: 20px;
	    border-bottom: 1px solid #ddd;
	  }
	
	  .info .info-tab {
	    display: flex;
	    flex-direction: column;
	    justify-content: center;
	    align-items: center;
	    height: 150px;
	    flex: 1;
	    text-align: center;
	  }
	
	  .info .profile {
	    width: 80px;
	    height: 80px;
	    border-radius: 50%;
	    overflow: hidden;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    text-align: center;
	  }
	
	  .info .profile img {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	  }
	
	  .info .info-detail {
	    flex: 1;
	    text-align: left;
	  }
	
	  .info .name {
	    font-size: 26px;
	    font-weight: bold;
	    color: #333;
	    margin-bottom: 5px;
	  }
	
	  .info .id {
	    font-size: 14px;
	    color: #666;
	    margin-bottom: 15px;
	  }
	
	  .info .info-title {
	    font-size: 22px;
	    font-weight: bold;
	    color: #555;
	    margin-bottom: 10px;
	  }
	
	  .info .info-cnt {
	    font-size: 18px;
	    color: #888;
	  }
	
	  .info .logout {
	    margin-left: auto;
	    padding: 12px 25px;
	    border: 1px solid #e1c699;
	    border-radius: 5px;
	    background: #fff;
	    color: #e1c699;
	    font-weight: bold;
	    cursor: pointer;
	    transition: all 0.3s ease;
	  }
	
	  .info .logout:hover {
	    background: #e1c699;
	    color: #fff;
	  }
	
	  .info .logout:hover {
	    background: #e1c699;
	    color: #fff;
	  }

		.info > div {
		  flex: 1;
		  text-align: center;
		}
		.info > div:not(:last-child) {
		  border-right: 1px solid #e1e1e1;
		  padding-right: 15px;
		  margin-right: 15px;
		}
		.info > div:last-child {
		  padding-left: 15px;
		}

    .menu {
      width: 25%;
      float: left;
      margin-right: 20px;
      padding: 20px;
      height: 90%;
    }
    .menu ul {
      list-style: none;
      padding: 0;
      margin: 0;
    }
    .menu ul li {
      margin-bottom: 15px;
    }
    .menu ul li a {
      text-decoration: none;
      color: #333;
      font-size: 16px;
      padding: 10px;
      display: block;
      border-radius: 5px;
      background: #fff;
      transition: all 0.3s ease;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
    }
    .menu ul li a:hover {
      background-color: #e1c699;
      color: white;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .content {
      width: 72%;
      float: right;
    }

    .status-section {
      margin-bottom: 30px;
    }
    .status-section h3 {
      font-size: 20px;
      font-weight: bold;
      margin-bottom: 15px;
      border-bottom: 2px solid #f0f0f0;
      padding-bottom: 10px;
    }
    .status-list {
      display: flex;
      justify-content: space-between;
      gap: 10px;
    }
    .status-item {
      flex: 1;
      background: #fff;
      border: 1px solid #e1e1e1;
      border-radius: 8px;
      padding: 20px;
      text-align: center;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
      transition: transform 0.2s, background 0.3s, color 0.3s;
      cursor: pointer;
    }
    .status-item:hover {
      transform: translateY(-3px);
      background: #e1c699;
      color: #fff;
    }
    .status-item i {
      font-size: 24px;
      margin-bottom: 10px;
    }
    .status-item span {
      display: block;
      font-size: 14px;
    }

    .recent-orders, .faq {
      background: #fafafa;
      border: 1px solid #e1e1e1;
      border-radius: 8px;
      padding: 20px;
      margin-bottom: 20px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
    }
    .recent-orders h3, .faq h3 {
      font-size: 18px;
      margin-bottom: 15px;
    }
    .recent-orders ul, .faq ul {
      list-style: none;
      padding: 0;
      margin: 0;
    }
    .recent-orders li, .faq li {
      padding: 10px 0;
      border-bottom: 1px solid #e1e1e1;
    }
    .recent-orders li:last-child, .faq li:last-child {
      border-bottom: none;
    }
    .recent-orders li a, .faq li a {
      text-decoration: none;
      color: #333;
      transition: color 0.3s ease;
    }
    .recent-orders li a:hover, .faq li a:hover {
      color: #e1c699;
    }
    

		

  </style>
</head>
<body>
<div class="container">
  <div class="info">
    <div class="info-tab">
	  	<div class="profile"><img src="${ctp}/member/${vo.photo}"/></div>
	  	<div class="info-detail">
	      <div class="name">${vo.name} 님</div>
	      <div class="id">${vo.mid}</div>
      </div>
    </div>
    <div class="info-tab" onclick="">
      <div class="info-title">쿠폰</div>
      <div class="info-cnt">${fn: length(couponVOS)}장</div>
    </div>
    <div class="info-tab">
      <div class="info-title">Min's 포인트</div>
      <div class="info-cnt">${vo.point}P</div>
    </div>
    <button class="logout" onclick="location.href='${ctp}/common/logout'">로그아웃</button>
  </div>

  <div class="menu">
    <ul>
      <li class="menu-title">주문현황</li>
      <li><a href="#">주문확인/배송조회</a></li>
      <li><a href="#">취소/반품/교환</a></li>
      <li><a href="#">영수증/세금계산서</a></li>
      <li><a href="#">혜택</a></li>
      <li><a href="${ctp}/member/memberUpdate">내 정보 관리</a></li>
      <li><a href="#">회원 탈퇴</a></li>
    </ul>
  </div>

  <div class="content">
    <div class="status-section">
      <h3>주문 현황</h3>
      <div class="status-list">
        <div class="status-item">
          <i class="fa-solid fa-box"></i>
          <span>주문 준비 중</span>
        </div>
        <div class="status-item">
          <i class="fa-solid fa-truck"></i>
          <span>배송 중</span>
        </div>
        <div class="status-item">
          <i class="fa-solid fa-check"></i>
          <span>배송 완료</span>
        </div>
      </div>
    </div>

    <div class="recent-orders">
      <h3>최근 주문 내역</h3>
      <ul>
        <li>주문 내역이 없습니다.</li>
      </ul>
    </div>

    <div class="faq">
      <h3>FAQ</h3>
      <ul>
        <li><a href="#">배송 관련 문의</a></li>
        <li><a href="#">반품 및 환불 절차</a></li>
        <li><a href="#">회원 정보 수정</a></li>
      </ul>
    </div>
  </div>
</div>

</body>
</html>
