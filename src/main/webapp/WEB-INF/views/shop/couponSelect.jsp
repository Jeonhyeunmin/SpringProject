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
  	@font-face { /*눈누 기초고딕 - 두꺼운 네모 딱딱 고딕*/
	    font-family: 'NoonnuBasicGothicRegular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
		}
		
  	.couponTable {
		  width: 100%;
		  border-collapse: collapse;
		  margin-bottom: 20px;
		  font-family: 'NoonnuBasicGothicRegular';
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
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
  <table class="couponTable">
  	<tr>
  		<th>쿠폰명</th>
  		<th>할인 금액</th>
  		<th>쿠폰 기간</th>
  	</tr>
  	<c:if test="${empty vos}">
  		<tr>
  			<td colspan="3">보유하신 쿠폰이 없습니다.</td>
  		</tr>
  	</c:if>
  	<c:if test="${!empty vos}">
	  	<c:forEach var="vo" items="${vos}">
		  	<tr class="couponList" onclick="couponSelect(${vo.idx})">
			  		<td>${vo.couponName}</td>
			  		<td>${vo.discount}${vo.saleUnit}</td>
			  		<td>${fn: substring(vo.startDate, 0, 10)} ~ ${fn: substring(vo.endDate, 0, 10)}</td>
		  	</tr>
	  	</c:forEach>
  	</c:if>
  </table>
</body>
</html>