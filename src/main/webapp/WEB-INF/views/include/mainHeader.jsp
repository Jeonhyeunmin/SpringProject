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
    // 햄버거 버튼 클릭 시 메뉴와 배경 토글
    function toggleSidebar() {
    	const menu = document.querySelector(".menu");
      const sideMenu = document.querySelector(".side-menu");
      const overlay = document.querySelector(".overlay");

        // 햄버거 아이콘과 메뉴 상태를 토글
      menu.classList.toggle("active");
      sideMenu.classList.toggle("open");
      overlay.classList.toggle("active");
    }

    // 배경 클릭 시 메뉴 닫기
    document.querySelector(".overlay").addEventListener("click", function() {
      const menu = document.querySelector(".menu");
      const sideMenu = document.querySelector(".side-menu");
      const overlay = document.querySelector(".overlay");

       // 메뉴와 배경 숨기기
    	menu.classList.remove("active");
    	sideMenu.classList.remove("open");
    	overlay.classList.remove("active");
    });

    // 네비게이션바 고정 처리 (스크롤에 따라)
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

    // 햄버거 버튼 클릭 시 메뉴 열고 닫기
    const menuButton = document.querySelector(".menu");
    if (menuButton) {
    	menuButton.addEventListener("click", toggleSidebar);
    }

	});

	
	$(document).ready(function() {
	    const menuButton = $(".menu");
	    const whiteBox = $(".white-box");
	    const demo = $("#demo"); // JSP 내용이 보여질 영역

	    menuButton.on("click", function() {
	        // 하얀색 창 표시 및 애니메이션 실행
	        whiteBox.css({
	            "display": "block",
	            "z-index": "1000" // 하얀색 창이 가장 앞에 보이도록
	        });

	        // 애니메이션이 내려오는 중간에 JSP 파일 로드
	        setTimeout(function() {
	            $.ajax({
	                url: "${ctp}/login", // 불러올 JSP 경로
	                type: "GET",
	                success: function(data) {
	                		$("body > *").not("#demo, .white-box").hide();
	                    demo.html(data);
	                    demo.css({
	                        "display": "block",
	                        "opacity": "0", // 처음에는 투명
	                        "z-index": "999" // 하얀 창보다 한 단계 뒤에 위치
	                    });
	                },
	                error: function(xhr, status, error) {
	                    console.error("Error loading content:", error);
	                }
	            });
	        }, 500); // 0.5초 후 JSP를 불러옴

	        // 애니메이션 끝나기 전에 로그인창 서서히 표시
	        whiteBox.on("animationend", function(event) {
	            if (event.originalEvent.animationName === "slideWhiteBox") {
	                // 하얀 창이 올라가는 동안 opacity를 점진적으로 변경
	                demo.animate({ opacity: 1 }, 100, function() {
	                });
	            }
	        });
	    });
	});





</script>
<style>
	#navbar {
		display: flex;
		justify-content: space-between;
		position: fixed;
		width: 100%;
		z-index: 100;
		top: 0;
		left: 0;
		color: var(- -color-dark-gray);
		background: linear-gradient(to top, rgba(255, 255, 255, 0) 0%,
				rgba(0, 0, 0, 0.3) 100%);
		transition: background-color 0.5s ease-in-out, color 0.5s ease-in-out;
		padding: 1%;
	}
	
	.nav {
		list-style: none;
		display: flex;
	}
	
	.Logo {
		font-family: "Playfair Display", serif;
		font-size: 30px;
		color: white; /* 기본 글자 색상 */
		text-decoration: none; /* 기본 밑줄 제거 */
	}
	
	.Logo:hover {
		color: white; /* 마우스를 올려도 색상 변화 없음 */
		text-decoration: none; /* 밑줄 제거 */
	}
	
	.menu {
		cursor: pointer;
		width: 25px;
		height: 30px;
		position: relative;
	}
	
	.menu .bar {
		width: 25px;
		height: 3px;
		background-color: white;
		margin: 6px 0;
		transition: 0.3s ease-in-out;
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
    50% {
      transform: translateY(0%);
    }
    100% {
      transform: translateY(-100%);
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
		width: 45%; /* 각 항목이 2개씩 한 행에 배치되도록 설정 */
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
		animation: bounce 1.5s infinite; /* 애니메이션 */
		z-index: 1000;
		font-family: 'EliceDigitalBaeum-Bd';
	}
	
	/* 화살표 점프 애니메이션 */
	@
	keyframes bounce { 0%, 100% {
		transform: translateY(0);
	}
		50%	{transform:	translateY(-10px);}
	}
	
	#demo {
    display: none; /* 초기에는 숨겨진 상태 */
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 999; /* 하얀 창보다 한 단계 아래 */
    width: 90%;
    max-width: 400px;
    background-color: white;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    padding: 20px;
    border-radius: 10px;
    text-align: center;
    opacity: 0; /* 처음에는 투명 */
    transition: opacity 0.5s ease-in-out; /* 부드러운 전환 효과 */
	}

	.white-box {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: white;
    z-index: 1000; /* 로그인 창보다 위에 위치 */
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
		<div class="row">
			<nav class="main-nav" id="navbar">
				<a href="main.main" class="Logo" style="padding-left: 3.6%; padding-right: 0">Min's</a>
					<ul class="nav" style="padding-top: 0.5%; padding-left: 5%; padding-right: 30%;">
						<li class="nav_menu" style="padding: 0 25px;"><a href="#" class="active">Best</a></li>
						<li class="nav_menu" style="padding: 0 25px;"><a href="#">NEW</a></li>
						<li class="nav_menu" style="padding: 0 25px;"><a href="#">Brand</a></li>
						<li class="nav_menu" style="padding: 0 25px;"><a href="#">Collection</a></li>
					</ul>
					<ul class="nav" style="padding-top: 0.5%; padding-right: 3%;">
						<li><a href="#"><i class="fa-solid fa-magnifying-glass fa-lg"></i></a></li>
						<li><a href="FurnitureShoppingList.fu" style="padding: 0 20px;"><i class="fa-solid fa-cart-shopping fa-lg"></i></a></li>
						<li><a href="Love.ap?industry=ALL" style="padding-right: 20px;"><i class="fa-regular fa-heart fa-lg"></i></a></li>
						<li>
							<c:if test="${empty sMid}">
								<div class="pv-box">
									<div class="menu menu-icon" style="padding-left: 4px;">
										<div class="bar"></div>
										<div class="bar"></div>
										<div class="bar"></div>
									</div>
								</div>
							</c:if>
							<c:if test="${!empty sMid}">
								<div class="pv-box">
									<div class="menu menu-icon" onclick="toggleSidebar()" style="padding-left: 4px;">
										<div class="bar"></div>
										<div class="bar"></div>
										<div class="bar"></div>
									</div>
								</div>
							</c:if>
						</li>
					</ul>
				</nav>
			</div>
		</header>

		<div class="overlay"></div>

		<!-- 하얀색 애니메이션 창 -->
		<div class="white-box"></div>


		<c:if test="${!empty sMid}">
			<div class="side-menu-login">
				<div class="container" style="width: 80%; margin-top: 35%;">
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
								<div class="sideTitle"><a href="MemberLogout.mem">로그아웃</a></div>
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