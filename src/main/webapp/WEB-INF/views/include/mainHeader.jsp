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
    	const menu = document.querySelector(".sidebar");
      const sideMenu = document.querySelector(".side-menu-login");

      menu.classList.toggle("active");
      sideMenu.classList.toggle("open");
    }

    const menuButton = document.querySelector(".sidebar");
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
	
	document.querySelectorAll(".nav_menu").forEach(menu => {
	    menu.addEventListener("mouseenter", () => {
	        const submenu = menu.querySelector(".submenu");
	        if (submenu) submenu.style.display = "block";
	    });

	    menu.addEventListener("mouseleave", () => {
	        const submenu = menu.querySelector(".submenu");
	        if (submenu) submenu.style.display = "none";
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
	    top: 0;
	    left: 0;
	    padding: 10px 5%; /* 상하, 좌우 여백 */
	    z-index: 1000;
	    background-color: white;
	    position: fixed;
	    height: 80px; /* main-nav의 높이를 고정 */
	    padding-bottom: 0;
	}
	
	.sub-nav {
    position: fixed; /* 화면에 고정 */
    top: 80px; /* main-nav의 높이만큼 아래로 위치 */
    background-color: white; /* 배경색 설정 */
    padding: 20px;
    padding-left: 0;
	}
	
	.sub-nav a {
		margin-right: 50px;
	}
	
	/* 메뉴 스타일 */
	.menu-icon {
    display: flex;
    flex-direction: column;
    justify-content: center; /* 수직 가운데 정렬 */
    align-items: center; /* 수평 가운데 정렬 */
    gap: 5px; /* 막대 간 간격 */
    cursor: pointer;
    position: relative; /* 다른 아이콘들과의 위치 조정 */
    width: 24px; /* 아이콘 크기 */
    height: 24px; /* 아이콘 크기 */
	}
	.nav {
	    display: flex;
	    align-items: center; /* 세로 정렬 */
	    list-style: none;
	    margin: 0;
	    padding: 0;
	    gap: 20px; /* 아이콘 간격 */
	}
	
	/* 메뉴 링크 스타일 */
	.nav a {
	    color: black;
	    text-decoration: none;
	    font-size: 18px;
	    font-weight: bold;
	    transition: color 0.3s;
	}
	
	.nav a:hover {
	    color: gray;
	}
	
	/* 로고 스타일 */
	.Logo {
	    font-family: "Playfair Display", serif;
	    font-size: 50px;
	    font-weight: bold;
	    color: black;
	    text-decoration: none;
	    padding-left: 10px;
	}
	
	/* 아이콘 스타일 */
	.nav a i {
	    color: black;
	    font-size: 22px;
	    transition: color 0.3s;
	}
	
	.nav a i:hover {
	    color: gray;
	}
	
	/* 햄버거 메뉴 스타일 */
	.menu {
	    display: flex;
	    flex-direction: column;
	    justify-content: center; /* 수직 정렬 */
	    align-items: center; /* 수평 정렬 */
	    gap: 5px; /* 막대 간 간격 */
	    cursor: pointer;
	    width: 24px; /* 버튼 크기 고정 */
	    height: 24px; /* 버튼 크기 고정 */
	    position: relative; /* 위치를 아이콘들과 맞춤 */
	}
	
	.menu .bar {
    width: 24px; /* 막대 너비 고정 */
    height: 3px;
    background-color: black;
    transition: all 0.3s ease;
	}

	
	.nav a {
		text-decoration: none;
		color: black;
		transition: color 0.5s ease-in-out;
		font-family: 'EliceDigitalBaeum-Bd';
		font-size: 20px;
	}
	
	.nav a:hover {
		color: gray;
		text-decoration: none;
	}
	
	.menu.active .bar:nth-child(2) {
	    opacity: 0; /* 가운데 막대 숨기기 */
	}
	
	.menu.active .bar:first-child {
	    transform: rotate(45deg); /* 위쪽 막대를 X로 변형 */
	    position: absolute;
	    top: 10px;
	    left: 0;
	}
	
	.menu.active .bar:last-child {
	    transform: rotate(-45deg); /* 아래쪽 막대를 X로 변형 */
	    position: absolute;
	    top: 10px;
	    left: 0;
	}
	/* 전체 정렬을 맞추기 위해 부모 요소 스타일도 추가 */
	.nav > li {
	    display: flex;
	    align-items: center;
	    justify-content: center;
	}
	
	/* 추가: 햄버거 버튼의 위치를 다른 아이콘들과 동일하게 설정 */
	.nav .menu {
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    position: relative;
	    margin: 0; /* 여백 제거 */
	    padding: 0; /* 여백 제거 */
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
	.nav_menu {
	    position: relative; /* 서브메뉴를 위한 부모 요소 설정 */
	}
	
	.submenu {
	    display: none; /* 기본적으로 숨기기 */
	    position: absolute;
	    top: 100%; /* 부모 메뉴 아래에 위치 */
	    left: 0;
	    background-color: white;
	    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
	    padding: 10px 0;
	    list-style: none;
	    z-index: 1000;
	    min-width: 150px;
	    width: 100%;
	}
	
	.submenu li {
	    padding: 10px 20px;
	}
	
	.submenu li a {
	    color: black;
	    text-decoration: none;
	    display: block;
	    font-size: 16px;
	}
	
	.submenu li a:hover {
	    background-color: #f0f0f0;
	}
	
	/* 마우스 올릴 때 서브메뉴 표시 */
	.nav_menu:hover .submenu {
	    display: block;
	}

	.search {
    border: none;
    border-bottom: 2px solid #555;
    outline: none;
    font-size: 18px;
    padding: 5px 10px;
    width: 700px;
    transition: border-color 0.3s ease;
  }

  .search:focus {
    border-bottom-color: #000;
  }

  .search::placeholder {
    color: #aaa;
    font-size: 18px;
  }

  .search-icon {
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    font-size: 20px;
    color: #555;
    cursor: pointer;
  }

  .menu-wrapper {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 20px;
  }

  .menu-wrapper ul {
    display: flex;
    gap: 40px;
    margin: 20px 0 0 0;
    padding: 0;
    list-style: none;
  }

  .menu-wrapper ul li a {
    text-decoration: none;
    color: #333;
    font-size: 18px;
    font-weight: bold;
  }

  .menu-wrapper ul li a:hover {
    color: #000;
  }
  
  .menu-icon {
    display: flex;
    flex-direction: column;
    justify-content: center; /* 수직 가운데 정렬 */
    align-items: center; /* 수평 가운데 정렬 */
    gap: 5px; /* 막대 간 간격 */
    cursor: pointer;
    position: relative; /* 다른 아이콘들과의 위치 조정 */
    width: 24px; /* 아이콘 크기 */
    height: 24px; /* 아이콘 크기 */
	}
	
	.pv-box{
		margin-top: 4px;
	}
	
</style>


</head>
<body>
<div id="demo"></div>
<header class="header-area header-sticky wow slideInDown animated" data-wow-duration="0.75s" data-wow-delay="0s">
  <nav class="main-nav" id="navbar">
    <div class="container d-flex align-items-center justify-content-between ps-0">
      <a href="${ctp}/" class="Logo">Min's</a>
      <!-- Search Bar -->
      <div style="position: relative; margin-top: 20px;">
        <input
          class="search"
          type="search"
          maxlength="30"
          id="cs-token-input"
          name="searchQuery"
          placeholder="Search"
          autocomplete="off"
        />
        <i class="fa fa-search search-icon"></i>
      </div>
			<div>
	      <!-- 오른쪽 아이콘 -->
	      <ul class="nav" style="margin: 0;">
	        <li><a href="#"><i class="fa-solid fa-magnifying-glass fa-lg"></i></a></li>
	        <li><a href="FurnitureShoppingList.fu"><i class="fa-solid fa-cart-shopping fa-lg"></i></a></li>
	        <li><a href="Love.ap?industry=ALL"><i class="fa-regular fa-heart fa-lg"></i></a></li>
	        <li>
	        	<c:if test="${!empty sMid}">
		          <div class="pv-box">
		            <div class="menu menu-icon sidebar" onclick="toggleSidebar()">
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
    </div>
  </nav>
  <nav>
	  <div class="container">
	  	<div class="sub-nav" style="width: 100%;">
				<ul class="nav" style="margin: 0; padding: 0;">
			    <li class="nav_menu">
		        <a href="#" class="menu-item">NEW</a>
		        <ul class="submenu">
		            <li><a href="#">Submenu 1</a></li>
		            <li><a href="#">Submenu 2</a></li>
		            <li><a href="#">Submenu 3</a></li>
		        </ul>
			    </li>
			    <li class="nav_menu">
		        <a href="#" class="menu-item">BEST</a>
		        <ul class="submenu">
		          <li><a href="#">Submenu A</a></li>
		          <li><a href="#">Submenu B</a></li>
		          <li><a href="#">Submenu C</a></li>
		        </ul>
			    </li>
			    <li class="nav_menu">
		        <a href="#" class="menu-item">Brand</a>
		        <ul class="submenu">
		            <li><a href="#">Submenu A</a></li>
		            <li><a href="#">Submenu B</a></li>
		            <li><a href="#">Submenu C</a></li>
		        </ul>
			    </li>
		    	<li class="nav_menu">
		        <a href="#" class="menu-item">Gift</a>
		        <ul class="submenu">
		            <li><a href="#">Submenu A</a></li>
		            <li><a href="#">Submenu B</a></li>
		            <li><a href="#">Submenu C</a></li>
		        </ul>
			    </li>
				</ul>
			</div>
		</div>
	</nav>
</header>


		

		<!-- 하얀색 애니메이션 창 -->
		<div class="white-box"></div>


		<c:if test="${!empty sMid}">
			<div class="side-menu-login">
				<div class="container">
					<div style="margin-top: 160px;">
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
		<div style="height: 150px;"></div>
</body>
</html>