<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="${ctp}/main/favicon.png">
  <title>관리자 | Min's</title>
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <style type="text/css">
  	body {
			display: flex;
		}
		nav{
			flex: 0.3;
		}
		.content{
			flex: 1.7;
		}
  </style>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
  <nav>
    <tiles:insertAttribute name="nav" />
  </nav>
  <div class="content">
  	<tiles:insertAttribute name="adminBody" />
  </div>
</body>
</html>