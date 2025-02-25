<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <style type="text/css">
  	@font-face { /*눈누 기초고딕 - 두꺼운 네모 딱딱 고딕*/
	    font-family: 'NoonnuBasicGothicRegular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
		}
		
  	html, body {
		  height: 100%;
		  overflow-y: hidden;
		  margin: 0;
		  padding: 0;
		}
	  .info {
	  	font-family: 'NoonnuBasicGothicRegular';
	    display: flex;
	    align-items: center;
	    margin-bottom: 30px;
	    padding: 20px;
	    border-bottom: 1px solid #ddd;
	  }
	
	  .info .info-tab {
	    display: flex;
	    flex-direction: column;
	    justify-content: center;
	    align-items: center;
	    height: 150px;
	    flex: 1;
	    text-align: center;
	  }
	
	  .info .profile {
	    width: 80px;
	    height: 80px;
	    border-radius: 50%;
	    overflow: hidden;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    text-align: center;
	  }
	
	  .info .profile img {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	  }
	
	  .info .info-detail {
	    flex: 1;
	    text-align: left;
	  }
	
	  .info .name {
	    font-size: 26px;
	    font-weight: bold;
	    color: #333;
	    margin-bottom: 5px;
	  }
	
	  .info .id {
	    font-size: 14px;
	    color: #666;
	    margin-bottom: 15px;
	    text-align: center;
	  }
	
	  .info .info-title {
	    font-size: 22px;
	    font-weight: bold;
	    color: #555;
	    margin-bottom: 10px;
	  }
	
	  .info .info-cnt {
	    font-size: 18px;
	    color: #888;
	  }
	
	  .info .logout {
	    padding: 12px 25px;
	    border: 1px solid #e1c699;
	    border-radius: 5px;
	    background: #fff;
	    color: #e1c699;
	    font-weight: bold;
	    cursor: pointer;
	    transition: all 0.3s ease;
	    margin: 0 5%;
	  }
	
	  .info .logout:hover {
	    background: #e1c699;
	    color: #fff;
	  }
	
	  .info .logout:hover {
	    background: #e1c699;
	    color: #fff;
	  }

		.info > div {
		  flex: 1;
		  text-align: center;
		}
		.info > div:not(:last-child) {
		  border-right: 1px solid #e1e1e1;
		  padding-right: 15px;
		  margin-right: 15px;
		}
		.info > div:last-child {
		  padding-left: 15px;
		}
		a{
			text-decoration: none;
		}
  </style>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
  <div class="info">
    <div class="info-tab">
	  	<a href="${ctp}/member/content" target="customer">
		  	<div class="profile"><img src="${ctp}/member/${vo.photo}"/></div>
		  	<div class="info-detail">
		      <div class="name">${vo.name} 님</div>
		      <div class="id">${vo.mid}</div>
	      </div>
	    </a>
    </div>
    <div class="info-tab coupon">
	    <a href="${ctp}/shop/couponSelect" target="customer">
	      <div class="info-title">쿠폰</div>
	      <div class="info-cnt">${fn: length(couponVOS)}장</div>
	    </a>
    </div>
    <div class="info-tab">
      <div class="info-title">Min's 포인트</div>
      <div class="info-cnt">${vo.point}P</div>
    </div>
    <a class="logout" href='${ctp}/common/logout' target="_top">로그아웃</a>
  </div>
</body>
</html>