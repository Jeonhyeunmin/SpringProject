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
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <style>
  	@font-face { /*눈누 기초고딕 - 두꺼운 네모 딱딱 고딕*/
	    font-family: 'NoonnuBasicGothicRegular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
		}
    .container {
    	font-family: 'NoonnuBasicGothicRegular';
      margin-top: 2%;
    }
    .order-card {
      border: 1px solid #ddd;
      border-radius: 10px;
      padding: 20px;
      margin-bottom: 20px;
      background-color: #f9f9f9;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
      transition: all 0.3s ease;
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
  </style>
  <script type="text/javascript">
  	function deliveryStart(idx) {
			let ans = confirm("제품을 배송중으로 업데이트 하시겠습니까?");
			if(ans){
				$.ajax({
					type : "post",
					url : "${ctp}/partner/deliveryStart",
					data : {
						idx : idx
					},
					success: function(res) {
						if(res != "0"){
							alert("제품을 배송중으로 업데이트 했습니다.");
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
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
  <div class="container">
    <h4 class="text-start mt-4" style="font-weight: bold;">주문 목록</h4>
    <div class="order-card">
      <div class="order-header">
        <h5>${vo.shopTitle}</h5>
        <i class="fas fa-check-circle text-success"></i>
      </div>
      <div class="order-body">
        <div class="order-thumbnail">
          <img src="${ctp}/category/${vo.thumbnail}" alt="상품 이미지">
        </div>
        <div class="order-details">
          <p><strong>${vo.decide == 'no' ? '구매 확정 전' : vo.decide} / ${vo.delivery}</strong></p>
          <p><c:if test="${!empty vo.optionSelect}">[옵션: ${vo.optionSelect}] </c:if>${vo.shopTitle}</p>
          <table class="order-details-table">
            <tr>
              <th>구매자:</th>
              <td>${vo.buyerName}</td>
            </tr>
            <tr>
              <th>구매자 이메일:</th>
              <td>${vo.buyerEmail}</td>
            </tr>
            <tr>
              <th>구매자 연락처:</th>
              <td>${vo.buyerTel}</td>
            </tr>
            <tr>
              <th>구매자 주소:</th>
              <td>${vo.buyerAddress}</td>
            </tr>
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
              <th>사용 포인트:</th>
              <td><fmt:formatNumber pattern="#,##0" value="${vo.usePoint}"/>원</td>
            </tr>
            <tr>
              <th>총 금액:</th>
              <td class="total-price"><fmt:formatNumber value="${vo.totalPrice}"/>원</td>
            </tr>
            <tr>
              <th>정산현황:</th>
              <td>${vo.adjustment == 'NO' ? '미정산' : '정산완료'}</td>
            </tr>
          </table>
        </div>
      </div>
      <div class="order-actions">
    		<button type="button" class="btn btn-secondary btn-sm" onclick="history.back()">목록으로 돌아가기</button>
      	<c:if test="${vo.delivery == '배송중' }">
	        <button type="button" class="btn btn-success btn-sm" onclick="deliveryEnd(${vo.idx})">
	          <i class="fas fa-truck"></i> 배송완료
	        </button>
        </c:if>
      	<c:if test="${vo.delivery == '배송준비' }">
	        <button type="button" class="btn btn-primary btn-sm" onclick="deliveryStart(${vo.idx})">
	          <i class="fas fa-truck"></i> 배송 시작
	        </button>
        </c:if>
      </div>
    </div>
  </div>
</body>
</html>  