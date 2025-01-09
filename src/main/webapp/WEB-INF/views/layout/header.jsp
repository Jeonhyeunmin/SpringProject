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
		                url: "${ctp}/common/login",
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
	    
	    $(document).ready(function() {
		    const menuButton = $(".partner");
		    const whiteBox = $(".white-box");
		    const demo = $("#demo");
	
		    menuButton.on("click", function() {
		        whiteBox.css({
		            "display": "block",
		            "z-index": "1000"
		        });
	
		        setTimeout(function() {
		            $.ajax({
		                url: "${ctp}/common/partnerJoin",
		                type: "GET",
		                success: function(data) {
		                		$("header > *").not("#demo, .white-box").hide();
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
        padding: 30px 0px !important;
        transition: color 0.3s ease, border-bottom 0.3s ease !important;
        text-decoration: none !important;
	    }
	    .nav-link:hover {
        color: #e1c699 !important;
        text-decoration: underline !important;
	    }
	            				
	    .submenu {
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
	      padding: 20px !important !important;
	      border-radius: 10px !important !important;
	      opacity: 0 !important !important;
	      transition: opacity 0.5s ease-in-out !important !important;
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
	            				
      /* 서브 카테고리 스타일 */
      .sub-category {
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
    </style>
</head>
<body>
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
							    <a href="#" class="nav-link">NEW</a>
							    <ul class="submenu" style="flex-wrap: wrap; justify-content: center; gap: 20px;">
							        <c:forEach begin="1" end="3">
							            <li style="list-style: none; text-align: center;">
							                <a href="#" style="display: block;">
							                    <img src="${ctp}/main/main1.jpg" width="400px" style="display: block; margin: 0 auto;">
							                    <p style="margin-top: 10px; font-size: 14px; color: #333;">브랜드 이름 ${index}</p>
							                </a>
							            </li>
							        </c:forEach>
							    </ul>
								</li>
                <li class="nav-item">
							    <a href="#" class="nav-link">BEST</a>
							    <ul class="submenu" style="flex-wrap: wrap; justify-content: center; gap: 20px;">
							        <c:forEach begin="1" end="3">
							            <li style="list-style: none; text-align: center;">
							                <a href="#" style="display: block;">
							                    <img src="${ctp}/main/main1.jpg" width="400px" style="display: block; margin: 0 auto;">
							                    <p style="margin-top: 10px; font-size: 14px; color: #333;">브랜드 이름 ${index}</p>
							                </a>
							            </li>
							        </c:forEach>
							    </ul>
								</li>
                <li class="nav-item">
							    <a href="#" class="nav-link">BRAND</a>
							    <ul class="submenu" style="flex-wrap: wrap; justify-content: center; gap: 20px;">
							        <c:forEach begin="1" end="3">
							            <li style="list-style: none; text-align: center;">
							                <a href="#" style="display: block;">
							                    <img src="${ctp}/main/main1.jpg" width="400px" style="display: block; margin: 0 auto;">
							                    <p style="margin-top: 10px; font-size: 14px; color: #333;">브랜드 이름 ${index}</p>
							                </a>
							            </li>
							        </c:forEach>
							    </ul>
								</li>
                <li class="nav-item">
                  <a href="#" class="nav-link">GIFT</a>
                </li>
            </ul>

            <!-- 액션 -->
            <div class="actions">
                <div class="search-bar">
                    <input type="text" placeholder="Search">
                    <i class="fas fa-search"></i>
                </div>
                <a href="#" class="action-link"><i class="fas fa-heart"></i></a>
                <a href="${ctp}/shop/shopCart" class="action-link"><i class="fas fa-shopping-cart"></i></a>
                <ul class="nav">
                  <li class="nav-item">
                    <c:if test="${empty sMid}"><a href="#" class="nav-link login" style="padding-left: 0; padding-right: 0;"><i class="fas fa-user"></i></a></c:if>
                    <c:if test="${!empty sMid}"><a href="${ctp}/common/myPage" class="nav-link" style="padding-left: 0; padding-right: 0;"><i class="fas fa-user"></i></a></c:if>
                    <ul class="myPage">
                        <c:if test="${empty sMid}"><li><a href="#" class="login">로그인</a></li></c:if>
                        <c:if test="${!empty sMid}"><li><a href="${ctp}/common/myPage">마이페이지</a></li></c:if>
                        <c:if test="${!empty sMid}"><li><a href="${ctp}/common/logout">로그아웃</a></li></c:if>
                        <c:if test="${sLevel == 1 || sLevel > 3 || empty sLevel}"><li><a href="#" class="partner">파트너신청</a></li></c:if>
                    </ul>
                </li>
                <li class="nav-item menuBtn">
							    <a href="#" class="nav-link" style="padding-left: 0 !important; padding-right: 0 !important;">
							        <i class="fa-solid fa-bars"></i>
							    </a>
							    <div class="submenu-container">
						        <ul class="sub-category">
									    <li data-category="beauty" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=스킨케어">스킨케어</a></h3>
									        <ul>
								            <li><a href="${ctp}/shop/shopSubList?subCategory=스킨/토너/미스트">스킨/토너/미스트</a></li>
								            <li><a href="${ctp}/shop/shopSubList?subCategory=로션/에멀젼">로션/에멀젼</a></li>
								            <li><a href="${ctp}/shop/shopSubList?subCategory=에센스/세럼">에센스/세럼</a></li>
								            <li><a href="${ctp}/shop/shopSubList?subCategory=크림">크림</a></li>
								            <li><a href="${ctp}/shop/shopSubList?subCategory=아이크림">아이크림</a></li>
								            <li><a href="${ctp}/shop/shopSubList?subCategory=클렌징">클렌징</a></li>
								            <li><a href="${ctp}/shop/shopSubList?subCategory=마스크/팩">마스크/팩</a></li>
								            <li><a href="${ctp}/shop/shopSubList?subCategory=각질/스크럼/필링">각질/스크럼/필링</a></li>
								            <li><a href="${ctp}/shop/shopSubList?subCategory=유아용화장품">유아용화장품</a></li>
								            <li><a href="${ctp}/shop/shopSubList?subCategory=페이스오일">페이스오일</a></li>
								            <li><a href="${ctp}/shop/shopSubList?subCategory=썬케어">썬케어</a></li>
									        </ul>
									    </li>
									    <li data-category="beauty" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=메이크업">메이크업</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=페이스">페이스</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=립">립</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=아이">아이</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=블러셔">블러셔</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=하이라이터">하이라이터</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=네일">네일</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=메이크업 세트">메이크업 세트</a></li>
									        </ul>
									    </li>
									    <li data-category="beauty" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=바디/헤어케어">바디/헤어케어</a></h3>
									        <ul>
									        	<li><a href="${ctp}/shop/shopSubList?subCategory=바디케어">바디케어</a></li>
									        	<li><a href="${ctp}/shop/shopSubList?subCategory=헤어케어">헤어케어</a></li>
									        </ul>
									    </li>
									    <li data-category="beauty" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=프레그런스">프레그런스</a></h3>
									        <ul>
									        	<li><a href="${ctp}/shop/shopSubList?subCategory=여성용">여성용</a></li>
									        	<li><a href="${ctp}/shop/shopSubList?subCategory=남성용">남성용</a></li>
									        	<li><a href="${ctp}/shop/shopSubList?subCategory=공용향수">공용향수</a></li>
									        	<li><a href="${ctp}/shop/shopSubList?subCategory=캔들">캔들</a></li>
									        	<li><a href="${ctp}/shop/shopSubList?subCategory=디퓨저">디퓨저</a></li>
									        	<li><a href="${ctp}/shop/shopSubList?subCategory=룸 프레그런스">룸 프레그런스</a></li>
									        	<li><a href="${ctp}/shop/shopSubList?subCategory=아로마오일">아로마오일</a></li>
									        </ul>
									    </li>
									    <li data-category="beauty" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=미용기기/용품">미용기기/용품</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=바디용품">바디용품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=헤어용품">헤어용품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=기타소품">기타소품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=피부관리기">피부관리기</a></li>
									        </ul>
									    </li>
									    <li data-category="beauty" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=남성화장품">남성화장품</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=남성화장품세트">남성화장품세트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=로션/크림/에센스">로션/크림/에센스</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=에프터쉐이브/스킨">에프터쉐이브/스킨</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=크렌징/쉐이빙">크렌징/쉐이빙</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=선케어/베이스메이크업">선케어/베이스메이크업</a></li>
									        </ul>
									    </li>
									    <li data-category="luxury" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=명품">명품</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=가방/지갑">가방/지갑</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=시계">시계</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=악세서리/잡화">악세서리/잡화</a></li>
									        </ul>
									    </li>
									    <li data-category="luxury" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=핸드백/가방">핸드백/가방</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=여성 핸드백/가방">여성 핸드백/가방</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=남성가방">남성가방</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=여행가방">여행가방</a></li>
									        </ul>
									    </li>
									    <li data-category="luxury" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=슈즈">슈즈</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=여성화">여성화</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=남성화">남성화</a></li>
									        </ul>
									    </li>
									    <li data-category="luxury" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=기타잡화">기타잡화</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=양말">양말</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=스타킹/타이즈">스타킹/타이즈</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=모자">모자</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=선글라스">선글라스</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=머플러/스카프">머플러/스카프</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=장갑">장갑</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=손수건">손수건</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=안경테">안경테</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=우산/양산">우산/양산</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=핸드폰악세서리">핸드폰악세서리</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=기타">기타</a></li>
									        </ul>
									    </li>
									    <li data-category="luxury" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=지갑/벨트">지갑/벨트</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=여성지갑">여성지갑</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=남성지갑">남성지갑</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=명함지갑">명함지갑</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=여성벨트">여성벨트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=남성벨트">남성벨트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=기타">기타</a></li>
									        </ul>
									    </li>
									    <li data-category="luxury" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=악세서리">악세서리</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=귀걸이">귀걸이</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=목걸이/펜던트">목걸이/펜던트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=팔찌/발찌">팔찌/발찌</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=반지">반지</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=브룻지">브룻지</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=헤어악세서리">헤어악세서리</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=세트상품">세트상품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=금/골드바/귀금속">금/골드바/귀금속</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=나석">나석</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=기타 소품">기타 소품</a></li>
									        </ul>
									    </li>
									    <li data-category="womenFashion" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=아우터">아우터</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=패딩/점퍼">패딩/점퍼</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=코트">코트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=재킷">재킷</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=가죽">가죽</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=모피">모피</a></li>
									        </ul>
									    </li>
									    <li data-category="womenFashion" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=상의">상의</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=티셔츠">티셔츠</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=셔츠/블라우스">셔츠/블라우스</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=가디건/블라우스">가디건/블라우스</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=가디건/베스트">가디건/베스트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=니트/스웨터">니트/스웨터</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=상의세트">상의세트</a></li>
									        </ul>
									    </li>
									    <li data-category="womenFashion" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=하의">하의</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=팬츠">팬츠</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=스커트">스커트</a></li>
									        </ul>
									    </li>
									    <li data-category="womenFashion" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=여성 이지/언더웨어">여성 이지/언더웨어</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=여성 언더웨어">여성 언더웨어</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=이지웨어/잠옷">이지웨어/잠옷</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=임산부 언더웨어">임산부 언더웨어</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=트레이닝복/이지웨어">트레이닝복/이지웨어</a></li>
									        </ul>
									    </li>
									    <li data-category="womenFashion" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=정장/원피스">정장/원피스</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=정장/수트">정장/수트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=원피스">원피스</a></li>
									        </ul>
									    </li>
									    <li data-category="menFashion" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=아우터">아우터</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=재킷">재킷</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=패딩">패딩</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=점퍼">점퍼</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=코트">코트</a></li>
									        </ul>
									    </li>
									    <li data-category="menFashion" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=상의">상의</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=티셔츠">티셔츠</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=셔츠">셔츠</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=카라티">카라티</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=니트/스웨터">니트/스웨터</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=가디건">가디건</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=베스트">베스트</a></li>
									        </ul>
									    </li>
									    <li data-category="menFashion" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=하의">하의</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=반바지/트레이닝">반바지/트레이닝</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=슬랙스/면바지">슬랙스/면바지</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=데님">데님</a></li>
									        </ul>
									    </li>
									    <li data-category="menFashion" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=정장/세트">정장/세트</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=정장/수트세트">정장/수트세트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=맞춤정장">맞춤정장</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=상의">상의</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=팬츠">팬츠</a></li>
									        </ul>
									    </li>
									    <li data-category="menFashion" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=남성 이지/언더웨어">남성 이지/언더웨어</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=남성 런닝&팬티세트">남성 런닝&팬티세트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=남성 내의/이지웨어">남성 내의/이지웨어</a></li>
									        </ul>
									    </li>
									    <li data-category="menFashion" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=패션소품">패션소품</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=넥타이">넥타이</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=벨트">벨트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=지갑">지갑</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=가방">가방</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=모자">모자</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=머플러/스카프">머플러/스카프</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=소품">소품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=슈즈">슈즈</a></li>
									        </ul>
									    </li>
									    <li data-category="casual" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=아우터">아우터</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=재킷">재킷</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=점퍼/패딩">점퍼/패딩</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=코트">코트</a></li>
									        </ul>
									    </li>
									    <li data-category="casual" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=상의">상의</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=티셔츠">티셔츠</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=카라티">카라티</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=셔츠/블라우스">셔츠/블라우스</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=가디건/베스트">가디건/베스트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=니트/스웨터">니트/스웨터</a></li>
									        </ul>
									    </li>
									    <li data-category="casual" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=하의">하의</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=데님">데님</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=팬츠">팬츠</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=스커트">스커트</a></li>
									        </ul>
									    </li>
									    <li data-category="casual" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=세트/원피스">세트/원피스</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=트레이닝복/세트">트레이닝복/세트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=원피스">원피스</a></li>
									        </ul>
									    </li>
									    <li data-category="sports" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=스포츠 의류">스포츠 의류</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=티셔츠/셔츠/멘투맨">티셔츠/셔츠/멘투맨</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=니트/베스트">니트/베스트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=재킷/점퍼">재킷/점퍼</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=다운/패딩">다운/패딩</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=팬츠">팬츠</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=스커트">스커트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=트레이닝복">트레이닝복</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=기능성웨어">기능성웨어</a></li>
									        </ul>
									    </li>
									    <li data-category="sports" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=스포츠 슈즈/잡화">스포츠 슈즈/잡화</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=런닝화">런닝화</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=워킹화">워킹화</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=스니커즈/캔버스화">스니커즈/캔버스화</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=슬리퍼/샌들/아쿠아슈즈">슬리퍼/샌들/아쿠아슈즈</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=스포츠화">스포츠화</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=스포츠 용품">스포츠 용품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=스포츠 고글">스포츠 고글</a></li>
									        </ul>
									    </li>
									    <li data-category="sports" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=등산/아웃도어">등산/아웃도어</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=티셔츠">티셔츠</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=베스트">베스트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=재킷/점퍼/코트">재킷/점퍼/코트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=남성 등산화">남성 등산화</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=여성 등산화">여성 등산화</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=등산배낭">등산배낭</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=장갑">장갑</a></li>
									        </ul>
									    </li>
									    <li data-category="sports" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=캠핑">캠핑</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=텐트/그늘막">텐트/그늘막</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=매트리스/침낭/침대">매트리스/침낭/침대</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=캠핑 테이블/의자">캠핑 테이블/의자</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=캠핑소품">캠핑소품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=캠핑가구">캠핑가구</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=취사용품">취사용품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=자동차용품">자동차용품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=기타용품">기타용품</a></li>
									        </ul>
									    </li>
									    <li data-category="sports" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=골프">골프</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=티셔츠/셔츠/멘투맨">티셔츠/셔츠/멘투맨</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=베스트/니트">베스트/니트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=재킷/점퍼">재킷/점퍼</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=남성팬츠">남성팬츠</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=여성팬츠/스커트">여성팬츠/스커트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=UNISEX 의류">UNISEX 의류</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=골프용품">골프용품</a></li>
									        </ul>
									    </li>
									    <li data-category="sports" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=수영/스키/시즌">수영/스키/시즌</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=여성 수영복">여성 수영복</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=여성 래쉬가드">여성 래쉬가드</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=남성 수영복">남성 수영복</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=남성 래쉬가드">남성 래쉬가드</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=아동 수영복">아동 수영복</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=아동 래쉬가드">아동 래쉬가드</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=수경/수영모/수영용품">수경/수영모/수영용품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=비치백/수영가방">비치백/수영가방</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=물놀이 용품">물놀이 용품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=요트">요트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=스키/보드복">스키/보드복</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=스키/보드 용품">스키/보드 용품</a></li>
									        </ul>
									    </li>
									    <li data-category="children" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=신생아 의류">신생아 의류</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=실내복">실내복</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=실외복">실외복</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=세트">세트</a></li>
									        </ul>
									    </li>
									    <li data-category="children" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=교구/완구">교구/완구</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=아동/유아 장난감">아동/유아 장난감</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=피규어">피규어</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=미술용품/악기">미술용품/악기</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=서적">서적</a></li>
									        </ul>
									    </li>
									    <li data-category="children" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=유아의류">유아의류</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=자켓/점퍼/코트">자켓/점퍼/코트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=티셔츠/셔츠">티셔츠/셔츠</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=니트/조끼/가디건">니트/조끼/가디건</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=바지">바지</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=상하복/세트">상하복/세트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=원피스/치마">원피스/치마</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=언더웨어/잠옷/내의">언더웨어/잠옷/내의</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=우주복">우주복</a></li>
									        </ul>
									    </li>
									    <li data-category="living" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=거실/침실 가구">거실/침실 가구</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=소파">소파</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=거실장/서랍장">거실장/서랍장</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=테이블">테이블</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=스톰/의자">스톰/의자</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=침대">침대</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=장롱/옷장">장롱/옷장</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=협탁/콘솔/화장대">협탁/콘솔/화장대</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=책상/의자/세트">책상/의자/세트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=식탁/의자/세트">식탁/의자/세트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=리바트 세계가구">리바트 세계가구</a></li>
									        </ul>
									    </li>
									    <li data-category="living" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=침구/패브릭">침구/패브릭</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=침구단품/세트">침구단품/세트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=카페트/러그/대자리">카페트/러그/대자리</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=베개/베개솜/베개커버">베개/베개솜/베개커버</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=쿠션/방석/커튼">쿠션/방석/커튼</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=기타/패브릭">기타/패브릭</a></li>
									        </ul>
									    </li>
									    <li data-category="living" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=홈데코/소품">홈데코/소품</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=조명">조명</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=주방조명/데코">주방조명/데코</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=수납/정리">수납/정리</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=캔들/방향제/디퓨저">캔들/방향제/디퓨저</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=액자/시계/거울">액자/시계/거울</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=디자인소품">디자인소품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=생활소품">생활소품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=화병">화병</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=손/발 관리용품">손/발 관리용품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=기타 생활용품">기타 생활용품</a></li>
									        </ul>
									    </li>
									    <li data-category="living" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=바디/욕실용품">바디/욕실용품</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=바디용품">바디용품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=비누/세정제">비누/세정제</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=방향제/습기제거제">방향제/습기제거제</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=욕실/목욕용품">욕실/목욕용품</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=기타 욕실잡화">기타 욕실잡화</a></li>
									        </ul>
									    </li>
									    <li data-category="living" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=주방용품/식기">주방용품/식기</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=냄비">냄비</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=후라이팬">후라이팬</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=압력솥/주전자">압력솥/주전자</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=칼/조리기구">칼/조리기구</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=주방잡화">주방잡화</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=컵/머그/잔">컵/머그/잔</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=보관용기">보관용기</a></li>
									        </ul>
									    </li>
									    <li data-category="living" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=종합/생활가전">종합/생활가전</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=주방가전">주방가전</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=생활가전">생활가전</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=TV">TV</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=냉장고">냉장고</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=세탁기">세탁기</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=계절가전">계절가전</a></li>
									        </ul>
									    </li>
									    <li data-category="living" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=디지털/오디오">디지털/오디오</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=스마트폰/휴대폰">스마트폰/휴대폰</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=컴퓨터/주변기기">컴퓨터/주변기기</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=디지털카메라">디지털카메라</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=카메라 주변기기">카메라 주변기기</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=모바일 악세서리">모바일 악세서리</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=오디오">오디오</a></li>
									        </ul>
									    </li>
									    <li data-category="food" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=산지스토리관">산지스토리관</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=산지직송">산지직송</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=지역명물">지역명물</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=쉐프 초이스">쉐프 초이스</a></li>
									        </ul>
									    </li>
									    <li data-category="food" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=신선식품">신선식품</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=정육">정육</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=수산/건어물">수산/건어물</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=쌀/잡곡/혼합">쌀/잡곡/혼합곡</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=청과/야채">청과/야채</a></li>
									        </ul>
									    </li>
									    <li data-category="food" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=디저트">디저트</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=베이커리/쿠키">베이커리/쿠키</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=초콜렛/젤리/캔디">초콜렛/젤리/캔디</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=간식/스낵">간식/스낵</a></li>
									        </ul>
									    </li>
									    <li data-category="food" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=그로서리">그로서리</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=수입오일/소스">수입오일/소스</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=장/양념">장/양념</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=간편식/안주">간편식/안주</a></li>
									        </ul>
									    </li>
									    <li data-category="food" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=차/커피/음료">차/커피/음료</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=차">차</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=과일차/청">과일차/청</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=선물세트">선물세트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=커피">커피</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=음료">음료</a></li>
									        </ul>
									    </li>
									    <li data-category="food" class="sub-category-item">
									        <h3><a href="${ctp}/shop/shopMainList?mainCategory=홍삼/건강식품">홍삼/건강식품</a></h3>
									        <ul>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=홍삼/인삼/수삼">홍삼/인삼/수삼</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=비타민">비타민</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=오메가/루테인">오메가/루테인</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=칼슘/마그네슘/철분">칼슘/마그네슘/철분</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=유산균">유산균</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=콜라겐/다이어트">콜라겐/다이어트</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=초유/산양유">초유/산양유</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=꿀/프로폴리스">꿀/프로폴리스</a></li>
									            <li><a href="${ctp}/shop/shopSubList?subCategory=기타 건강식품">기타 건강식품</a></li>
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
					            <li class="category-item" data-target="living" onclick="location.href='${ctp}/shop/shopList?category=LIVING'">리빙/가전</li>
					            <li class="category-item" data-target="food" onclick="location.href='${ctp}/shop/shopList?category=FOOD'">식품</li>
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
