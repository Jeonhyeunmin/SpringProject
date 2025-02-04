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
    	font-family: Arial, sans-serif;
      font-size: 22px;
      font-weight: bold;
      margin-bottom: 30px;
      color: #F5D3A7;
      text-transform: uppercase;
      margin-top: 29%;
      cursor: pointer;
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
      color: #003366;
      transition: background 0.3s, color 0.3s;
      cursor: pointer;
      border-top-left-radius: 8px;
      border-bottom-left-radius: 8px;
    }

    .sidebar a i {
      margin-right: 15px;
    }

    .sidebar a:hover {
      background: #F5D3A7;
      color: #003366;
    }

    .sidebar a.active {
      background: #F5D3A7;
      color: white;
    }

    .sidebar {
      width: 240px;
      height: 100vh;
      background-color: white;
      color: black;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding-top: 20px;
      border-right: 1px solid #ddd;
      position: fixed;
    }

    /* 하위 메뉴 스타일 */
    .submenu {
      display: none;
      flex-direction: column;
      width: 100%;
      padding-left: 20px;
    }

    .submenu a {
      font-size: 14px;
      padding: 10px 20px;
      color: #555;
    }

    .submenu a:hover {
      background: #eee;
      color: #333;
    }

    .submenu.open {
      display: flex;
    }

    /* 하단 계정 섹션 */
    .sidebar .bottom-link {
      margin-top: auto;
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
  	  const submenus = document.querySelectorAll(".submenu");
  	  const menus = document.querySelectorAll(".menu-post, .menu-event");

  	  menus.forEach(menu => {
  	    menu.addEventListener("click", function () {
  	      // 현재 메뉴에 연결된 서브메뉴 찾기
  	      const targetSubmenu = this.nextElementSibling;

  	      // 모든 서브메뉴 닫기
  	      submenus.forEach(submenu => {
  	        if (submenu !== targetSubmenu) {
  	          submenu.classList.remove("open");
  	        }
  	      });

  	      // 클릭한 메뉴의 서브메뉴 토글
  	      targetSubmenu.classList.toggle("open");
  	    });
  	  });

      // 현재 URL 활성화
      const links = document.querySelectorAll(".sidebar a");
      const currentUrl = window.location.pathname;

      links.forEach(link => {
        const linkHref = link.getAttribute("href");
        if (linkHref && currentUrl.startsWith(linkHref)) {
          link.classList.add("active");
        } else {
          link.classList.remove("active");
        }
      });
    });
	</script>
  
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
  <div class="sidebar">
    <div class="logo" onclick="location.href='${ctp}/admin/admin'">Min's ADMIN</div>
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
      파트너관리
    </a>
    <a href="javascript:void(1)" class="menu-post">
      <i class="fas fa-file-alt"></i> <!-- 게시물 관리 아이콘 -->
      게시물 관리
    </a>
    <div class="submenu">
      <a href="${ctp}/admin/acceptPost">미승인 게시물</a>
      <a href="${ctp}/admin/claimPost">신고 게시물</a>
    </div>
    <a href="${ctp}/admin/reviewManage">
      <i class="fas fa-comment-dots"></i> <!-- 리뷰관리 아이콘 -->
      리뷰관리
    </a>
    <a href="${ctp}/admin/orderManage">
      <i class="fas fa-receipt"></i> <!-- 주문관리 아이콘 -->
      주문관리
    </a>
    <a href="${ctp}/admin/adjustmentManage">
      <i class="fas fa-calculator"></i> <!-- 정산 아이콘 -->
      정산
    </a>
    <a href="javascript:void(1)" class="menu-event">
      <i class="fas fa-gift"></i> <!-- 이벤트 아이콘 -->
      이벤트
    </a>
    <div class="submenu submenu-event">
		  <a href="${ctp}/admin/eveneManage">이벤트 관리</a>
		  <a href="${ctp}/event/eventInput">이벤트 등록</a>
		</div>
    <a href="${ctp}/admin/couponManage">
      <i class="fas fa-ticket-alt"></i> <!-- 쿠폰관리 아이콘 -->
      쿠폰관리
    </a>
    <div class="bottom-link" onclick="location.href='${ctp}'">
      <i class="fas fa-sign-out-alt"></i> <!-- 로그아웃 아이콘 -->
      Exit
    </div>
  </div>
</body>
</html>
