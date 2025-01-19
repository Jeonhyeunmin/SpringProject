<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Min's 소개 | Min's</title>
  <link rel="icon" href="${ctp}/main/favicon.png">
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <style type="text/css">
  	.video-container {
	     position: absolute;
	     top: 0;
	     left: 0;
	     width: 100%;
	     height: 100%;
	     overflow: hidden;
	    }
      
    .video-container video {
       object-fit: cover; /* 비디오가 화면을 꽉 채우도록 설정 */
       width: 100%;
       height: 100%;
    }
  </style>
</head>
<body>
	<div class="video-container">
		<video autoplay loop muted>
	  	<source src="${ctp}/main/Min.mp4" type="video/mp4">
	  </video>
	</div>
	
</body>
</html>