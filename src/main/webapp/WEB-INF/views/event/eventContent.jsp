<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
	<style type="text/css">
		.event-container {
	    margin: 50px 20%;
	    align-content: center;
	    align-items: center;
	    text-align: center;
	    position: relative;
	    min-height: 80vh; /* 페이지의 최소 높이를 설정해 버튼이 아래에 위치하도록 */
		}
		
		.page-header .breadcrumb {
	    font-size: 14px;
	    color: #555;
	    margin-top: 2%;
	    margin-left: 14%;
	    background-color: #fff;
		}
		
		.breadcrumb a {
	    text-decoration: none;
	    padding: 0 5px;
	    color: #3498db;
	    transition: color 0.3s ease;
		}
		
		.breadcrumb a:hover {
	    color: #2c3e50;
		}
		
		.event-content {
	    margin-top: 100px;
		}
		
		/* 쿠폰 다운로드 버튼 */
		.downCoupon {
	    position: absolute;
	    bottom: 50px;
	    left: 50%;
	    transform: translateX(-50%);
	    font-size: 18px;
	    padding: 25px 60px;
	    border-radius: 10px;
	    border: none;
	    background: linear-gradient(45deg, #3498db, #2980b9);
	    color: white;
	    font-weight: bold;
	    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	    transition: all 0.3s ease;
	    cursor: pointer;
		}
		
		.downCoupon:hover {
	    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
	    transform: translate(-50%, -5px);
		}
		
		.downCoupon:active {
	    box-shadow: 0 3px 8px rgba(0, 0, 0, 0.2);
	    transform: translate(-50%, 2px);
		}

	</style>  
</head>
<body>
	<div class="event-container">
    <div class="breadcrumb">HOME > 쿠폰/혜택</div>
    <div class="event-content">
      ${vo.content}
    </div>
    <!-- 쿠폰 다운로드 버튼 -->
    <button class="downCoupon" onclick="location.href='${ctp}/event/downCoupon?idx=${vo.idx}'">쿠폰 다운로드</button>
	</div>
</body>
</html>