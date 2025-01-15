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
    .order-card {
      border: 1px solid #ddd;
      border-radius: 10px;
      padding: 20px;
      background-color: #fff;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
      margin: 1% auto;
      max-width: 800px;
    }
    .order-card:hover {
      box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2);
    }
    .order-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding-bottom: 10px;
      margin-bottom: 15px;
      border-bottom: 1px solid #eaeaea;
    }
    .order-header h5 {
      font-size: 18px;
      font-weight: bold;
      margin: 0;
    }
    .order-body {
      display: flex;
      flex-direction: column;
      gap: 15px;
      align-items: flex-start;
      cursor: pointer;
    }
    .order-thumbnail img {
      width: 120px;
      height: auto;
      border-radius: 10px;
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
      font-size: 18px;
      font-weight: bold;
      color: #28a745;
    }
    .order-details-table {
      width: 100%;
      font-size: 14px;
      margin-top: 10px;
      border-collapse: collapse;
    }
    .order-details-table th, .order-details-table td {
      padding: 5px 10px;
    }
    .order-details-table th {
      text-align: left;
      color: #6c757d;
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
      font-weight: bold;
      transition: all 0.3s ease;
      cursor: pointer;
    }
    .track-btn {
      background-color: #007bff;
      color: white;
    }
    .track-btn:hover {
      background-color: #0056b3;
    }
    .reorder-btn {
      background-color: #28a745;
      color: white;
    }
    .reorder-btn:hover {
      background-color: #1e7e34;
    }
    @media (max-width: 768px) {
      .order-body {
        flex-direction: column;
        align-items: center;
      }
      .order-thumbnail img {
        width: 100px;
      }
    }
    .review-btn{
    	background-color: #e1c699;
    }
  </style>
  <script type="text/javascript">
  	function buyDecide(idx) {
			let ans = confirm("구매확정 하시겠습니까?");
			if(ans){
				$.ajax({
					type:"post",
					url:"${ctp}/member/buyDecide",
					data: {
						idx : idx
					},
					success: function(res) {
						if(res != "0"){
							alert("구매 확정이 완료되었습니다.");
							location.reload();
						}
					},
					error: function() {
						alert("전송 오류");
					}
				});
			}
		}
  	
  	function exchange(idx) {
			let ans = confirm("교환 및 환불처리 하시겠습니까?");
			if(ans){
				$.ajax({
					type:"post",
					url:"${ctp}/member/orderExchange",
					data : {
						idx : idx
					},
					success: function(res) {
						if(res != "0"){
							alert("영업일 기준 3일 내에 담당자에게 연락이 갈 예정입니다.");
							location.reload();
						}
					},
					error: function() {
						alert("전송오류");
					}
				});
			}
			
		}
  </script>
</head>
<body>
  <div class="container">
    <h3 class="text-start mt-4" style="font-weight: bold;">주문 내역</h3>
    <c:forEach var="vo" items="${orderVOS}">
      <div class="order-card">
        <div class="order-header">
          <h5>${vo.company}</h5>
          <c:if test="${vo.decide != '교환 및 환불'}"><a href='javascript:exchange(${vo.idx})' style="text-decoration: none;" class="badge bg-danger">교환 및 환불</a></c:if>
        </div>
        <div class="order-body" onclick="window.open('${ctp}/shop/shopContent?idx=${vo.shopIdx}')">
          <div class="order-thumbnail">
            <img src="${ctp}/category/${vo.thumbnail}" alt="상품 이미지">
          </div>
          <div class="order-details">
            <p><strong>${vo.decide == 'no' ? '구매 확정 전' : vo.decide}</strong></p>
            <p><c:if test="${!empty vo.optionSelect}">[옵션: ${vo.optionSelect}] </c:if>${vo.shopTitle}</p>
            <table class="order-details-table">
              <tr>
                <th>수량:</th>
                <td>${vo.quantity}개</td>
              </tr>
              <tr>
                <th>총 금액:</th>
                <td class="total-price"><fmt:formatNumber value="${vo.totalPrice}"/>원</td>
              </tr>
              <tr>
                <th>현황:</th>
                <td>${vo.delivery}</td>
              </tr>
            </table>
          </div>
        </div>
        <div class="order-actions">
          <c:if test="${vo.decide == 'no'}"><button type="button" onclick="buyDecide(${vo.idx})" class="track-btn">구매확정</button></c:if>
          <button type="button" class="reorder-btn" onclick="window.open('${ctp}/shop/shopContent?idx=${vo.shopIdx}')"><i class="fas fa-redo"></i> 재구매</button>
          <c:if test="${vo.review == 'no' && vo.decide != '교환 및 환불'}">
          	<button type="button" class="review-btn" onclick="location.href='${ctp}/shop/shopReview?idx=${vo.shopIdx}'">리뷰쓰기</button>
          </c:if>
        </div>
      </div>
    </c:forEach>
  </div>
</body>
</html>
