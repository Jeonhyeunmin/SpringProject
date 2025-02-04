<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Min's 백화점</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.js"></script>
    <script type="text/javascript">
		
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
			
			document.addEventListener("DOMContentLoaded", function () {
			    const categoryItems = document.querySelectorAll(".main-category .category-item");
			    const subCategoryItems = document.querySelectorAll(".sub-category-item");

			    categoryItems.forEach((category) => {
			        category.addEventListener("mouseenter", function () {
			            const target = category.getAttribute("data-target");
			            subCategoryItems.forEach((subCategory) => {
			                if (subCategory.getAttribute("data-category") === target) {
			                    subCategory.style.display = "block"; // 선택된 카테고리만 표시
			                } else {
			                    subCategory.style.display = "none"; // 나머지 숨기기
			                }
			            });
			        });
			    });

			    // 기본적으로 모든 서브 카테고리를 숨김
			    subCategoryItems.forEach((subCategory) => {
			        subCategory.style.display = "none";
			    });
			});
			
			document.addEventListener("DOMContentLoaded", function () {
		    const categoryMappings = {
		        menFashion: "MENFASHION",
		        womenFashion: "WOMENFASHION",
		        beauty: "BEAUTY",
		        luxury: "LUXURY",
		        sports: "SPORTS",
		        children: "CHILDREN",
		        living: "LIVING",
		        food: "FOOD",
		        casual : "CASUAL"
		    };

		    document.querySelectorAll(".sub-category-item h3 a").forEach((link) => {
		    	
		    	const mainCategory = link.textContent.trim(); 
		    	
	        const parentCategory = link.closest(".sub-category-item").getAttribute("data-category");
	        
	        if (categoryMappings[parentCategory]) {
	            link.href = "${ctp}/shop/shopMainList?category=" + categoryMappings[parentCategory] + "&mainCategory=" + mainCategory;
	        }
		    });
			});
			
			$(document).ready(function () {
        $('#keyword').on('keyup', function (event) {
          if (event.keyCode === 13) {
            const query = $(this).val().trim();
            if (query) {
              var searchUrl = "${ctp}/shop/search?query=" + encodeURIComponent(query);
              window.location.href = searchUrl;
            } else {
              alert("검색어를 입력해주세요.");
            }
          }
        });
	    });
			
			function searchKeyword() {
				let query = document.getElementById("keyword").value.trim();
				if(query == ""){
					alert("검색어를 입력해주세요.");
					return false;
				}
				else{
					location.href='${ctp}/shop/search?query=' + encodeURIComponent(query);
				}
			}
			
			function windowMypage() {
				if("${sMid}" == ""){
					let url = "${ctp}/common/mobieLogin";
					window.open(url, "mobieLogin", "width=650px, height=700px, top=150px, left=500px;");
					
					 window.onLoginSuccess = function () {
						 location.reload();
	        };
				}
				else{
					location.href = '${ctp}/common/myPage';
				}
			}
			
			function windowLogin(){
				let url = "${ctp}/common/mobieLogin";
				window.open(url, "mobieLogin", "width=650px, height=700px, top=150px, left=500px;");
				
				 window.onLoginSuccess = function () {
					 location.reload();
        };
			}
 	  </script>
    <style>
	    body {
        margin: 0  !important;
        font-family: 'Georgia', serif !important;
        color: #333 !important;
	    }
	    .header {
        position: fixed !important;
        top: 0 !important;
        left: 0 !important;
        width: 100% !important;
        background-color: #fff !important;
        border-bottom: 2px solid #e1c699 !important;
        z-index: 1000 !important;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1) !important;
	    }
	    .header-container {
        display: flex !important;
        justify-content: space-between !important;
        align-items: center !important;
        max-width: 1200px !important;
        margin: 0 auto !important;
        padding: 20px 20px !important;
	    }
	    .logo {
        font-size: 28px !important;
        font-weight: bold !important;
        color: #e1c699 !important;
        text-decoration: none !important;
        font-family: 'Playfair Display', serif !important;
      }
	    .nav {
        display: flex  !important;
        list-style: none !important;
        margin: 0 !important;
        padding: 0 !important;
        gap: 25px !important;
	    }
	    .nav-item {
        position: relative !important;
	    }
	    .nav-link {
        font-size: 16px !important;
        font-weight: bold !important;
        color: #333 !important;
        padding: 30px 15px !important;
        transition: color 0.3s ease, border-bottom 0.3s ease !important;
        text-decoration: none !important;
	    }
	    .nav-link:hover {
        color: #e1c699 !important;
        text-decoration: underline !important;
	    }
    	@font-face {
		    font-family: 'Freesentation-9Black';
		    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2404@1.0/Freesentation-9Black.woff2') format('woff2');
		    font-weight: 900;
		    font-style: normal;
			}		
	    .submenu {
	    	font-family: 'Freesentation-9Black';
        display: none !important;
        position: fixed !important;
        top: 100px !important;
        left: 0 !important;
        right: 0 !important;
        background-color: #fff !important;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1) !important;
        list-style: none !important;
        margin: 0 !important;
        padding: 20px 0 !important;
        z-index: 998 !important;
        border-top: 1px solid #e1c699 !important;
        font-weight: 200;
	    }
	    .submenu li {
        padding: 10px 20px !important;
        text-align: center !important;
        display: inline !important;
	    }
	
	    .submenu li a {
        text-decoration: none !important;
        color: #333 !important;
        font-size: 14px !important;
        padding: 20px !important;
	    }
	    .submenu li a:hover {
        color: #e1c699 !important;
	    }
      .myPage {
      	font-family: 'NoonnuBasicGothicRegular';
        display: none !important;
        position: absolute !important;
        top: 100% !important;
        left: 0 !important;
        right: 0 !important;
        background-color: #fff !important;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1) !important;
        list-style: none !important;
        margin: 0 !important;
        padding: 20px 0 !important;
        z-index: 1000 !important;
        border-top: 1px solid #e1c699 !important;
        width: 200px !important;
      }
      .myPage li {
        padding: 10px 20px !important;
        width: 200px !important;
      }
	
	    .myPage li a {
	      text-decoration: none !important;
	      color: #333 !important;
	      font-size: 14px !important;
	      padding: 10px !important;
	    }
	    .myPage li a:hover {
        color: #e1c699 !important;
	    }
	
	    .nav-item:hover .submenu {
        display: flex !important;
	    }
	    .nav-item:hover .myPage {
        display: block !important;
	    }
	    .actions {
        display: flex !important;
        align-items: center !important;
        gap: 25px !important;
	    }
	    .action-link {
        font-size: 18px !important;
        color: #333 !important;
        text-decoration: none !important;
        transition: color 0.3s ease !important;
	    }
	    .action-link:hover {
        color: #e1c699 !important;
	    }
	    .search-bar {
	    	font-family: 'NoonnuBasicGothicRegular';
        display: flex !important;
        align-items: center !important;
        border: 1px solid #e1c699 !important;
        padding: 5px 10px !important;
        border-radius: 20px !important;
        background-color: #fff !important;
	    }
	    .search-bar input {
        border: none !important;
        outline: none !important;
        font-size: 14px !important;
        width: 250px !important;
        color: #333 !important;
	    }
	    .search-bar i {
        font-size: 16px !important;
        color: #e1c699 !important;
	    }
	    .tagline {
        font-size: 14px !important;
        color: #888 !important;
        margin-top: 5px !important;
	    }
	            				
      /* 하얀색 창 애니메이션 */
      .white-box {
        position: fixed !important;
        top: 0 !important;
        left: 0 !important;
        width: 100% !important;
        height: 100% !important;
        background-color: white !important;
        z-index: 1000 !important;
        display: none !important;
        animation: slideWhiteBox 1s ease-in-out forwards !important;
      }
	            				
      #demo {
	      display: none !important;
	      position: fixed !important;
	      top: 50% !important;
	      transform: translate(-50%, -50%) !important;
	      z-index: 999 !important;
	      background-color: white !important;
	      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3) !important;
	      padding: 20px !important;
	      border-radius: 10px !important !important;
	      opacity: 0 !important !important;
	      transition: opacity 0.5s ease-in-out !important;
	      left: 50% !important;
	      height: 850px !important;
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
	            				
      /* 기본적으로 서브메뉴 숨김 */
      .submenu-container {
        display: none !important;
        position: fixed !important;
        top: 100px !important;
        left: 0 !important;
        right: 0 !important;
        background-color: #fff !important;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1) !important;
        list-style: none !important;
        margin: 0 !important;
        padding: 20px 0 !important;
        z-index: 998 !important;
        border-top: 1px solid #e1c699 !important;
      }
      .submenu-container li{
        text-align: center !important;
      }
	            				
      /* 메인 카테고리 스타일 */
      .main-category {
        list-style: none !important;
        margin: 0 !important;
        padding: 10px !important;
        width: 30% !important;
      }
      				
	    .category-item {
	    	font-family: 'NoonnuBasicGothicRegular';
        padding: 15px 15px !important;
        cursor: pointer !important;
        font-size: 16px !important;
        font-weight: bold !important;
        color: #333 !important;
        transition: background-color 0.3s ease, color 0.3s ease !important;
	    }
	            				
      .category-item:hover {
        background-color: #e1c699 !important;
        color: #fff !important;
      }
      				
      /* 구분선 스타일 */
      .divider {
        width: 1px !important;
        background-color: #ccc !important;
        margin: 0 20px !important;
      }
      
			@font-face { /*눈누 기초고딕 - 두꺼운 네모 딱딱 고딕*/
		    font-family: 'NoonnuBasicGothicRegular';
		    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
			}
	            				
      /* 서브 카테고리 스타일 */
      .sub-category {
      	font-family: 'NoonnuBasicGothicRegular';
	      max-height: 500px !important; /* 최대 높이 설정 */
	      overflow-y: auto !important; /* 항목이 넘칠 경우 스크롤 표시 */
	      flex-direction: column !important;
	      margin: 0 !important;
	      width: 70% !important;
	      display: flex !important;
	      flex-wrap: wrap !important;
	      gap: 20px !important;
	      padding: 20px !important;
	      background-color: #fff !important;
	      list-style: none !important;
      }
      
      .sub-category-item {
        flex: 1 1 calc(33.33% - 20px) !important; /* 세 항목씩 한 줄에 배치 */
        background-color: #f9f9f9 !important;
        padding: 20px !important;
        border-radius: 8px !important;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1) !important;
        text-align: left !important;
        font-weight: 100 !important;
      }
	            				
      .sub-category-item h3 {
	      font-size: 18px !important;
	      font-weight: bold !important;
	      color: #333 !important;
	      margin-bottom: 10px !important;
	      border-bottom: 2px solid #e1c699 !important;
	      padding-bottom: 5px !important;
      }
	            				
      .sub-category-item ul {
	      list-style: none !important;
	      padding: 0 !important;
	      margin: 0 !important;
      }
	            				
      .sub-category-item ul li {
	      font-size: 14px !important;
	      color: #555 !important;
	      margin-bottom: 5px !important;
	      padding-left: 0 !important;
	      position: relative !important;
      }
	            				
      .sub-category-item ul li:before {
	      list-style: none !important;
	      content: '•' !important;
	      position: absolute !important;
	      left: 0 !important;
	      color: #e1c699 !important;
	      font-weight: bold !important;
      }
	            				
      .main-category .category-item:hover ~ .sub-category .sub-category-item {
      	display: none !important; /* 기본적으로 숨겨진 상태 */
      }
      				
      .sub-category-item:hover {
      	color: #e1c699 !important;
      }
      				
      /* 햄버거 버튼에 마우스를 올렸을 때 서브메뉴 표시 */
      .menuBtn:hover .submenu-container {
      	display: flex !important;
      }
      				
      .sub-category a{
        text-decoration: none !important;
      }
      svg {
			  overflow: visible !important;
			}
			
			@media (max-width: 768px) {
	    .header-container {
	        flex-direction: column;
	        align-items: flex-start;
	    }
	
	    .nav {
	        display: none; /* 기본적으로 숨김 */
	        flex-direction: column;
	        width: 100%;
	        background-color: #fff;
	        position: absolute;
	        top: 100%;
	        left: 0;
	        border-top: 1px solid #e1c699;
	        z-index: 999;
	    }
	
	    .nav-item {
	        width: 100%;
	    }
	
	    .nav-link {
        padding: 15px;
        display: block;
        width: 100%;
        text-align: left;
	    }
	
	    .hamburger {
        display: block;
        font-size: 24px;
        cursor: pointer;
        color: #333;
	    }
	
	    .hamburger.active + .nav {
        display: flex; /* 햄버거 메뉴 클릭 시 표시 */
	    }
	
	    .search-bar input {
        width: 150px;
	    }
		}
  </style>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
		<div id="demo"></div>
    <header class="header">
        <div class="header-container">
            <!-- 로고 -->
            <div>
                <a href="${ctp}" class="logo">Min's</a>
                <div class="tagline">Luxury Shopping Redefined</div>
            </div>

            <!-- 내비게이션 -->
            <ul class="nav">
                <li class="nav-item">
							    <a href="${ctp}/shop/newShop" class="nav-link">NEW</a>
							    <ul class="submenu" style="flex-wrap: wrap; justify-content: center; gap: 20px;">
						        <c:forEach var="dateVO" items="${dateVosTop3}">
					            <li style="list-style: none; text-align: center;">
				                <a href="${ctp}/shop/shopContent?idx=${dateVO.idx}" style="display: block;">
			                    <img src="${ctp}/category/${dateVO.thumbnail}" width="200px" style="display: block; margin: 0 auto;">
			                    <p style="margin-top: 10px; margin-bottom: 0;  font-size: 14px; color: #333;">${dateVO.title}</p>
			                    <p style="font-size: 12px; color: #333;">${dateVO.company} | ${dateVO.category}</p>
				                </a>
					            </li>
						        </c:forEach>
							    </ul>
								</li>
                <li class="nav-item">
							    <a href="${ctp}/shop/shopBest" class="nav-link">BEST</a>
							    <ul class="submenu" style="flex-wrap: wrap; justify-content: center; gap: 20px;">
						        <c:forEach var="bestVO" items="${BestVosTop3}">
					            <li style="list-style: none; text-align: center;">
				                <a href="${ctp}/shop/shopContent?idx=${bestVO.idx}" style="display: block;">
			                    <img src="${ctp}/category/${bestVO.thumbnail}" width="200px" style="display: block; margin: 0 auto;">
			                    <p style="margin-top: 10px; font-weight: light; margin-bottom: 0; font-size: 14px; color: #333;">${bestVO.title}</p>
			                    <p style="font-size: 12px; color: #333;">${bestVO.company} | ${bestVO.category}</p>
				                </a>
					            </li>
						        </c:forEach>
							    </ul>
								</li>
                <li class="nav-item">
                  <a href="${ctp}/event/event" class="nav-link">EVENT</a>
                </li>
                <li class="nav-item"><a href="${ctp}/common/info" class="nav-link">INFO</a></li>
            </ul>

            <!-- 액션 -->
            <div class="actions">
                <div class="search-bar">
                  <input type="search" id="keyword" placeholder="Search" value="${query}">
                  <i class="fas fa-search" onclick="searchKeyword()" style="cursor: pointer;"></i>
                </div>
                <ul class="nav">
                  <li class="nav-item">
                    <c:if test="${sLevel != 0}"><a href="javascript:windowMypage()" class="nav-link" style="padding-left: 0 !important; padding-right: 0 !important;"><i class="fas fa-user"></i></a></c:if>
                    <c:if test="${sLevel == 0}"><a href="${ctp}/admin/admin" class="nav-link" style="padding-left: 0 !important; padding-right: 0 !important;"><i class="fas fa-user"></i></a></c:if>
                    <ul class="myPage">
                        <c:if test="${empty sMid}"><li><a href="javascript:windowLogin()" class="login">로그인</a></li></c:if>
                        <c:if test="${!empty sMid && sLevel > 0 && sLevel <= 3}"><li><a href="javascript:windowMypage()">마이페이지</a></li></c:if>
                        <c:if test="${!empty sMid}"><li><a href="${ctp}/common/logout">로그아웃</a></li></c:if>
                        <c:if test="${sLevel == 1 || sLevel > 3 || empty sLevel}"><li><a href="#" class="partner">파트너신청</a></li></c:if>
                    </ul>
                </li>
                <li><a href="${ctp}/shop/shopCart" class="nav-link" style="padding-left: 0 !important; padding-right: 0 !important;"><i class="fas fa-shopping-cart"></i></a></li>
                <li class="nav-item menuBtn">
							    <a href="#" class="nav-link" style="padding-left: 0 !important; padding-right: 0 !important;">
							        <i class="fa-solid fa-bars"></i>
							    </a>
							    <div class="submenu-container">
						        <ul class="sub-category">
									    <li data-category="beauty" class="sub-category-item">
									        <h3><a>스킨케어</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=스킨케어&subCategory=스킨/토너/미스트">스킨/토너/미스트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=스킨케어&subCategory=로션/에멀젼">로션/에멀젼</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=스킨케어&subCategory=에센스/세럼">에센스/세럼</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=스킨케어&subCategory=크림">크림</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=스킨케어&subCategory=아이크림">아이크림</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=스킨케어&subCategory=클렌징">클렌징</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=스킨케어&subCategory=마스크/팩">마스크/팩</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=스킨케어&subCategory=각질/스크럼/필링">각질/스크럼/필링</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=스킨케어&subCategory=유아용화장품">유아용화장품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=스킨케어&subCategory=페이스오일">페이스오일</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=스킨케어&subCategory=썬케어">썬케어</a></li>
									        </ul>
									    </li>
									    <li data-category="beauty" class="sub-category-item">
									        <h3><a>메이크업</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=메이크업&subCategory=페이스">페이스</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=메이크업&subCategory=립">립</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=메이크업&subCategory=아이">아이</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=메이크업&subCategory=블러셔">블러셔</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=메이크업&subCategory=하이라이터">하이라이터</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=메이크업&subCategory=네일">네일</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=메이크업&subCategory=메이크업 세트">메이크업 세트</a></li>
									        </ul>
									    </li>
									    <li data-category="beauty" class="sub-category-item">
									        <h3><a>바디/헤어케어</a></h3>
									        <ul>
									        	<li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=바디/헤어케어&subCategory=바디케어">바디케어</a></li>
									        	<li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=바디/헤어케어&subCategory=헤어케어">헤어케어</a></li>
									        </ul>
									    </li>
									    <li data-category="beauty" class="sub-category-item">
									        <h3><a>프레그런스</a></h3>
									        <ul>
									        	<li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=프레그런스&subCategory=여성용">여성용</a></li>
									        	<li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=프레그런스&subCategory=남성용">남성용</a></li>
									        	<li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=프레그런스&subCategory=공용향수">공용향수</a></li>
									        	<li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=프레그런스&subCategory=캔들">캔들</a></li>
									        	<li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=프레그런스&subCategory=디퓨저">디퓨저</a></li>
									        	<li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=프레그런스&subCategory=룸 프레그런스">룸 프레그런스</a></li>
									        	<li><a href="${ctp}/shop/shopSubList?subCategory=아로마오일">아로마오일</a></li>
									        </ul>
									    </li>
									    <li data-category="beauty" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?category=beauty&mainCategory=미용기기/용품">미용기기/용품</a></h3>
									        <ul>
									            <li><a>바디용품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=미용기기/용품&subCategory=헤어용품">헤어용품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=미용기기/용품&subCategory=기타소품">기타소품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=미용기기/용품&subCategory=피부관리기">피부관리기</a></li>
									        </ul>
									    </li>
									    <li data-category="beauty" class="sub-category-item">
									        <h3><a>남성화장품</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=남성화장품&subCategory=남성화장품세트">남성화장품세트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=남성화장품&subCategory=로션/크림/에센스">로션/크림/에센스</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=남성화장품&subCategory=에프터쉐이브/스킨">에프터쉐이브/스킨</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=남성화장품&subCategory=크렌징/쉐이빙">크렌징/쉐이빙</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=beauty&mainCategory=남성화장품&subCategory=선케어/베이스메이크업">선케어/베이스메이크업</a></li>
									        </ul>
									    </li>
									    <li data-category="luxury" class="sub-category-item">
									        <h3><a>명품</a></h3>
									        <ul>
									            <li><a>가방/지갑</a></li>
									            <li><a>시계</a></li>
									            <li><a>악세서리/잡화</a></li>
									        </ul>
									    </li>
									    <li data-category="luxury" class="sub-category-item">
									        <h3><a>핸드백/가방</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=핸드백/가방&subCategory=여성 핸드백/가방">여성 핸드백/가방</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=핸드백/가방&subCategory=남성가방">남성가방</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=핸드백/가방&subCategory=여행가방">여행가방</a></li>
									        </ul>
									    </li>
									    <li data-category="luxury" class="sub-category-item">
									        <h3><a>슈즈</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=슈즈&subCategory=여성화">여성화</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=슈즈&subCategory=남성화">남성화</a></li>
									        </ul>
									    </li>
									    <li data-category="luxury" class="sub-category-item">
									        <h3><a>기타잡화</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=기타잡화&subCategory=양말">양말</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=기타잡화&subCategory=스타킹/타이즈">스타킹/타이즈</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=기타잡화&subCategory=모자">모자</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=기타잡화&subCategory=선글라스">선글라스</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=기타잡화&subCategory=머플러/스카프">머플러/스카프</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=기타잡화&subCategory=장갑">장갑</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=기타잡화&subCategory=손수건">손수건</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=기타잡화&subCategory=안경테">안경테</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=기타잡화&subCategory=우산/양산">우산/양산</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=기타잡화&subCategory=핸드폰악세서리">핸드폰악세서리</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=기타잡화&subCategory=기타">기타</a></li>
									        </ul>
									    </li>
									    <li data-category="luxury" class="sub-category-item">
									        <h3><a>지갑/벨트</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=지갑/벨트&subCategory=여성지갑">여성지갑</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=지갑/벨트&subCategory=남성지갑">남성지갑</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=지갑/벨트&subCategory=명함지갑">명함지갑</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=지갑/벨트&subCategory=여성벨트">여성벨트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=지갑/벨트&subCategory=남성벨트">남성벨트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=지갑/벨트&subCategory=기타">기타</a></li>
									        </ul>
									    </li>
									    <li data-category="luxury" class="sub-category-item">
									        <h3><a>악세서리</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=악세서리&subCategory=귀걸이">귀걸이</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=악세서리&subCategory=목걸이/펜던트">목걸이/펜던트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=악세서리&subCategory=팔찌/발찌">팔찌/발찌</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=악세서리&subCategory=반지">반지</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=악세서리&subCategory=브룻지">브룻지</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=악세서리&subCategory=헤어악세서리">헤어악세서리</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=악세서리&subCategory=세트상품">세트상품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=luxury&mainCategory=악세서리&subCategory=기타 소품">기타 소품</a></li>
									        </ul>
									    </li>
									    <li data-category="womenFashion" class="sub-category-item">
									        <h3><a>아우터</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=womenFashion&mainCategory=아우터&subCategory=패딩/점퍼">패딩/점퍼</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=womenFashion&mainCategory=아우터&subCategory=코트">코트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=womenFashion&mainCategory=아우터&subCategory=재킷">재킷</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=womenFashion&mainCategory=아우터&subCategory=가죽">가죽</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=womenFashion&mainCategory=아우터&subCategory=모피">모피</a></li>
									        </ul>
									    </li>
									    <li data-category="womenFashion" class="sub-category-item">
									        <h3><a>상의</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=womenFashion&mainCategory=상의&subCategory=티셔츠">티셔츠</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=womenFashion&mainCategory=상의&subCategory=셔츠/블라우스">셔츠/블라우스</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=womenFashion&mainCategory=상의&subCategory=가디건/블라우스">가디건/블라우스</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=womenFashion&mainCategory=상의&subCategory=가디건/베스트">가디건/베스트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=womenFashion&mainCategory=상의&subCategory=니트/스웨터">니트/스웨터</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=womenFashion&mainCategory=상의&subCategory=상의세트">상의세트</a></li>
									        </ul>
									    </li>
									    <li data-category="womenFashion" class="sub-category-item">
									        <h3><a>하의</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=womenFashion&mainCategory=하의&subCategory=팬츠">팬츠</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=womenFashion&mainCategory=하의&subCategory=스커트">스커트</a></li>
									        </ul>
									    </li>
									    <li data-category="womenFashion" class="sub-category-item">
									        <h3><a>여성 이지/언더웨어</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=womenFashion&mainCategory=여성 이지/언더웨어&subCategory=여성 언더웨어">여성 언더웨어</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=womenFashion&mainCategory=여성 이지/언더웨어&subCategory=이지웨어/잠옷">이지웨어/잠옷</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=womenFashion&mainCategory=여성 이지/언더웨어&subCategory=임산부 언더웨어">임산부 언더웨어</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=womenFashion&mainCategory=여성 이지/언더웨어&subCategory=트레이닝복/이지웨어">트레이닝복/이지웨어</a></li>
									        </ul>
									    </li>
									    <li data-category="womenFashion" class="sub-category-item">
									        <h3><a>정장/원피스</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=womenFashion&mainCategory=정장/원피스&subCategory=정장/수트">정장/수트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=womenFashion&mainCategory=정장/원피스&subCategory=원피스">원피스</a></li>
									        </ul>
									    </li>
									    <li data-category="menFashion" class="sub-category-item">
									        <h3><a>아우터</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=menFashion&mainCategory=아우터&subCategory=재킷">재킷</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=menFashion&mainCategory=아우터&subCategory=패딩">패딩</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=menFashion&mainCategory=아우터&subCategory=점퍼">점퍼</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=menFashion&mainCategory=아우터&subCategory=코트">코트</a></li>
									        </ul>
									    </li>
									    <li data-category="menFashion" class="sub-category-item">
									        <h3><a>상의</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=menFashion&mainCategory=상의&subCategory=티셔츠">티셔츠</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=menFashion&mainCategory=상의&subCategory=셔츠">셔츠</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=menFashion&mainCategory=상의&subCategory=카라티">카라티</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=menFashion&mainCategory=상의&subCategory=니트/스웨터">니트/스웨터</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=menFashion&mainCategory=상의&subCategory=가디건">가디건</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=menFashion&mainCategory=상의&subCategory=베스트">베스트</a></li>
									        </ul>
									    </li>
									    <li data-category="menFashion" class="sub-category-item">
									        <h3><a>하의</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=menFashion&mainCategory=하의&subCategory=반바지/트레이닝">반바지/트레이닝</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=menFashion&mainCategory=하의&subCategory=슬랙스/면바지">슬랙스/면바지</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=menFashion&mainCategory=하의&subCategory=데님">데님</a></li>
									        </ul>
									    </li>
									    <li data-category="menFashion" class="sub-category-item">
									        <h3><a>남성 이지/언더웨어</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=menFashion&mainCategory=남성 이지/언더웨어&subCategory=남성 런닝/팬티세트">남성 런닝/팬티세트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=menFashion&mainCategory=남성 이지/언더웨어&subCategory=남성 내의/이지웨어">남성 내의/이지웨어</a></li>
									        </ul>
									    </li>
									    <li data-category="menFashion" class="sub-category-item">
									        <h3><a>패션소품</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=menFashion&mainCategory=패션소품&subCategory=넥타이">넥타이</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=menFashion&mainCategory=패션소품&subCategory=벨트">벨트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=menFashion&mainCategory=패션소품&subCategory=지갑">지갑</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=menFashion&mainCategory=패션소품&subCategory=가방">가방</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=menFashion&mainCategory=패션소품&subCategory=모자">모자</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=menFashion&mainCategory=패션소품&subCategory=머플러/스카프">머플러/스카프</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=menFashion&mainCategory=패션소품&subCategory=소품">소품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=menFashion&mainCategory=패션소품&subCategory=슈즈">슈즈</a></li>
									        </ul>
									    </li>
									    <li data-category="casual" class="sub-category-item">
									        <h3><a>아우터</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=casual&mainCategory=아우터&subCategory=재킷">재킷</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=casual&mainCategory=아우터&subCategory=점퍼/패딩">점퍼/패딩</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=casual&mainCategory=아우터&subCategory=코트">코트</a></li>
									        </ul>
									    </li>
									    <li data-category="casual" class="sub-category-item">
									        <h3><a>상의</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=casual&mainCategory=상의&subCategory=티셔츠">티셔츠</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=casual&mainCategory=상의&subCategory=카라티">카라티</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=casual&mainCategory=상의&subCategory=셔츠/블라우스">셔츠/블라우스</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=casual&mainCategory=상의&subCategory=가디건/베스트">가디건/베스트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=casual&mainCategory=상의&subCategory=니트/스웨터">니트/스웨터</a></li>
									        </ul>
									    </li>
									    <li data-category="casual" class="sub-category-item">
									        <h3><a>하의</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=casual&mainCategory=하의&subCategory=데님">데님</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=casual&mainCategory=하의&subCategory=팬츠">팬츠</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=casual&mainCategory=하의&subCategory=스커트">스커트</a></li>
									        </ul>
									    </li>
									    <li data-category="casual" class="sub-category-item">
									        <h3><a>세트/원피스</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=casual&mainCategory=세트/원피스&subCategory=트레이닝복/세트">트레이닝복/세트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=casual&mainCategory=세트/원피스&subCategory=원피스">원피스</a></li>
									        </ul>
									    </li>
									    <li data-category="sports" class="sub-category-item">
									        <h3><a>스포츠 의류</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=스포츠 의류&subCategory=티셔츠/셔츠/멘투맨">티셔츠/셔츠/멘투맨</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=스포츠 의류&subCategory=니트/베스트">니트/베스트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=스포츠 의류&subCategory=재킷/점퍼">재킷/점퍼</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=스포츠 의류&subCategory=다운/패딩">다운/패딩</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=스포츠 의류&subCategory=팬츠">팬츠</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=스포츠 의류&subCategory=스커트">스커트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=스포츠 의류&subCategory=트레이닝복">트레이닝복</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=스포츠 의류&subCategory=기능성웨어">기능성웨어</a></li>
									        </ul>
									    </li>
									    <li data-category="sports" class="sub-category-item">
									        <h3><a>스포츠 슈즈/잡화</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=스포츠 슈즈/잡화&subCategory=런닝화">런닝화</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=스포츠 슈즈/잡화&subCategory=워킹화">워킹화</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=스포츠 슈즈/잡화&subCategory=스니커즈/캔버스화">스니커즈/캔버스화</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=스포츠 슈즈/잡화&subCategory=슬리퍼/샌들/아쿠아슈즈">슬리퍼/샌들/아쿠아슈즈</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=스포츠 슈즈/잡화&subCategory=스포츠화">스포츠화</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=스포츠 슈즈/잡화&subCategory=스포츠 용품">스포츠 용품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=스포츠 슈즈/잡화&subCategory=스포츠 고글">스포츠 고글</a></li>
									        </ul>
									    </li>
									    <li data-category="sports" class="sub-category-item">
									        <h3><a>등산/아웃도어</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=등산/아웃도어&subCategory=티셔츠">티셔츠</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=등산/아웃도어&subCategory=베스트">베스트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=등산/아웃도어&subCategory=재킷/점퍼/코트">재킷/점퍼/코트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=등산/아웃도어&subCategory=남성 등산화">남성 등산화</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=등산/아웃도어&subCategory=여성 등산화">여성 등산화</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=등산/아웃도어&subCategory=등산배낭">등산배낭</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=등산/아웃도어&subCategory=장갑">장갑</a></li>
									        </ul>
									    </li>
									    <li data-category="sports" class="sub-category-item">
									        <h3><a>캠핑</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=캠핑&subCategory=텐트/그늘막">텐트/그늘막</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=캠핑&subCategory=매트리스/침낭/침대">매트리스/침낭/침대</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=캠핑&subCategory=캠핑 테이블/의자">캠핑 테이블/의자</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=캠핑&subCategory=캠핑소품">캠핑소품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=캠핑&subCategory=캠핑가구">캠핑가구</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=캠핑&subCategory=취사용품">취사용품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=캠핑&subCategory=자동차용품">자동차용품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=캠핑&subCategory=기타용품">기타용품</a></li>
									        </ul>
									    </li>
									    <li data-category="sports" class="sub-category-item">
									        <h3><a>골프</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=골프&subCategory=티셔츠/셔츠/멘투맨">티셔츠/셔츠/멘투맨</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=골프&subCategory=베스트/니트">베스트/니트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=골프&subCategory=재킷/점퍼">재킷/점퍼</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=골프&subCategory=남성팬츠">남성팬츠</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=골프&subCategory=여성팬츠/스커트">여성팬츠/스커트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=골프&subCategory=UNISEX 의류">UNISEX 의류</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=sports&mainCategory=골프&subCategory=골프용품">골프용품</a></li>
									        </ul>
									    </li>
									    <li data-category="children" class="sub-category-item">
									        <h3><a>신생아 의류</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=children&mainCategory=신생아 의류&subCategory=실내복">실내복</a></li>
									        </ul>
									    </li>
									    <li data-category="children" class="sub-category-item">
									        <h3><a>유아의류</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?category=children&mainCategory=유아의류&subCategory=자켓/점퍼/코트">자켓/점퍼/코트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=children&mainCategory=유아의류&subCategory=티셔츠/셔츠">티셔츠/셔츠</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=children&mainCategory=유아의류&subCategory=니트/조끼/가디건">니트/조끼/가디건</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=children&mainCategory=유아의류&subCategory=바지">바지</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=children&mainCategory=유아의류&subCategory=상하복/세트">상하복/세트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=children&mainCategory=유아의류&subCategory=원피스/치마">원피스/치마</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=children&mainCategory=유아의류&subCategory=언더웨어/잠옷/내의">언더웨어/잠옷/내의</a></li>
									            <li><a href="${ctp}/shop/shopSubList?category=children&mainCategory=유아의류&subCategory=우주복">우주복</a></li>
									        </ul>
									    </li>
										</ul>
						        <div class="divider"></div>
						        <ul class="main-category">
					            <li class="category-item" data-target="beauty" onclick="location.href='${ctp}/shop/shopList?category=BEAUTY'">뷰티</li>
					            <li class="category-item" data-target="luxury" onclick="location.href='${ctp}/shop/shopList?category=LUXURY'">명품잡화</li>
					            <li class="category-item" data-target="womenFashion" onclick="location.href='${ctp}/shop/shopList?category=WOMENFASHION'">여성패션</li>
					            <li class="category-item" data-target="menFashion" onclick="location.href='${ctp}/shop/shopList?category=MENFASHION'">남성패션</li>
					            <li class="category-item" data-target="casual" onclick="location.href='${ctp}/shop/shopList?category=CASUAL'">진/캐주얼</li>
					            <li class="category-item" data-target="sports" onclick="location.href='${ctp}/shop/shopList?category=SPORTS'">스포츠/레저</li>
					            <li class="category-item" data-target="children" onclick="location.href='${ctp}/shop/shopList?category=CHILDREN'">유아동</li>
						        </ul>
							    </div>
							</li>
            </ul>
          </div>
        </div>
    </header>
		<!-- 하얀색 애니메이션 창 -->
		<div class="white-box"></div>
    <div style="height: 110px;"></div>
</body>
</html>
