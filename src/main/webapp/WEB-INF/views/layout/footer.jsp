<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
</head>
<body>
<div class="jumbotron text-center" style="margin-bottom:0; padding: 0;">
	<div style="width: 100%;">
		<br>
		<div style="text-align: left; padding-top:5px; margin-left: 10%;">
			<div class="input-group" style="font-size: 20px;">
				<div><a href="" style="color: gray; padding-left: 10px">회사소개</a></div>
				<div><a href="" style="color: gray; padding-left: 10px">이용약관</a></div>
				<div><a href="" style="color: gray; padding-left: 10px">개인벙보처리방침</a></div>
				<div><a href="" style="color: gray; padding-left: 10px">이메일주소 무단수집 거부</a></div>
			</div>
			<div style="color: gray; padding-left: 10px; padding-bottom: 25px; font-size: 15px">
				<div>대표이사 : 전현민 | 사업자등록번호 : 123-45-67890</div>	
				<div>전화 : 043-123-4567 | 충청북도 청주시 서원구 사직대로 109 4층</div>	
				<div>Design by Hy_.min</div>
			</div>	
		</div>
	</div>
</div>
</body>
</html>