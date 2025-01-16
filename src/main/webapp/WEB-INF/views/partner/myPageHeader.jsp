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
  	html, body {
		  height: 100%;
		  overflow-y: hidden;
		  margin: 0;
		  padding: 0;
		}
	  .info {
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
	    margin-left: 20px;
	  }
	
	  .info .id {
	    margin-left: 20px;
	    font-size: 14px;
	    color: #666;
	    margin-bottom: 15px;
	  }
    .info .logout {
      margin-left: auto;
      padding: 10px 20px;
      border: 1px solid #e1c699;
      border-radius: 5px;
      background: transparent;
      color: #e1c699;
      cursor: pointer;
      transition: all 0.3s ease;
    }
    .info .logout:hover {
      background: #e1c699;
      color: #fff;
    }
		a{
			text-decoration: none;
		}
  </style>
</head>
<body>
  <div class="info">
    <div class="profile"><img src="${ctp}/logo/${vo.logo}"/></div>
  	<div class="info-detail">
      <div class="name">
      	${vo.company} 님
      	<c:if test="${vo.accept == 'NO'}"><font color="red" size="2px">* 관리자 승인 후 게시물 등록이 가능합니다.</font></c:if>
      </div>
      <div class="id">${vo.mid}</div>
    </div>
		<a class="logout" href='${ctp}/common/logout'>로그아웃</a>
  </div>
</body>
</html>