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
				    text-align: center; /* 중앙 정렬 */
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
        }
        .myPage li a:hover {
            color: #e1c699;
        }

        .nav-item:hover .submenu {
            display: block;
        }
        .nav-item:hover .myPage {
            display: block;
        }
        .actions {
            display: flex;
            align-items: center;
            gap: 15px;
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
    </style>
</head>
<body>
<div id="demo"></div>
    <header class="header">
        <div class="header-container">
            <!-- 로고 -->
            <div style="z-index: 999;">
                <a href="#" class="logo">Min's</a>
                <div class="tagline">Luxury Shopping Redefined</div>
            </div>

            <!-- 내비게이션 -->
            <ul class="nav">
                <li class="nav-item">
                    <a href="#" class="nav-link">NEW</a>
                    <ul class="submenu">
                        <li><a href="#"><i class="fa-solid fa-star"></i> 신상품 1</a></li>
                        <li><a href="#"><i class="fa-solid fa-star"></i> 신상품 2</a></li>
                        <li><a href="#"><i class="fa-solid fa-star"></i> 신상품 3</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">BEST</a>
                    <ul class="submenu">
                        <li><a href="#"><i class="fa-solid fa-thumbs-up"></i> 베스트 1</a></li>
                        <li><a href="#"><i class="fa-solid fa-thumbs-up"></i> 베스트 2</a></li>
                        <li><a href="#"><i class="fa-solid fa-thumbs-up"></i> 베스트 3</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">BRAND</a>
                    <ul class="submenu">
                        <li><a href="#">브랜드 A</a></li>
                        <li><a href="#">브랜드 B</a></li>
                        <li><a href="#">브랜드 C</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">GIFT</a>
                    <ul class="submenu">
                        <li><a href="#"><i class="fa-solid fa-gift"></i> 선물 A</a></li>
                        <li><a href="#"><i class="fa-solid fa-gift"></i> 선물 B</a></li>
                        <li><a href="#"><i class="fa-solid fa-gift"></i> 선물 C</a></li>
                    </ul>
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
                    <a href="#" class="nav-link login" style="padding: 15px 5px;"><i class="fas fa-user"></i></a>
                    <ul class="myPage">
                        <c:if test="${empty sMid}"><li><a href="#" class="login">로그인</a></li></c:if>
                        <c:if test="${!empty sMid}"><li><a href="${ctp}/common/myPage">마이페이지</a></li></c:if>
                        <c:if test="${!empty sMid}"><li><a href="${ctp}/common/logout">로그아웃</a></li></c:if>
                        <li><a href="#" class="partner">파트너신청</a></li>
                    </ul>
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
