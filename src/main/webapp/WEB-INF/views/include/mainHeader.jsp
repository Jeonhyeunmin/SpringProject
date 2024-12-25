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
            margin: 0;
            font-family: 'Georgia', serif;
            color: #333;
        }
        .header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: #fff;
            border-bottom: 2px solid #e1c699;
            z-index: 1000;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px 20px;
        }
        .logo {
            font-size: 28px;
            font-weight: bold;
            color: #e1c699;
            text-decoration: none;
            font-family: 'Playfair Display', serif;
        }
        .nav {
            display: flex;
            list-style: none;
            margin: 0;
            padding: 0;
            gap: 25px;
        }
        .nav-item {
            position: relative;
        }
        .nav-link {
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            color: #333;
            padding: 30px 15px;
            transition: color 0.3s ease, border-bottom 0.3s ease;
        }
        .nav-link:hover {
            color: #e1c699;
            text-decoration: underline;
        }
				
				.submenu {
				    display: none;
				    position: fixed;
				    top: 100px;
				    left: 0;
				    right: 0;
				    background-color: #fff;
				    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
				    list-style: none;
				    margin: 0;
				    padding: 20px 0;
				    z-index: 998;
				    border-top: 1px solid #e1c699;
				}
				.submenu li {
				    padding: 10px 20px;
				    text-align: center;
				    display: inline;
				}

        .submenu li a {
            text-decoration: none;
            color: #333;
            font-size: 14px;
            padding: 20px;
        }
        .submenu li a:hover {
            color: #e1c699;
        }
				.myPage {
        	  display: none;
            position: absolute;
            top: 100%;
            left: 0;
            right: 0; /* 페이지 오른쪽 끝 */
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            list-style: none;
            margin: 0;
            padding: 20px 0;
            z-index: 1000;
				    border-top: 1px solid #e1c699;
				    width: 200px;
				}
				.myPage li {
				    padding: 10px 20px;
				    width: 200px;
				}

        .myPage li a {
            text-decoration: none;
            color: #333;
            font-size: 14px;
            padding: 10px;
        }
        .myPage li a:hover {
            color: #e1c699;
        }

        .nav-item:hover .submenu {
            display: flex;
        }
        .nav-item:hover .myPage {
            display: block;
        }
        .actions {
            display: flex;
            align-items: center;
            gap: 25px;
        }
        .action-link {
            font-size: 18px;
            color: #333;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .action-link:hover {
            color: #e1c699;
        }
        .search-bar {
            display: flex;
            align-items: center;
            border: 1px solid #e1c699;
            padding: 5px 10px;
            border-radius: 20px;
            background-color: #fff;
        }
        .search-bar input {
            border: none;
            outline: none;
            font-size: 14px;
            width: 250px;
            color: #333;
        }
        .search-bar i {
            font-size: 16px;
            color: #e1c699;
        }
        .tagline {
            font-size: 14px;
            color: #888;
            margin-top: 5px;
        }
				
				/* 하얀색 창 애니메이션 */
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
			    display: none;
			    position: fixed;
			    top: 100px;
			    left: 0;
			    right: 0;
			    background-color: #fff;
			    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
			    list-style: none;
			    margin: 0;
			    padding: 20px 0;
			    z-index: 998;
			    border-top: 1px solid #e1c699;
			}
			.submenu-container li{
				text-align: center;
			}
			
			/* 메인 카테고리 스타일 */
			.main-category {
			    list-style: none;
			    margin: 0;
			    padding: 10px;
			    width: 30%;
			}
			
			.category-item {
			    padding: 15px 15px;
			    cursor: pointer;
			    font-size: 16px;
			    font-weight: bold;
			    color: #333;
			    transition: background-color 0.3s ease, color 0.3s ease;
			}
			
			.category-item:hover {
			    background-color: #e1c699;
			    color: #fff;
			}
			
			/* 구분선 스타일 */
			.divider {
			    width: 1px;
			    background-color: #ccc;
			    margin: 0 20px;
			}
			
			/* 서브 카테고리 스타일 */
			.sub-category {
		    max-height: 500px; /* 최대 높이 설정 */
    		overflow-y: auto; /* 항목이 넘칠 경우 스크롤 표시 */
		    flex-direction: column;
		    margin: 0;
		    width: 70%;
		    display: flex;
		    flex-wrap: wrap;
		    gap: 20px;
		    padding: 20px;
		    background-color: #fff;
		    list-style: none;
			}
			
			.sub-category-item {
		    flex: 1 1 calc(33.33% - 20px); /* 세 항목씩 한 줄에 배치 */
		    background-color: #f9f9f9;
		    padding: 20px;
		    border-radius: 8px;
		    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		    text-align: left;
			}
			
			.sub-category-item h3 {
		    font-size: 18px;
		    font-weight: bold;
		    color: #333;
		    margin-bottom: 10px;
		    border-bottom: 2px solid #e1c699;
		    padding-bottom: 5px;
			}
			
			.sub-category-item ul {
		    list-style: none;
		    padding: 0;
		    margin: 0;
			}
			
			.sub-category-item ul li {
		    font-size: 14px;
		    color: #555;
		    margin-bottom: 5px;
		    padding-left: 0;
		    position: relative;
			}
			
			.sub-category-item ul li:before {
		    list-style: none;
		    content: '•';
		    position: absolute;
		    left: 0;
		    color: #e1c699;
		    font-weight: bold;
			}
			
			.main-category .category-item:hover ~ .sub-category .sub-category-item {
		    display: none; /* 기본적으로 숨겨진 상태 */
			}
			
			.sub-category-item:hover {
		    color: #e1c699;
			}
			
			/* 햄버거 버튼에 마우스를 올렸을 때 서브메뉴 표시 */
			.menuBtn:hover .submenu-container {
		    display: flex;
			}
			
			.sub-category a{
				text-decoration: none;
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
                <a href="#" class="action-link"><i class="fas fa-shopping-cart"></i></a>
                <ul class="nav">
                  <li class="nav-item">
                    <a href="#" class="nav-link login" style="padding-left: 0; padding-right: 0;"><i class="fas fa-user"></i></a>
                    <ul class="myPage">
                        <c:if test="${empty sMid}"><li><a href="#" class="login">로그인</a></li></c:if>
                        <c:if test="${!empty sMid}"><li><a href="${ctp}/common/myPage">마이페이지</a></li></c:if>
                        <c:if test="${!empty sMid}"><li><a href="${ctp}/common/logout">로그아웃</a></li></c:if>
                        <c:if test="${sLevel == 1 || sLevel > 3 || empty sLevel}"><li><a href="#" class="partner">파트너신청</a></li></c:if>
                    </ul>
                </li>
                <li class="nav-item menuBtn">
							    <a href="#" class="nav-link" style="padding-left: 0; padding-right: 0;">
							        <i class="fa-solid fa-bars"></i>
							    </a>
							    <div class="submenu-container">
						        <ul class="sub-category">
									    <li data-category="beauty" class="sub-category-item">
									        <h3>스킨케어</h3>
									        <ul>
									            <li><a href="#">스킨/토너/미스트</a></li>
									            <li><a href="#">로션/에멀젼</a></li>
									            <li><a href="#">에센스/세럼</a></li>
									            <li><a href="#">크림</a></li>
									            <li><a href="#">아이크림</a></li>
									            <li><a href="#">클렌징</a></li>
									            <li><a href="#">마스크/팩</a></li>
									            <li><a href="#">각질/스크럼/필링</a></li>
									            <li><a href="#">유아용화장품</a></li>
									            <li><a href="#">페이스오일</a></li>
									            <li><a href="#">썬케어</a></li>
									        </ul>
									    </li>
									    <li data-category="beauty" class="sub-category-item">
									        <h3>메이크업</h3>
									        <ul>
									            <li><a href="#">페이스</a></li>
									            <li><a href="#">립</a></li>
									            <li><a href="#">아이</a></li>
									            <li><a href="#">블러셔</a></li>
									            <li><a href="#">하이라이터</a></li>
									            <li><a href="#">네일</a></li>
									            <li><a href="#">메이크업 세트</a></li>
									        </ul>
									    </li>
									    <li data-category="beauty" class="sub-category-item">
									        <h3>바디/헤어케어</h3>
									        <ul>
									        	<li><a href="#">바디케어</a></li>
									        	<li><a href="#">헤어케어</a></li>
									        </ul>
									    </li>
									    <li data-category="beauty" class="sub-category-item">
									        <h3>프레그런스</h3>
									        <ul>
									        	<li><a href="#">여성용</a></li>
									        	<li><a href="#">남성용</a></li>
									        	<li><a href="#">공용향수</a></li>
									        	<li><a href="#">캔들</a></li>
									        	<li><a href="#">디퓨저</a></li>
									        	<li><a href="#">룸 프레그런스</a></li>
									        	<li><a href="#">아로마오일</a></li>
									        </ul>
									    </li>
									    <li data-category="beauty" class="sub-category-item">
									        <h3>미용기기/용품</h3>
									        <ul>
									            <li><a href="#">바디용품</a></li>
									            <li><a href="#">헤어용품</a></li>
									            <li><a href="#">기타소품</a></li>
									            <li><a href="#">피부관리기</a></li>
									        </ul>
									    </li>
									    <li data-category="beauty" class="sub-category-item">
									        <h3>남성화장품</h3>
									        <ul>
									            <li><a href="#">남성화장품세트</a></li>
									            <li><a href="#">로션/크림/에센스</a></li>
									            <li><a href="#">에프터쉐이브/스킨</a></li>
									            <li><a href="#">크렌징/쉐이빙</a></li>
									            <li><a href="#">선케어/베이스메이크업</a></li>
									        </ul>
									    </li>
									    <li data-category="luxury" class="sub-category-item">
									        <h3>명품</h3>
									        <ul>
									            <li><a href="#">가방/지갑</a></li>
									            <li><a href="#">시계</a></li>
									            <li><a href="#">엑세서리/잡화</a></li>
									        </ul>
									    </li>
									    <li data-category="luxury" class="sub-category-item">
									        <h3>핸드백/가방</h3>
									        <ul>
									            <li><a href="#">여성 핸드백/가방</a></li>
									            <li><a href="#">남성가방</a></li>
									            <li><a href="#">여행가방</a></li>
									        </ul>
									    </li>
									    <li data-category="luxury" class="sub-category-item">
									        <h3>슈즈</h3>
									        <ul>
									            <li><a href="#">여성화</a></li>
									            <li><a href="#">남성화</a></li>
									        </ul>
									    </li>
									    <li data-category="luxury" class="sub-category-item">
									        <h3>기타잡화</h3>
									        <ul>
									            <li><a href="#">양말</a></li>
									            <li><a href="#">스타킹/타이즈</a></li>
									            <li><a href="#">모자</a></li>
									            <li><a href="#">선글라스</a></li>
									            <li><a href="#">머플러/스카프</a></li>
									            <li><a href="#">장갑</a></li>
									            <li><a href="#">손수건</a></li>
									            <li><a href="#">안경테</a></li>
									            <li><a href="#">우산/양산</a></li>
									            <li><a href="#">핸드폰악세서리</a></li>
									            <li><a href="#">기타</a></li>
									        </ul>
									    </li>
									    <li data-category="luxury" class="sub-category-item">
									        <h3>지갑/벨트</h3>
									        <ul>
									            <li><a href="#">여성지갑</a></li>
									            <li><a href="#">남성지갑</a></li>
									            <li><a href="#">명함지갑</a></li>
									            <li><a href="#">여성벨트</a></li>
									            <li><a href="#">남성벨트</a></li>
									            <li><a href="#">기타</a></li>
									        </ul>
									    </li>
									    <li data-category="luxury" class="sub-category-item">
									        <h3>악세서리</h3>
									        <ul>
									            <li><a href="#">귀걸이</a></li>
									            <li><a href="#">목걸이/펜던트</a></li>
									            <li><a href="#">팔찌/발찌</a></li>
									            <li><a href="#">반지</a></li>
									            <li><a href="#">브룻지</a></li>
									            <li><a href="#">헤어악세서리</a></li>
									            <li><a href="#">세트상품</a></li>
									            <li><a href="#">금/골드바/귀금속</a></li>
									            <li><a href="#">나석</a></li>
									            <li><a href="#">기타 소품</a></li>
									        </ul>
									    </li>
									    <li data-category="womenFashion" class="sub-category-item">
									        <h3>아우터</h3>
									        <ul>
									            <li><a href="#">패딩/점퍼</a></li>
									            <li><a href="#">코트</a></li>
									            <li><a href="#">재킷</a></li>
									            <li><a href="#">가죽</a></li>
									            <li><a href="#">모피</a></li>
									        </ul>
									    </li>
									    <li data-category="womenFashion" class="sub-category-item">
									        <h3>상의</h3>
									        <ul>
									            <li><a href="#">티셔츠</a></li>
									            <li><a href="#">셔츠/블라우스</a></li>
									            <li><a href="#">가디건/블라우스</a></li>
									            <li><a href="#">가디건/베스트</a></li>
									            <li><a href="#">니트/스웨터</a></li>
									            <li><a href="#">상의세트</a></li>
									        </ul>
									    </li>
									    <li data-category="womenFashion" class="sub-category-item">
									        <h3>하의</h3>
									        <ul>
									            <li><a href="#">팬츠</a></li>
									            <li><a href="#">스커트</a></li>
									        </ul>
									    </li>
									    <li data-category="womenFashion" class="sub-category-item">
									        <h3>여성 이지/언더웨어</h3>
									        <ul>
									            <li><a href="#">여성 언더웨어</a></li>
									            <li><a href="#">이지웨어/잠옷</a></li>
									            <li><a href="#">임산부 언더웨어</a></li>
									            <li><a href="#">트레이닝복/이지웨어</a></li>
									        </ul>
									    </li>
									    <li data-category="womenFashion" class="sub-category-item">
									        <h3>정장/원피스</h3>
									        <ul>
									            <li><a href="#">정장/수트</a></li>
									            <li><a href="#">원피스</a></li>
									        </ul>
									    </li>
									    <li data-category="menFashion" class="sub-category-item">
									        <h3>아우터</h3>
									        <ul>
									            <li><a href="#">재킷</a></li>
									            <li><a href="#">패딩</a></li>
									            <li><a href="#">점퍼</a></li>
									            <li><a href="#">코트</a></li>
									        </ul>
									    </li>
									    <li data-category="menFashion" class="sub-category-item">
									        <h3>상의</h3>
									        <ul>
									            <li><a href="#">티셔츠</a></li>
									            <li><a href="#">셔츠</a></li>
									            <li><a href="#">카라티</a></li>
									            <li><a href="#">니트/스웨터</a></li>
									            <li><a href="#">가디건</a></li>
									            <li><a href="#">베스트</a></li>
									        </ul>
									    </li>
									    <li data-category="menFashion" class="sub-category-item">
									        <h3>하의</h3>
									        <ul>
									            <li><a href="#">반바지/트레이닝</a></li>
									            <li><a href="#">슬랙스/면바지</a></li>
									            <li><a href="#">데님</a></li>
									        </ul>
									    </li>
									    <li data-category="menFashion" class="sub-category-item">
									        <h3>정장/세트</h3>
									        <ul>
									            <li><a href="#">정장/수트세트</a></li>
									            <li><a href="#">맞춤정장</a></li>
									            <li><a href="#">상의</a></li>
									            <li><a href="#">팬츠</a></li>
									        </ul>
									    </li>
									    <li data-category="menFashion" class="sub-category-item">
									        <h3>남성 이지/언더웨어</h3>
									        <ul>
									            <li><a href="#">남성 런닝&팬티세트</a></li>
									            <li><a href="#">남성 내의/이지웨어</a></li>
									        </ul>
									    </li>
									    <li data-category="menFashion" class="sub-category-item">
									        <h3>패션소품</h3>
									        <ul>
									            <li><a href="#">넥타이</a></li>
									            <li><a href="#">벨트</a></li>
									            <li><a href="#">지갑</a></li>
									            <li><a href="#">가방</a></li>
									            <li><a href="#">모자</a></li>
									            <li><a href="#">머플러/스카프</a></li>
									            <li><a href="#">소품</a></li>
									            <li><a href="#">슈즈</a></li>
									        </ul>
									    </li>
									    <li data-category="casual" class="sub-category-item">
									        <h3>아우터</h3>
									        <ul>
									            <li><a href="#">재킷</a></li>
									            <li><a href="#">점퍼/패딩</a></li>
									            <li><a href="#">코트</a></li>
									        </ul>
									    </li>
									    <li data-category="casual" class="sub-category-item">
									        <h3>상의</h3>
									        <ul>
									            <li><a href="#">티셔츠</a></li>
									            <li><a href="#">카라티</a></li>
									            <li><a href="#">셔츠/블라우스</a></li>
									            <li><a href="#">가디건/베스트</a></li>
									            <li><a href="#">니트/스웨터</a></li>
									        </ul>
									    </li>
									    <li data-category="casual" class="sub-category-item">
									        <h3>하의</h3>
									        <ul>
									            <li><a href="#">데님</a></li>
									            <li><a href="#">팬츠</a></li>
									            <li><a href="#">스커트</a></li>
									        </ul>
									    </li>
									    <li data-category="casual" class="sub-category-item">
									        <h3>세트/원피스</h3>
									        <ul>
									            <li><a href="#">트레이닝복/세트</a></li>
									            <li><a href="#">원피스</a></li>
									        </ul>
									    </li>
									    <li data-category="sports" class="sub-category-item">
									        <h3>스포츠 의류</h3>
									        <ul>
									            <li><a href="#">티셔츠/셔츠/멘투맨</a></li>
									            <li><a href="#">니트/베스트</a></li>
									            <li><a href="#">재킷/점퍼</a></li>
									            <li><a href="#">다운/패딩</a></li>
									            <li><a href="#">팬츠</a></li>
									            <li><a href="#">스커트</a></li>
									            <li><a href="#">트레이닝복</a></li>
									            <li><a href="#">기능성웨어</a></li>
									        </ul>
									    </li>
									    <li data-category="sports" class="sub-category-item">
									        <h3>스포츠 슈즈/잡화</h3>
									        <ul>
									            <li><a href="#">런닝화</a></li>
									            <li><a href="#">워킹화</a></li>
									            <li><a href="#">스니커즈/캔버스화</a></li>
									            <li><a href="#">슬리퍼/샌들/아쿠아슈즈</a></li>
									            <li><a href="#">스포츠화</a></li>
									            <li><a href="#">스포츠 용품</a></li>
									            <li><a href="#">스포츠 고글</a></li>
									        </ul>
									    </li>
									    <li data-category="sports" class="sub-category-item">
									        <h3>등산/아웃도어</h3>
									        <ul>
									            <li><a href="#">티셔츠</a></li>
									            <li><a href="#">베스트</a></li>
									            <li><a href="#">재킷/점퍼/코트</a></li>
									            <li><a href="#">남성 등산화</a></li>
									            <li><a href="#">여성 등산화</a></li>
									            <li><a href="#">등산배낭</a></li>
									            <li><a href="#">장갑</a></li>
									        </ul>
									    </li>
									    <li data-category="sports" class="sub-category-item">
									        <h3>캠핑</h3>
									        <ul>
									            <li><a href="#">텐트/그늘막</a></li>
									            <li><a href="#">매트리스/침낭/침대</a></li>
									            <li><a href="#">캠핑 테이블/의자</a></li>
									            <li><a href="#">캠핑소품</a></li>
									            <li><a href="#">캠핑가구</a></li>
									            <li><a href="#">취사용품</a></li>
									            <li><a href="#">자동차용품</a></li>
									            <li><a href="#">기타용품</a></li>
									        </ul>
									    </li>
									    <li data-category="sports" class="sub-category-item">
									        <h3>골프</h3>
									        <ul>
									            <li><a href="#">티셔츠/셔츠/멘투맨</a></li>
									            <li><a href="#">베스트/니트</a></li>
									            <li><a href="#">재킷/점퍼</a></li>
									            <li><a href="#">남성팬츠</a></li>
									            <li><a href="#">여성팬츠/스커트</a></li>
									            <li><a href="#">UNISEX 의류</a></li>
									            <li><a href="#">골프용품</a></li>
									        </ul>
									    </li>
									    <li data-category="sports" class="sub-category-item">
									        <h3>수영/스키/시즌</h3>
									        <ul>
									            <li><a href="#">여성 수영복</a></li>
									            <li><a href="#">여성 래쉬가드</a></li>
									            <li><a href="#">남성 수영복</a></li>
									            <li><a href="#">남성 래쉬가드</a></li>
									            <li><a href="#">아동 수영복</a></li>
									            <li><a href="#">아동 래쉬가드</a></li>
									            <li><a href="#">수경/수영모/수영용품</a></li>
									            <li><a href="#">비치백/수영가방</a></li>
									            <li><a href="#">물놀이 용품</a></li>
									            <li><a href="#">요트</a></li>
									            <li><a href="#">스키/보드복</a></li>
									            <li><a href="#">스키/보드 용품</a></li>
									        </ul>
									    </li>
									    <li data-category="children" class="sub-category-item">
									        <h3>신생아 의류</h3>
									        <ul>
									            <li><a href="#">실내복</a></li>
									            <li><a href="#">실외복</a></li>
									            <li><a href="#">세트</a></li>
									        </ul>
									    </li>
									    <li data-category="children" class="sub-category-item">
									        <h3>교구/완구</h3>
									        <ul>
									            <li><a href="#">아동/유아 장난감</a></li>
									            <li><a href="#">피규어</a></li>
									            <li><a href="#">미술용품/악기</a></li>
									            <li><a href="#">서적</a></li>
									        </ul>
									    </li>
									    <li data-category="children" class="sub-category-item">
									        <h3>유아의류</h3>
									        <ul>
									            <li><a href="#">자켓/점퍼/코트</a></li>
									            <li><a href="#">티셔츠/셔츠</a></li>
									            <li><a href="#">니트/조끼/가디건</a></li>
									            <li><a href="#">바지</a></li>
									            <li><a href="#">상하복/세트</a></li>
									            <li><a href="#">원피스/치마</a></li>
									            <li><a href="#">언더웨어/잠옷/내의</a></li>
									            <li><a href="#">우주복</a></li>
									        </ul>
									    </li>
									    <li data-category="living" class="sub-category-item">
									        <h3>거실/침실 가구</h3>
									        <ul>
									            <li><a href="#">소파</a></li>
									            <li><a href="#">거실장/서랍장</a></li>
									            <li><a href="#">테이블</a></li>
									            <li><a href="#">스톰/의자</a></li>
									            <li><a href="#">침대</a></li>
									            <li><a href="#">장롱/옷장</a></li>
									            <li><a href="#">협탁/콘솔/화장대</a></li>
									            <li><a href="#">책상/의자/세트</a></li>
									            <li><a href="#">식탁/의자/세트</a></li>
									            <li><a href="#">리바트 세계가구</a></li>
									        </ul>
									    </li>
									    <li data-category="living" class="sub-category-item">
									        <h3>침구/패브릭</h3>
									        <ul>
									            <li><a href="#">침구단품/세트</a></li>
									            <li><a href="#">카페트/러그/대자리</a></li>
									            <li><a href="#">베개/베개솜/베개커버</a></li>
									            <li><a href="#">쿠션/방석/커튼</a></li>
									            <li><a href="#">기타/패브릭</a></li>
									        </ul>
									    </li>
									    <li data-category="living" class="sub-category-item">
									        <h3>홈데코/소품</h3>
									        <ul>
									            <li><a href="#">조명</a></li>
									            <li><a href="#">조명</a></li>
									            <li><a href="#">주방조명/데코</a></li>
									            <li><a href="#">수납/정리</a></li>
									            <li><a href="#">캔들/방향제/디퓨저</a></li>
									            <li><a href="#">액자/시계/거울</a></li>
									            <li><a href="#">디자인소품</a></li>
									            <li><a href="#">생활소품</a></li>
									            <li><a href="#">화병</a></li>
									            <li><a href="#">손/발 관리용품</a></li>
									            <li><a href="#">기타 생활용품</a></li>
									        </ul>
									    </li>
									    <li data-category="living" class="sub-category-item">
									        <h3>바디/욕실용품</h3>
									        <ul>
									            <li><a href="#">바디용품</a></li>
									            <li><a href="#">비누/세정제</a></li>
									            <li><a href="#">방향제/습기제거제</a></li>
									            <li><a href="#">욕실/목욕용품</a></li>
									            <li><a href="#">기타 욕실잡화</a></li>
									        </ul>
									    </li>
									    <li data-category="living" class="sub-category-item">
									        <h3>주방용품/식기</h3>
									        <ul>
									            <li><a href="#">냄비</a></li>
									            <li><a href="#">후라이팬</a></li>
									            <li><a href="#">압력솥/주전자</a></li>
									            <li><a href="#">칼/조리기구</a></li>
									            <li><a href="#">주방잡화</a></li>
									            <li><a href="#">컵/머그/잔</a></li>
									            <li><a href="#">보관용기</a></li>
									        </ul>
									    </li>
									    <li data-category="living" class="sub-category-item">
									        <h3>종합/생활가전</h3>
									        <ul>
									            <li><a href="#">주방가전</a></li>
									            <li><a href="#">생활가전</a></li>
									            <li><a href="#">TV</a></li>
									            <li><a href="#">냉장고</a></li>
									            <li><a href="#">세탁기</a></li>
									            <li><a href="#">계절가전</a></li>
									        </ul>
									    </li>
									    <li data-category="living" class="sub-category-item">
									        <h3>디지털/오디오</h3>
									        <ul>
									            <li><a href="#">스마트폰/휴대폰</a></li>
									            <li><a href="#">컴퓨터/주변기기</a></li>
									            <li><a href="#">디지털카메라</a></li>
									            <li><a href="#">카레마 주변기기</a></li>
									            <li><a href="#">모바일 악세서리</a></li>
									            <li><a href="#">오디오</a></li>
									        </ul>
									    </li>
									    <li data-category="food" class="sub-category-item">
									        <h3>산지스토리관</h3>
									        <ul>
									            <li><a href="#">산지직송</a></li>
									            <li><a href="#">지역명물</a></li>
									            <li><a href="#">쉐프 초이스</a></li>
									        </ul>
									    </li>
									    <li data-category="food" class="sub-category-item">
									        <h3>신선식품</h3>
									        <ul>
									            <li><a href="#">정육</a></li>
									            <li><a href="#">수산/건어물</a></li>
									            <li><a href="#">쌀/잡곡/혼합곡</a></li>
									            <li><a href="#">청과/야채</a></li>
									        </ul>
									    </li>
									    <li data-category="food" class="sub-category-item">
									        <h3>디저트</h3>
									        <ul>
									            <li><a href="#">베이커리/쿠키</a></li>
									            <li><a href="#">초콜렛/젤리/캔디</a></li>
									            <li><a href="#">간식/스낵</a></li>
									        </ul>
									    </li>
									    <li data-category="food" class="sub-category-item">
									        <h3>그로서리</h3>
									        <ul>
									            <li><a href="#">수입오일/소스</a></li>
									            <li><a href="#">장/양념</a></li>
									            <li><a href="#">간편식/안주</a></li>
									        </ul>
									    </li>
									    <li data-category="food" class="sub-category-item">
									        <h3>차/커피/음료</h3>
									        <ul>
									            <li><a href="#">차</a></li>
									            <li><a href="#">과일차/청</a></li>
									            <li><a href="#">선물세트</a></li>
									            <li><a href="#">커피</a></li>
									            <li><a href="#">음료</a></li>
									        </ul>
									    </li>
									    <li data-category="food" class="sub-category-item">
									        <h3>홍삼/건강식품</h3>
									        <ul>
									            <li><a href="#">홍삼/인삼/수삼</a></li>
									            <li><a href="#">비타민</a></li>
									            <li><a href="#">오메가/루테인</a></li>
									            <li><a href="#">칼슘/마그네슘/철분</a></li>
									            <li><a href="#">유산균</a></li>
									            <li><a href="#">콜라겐/다이어트</a></li>
									            <li><a href="#">초유/산양유</a></li>
									            <li><a href="#">꿀/프로폴리스</a></li>
									            <li><a href="#">기타 건강식품</a></li>
									        </ul>
									    </li>
										</ul>
						        <div class="divider"></div>
						        <ul class="main-category">
					            <li class="category-item" data-target="beauty">뷰티</li>
					            <li class="category-item" data-target="luxury">명품잡화</li>
					            <li class="category-item" data-target="womenFashion">여성패션</li>
					            <li class="category-item" data-target="menFashion">남성패션</li>
					            <li class="category-item" data-target="casual">진/캐주얼</li>
					            <li class="category-item" data-target="sports">스포츠/레저</li>
					            <li class="category-item" data-target="children">유아동</li>
					            <li class="category-item" data-target="living">리빙/가전</li>
					            <li class="category-item" data-target="food">식품</li>
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
