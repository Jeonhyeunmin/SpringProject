<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    /* 로고 섹션 */
    .sidebar .logo {
      font-size: 22px;
      font-weight: bold;
      margin-bottom: 30px;
      color: #F5D3A7; /* 포인트 골드 */
      text-transform: uppercase;
      margin-top: 29%;
    }

    /* 메뉴 리스트 */
    .sidebar a {
      width: 100%;
      text-decoration: none;
      padding: 15px 20px;
      margin: 5px 0;
      display: flex;
      align-items: center;
      font-size: 16px;
      color: #003366; /* 기본 텍스트 색상 */
      border-radius: 8px;
      transition: background 0.3s, color 0.3s;
    }

    /* 아이콘 스타일 */
    .sidebar a i {
      width: 20px;
      height: 20px;
      margin-right: 15px;
      color: inherit;
    }

    /* 호버 효과 */
    .sidebar a:hover {
      background: #F5D3A7; /* 골드 하이라이트 */
      color: #003366; /* 텍스트 딥 네이비 */
    }

    /* 활성화된 메뉴 */
    .sidebar a.active {
      background: #F5D3A7;
      color: white;
    }

    /* 하단 계정 섹션 */
		.sidebar {
		  width: 240px;
		  height: 100vh;
		  background-color: white;
		  color: black;
		  display: flex;
		  flex-direction: column; /* 수직 배치 */
		  align-items: center;
		  padding-top: 20px;
		  border-right: 1px solid #ddd;
		  position: fixed; /* 화면 고정 */
		}
		
		/* 하단 계정 섹션 */
		.sidebar .bottom-link {
		  margin-top: auto; /* 하단으로 밀기 */
		  padding: 15px 20px;
		  width: 100%;
		  color: black;
		  text-align: center;
		  font-size: 16px;
		  cursor: pointer;
		  transition: background 0.3s;
		}
		
		.sidebar .bottom-link:hover {
		  background: #F5D3A7;
		  color: #003366;
		}
  </style>
  <script>
	  document.addEventListener("DOMContentLoaded", function () {
	    const links = document.querySelectorAll(".sidebar a"); // 모든 링크 가져오기
	    const currentUrl = window.location.pathname; // 현재 URL 경로 가져오기
	
	    links.forEach(link => {
	      const linkHref = link.getAttribute("href");
	
	      // 현재 URL이 링크의 href와 일치하거나 하위 경로일 경우
	      if (linkHref && currentUrl.startsWith(linkHref)) {
	        link.classList.add("active");
	      } else {
	        link.classList.remove("active");
	      }
	    });
	  });
	</script>
  
</head>
<body>
  <div class="sidebar">
    <div class="logo">Min's ADMIN</div>
    <a href="${ctp}/admin/admin" class="active">
      <i class="fas fa-chart-pie"></i> <!-- 대시보드 아이콘 -->
      대시보드
    </a>
    <a href="${ctp}/admin/userManage">
      <i class="fas fa-users"></i> <!-- 고객관리 아이콘 -->
      고객관리
    </a>
    <a href="${ctp}/admin/partnerManage">
      <i class="fas fa-store"></i> <!-- 업체관리 아이콘 -->
      업체관리
    </a>
    <a href="#">
      <i class="fas fa-file-alt"></i> <!-- 게시물 관리 아이콘 -->
      게시물 관리
    </a>
    <a href="${ctp}/admin/reviewManage">
      <i class="fas fa-comment-dots"></i> <!-- 리뷰관리 아이콘 -->
      리뷰관리
    </a>
    <a href="${ctp}/admin/orderManage">
      <i class="fas fa-receipt"></i> <!-- 주문관리 아이콘 -->
      주문관리
    </a>
    <a href="#">
      <i class="fas fa-calculator"></i> <!-- 정산 아이콘 -->
      정산
    </a>
    <a href="#">
      <i class="fas fa-ticket-alt"></i> <!-- 쿠폰관리 아이콘 -->
      쿠폰관리
    </a>
    <a href="#">
      <i class="fas fa-gift"></i> <!-- 이벤트 아이콘 -->
      이벤트
    </a>
    <div class="bottom-link" onclick="location.href='${ctp}'">
      <i class="fas fa-sign-out-alt"></i> <!-- 로그아웃 아이콘 -->
      Exit
    </div>
  </div>
</body>
</html>
