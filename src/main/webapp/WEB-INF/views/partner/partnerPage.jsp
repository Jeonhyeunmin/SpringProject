<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
	<style>
    body, html {
      margin: 0;
      padding: 0;
      height: 2500px;
    }
    #header {
      height: 200px;
      width: 100%;
    }
    #main {
      display: flex;
      height: calc(100% - 80px);
    }
    #nav {
      width: 15%;
      height: 100%;
    }
    #content {
      flex: 1;
      height: 100%;
    }
    iframe {
      border: none;
      width: 100%;
      height: 100%;
    }
  </style>
  <script type="text/javascript">
	  if (window.top !== window.self) {
	    window.top.location = window.location.href;
	  }
	  
  </script>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
		<div id="header">
			<div style="margin-top: 3%;"></div>
	    <iframe src="${ctp}/partner/header" name="partnerPageHeader"></iframe>
	  </div>
	  <div id="main">
	    <div id="nav">
	      <iframe src="${ctp}/partner/nav" name="partnerPageNav"></iframe>
	    </div>
	    <div id="content">
	      <iframe src="${ctp}/partner/content" name="partner"></iframe>
	    </div>
	  </div>
</body>
</html>
