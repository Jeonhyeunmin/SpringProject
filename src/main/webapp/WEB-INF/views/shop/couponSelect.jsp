<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  
  <style type="text/css">
  	table {
		  width: 100%;
		  border-collapse: collapse;
		  margin-bottom: 20px;
		}
		
		table th{
			background: #ddd;
  	}
		
		table th, table td {
		  padding: 15px;
		  text-align: center;
		  border: 1px solid #ddd;
		}
		
		
  </style>
</head>
<body>
  <table>
  	<tr>
  		<th>쿠폰명</th>
  		<th>할인 금액</th>
  		<th>쿠폰 기간</th>
  	</tr>
  	<c:forEach var="vo" items="${vos}">
	  	<tr class="couponList" onclick="couponSelect(${vo.idx})">
	  		<td>${vo.couponName}</td>
	  		<td>${vo.discount}${vo.saleUnit}</td>
	  		<td>${fn: substring(vo.startDate, 0, 10)} ~ ${fn: substring(vo.endDate, 0, 10)}</td>
	  	</tr>
  	</c:forEach>
  </table>
</body>
</html>