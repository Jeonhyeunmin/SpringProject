<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <link rel="icon" href="${ctp}/main/favicon.png">
  <title>${title}</title>
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <style>
      body {
          margin: 0;
          padding: 0;
          display: flex;
          flex-direction: column;
          min-height: 100vh; /* 전체 높이를 채우도록 설정 */
          font-family: Arial, sans-serif;
      }
      header {
          flex-shrink: 0;
          width: 100%;
          background-color: #f8f9fa;
          box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      }
      .container {
          flex-grow: 1; /* 콘텐츠 영역이 여유 공간을 채우도록 설정 */
          padding: 20px;
          display: block; /* 중앙 정렬 방지 */
      }
      footer {
          flex-shrink: 0;
          width: 100%;
          background-color: #343a40;
          color: #fff;
          text-align: center;
          padding: 10px 0;
          box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
      }
  </style>
</head>
<body>
  <!-- Header -->
  <header>
      <tiles:insertAttribute name="header" />
  </header>

  <!-- Main Body -->
<	tiles:insertAttribute name="body" />

  <!-- Footer -->
  <footer>
      <tiles:insertAttribute name="footer" />
  </footer>
</body>
</html>
