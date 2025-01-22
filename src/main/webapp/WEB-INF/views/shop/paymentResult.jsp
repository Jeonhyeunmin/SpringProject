<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <style>
  	.container{
  		margin-top: 2%;
  	}
    .order-card {
      border: 1px solid #ddd;
      border-radius: 10px;
      padding: 20px;
      margin-bottom: 20px;
      background-color: #fff;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
      margin: 3% auto !important;
      max-width: 800px;
    }
    .order-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding-bottom: 10px;
      margin-bottom: 15px;
      border-bottom: 1px solid #f1f1f1;
      margin-top: 2%;
    }
    .order-header h5 {
      font-size: 18px;
      margin: 0;
    }
    .order-header button {
      background-color: transparent;
      border: none;
      color: #007bff;
      font-size: 14px;
      cursor: pointer;
    }
    .order-body {
      display: flex;
      gap: 15px;
      align-items: flex-start;
      cursor: pointer;
    }
    .order-thumbnail img {
      width: 100px;
      border-radius: 8px;
    }
    .order-details {
      flex: 1;
      font-size: 14px;
    }
    .order-details p {
      margin: 5px 0;
    }
    .order-details .discount {
      color: #d9534f;
      font-weight: bold;
    }
    .order-details .total-price {
      font-size: 16px;
      font-weight: bold;
      color: #28a745;
    }
    .order-details-table {
      width: 100%;
      font-size: 14px;
      margin-top: 10px;
    }
    .order-details-table th, .order-details-table td {
      text-align: left;
      padding: 5px 10px;
    }
    .order-actions {
      margin-top: 15px;
      display: flex;
      gap: 10px;
    }
    .order-actions button {
      flex: 1;
      padding: 10px;
      border-radius: 5px;
      border: none;
      font-size: 14px;
      cursor: pointer;
    }
    .track-btn {
      background-color: #f8f9fa;
      color: #333;
    }
    .reorder-btn {
      background-color: #e9ecef;
      color: #007bff;
    }
  </style>
</head>
<body>
  <div class="container">
    <h4 class="text-center mt-4" style="font-weight: bold;">주문 내역</h4>
    <c:forEach var="vo" items="${orderVos}">
      <div class="order-card">
        <div class="order-header">
          <h5>${vo.shopTitle}</h5>
          <button>문의하기</button>
        </div>
        <div class="order-body" onclick="location.href='${ctp}/shop/shopContent?idx=${vo.shopIdx}'">
          <div class="order-thumbnail">
            <img src="${ctp}/category/${vo.thumbnail}" alt="상품 이미지">
          </div>
          <div class="order-details">
            <p><strong>구매확정완료</strong></p>
            <p><c:if test="${!empty vo.optionSelect}">[옵션: ${vo.optionSelect}] </c:if>${vo.shopTitle}</p>
            <table class="order-details-table">
            	<c:if test="${vo.discount != 0}">
	              <tr>
	                <th>즉시할인:</th>
	                <td><span class="badge bg-danger" style="font-weight: normal;">${vo.discount}%</span></td>
	              </tr>
              </c:if>
              <c:if test="${vo.couponDiscount != 0}">
	              <tr>
	                <th>쿠폰할인:</th>
	                <td><span class="badge bg-danger" style="font-weight: normal;">${vo.couponDiscount}%</span></td>
	              </tr>
              </c:if>
              <tr>
                <th>할인 금액:</th>
                <td><font color="red"><fmt:formatNumber value="${(vo.price * vo.quantity) - vo.totalPrice}"/>원</font></td>
              </tr>
              <tr>
                <th>단가:</th>
                <td><fmt:formatNumber value="${vo.price}"/>원 × ${vo.quantity}개</td>
              </tr>
              <tr>
                <th>결제 금액:</th>
                <td><fmt:formatNumber value="${vo.pay}"/>원</td>
              </tr>
              <tr>
                <th>적립 예정:</th>
                <td><fmt:formatNumber pattern="#,##0" value="${vo.addPoint}"/>원</td>
              </tr>
              <tr>
                <th>사용 포인트:</th>
                <td><fmt:formatNumber pattern="#,##0" value="${vo.usePoint}"/>원</td>
              </tr>
              <tr>
                <th>총 금액:</th>
                <td class="total-price"><fmt:formatNumber value="${vo.totalPrice}"/>원</td>
              </tr>
            </table>
          </div>
        </div>
        <div class="order-actions">
          <button type="button" class="reorder-btn" onclick="location.href='${ctp}/shop/shopContent?idx=${vo.shopIdx}'">재구매</button>
        </div>
      </div>
    </c:forEach>
  </div>
</body>
</html>
