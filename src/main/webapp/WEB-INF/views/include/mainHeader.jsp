<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
<jsp:include page="/WEB-INF/views/include/bs5.jsp" />
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
    function toggleSidebar() {
    	const menu = document.querySelector(".menu");
      const sideMenu = document.querySelector(".side-menu-login");
      const overlay = document.querySelector(".overlay");

      menu.classList.toggle("active");
      sideMenu.classList.toggle("open");
      overlay.classList.toggle("active");
    }

    document.querySelector(".overlay").addEventListener("click", function() {
      const menu = document.querySelector(".menu");
      const sideMenu = document.querySelector(".side-menu-login");
      const overlay = document.querySelector(".overlay");

    	menu.classList.remove("active");
    	sideMenu.classList.remove("open");
    	overlay.classList.remove("active");
    });

    const navbar = document.querySelector("#navbar");
    
    document.addEventListener("scroll", () => {
      const scrollY = window.scrollY;
    	if(scrollY > 40) {
      	navbar.classList.add("fixed");
    	} 
    	else {
    		navbar.classList.remove("fixed");
  		}
    });

    const menuButton = document.querySelector(".menu");
    if (menuButton) {
    	menuButton.addEventListener("click", toggleSidebar);
    }

	});

	
	$(document).ready(function() {
	    const menuButton = $(".login");
	    const whiteBox = $(".white-box");
	    const demo = $("#demo");

	    menuButton.on("click", function() {
	        whiteBox.css({
	            "display": "block",
	            "z-index": "1000"
	        });

	        setTimeout(function() {
	            $.ajax({
	                url: "${ctp}/member/login",
	                type: "GET",
	                success: function(data) {
	                		$("body > *").not("#demo, .white-box").hide();
	                    demo.html(data);
	                    demo.css({
	                        "display": "block",
	                        "opacity": "0",
	                        "z-index": "999"
	                    });
	                },
	                error: function(xhr, status, error) {
	                    console.error("Error loading content:", error);
	                }
	            });
	        }, 500);

	        whiteBox.on("animationend", function(event) {
	            if (event.originalEvent.animationName === "slideWhiteBox") {
	                demo.animate({ opacity: 1 }, 100, function() {
	                });
	            }
	        });
	    });
	});

