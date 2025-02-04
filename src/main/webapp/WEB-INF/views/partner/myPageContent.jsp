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
  <style type="text/css">
  	@font-face { /*눈누 기초고딕 - 두꺼운 네모 딱딱 고딕*/
	    font-family: 'NoonnuBasicGothicRegular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
		}
		.content{
	  	font-family: 'NoonnuBasicGothicRegular';
		}
	  .table-wrapper {
	    overflow-x: auto;
	    margin-top: 20px;
	    border: 1px solid #e1e1e1;
	    border-radius: 8px;
	    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	  }
	  table {
	    width: 100%;
	    border-collapse: collapse;
	    font-size: 14px;
	    text-align: center;
	  }
	  table th, table td {
	    padding: 12px 10px;
	    border: 1px solid #e1e1e1;
	  }
	  table th {
	    background: #f8f9fa;
	    font-weight: bold;
	    color: #333;
	    position: sticky;
	    top: 0;
	    z-index: 1;
	  }
	  table tr:nth-child(even) {
	    background: #f9f9f9;
	  }
	  table tr:nth-child(odd) {
	    background: #ffffff;
	  }
	  table tr:hover {
	    background: #e1c699;
	    color: #fff;
	    transition: background 0.3s;
	  }
	  .btn-confirm {
	    padding: 6px 12px;
	    background: #e1c699;
	    border: none;
	    border-radius: 4px;
	    color: #fff;
	    font-size: 12px;
	    cursor: pointer;
	    transition: background 0.3s ease;
	  }
	  .btn-confirm:hover {
	    background: #d1b586;
	  }
	  .btn-confirm:hover {
	    background: #d1b586;
	  }
    .status-section {
      margin-bottom: 30px;
    }
    .status-section h3 {
      font-size: 20px;
      font-weight: bold;
      margin-bottom: 15px;
      border-bottom: 2px solid #f0f0f0;
      padding-bottom: 10px;
    }
    .status-list {
      display: flex;
      justify-content: space-between;
      gap: 10px;
    }
    .status-item {
      flex: 1;
      background: #fff;
      border: 1px solid #e1e1e1;
      border-radius: 8px;
      padding: 20px;
      text-align: center;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
      transition: transform 0.2s, background 0.3s, color 0.3s;
      cursor: pointer;
    }
    .status-item:hover {
      transform: translateY(-3px);
      background: #e1c699;
      color: #fff;
    }
    .status-item i {
      font-size: 24px;
      margin-bottom: 10px;
    }
    .status-item span {
      display: block;
      font-size: 14px;
    }

    .recent-orders h3, .faq h3 {
      font-size: 18px;
      margin-bottom: 15px;
    }
    .recent-orders ul, .faq ul {
      list-style: none;
      padding: 0;
      margin: 0;
    }
    .recent-orders li, .faq li {
      padding: 10px 0;
      border-bottom: 1px solid #e1e1e1;
    }
    .recent-orders li:last-child, .faq li:last-child {
      border-bottom: none;
    }
    .recent-orders li a, .faq li a {
      text-decoration: none;
      color: #333;
      transition: color 0.3s ease;
    }
    .recent-orders li a:hover, .faq li a:hover {
      color: #e1c699;
    }
    
    /* 기존 스타일에 추가 */
		.table-wrapper table td, 
		.table-wrapper table th {
		  text-overflow: ellipsis;
		  overflow: hidden;
		  white-space: nowrap;
		}
		
		/* 특정 열에만 적용하려면 예: 상품명 열 */
		.table-wrapper table td:nth-child(4) {
		  max-width: 150px; /* 셀의 최대 너비 설정 */
		  text-overflow: ellipsis;
		  overflow: hidden;
		  white-space: nowrap;
		}
		
		.reviewButton{
			padding: 10px 20px;
			background-color: #eee;
			border: 1px solid #ddd;
			border-radius: 5px;
			width: 90%;
		}
		
		.reviewButton:hover{
			background-color: white;
		}
  </style>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
  <div class="content">
    <div class="status-section">
      <h3>주문 현황</h3>
      <div class="status-list">
        <div class="status-item" onclick="location.href='${ctp}/partner/orderList'">
          <i class="fa-solid fa-shopping-cart"></i>
          <span>주문 ${fn: length(orderVOS)}건</span>
        </div>
        <div class="status-item" onclick="location.href='${ctp}/partner/exchange'">
          <i class="fa-solid fa-undo"></i>
          <span>교환 및 환불 ${exchage}건</span>
        </div>
        <div class="status-item" onclick="location.href='${ctp}/partner/claimPost'">
          <i class="fa-solid fa-exclamation-triangle"></i>
          <span>신고글 ${claim}건</span>
        </div>
      </div>
    </div>
    <div class="recent-orders">
      <h3 style="font-weight: bold;">리뷰가 달린 게시물</h3>
      <%-- <c:if test="${empty orderVOS}"> --%>
      <p>최근 리뷰가 달린 게시물이 없습니다.</p>
      <%-- </c:if> --%>
      <%-- <c:if test="${!empty orderVOS}">
		    <div class="table-wrapper">
				  <table>
				    <thead>
				      <tr>
				        <th>구매자</th>
				        <th>주소</th>
				        <th>연락처</th>
				        <th>상품명</th>
				        <th>수량</th>
				        <th>쿠폰</th>
				        <th>쿠폰 할인율</th>
				        <th>금액</th>
				        <th>적립 포인트</th>
				        <th>사용 포인트</th>
				        <th>구매날짜</th>
				      </tr>
				    </thead>
				    <tbody>
				      <c:forEach var="orderVO" items="${orderVOS}" varStatus="st">
					      <c:if test="${st.index >= 3}">
					        <c:set var="stop" value="true" />
						    </c:if>
						    <c:if test="${stop != true}">
				        <tr onclick="window.open('${ctp}/shop/shopContent?idx=${orderVO.shopIdx}')">
				          <td>${orderVO.buyerName}</td>
				          <td>${fn: replace(orderVO.buyerAddress, '/', '')}</td>
				          <td>${orderVO.buyerTel}</td>
				          <td>${orderVO.shopTitle}</td>
				          <td>${orderVO.quantity}개</td>
				          <c:if test="${empty orderVO.coupon}">
				          	<td>X</td>
				          </c:if>
				          <c:if test="${!empty orderVO.coupon}">
				          	<td>${orderVO.coupon}</td>
				          </c:if>
				          <c:if test="${empty orderVO.coupon}">
				          	<td>X</td>
				          </c:if>
				          <c:if test="${!empty orderVO.coupon}">
				          	<td>${orderVO.couponDiscount}%</td>
				          </c:if>
				          <td><fmt:formatNumber pattern="#,##0" value="${orderVO.totalPrice}"/>원</td>
				          <td>${orderVO.addPoint}원 사용</td>
				          <td>${orderVO.usePoint}원 적립</td>
				          <td>${fn: substring(orderVO.orderDate, 0, 10)}</td>
				        </tr>
			          <c:if test="${orderVO.review == 'no'}">
				          <tr>
				          	<td colspan="14"><button type="button" class="reviewButton" onclick="location.href='${ctp}/shop/shopReview?idx=${orderVO.shopIdx}'">리뷰쓰러 가기</button></td>
			          	</tr>
			          </c:if>
			          </c:if>
				      </c:forEach>
				    </tbody>
				  </table>
				</div>
			</c:if> --%>
		</div>
  </div>
</body>
</html>