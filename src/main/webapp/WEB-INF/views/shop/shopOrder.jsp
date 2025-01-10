<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
</head>
<body>
<div style="height: 200px;"></div>
  <c:forEach var="vo" items="${vos}">
  	${vo.shopIdx}
  	${vo.mid}
  	${vo.shopTitle}
  	${vo.price}
  	${vo.quantity}
  	${vo.couponIdx}
  	${vo.coupon}
  	${vo.couponDiscount}
  	${vo.discount}
  	${vo.totalPrice}
  	${vo.thumbnail}
  	${vo.optionSelect}
  	<br>
  </c:forEach>
</body>
</html>