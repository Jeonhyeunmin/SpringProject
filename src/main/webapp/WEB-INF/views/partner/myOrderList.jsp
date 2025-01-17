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
    .table-responsive {
	    overflow-x: auto;
	  }
	  table {
	    white-space: nowrap; /* 줄바꿈 방지 */
	  }
	  table th, table td {
	    text-align: center; /* 중앙 정렬 */
	    vertical-align: middle !important; /* 세로 가운데 정렬 */
	  }
	  table td {
	    max-width: 200px; /* 열 너비 제한 */
	    overflow: hidden; /* 초과 내용 숨기기 */
	    text-overflow: ellipsis; /* 말줄임표 처리 */
	  }
	  th, td {
	    padding: 8px 12px;
	  }
	  
	  .action-buttons {
	    display: flex;
	    gap: 10px;
	    margin-bottom: 10px;
	    margin-top: 10px;
	  }
	  .action-buttons button {
	    padding: 10px 15px;
	    font-size: 14px;
	    font-weight: bold;
	    border: none;
	    border-radius: 5px;
	    color: white;
	    transition: background-color 0.3s ease, transform 0.2s ease;
	    cursor: pointer;
	  }
	  .action-buttons .btn-delivery-all {
	    background-color: #007bff;
	  }
	  .action-buttons .btn-delivery-all:hover {
	    background-color: #0056b3;
	  }
	  .action-buttons .btn-delivery-selected {
	    background-color: #e35c61;
	  }
	  .action-buttons .btn-delivery-selected:hover {
	    background-color: #ac3f43;
	  }
	  .action-buttons .btn-delivery-finish {
	    background-color: #28a745;
	  }
	  .action-buttons .btn-delivery-finish:hover {
	    background-color: #1e7e34;
	  }
	  .action-buttons .btn-return {
	    background-color: #eec816;
	  }
	  .action-buttons .btn-return:hover {
	    background-color: #ad9836;
	  }
	  .action-buttons .btn-return-all {
	    background-color: #dc3545;
	  }
	  .action-buttons .btn-return-all:hover {
	    background-color: #a71d2a;
	  }
	  .action-buttons button:active {
	    transform: scale(0.95);
	  }
	  
	  .allCheckBox {
      width: 20px;
      height: 20px;
      margin: 0;
      border-radius: 0;
      vertical-align: middle !important;
    }
    
    a{
    	text-decoration: none;
    }
  </style>
  <script type="text/javascript">
	  document.addEventListener("DOMContentLoaded", function () {
			allCheck();
		});
	  
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
  	
  	function deliveryEnd(idx) {
			let ans = confirm("제품을 배송완료로 업데이트 하시겠습니까?");
			if(ans){
				$.ajax({
					type : "post",
					url : "${ctp}/partner/deliveryEnd",
					data : {
						idx : idx
					},
					success: function(res) {
						if(res != "0"){
							alert("제품을 배송완료로 업데이트 했습니다.");
							location.reload();
						}
					},
					error: function() {
						alert("전송오류");
					}
				});
			}
		}
  	
  	function allCheck(){
    	let minIdx = parseInt(document.getElementById("minIdx").value);
      let maxIdx = parseInt(document.getElementById("maxIdx").value);
      if(document.getElementById("allcheck").checked){
        for(let i=minIdx;i<=maxIdx;i++){
          if($("#check"+i).length != 0){
            document.getElementById("check"+i).checked=true;
          }
        }
      }
      else {
        for(let i=minIdx;i<=maxIdx;i++){
          if($("#check"+i).length != 0){
            document.getElementById("check"+i).checked=false;
          }
        }
      }
    }
  	
  	function onCheck() {
      let minIdx = parseInt(document.getElementById("minIdx").value);
      let maxIdx = parseInt(document.getElementById("maxIdx").value);
      
      let emptyCnt=0;
      for(let i=minIdx;i<=maxIdx;i++){
        if($("#check"+i).length != 0 && document.getElementById("check"+i).checked==false){
          emptyCnt++;
          break;
        }
      }
      if(emptyCnt!=0){
        document.getElementById("allcheck").checked=false;
      } 
      else {
        document.getElementById("allcheck").checked=true;
      }
    }
  	
  	function deliveryAll() {
  		let ans = confirm("전체 배송을 시작하시겠습니까?");
  		if(ans){
				$.ajax({
					type:"post",
					url : "${ctp}/partner/deliveryAll",
					success: function(res) {
						if(res != "0"){
							alert(res + "건을 배송 시작으로 업데이트 하였습니다.");
							location.reload();
						}
					},
					error: function() {
						alert("전송오류");
					}
				});
  		}
		}
  	
  	function deliveryFinish() {
  		let ans = confirm("전체 배송완료 하시겠습니까?");
  		if(ans){
				$.ajax({
					type:"post",
					url : "${ctp}/partner/deliveryFinish",
					success: function(res) {
						if(res != "0"){
							alert(res + "건을 배송 완료로 업데이트 하였습니다.");
							location.reload();
						}
					},
					error: function() {
						alert("전송오류");
					}
				});
  		}
		}
  	
  	function delivery() {
  		let idxArr = "";
    	for(let i = 0; i < myform.check.length; i++){
				if(myform.check[i].checked){
					idxArr += myform.check[i].value + "/";
				}
			}
    	idxArr = idxArr.substring(0,idxArr.length-1);
    	
			let ans = confirm("선택된 항목들을 배송처리 하시겠습니까?");
    	
    	if(!ans){
    		return false;
    	}
    	$.ajax({
    		type : "post",
    		url : "${ctp}/partner/selectDelivery",
    		data : {
    			idxArr : idxArr
    		},
    		success: function(res) {
    			if(res != "0"){
	    			alert("배송중 상태로 업데이트 되었습니다.");
						location.reload();
    			}
				},
				error: function() {
					alert("전송오류");
				}
    	});
		}
  </script>
