<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>업체 마이페이지</title>
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
      max-width: 1200px;
      margin: 50px auto;
      padding: 20px;
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      height: auto;
      height: 800px;
    }
    .info {
      display: flex;
      align-items: center;
      margin-bottom: 30px;
      border-bottom: 2px solid #f0f0f0;
      padding-bottom: 15px;
    }
    .info .profile {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      background-color: #e1c699;
      color: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 24px;
      font-weight: bold;
      margin-right: 20px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .info .name {
      font-size: 24px;
      font-weight: bold;
    }
    .info .id {
      font-size: 14px;
      color: #777;
    }
    .info .logout {
      margin-left: auto;
      padding: 10px 20px;
      border: 1px solid #e1c699;
      border-radius: 5px;
      background: transparent;
      color: #e1c699;
      cursor: pointer;
      transition: all 0.3s ease;
    }
    .info .logout:hover {
      background: #e1c699;
      color: #fff;
    }

    .menu {
      width: 25%;
      float: left;
      margin-right: 20px;
      background: #f9f9f9;
      border-radius: 10px;
      border: 1px solid #e1e1e1;
      padding: 20px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
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

    .section {
      margin-bottom: 30px;
    }
    .section h3 {
      font-size: 20px;
      font-weight: bold;
      margin-bottom: 15px;
      border-bottom: 2px solid #f0f0f0;
      padding-bottom: 10px;
    }
    .section ul {
      list-style: none;
      padding: 0;
      margin: 0;
    }
    .section ul li {
      padding: 10px 0;
      border-bottom: 1px solid #e1e1e1;
    }
    .section ul li:last-child {
      border-bottom: none;
    }
    .section ul li a {
      text-decoration: none;
      color: #333;
      transition: color 0.3s ease;
    }
    .section ul li a:hover {
      color: #e1c699;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="info">
    <div class="profile">F</div>
    <div>
      <div class="name">${vo.company}</div>
      <div class="id">${vo.mid}</div>
    </div>
    <button class="logout" onclick="location.href='${ctp}/common/logout'">로그아웃</button>
  </div>

  <div class="menu">
    <ul>
      <li><a href="#">주문 관리</a></li>
      <li><a href="#">상품 등록</a></li>
      <li><a href="#">판매 내역</a></li>
      <li><a href="#">고객 문의</a></li>
      <li><a href="#">정산 관리</a></li>
      <li><a href="#">내 정보 관리</a></li>
      <li><a href="#">회원 탈퇴</a></li>
    </ul>
  </div>

  <div class="content">
    <div class="section">
      <h3>주문 현황</h3>
      <ul>
        <li><a href="#">신규 주문 5건</a></li>
        <li><a href="#">처리 중인 주문 3건</a></li>
        <li><a href="#">완료된 주문 10건</a></li>
      </ul>
    </div>

    <div class="section">
      <h3>최근 고객 문의</h3>
      <ul>
        <li><a href="#">배송 관련 문의</a></li>
        <li><a href="#">반품 요청</a></li>
        <li><a href="#">상품 문의</a></li>
      </ul>
    </div>

    <div class="section">
      <h3>정산 상태</h3>
      <ul>
        <li>정산 예정 금액: 2,500,000원</li>
        <li>정산 완료 금액: 1,200,000원</li>
      </ul>
    </div>
  </div>
</div>

</body>
</html>