</script>
<style>
	/* 네비게이션 바 스타일 */
	.main-nav {
	    display: flex;
	    justify-content: space-between; /* 좌우 정렬 */
	    align-items: center; /* 세로 정렬 */
	    width: 100%;
	    position: fixed;
	    top: 0;
	    left: 0;
	    padding: 10px 5%; /* 상하, 좌우 여백 */
	    z-index: 1000;
	}
	
	/* 메뉴 스타일 */
	.nav {
	    display: flex;
	    gap: 30px; /* 메뉴 항목 간격 */
	    align-items: center;
	    list-style: none;
	    margin: 0;
	    padding: 0;
	}
	
	/* 메뉴 링크 스타일 */
	.nav a {
	    color: white;
	    text-decoration: none;
	    font-size: 18px;
	    font-weight: bold;
	    transition: color 0.3s;
	}
	
	.nav a:hover {
	    color: #f8f9fa;
	}
	
	/* 로고 스타일 */
	.Logo {
	    font-family: "Playfair Display", serif;
	    font-size: 32px;
	    font-weight: bold;
	    color: white;
	    text-decoration: none;
	    margin: 0 auto; /* 중앙 정렬 */
	}
	
	/* 아이콘 스타일 */
	.nav a i {
	    color: white;
	    font-size: 22px;
	    transition: color 0.3s;
	}
	
	.nav a i:hover {
	    color: #f8f9fa;
	}
	
	/* 햄버거 메뉴 스타일 */
	.menu {
	    display: flex;
	    flex-direction: column;
	    gap: 5px;
	    cursor: pointer;
	}
	
	.menu .bar {
	    width: 25px;
	    height: 3px;
	    background-color: white;
	    transition: all 0.3s ease;
	}

	
	.nav a {
		text-decoration: none;
		color: white;
		transition: color 0.5s ease-in-out;
		font-family: 'EliceDigitalBaeum-Bd';
		font-size: 20px;
	}
	
	.nav a:hover {
		color: white;
		text-decoration: none;
	}
	
	.menu.active .bar:nth-child(2) {
		opacity: 0;
	}
	
	.menu.active .bar:first-child {
		transform: rotate(45deg);
		position: absolute;
		top: 3px;
		left: 0;
	}
	
	.menu.active .bar:last-child {
		transform: rotate(-45deg);
		position: absolute;
		top: 3px;
		left: 0;
	}
	
  	.side-menu-login {
	    position: fixed;
	    right: -400px;
	    height: calc(100%);
	    width: 400px;
	    background-color: white;
	    overflow-x: hidden;
	    transition: right 0.3s ease-in-out;
	    z-index: 99;
    }
	
	
	.side-menu-login.open {
			right: 0;
	}

	.overlay {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.5);
		display: none;
		z-index: 98;
	}

	/* 하얀색 창 애니메이션 */
	@keyframes slideWhiteBox {
    0% {
      transform: translateY(-100%);
    }
    100% {
      transform: translateY(0%);
    }
	}
	.overlay.active {
		display: block;
	}
	
	.white-box {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: white;
		z-index: 99;
		display: none;
		animation: slideWhiteBox 1s ease-in-out forwards;
	}
	
	.menu-list {
		display: flex;
		flex-wrap: wrap;
	}
	
	.menu-list li {
		width: 45%;
		list-style: none;
	}
	
	.menu-list a {
		text-decoration: none;
		display: block;
		color: black;
	}
	
	.menu-list a:hover {
		text-decoration: none;
		color: black;
	}
	
	.sideTitle {
		color: gray;
		margin-bottom: 15px;
	}
	
	#ml a {
		color: black;
		text-decoration: none;
		margin-bottom: 10px;
	}
	
	.container {
		font-size: 15px;
		font-family: 'SUIT-Regular';
	}
	
	.mainMenu li {
		margin-bottom: 20px;
		font-weight: bold;
	}
	
	.mainMenu a {
		color: black;
		text-decoration: none;
	}
	
	.mainMenu a:hover {
		color: black;
		text-decoration: none;
	}
	
	.sideTitle a {
		color: gray;
		text-decoration: none;
	}
	
	.sideTitle a:hover {
		color: gray;
		text-decoration: none;
	}
	
	/*로그인 화살표*/
	.menu-arrow {
		position: fixed;
		top: 80px;
		right: 3.9%;
		font-size: 24px;
		color: white;
		animation: bounce 1.5s infinite;
		z-index: 1000;
		font-family: 'EliceDigitalBaeum-Bd';
	}
	
	/* 화살표 점프 애니메이션 */
	@keyframes bounce { 0%, 100% {
		transform: translateY(0);
	}
		50%	{transform:	translateY(-10px);}
	}
	
	#demo {
    display: none;
    position: fixed;
    top: 50%;
    transform: translate(-50%, -50%);
    z-index: 999;
    background-color: white;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    padding: 20px;
    border-radius: 10px;
    opacity: 0;
    transition: opacity 0.5s ease-in-out;
    left: 50%;
    height: 850px;
	}

	.white-box {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: white;
    z-index: 1000;
    display: none;
    animation: slideWhiteBox 1s ease-in-out forwards;
	}

@keyframes slideWhiteBox {
    0% {
        transform: translateY(-100%);
    }
    50% {
        transform: translateY(0%);
    }
    100% {
        transform: translateY(-100%);
    }
}

	
</style>