</head>
<body>
	<form name="myform">
	  <div class="list-container">
		  <h4 class="text-start mt-4" style="font-weight: bold;">주문 목록</h4>
		  <div class="action-buttons">
			  <button type="button" onclick="deliveryAll()" class="btn-delivery-all">전체 배송</button>
			  <button type="button" class="btn-delivery-selected" onclick="delivery()">선택 배송</button>
			  <button type="button" class="btn-delivery-finish" onclick="deliveryFinish()">전체 배송 완료</button>
			</div>
		  <p>
		  	<input type="checkbox" id="deliveryReady" ${status != '' ? 'checked' : ''} onclick="location.href='${ctp}/partner/orderList?${status == '' ? 'status=ready' : ''}'"/><label for="deliveryReady" style="padding: 10px;">배송준비 목록 보기</label>
		  </p>
		  <div class="table-responsive">
		    <table class="table table-striped table-bordered table-hover">
		      <thead class="thead-dark">
		        <tr>
		          <th><input type="checkbox" id="allcheck" onclick="allCheck()" class="allCheckBox"></th>
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
		          <th>작업</th>
		        </tr>
		      </thead>
		      <tbody>
					  <c:forEach var="vo" items="${orderVOS}" varStatus="status">
					    <tr>
					      <td>
					        <input type="checkbox" id="check${vo.idx}" name="check" value="${vo.idx}" onClick="onCheck()">
					      </td>
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
					      <td>
					      	<c:if test="${vo.delivery == '배송완료' }">
					      		완료
					        </c:if>
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
					      </td>
					    </tr>
					  </c:forEach>
					</tbody>
		    </table>
		    <c:set var="maxIdx" value="${orderVOS[0].idx}"/>
			  <c:set var="maxSize" value="${fn:length(orderVOS)-1}"/>		
			  <c:set var="minIdx" value="${orderVOS[maxSize].idx}"/>
			  <input type="hidden" id="minIdx" name="minIdx" value="${minIdx}"/>
			  <input type="hidden" id="maxIdx" name="maxIdx" value="${maxIdx}"/>
		  </div>
		</div>
	</form>

</body>
</html>
