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
  <style>
  	body{
  		height: 100%; 
  	}
    .list-container {
      margin-top: 2%;
    }
    .table-responsive {
	    overflow-x: auto;
	  }
	  table {
	    white-space: nowrap; /* 줄바꿈 방지 */
	  }
	  table th, table td {
	    text-align: center; /* 중앙 정렬 */
	    vertical-align: middle; /* 세로 가운데 정렬 */
	  }
	  table td {
	    max-width: 200px; /* 열 너비 제한 */
	    overflow: hidden; /* 초과 내용 숨기기 */
	    text-overflow: ellipsis; /* 말줄임표 처리 */
	  }
	  th, td {
	    padding: 8px 12px;
	  }
	  a{
	  	text-decoration: none;
	  }
	  
  </style>
</head>
<body>
	<form name="myform">
	  <div class="list-container">
		  <h4 class="text-start mt-4" style="font-weight: bold;">교환 및 환불 <font color="red" size="2px"> * 담당자는 3일 이내로 구매자에게 연락 부탁 후 처리 부탁드립니다.</font></h4>
		  <div class="table-responsive">
		    <table class="table table-striped table-bordered table-hover">
		      <thead class="thead-dark">
		        <tr>
		          <th>상품명</th>
		          <th>구매자</th>
		          <th>연락처</th>
		          <th>주소</th>
		          <th>수량</th>
		          <th>판매 가격</th>
		          <th>할인 금액</th>
		          <th>결제 금액</th>
		          <th>주문일</th>
		          <th>확정 상태</th>
		          <th>배송 상태</th>
		        </tr>
		      </thead>
		      <tbody>
					  <c:forEach var="vo" items="${orderVOS}" varStatus="status">
					    <tr>
					      <td><a href='${ctp}/partner/orderDetail?idx=${vo.idx}'>${vo.shopTitle}</a></td>
					      <td>${vo.buyerName}</td>
					      <td>${vo.buyerTel}</td>
					      <td>${vo.buyerAddress}</td>
					      <td>${vo.quantity}</td>
					      <td><fmt:formatNumber value="${vo.pay}" />원</td>
					      <td><fmt:formatNumber value="${(vo.price * vo.quantity) - vo.totalPrice}" />원</td>
					      <td class="text-success"><fmt:formatNumber value="${vo.totalPrice}" />원</td>
					      <td>${fn:substring(vo.orderDate, 0, 10)}</td>
					      <td>
					      	<c:if test="${vo.decide == '교환 및 환불'}">
						      	<font color="red">교환 및 환불</font>
						      </c:if>
					      	<c:if test="${vo.decide != '교환 및 환불'}">
					      		${vo.decide == 'no' ? '구매 확정 전' : '구매확정'}
				      		</c:if>
				      	</td>
					      <td>${vo.delivery}</td>
					    </tr>
					  </c:forEach>
					</tbody>
		    </table>
		  </div>
		</div>
	</form>
</body>
</html>