</head>
<body>
<div id="demo"></div>
<header class="header-area header-sticky wow slideInDown animated" data-wow-duration="0.75s" data-wow-delay="0s">
  <nav class="main-nav" id="navbar">
    <div class="container-fluid d-flex align-items-center justify-content-between">
      <!-- 왼쪽 메뉴 -->
      <ul class="nav" style="margin: 0; padding: 0;">
        <li class="nav_menu"><a href="#" class="menu-item">NEW</a></li>
        <li class="nav_menu"><a href="#" class="menu-item">BEST</a></li>
        <li class="nav_menu"><a href="#" class="menu-item">Brand</a></li>
        <li class="nav_menu"><a href="#" class="menu-item">Collection</a></li>
      </ul>

      <!-- 중앙 로고 -->
      <a href="main.main" class="Logo text-center">Min's</a>

      <!-- 오른쪽 아이콘 -->
      <ul class="nav" style="margin: 0;">
        <li><a href="#"><i class="fa-solid fa-magnifying-glass fa-lg"></i></a></li>
        <li><a href="FurnitureShoppingList.fu"><i class="fa-solid fa-cart-shopping fa-lg"></i></a></li>
        <li><a href="Love.ap?industry=ALL"><i class="fa-regular fa-heart fa-lg"></i></a></li>
        <li>
        	<c:if test="${!empty sMid}">
	          <div class="pv-box">
	            <div class="menu menu-icon" onclick="toggleSidebar()">
	              <div class="bar"></div>
	              <div class="bar"></div>
	              <div class="bar"></div>
	            </div>
	          </div>
          </c:if>
        	<c:if test="${empty sMid}">
	          <div class="pv-box">
	            <div class="menu menu-icon login">
	              <div class="bar"></div>
	              <div class="bar"></div>
	              <div class="bar"></div>
	            </div>
	          </div>
          </c:if>
        </li>
      </ul>
    </div>
  </nav>
</header>


		<div class="overlay"></div>

		<!-- 하얀색 애니메이션 창 -->
		<div class="white-box"></div>


		<c:if test="${!empty sMid}">
			<div class="side-menu-login">
				<div class="container">
					<div>
						<div class="sideTitle">GRINTERIOR</div>
						<ul class="mainMenu">
							<li><a href="Interior.in?category=ALL">인테리어</a></li>
							<li><a href="Furniture.fu?category=ALL">가구 쇼핑</a></li>
							<li><a href="">컨설팅 사례</a></li>
						</ul>
					</div>
						<hr>
						<div>
						<div class="sideTitle">마이페이지</div>
						<ul class="menu-list" id="ml">
							<li><a href="MyPage.mem">내 정보</a></li>
							<li><a href="Love.ap?industry=ALL">관심목록</a></li>
							<c:if test="${sLevel==1 || sLevel==0}">
								<li><a href="BuyList.fu?mid=${sMid}">구매내역</a></li>
							</c:if>
							<c:if test="${sLevel==3}">
								<li><a href="SellList.fu?mid=${sMid}">판매내역</a></li>
							</c:if>
							<li><a href="FurnitureShoppingList.fu">장바구니</a></li>
						</ul>
						</div>
						<hr>
						<div>
							<div class="sideTitle">문의사항</div>
							<ul class="menu-list" id="ml">
								<li><a href="">배송관련</a></li>
								<li><a href="">비용/결제/환불</a></li>
								<li><a href="">취소/교환/반품</a></li>
								<li><a href="">서비스/일반</a></li>
							</ul>
						</div>
						<div>
							<hr>
							<div class="input-group" style="display: flex; justify-content: space-between; width: 100%;">
								<div class="sideTitle"><a href="${ctp}/member/logout">로그아웃</a></div>
								<c:if test="${sLevel == 0}"><div class="sideTitle"><a href="AdminMain.ad">관리자</a></div></c:if>
							</div>
						</div>
				</div>
			</div>
		</c:if>
		<c:if test="${empty sMid}">
			<div id="menuArrow" class="menu-arrow">
				로그인<i class="fa-solid fa-arrow-up"></i>
			</div>
		</c:if>
</body>
</html>