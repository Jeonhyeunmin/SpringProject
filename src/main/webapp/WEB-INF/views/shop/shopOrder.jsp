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
  	.order-container {
      margin: 0 15% 0 16.8%;
    }
  	.order-header {
      margin-top: 5%;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 0 45px;
      margin-bottom: 50px;
    }
    .order-header h2 {
      font-size: 30px;
      font-weight: bold;
    }
    
    .step-navigation {
      display: flex;
      align-items: center;
      list-style: none;
      padding: 0;
      margin: 0;
    }
    .step-navigation li {
      display: flex;
      align-items: center;
    }
    .step-navigation li span {
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 24px;
      margin-right: 10px;
    }
    
    .step-navigation li p {
      margin: 0;
      line-height: 1.4;
      font-size: 14px;
      text-align: left;
    }
    .step-navigation li i {
      font-size: 28px;
      color: #aaa;
    }
    .fa-chevron-right {
      padding: 0 20px;
    }
    .order-card {
      margin-bottom: 40px;
      padding: 0 45px;
    }
    
    .order-card h3 {
	    font-size: 20px;
	    font-weight: bold;
	    margin-bottom: 20px;
	    color: #333;
	    border-bottom: 2px solid #ddd;
	    padding-bottom: 10px;
	  }
	  
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
		
		table .couponList:hover{
			background: #eee;
			cursor: pointer;
		}
		
		
		table img {
		  border-radius: 4px;
		}
		
		button {
		  border-radius: 4px;
		}
		
		@media (max-width: 768px) {
		  table td {
		    font-size: 14px;
		  }
		
		  table img {
		    width: 60px;
		  }
		}

    .discount-section {
		  display: flex;
		  justify-content: space-between;
		  gap: 15px;
		}
		
		.discount-left .row,
		.discount-right .row {
		  display: flex;
		  align-items: center;
		  justify-content: space-between;
		  border-bottom: 1px solid #eee;
		  padding: 10px 0;
		}
		
		.discount-left .row:last-child,
		.discount-right .row:last-child {
		  border-bottom: none;
		}
		
		.discount-right {
		  flex: 0.5; /* 왼쪽 영역 대비 비율을 조정 */
		  background-color: #f8f9fa;
		  padding: 15px; /* 패딩을 약간 줄임 */
		  border: 1px solid #ddd;
		  border-radius: 8px;
		}
		
		.discount-left {
		  flex: 1.5; /* 왼쪽 영역 비율을 상대적으로 키움 */
		}
		
		.discount-right .total-row {
		  display: flex;
		  align-items: center;
		  justify-content: space-between;
		  border: none;
		  padding: 0;
		}
		
		.discount-right .label {
		  font-size: 16px;
		  font-weight: bold;
		  color: #555;
		}
		
		.discount-right .value {
		  font-size: 24px;
		  font-weight: bold;
		  color: #d9534f;
		  text-align: right;
		}
		
		.discount-right .horizontal-line {
		  border-top: 2px dashed #ddd;
		  margin: 15px 0;
		}
		
		.discount-right .total-text {
		  text-align: center;
		  font-size: 18px;
		  font-weight: bold;
		  color: #333;
		}
	
	  .discount-section .row {
	    display: flex;
	    align-items: center;
	    justify-content: space-between;
	    border-bottom: 1px solid #eee;
	    padding: 10px 0;
	  }
	
	  .discount-section .row:last-child {
	    border-bottom: none;
	  }
	
	  .discount-section .label {
	    font-size: 14px;
	    color: #666;
	  }
	
	  .discount-section .value {
	    font-size: 16px;
	    font-weight: bold;
	    color: #333;
	  }
	
	  .discount-section .info {
	    font-size: 12px;
	    color: #aaa;
	    margin-left: 5px;
	  }
	
	  /* 결제 수단 섹션 */
	  .payment-options {
	    display: flex;
	    gap: 15px;
	    margin-top: 15px;
	  }
	
	  .payment-options button {
	    flex: 1;
	    padding: 15px;
	    font-size: 14px;
	    font-weight: bold;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    background-color: #f9f9f9;
	    cursor: pointer;
	    transition: all 0.3s ease;
	  }
	
	  .payment-options button:hover {
	    background-color: #eee;
	  }
	
	  .summary {
	    text-align: right;
	    padding: 15px;
	    margin-top: 20px;
	    border: 1px solid #ddd;
	    background-color: #fafafa;
	    border-radius: 5px;
	    font-size: 16px;
	    font-weight: bold;
	    color: #333;
	  }
	
	  .summary strong {
	    color: #d9534f;
	    font-size: 18px;
	  }
    .changeAddress{
    	margin-left: 10px;
    	background-color: #3b3e43;
    	padding: 2px;
    	color: white;
    	font-weight: bold;
    }
    
    .couponSelectForm {
		  position: fixed;
		  bottom: -100%; /* 초기 위치: 화면 아래 */
		  left: 50%;
		  transform: translateX(-50%);
		  width: 100%;
		  max-width: 500px;
		  background: #fff;
		  border-radius: 15px;
		  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
		  padding: 20px;
		  z-index: 1000;
		  transition: bottom 0.5s ease-in-out, opacity 0.3s ease-in-out;
		  opacity: 0;
		}
		
		/* 수정 폼 활성화 */
		.couponSelectForm.show {
		  bottom: 40%; /* 화면에 보이도록 */
		  opacity: 1;
		}
		
		.modal-overlay {
		  position: fixed;
		  top: 0;
		  left: 0;
		  width: 100%;
		  height: 100%;
		  background: rgba(0, 0, 0, 0.6); /* 반투명 배경 */
		  display: none; /* 기본적으로 숨김 */
		  opacity: 0;
		  z-index: 999;
		  transition: opacity 0.3s ease-in-out;
		}
		
		/* 모달 활성화 */
		.modal-overlay.show {
		  display: block;
		  opacity: 1;
		}
		
		.point-section {
		  display: flex;
		  flex-direction: column;
		  align-items: center;
		  gap: 10px;
		}
		
		.point-info {
		  font-size: 14px;
		  color: #555;
		  font-weight: bold;
		}
		
		.point-info strong {
		  color: #d9534f;
		  font-size: 16px;
		}
		
		.point-actions {
		  display: flex;
		  align-items: center;
		  gap: 10px;
		}
		
		.point-actions input {
		  width: 150px;
		  padding: 8px;
		  font-size: 14px;
		  border: 1px solid #ddd;
		  border-radius: 4px;
		}
		
		.point-actions input:focus {
		  border-color: #d9534f;
		  outline: none;
		  box-shadow: 0 0 5px rgba(217, 83, 79, 0.5);
		}
		
		.point-actions .btn-use-all {
		  background-color: #d9534f;
		  color: white;
		  padding: 8px 12px;
		  font-size: 14px;
		  font-weight: bold;
		  border: none;
		  border-radius: 4px;
		  cursor: pointer;
		  transition: background-color 0.3s ease;
		}
		
		.point-actions .btn-use-all:hover {
		  background-color: #c9302c;
		}
				
    
  </style>
  
  <script type="text/javascript">
  	document.addEventListener("DOMContentLoaded", function () {
  		calculateDiscounts();
  		
  		
  		const pointInput = document.querySelector(".point-actions input");
	    pointInput.addEventListener("input", calculateDiscounts);
		});

  	
  	function selectCoupon() {
  	  $.ajax({
  	    type: "get",
  	    url: "${ctp}/shop/couponSelect",
  	    success: function (res) {
  	      const overlay = document.getElementById("modalOverlay");
  	      const updateForm = document.getElementById("couponSelectForm");

  	      updateForm.innerHTML = res;

  	      // 모달 활성화
  	      overlay.classList.add("show");
  	      updateForm.classList.add("show");
  	    },
  	    error: function () {
  	      alert("전송오류");
  	    },
  	  });
  	}

  	// 폼 닫기
  	function closeCouponSelectForm() {
  	  const overlay = document.getElementById("modalOverlay");
  	  const updateForm = document.getElementById("couponSelectForm");

  	  overlay.classList.remove("show");
  	  updateForm.classList.remove("show");
  	}
  	
	  function pwd1Check() {
	    let pwd1 = document.getElementById("pwd").value.trim();
	    let pwd2 = document.getElementById("pwd2").value.trim();
	    
	    document.getElementById("pwdError").innerHTML = "";
	    // 비밀번호 확인
	    if (!regex2.test(pwd1)) {
	      document.getElementById("pwdError").innerHTML = "비밀번호가 올바르지 않습니다.(영어/숫자 필수, 특수문자 가능 4~20자)";
	    } else if (pwd1 !== pwd2) {
	      document.getElementById("pwdError").innerHTML = "비밀번호가 동일하지 않습니다.";
	    } else {
	      document.getElementById("pwdError").innerHTML = "";
	    }
	  }
	  
	  function couponSelect(idx, index) {
			$.ajax({
				type:"post",
				url:"${ctp}/shop/couponSearch",
				data: {
					idx : idx
				},
				success: function(res) {
					
					let str = '';
					str += '<div>' + res.couponName + '</div>';
					str += '<div class="couponDiscount">' + res.discount + res.saleUnit + '</div>';
					$(".coupon").html(str);
					$("#couponIdx").val(res.idx);
					closeCouponSelectForm();
					calculateDiscounts();
				},
				error: function() {
					alert("전송 오류");
				}
			});
		}
	  
	  function calculateDiscounts() {
	    const itemPrices = document.querySelectorAll(".itemPrice");
	    let totalSum = 0;

	    // 총 상품 금액 계산
	    itemPrices.forEach((item) => {
	        const price = parseFloat(item.textContent.replace(/,/g, ""));
	        totalSum += price;
	    });

	    document.querySelector(".totalPrice").textContent = totalSum.toLocaleString() + "원";

	    // 즉시 할인 금액 계산
	    const itemDiscounts = document.querySelectorAll(".itemDiscount");
	    let totalDiscountSum = 0;

	    itemDiscounts.forEach((item) => {
	        const discount = parseFloat(item.getAttribute("data-discount")) || 0;
	        const price = parseFloat(item.getAttribute("data-price")) || 0;
	        const quantity = parseInt(item.getAttribute("data-quantity")) || 0;
					
	        const discountAmount = price * (discount / 100) * quantity;
	        totalDiscountSum += discountAmount;
	    });
	    document.querySelector(".totalDiscount").innerHTML = '-' + totalDiscountSum.toLocaleString() + '원';
	    // 쿠폰 할인 금액 계산
	    const couponElement = document.querySelector(".couponDiscount");
	    const couponText = couponElement ? couponElement.textContent.trim() : "";
	    let couponDiscountAmount = 0;

	    if (couponText.includes('%')) {
	        const couponDiscountPercent = parseFloat(couponText.replace('%', ""));
	        couponDiscountAmount = (totalSum * couponDiscountPercent) / 100;
	    } else if (couponText.includes('원')) {
	        const couponDiscountFixed = parseFloat(couponText.replace(/원|,/g, ""));
	        couponDiscountAmount = couponDiscountFixed;
	    }

	    document.querySelector(".totalCouponDiscount").textContent = '-' + couponDiscountAmount.toLocaleString() + '원';

	    const pointInput = document.querySelector(".point-actions input");
	    let usedPoints = parseFloat(pointInput.value) || 0;
	    const availablePoints = parseFloat(document.querySelector(".point-info strong").textContent.replace(/[^\d]/g, "")) || 0;

	    if (usedPoints > availablePoints) {
	        usedPoints = availablePoints;
	        pointInput.value = availablePoints; // 초과 입력 시 보유 포인트로 수정
	    }

	    document.querySelector(".discount-right .total-row:nth-child(3) .value").textContent = '-' + usedPoints.toLocaleString() + "원";

	    // 총 할인 금액 합산 및 표시
	    const grandTotalDiscount = totalDiscountSum + couponDiscountAmount;
	    document.querySelector(".discount-right .total-row:nth-child(2) .value").textContent = '-' + grandTotalDiscount.toLocaleString() + '원';

	    // 최종 결제 금액 계산
	    const finalPayment = totalSum - grandTotalDiscount - usedPoints;
	    document.querySelector(".discount-right .total-row:last-child .value").textContent = finalPayment.toLocaleString() + '원';

	    const pointEarned = Math.floor(finalPayment * 0.005);
	    document.querySelector(".pointAdd").textContent = pointEarned.toLocaleString() + "원 적립 예정";
			
	    
	    // 사용 포인트와 적립 예정 포인트를 hidden input에 설정
	    document.getElementById("usePoint").value = Number(usedPoints);
	    document.getElementById("addPoint").value = Number(pointEarned);
	    
		}


	  function pointAll() {
	    const availablePoints = parseFloat(document.querySelector(".point-info strong").textContent.replace(/[^\d]/g, "")) || 0;
	    const pointInput = document.querySelector("#point");
	    pointInput.value = availablePoints;
	    calculateDiscounts();
		}
	  
	  function order() {
		  if("${memberVO.address}" == null || "${memberVO.address}" == ""){
			  alert("주소 수정 후 결제를 진행해주세요.");
			  return false;
		  }
		  
			let ans = confirm("결제하시겠습니까?");
			if(ans){
				orderForm.submit();
			}
		}
  </script>
</head>
<body>
	<div class="order-container">
		<form name="orderForm" method="post" action="${ctp}/shop/payment">
			<div class="order-header">
			  <h2>주문서 작성</h2>
			  <ul class="step-navigation">
			    <li>
			      <span><i class="fa-solid fa-lock"></i></span>
			      <div>
			        <p>STEP 01</p>
			        <p>장바구니</p>
			      </div>
			    </li>
			    <li style="font-weight: bold;">
			      <i class="fa-solid fa-chevron-right"></i>
			      <span><i class="fa-solid fa-file-lines"></i></span>
			      <div>
			        <p>STEP 02</p>
			        <p>주문서작성</p>
			      </div>
			    </li>
			    <li>
			      <i class="fa-solid fa-chevron-right"></i>
			      <span><i class="fa-solid fa-check"></i></span>
			      <div>
			        <p>STEP 03</p>
			        <p>주문완료</p>
			      </div>
			    </li>
			  </ul>
			</div>
			<div class="order-card">
	      <h3>주문 고객</h3>
	      <table>
	        <tr>
	          <th>이름</th>
	          <td>${memberVO.name}</td>
	          <th>전화번호</th>
	          <td>${memberVO.tel}</td>
	          <th>이메일</th>
	          <td>${memberVO.email}</td>
	        </tr>
	      </table>
	    </div>
			<div class="order-card">
	      <h3>배송지 정보</h3>
	      <table>
	        <tr>
	          <th>배송지</th>
	          <c:if test="${empty memberVO.address}">
	          	<td>
		          	배송지를 입력해주세요.
		          	<button type="button" onclick="location.href='${ctp}/common/myPage'" class="changeAddress">입력하러가기</button>
	          	</td>
	          </c:if>
	          <c:if test="${!empty memberVO.address}">
	          	<td>${memberVO.address}</td>
	          </c:if>
	        </tr>
	      </table>
	    </div>
			<div class="order-card">
			  <h3>주문 상품</h3>
			  <table>
			    <thead>
			      <tr>
			        <th style="background-color: #eee !important;">상품정보/옵션정보</th>
			        <th style="background-color: #eee !important;">수량</th>
			        <th style="background-color: #eee !important;">상품금액</th>
			        <th style="background-color: #eee !important;">배송정보</th>
			      </tr>
			    </thead>
			    <tbody>
			      <c:forEach var="vo" items="${vos}" varStatus="st">
			        <tr>
			          <!-- 상품 정보 -->
			          <td style="text-align: left;">
			            <div style="display: flex; align-items: center;">
			              <img src="${ctp}/category/${vo.thumbnail}" alt="${vo.shopTitle}" width="80" style="margin-right: 10px; border: 1px solid #ddd;"/>
			              <div>
			                <p style="font-weight: bold; margin: 0;">${vo.shopTitle}</p><c:if test="${vo.discount != 0}"><span class="badge bg-danger">${vo.discount}% 할인</span></c:if>
			                <p style="color: #666; font-size: 12px; margin: 5px 0;"><c:if test="${!empty vo.optionSelect}">옵션: ${vo.optionSelect}</c:if></p>
			              </div>
			            </div>
			          </td>
			          <td>${vo.quantity}개</td>
			          <td>
			          	<span class="itemPrice">
			            	<fmt:formatNumber value="${vo.price * vo.quantity}" pattern="#,##0"/>원
			            </span>
			            <input type="hidden" class="itemDiscount" data-discount="${vo.discount}" data-price="${vo.price}" data-quantity="${vo.quantity}">
			          </td>
			          <td>
			            묶음배송<br>
			            <span>무료배송</span>
			          </td>
			        </tr>
			      </c:forEach>
			    </tbody>
			  </table>
			</div>
			<div class="order-card">
	      <h3>쿠폰 사용</h3>
	      <table>
	        <tr>
	          <th>쿠폰</th>
	        	<td>
	        		<div class="coupon">쿠폰을 선택해주세요.</div>
	        	</td>
	        	<td>
	          	<button type="button" style="margin-top: 5px; padding: 5px 10px; font-size: 12px; background-color: #f5f5f5; border: 1px solid #ddd; cursor: pointer;" onclick="selectCoupon()">
	              쿠폰 변경
	            </button>
	          </td>
	        </tr>
	      </table>
	    </div>
	    <div class="order-card">
			  <h3>할인 및 적립</h3>
			  <div class="discount-section">
			    <!-- 왼쪽 영역 -->
			    <div class="discount-left">
			      <div class="row">
			        <span class="label">즉시할인</span>
			        <div class="value totalDiscount" style="text-align: center; flex: 1;">0원</div>
			      </div>
			      <div class="row">
						  <span class="label">Min's.Point</span>
						  <div class="value point-section">
						    <div class="point-info">
						      <span>보유 포인트: <strong>${memberVO.point}P</strong></span>
						    </div>
						    <div class="point-actions">
						      <input type="number" id="point" placeholder="사용 포인트 입력" />
						      <button type="button" class="btn-use-all" onclick="pointAll()">전액사용</button>
						    </div>
						  </div>
						</div>
			      <div class="row">
			        <span class="label">쿠폰 적용 금액</span>
			        <div class="value totalCouponDiscount" style="text-align: center; flex: 1;">0원</div>
			      </div>
			      <div class="row">
			        <span class="label">Min's 포인트 적립</span>
			        <span class="label">결제금액의 0.5% 적립 예정</span>
			        <div class="value pointAdd" style="text-align: center; flex: 1;">0원 적립 예정</div>
			      </div>
			    </div>
			
			    <!-- 오른쪽 영역 -->
			    <div class="discount-right">
	  				<div class="row total-row">
					    <span class="label">주문금액</span>
					    <div class="value totalPrice"></div>
					  </div>
					  <div class="row total-row totalDiscount">
					    <span class="label">할인</span>
					    <div class="value">-0원</div>
					  </div>
					  <div class="row total-row">
					    <span class="label">포인트 사용</span>
					    <div class="value">-0원</div>
					  </div>
					  <div class="horizontal-line"></div>
					  <div class="row total-row">
					    <span class="label total-text">결제금액</span>
					    <div class="value"></div>
					  </div>
					</div>
			  </div>
			</div>
	
			<div class="order-card">
			  <h3>결제 수단</h3>
			  <div class="payment-options">
			    <button type="button" style="background-color: #e35c61; color: white; font-size: 25px;" onclick="order()">결제하기</button>
			  </div>
			</div>
			<c:set var="addr" value="${fn:split(memberVO.address,'/')}"/>
			<input type="hidden" name="name" value="${vos[0].shopTitle}">
			<input type="hidden" name="amount" value="10">
			<input type="hidden" name="buyer_email" value="${memberVO.email}">
			<input type="hidden" name="buyer_name" value="${memberVO.name}">
			<input type="hidden" name="buyer_tel" value="${memberVO.tel}">
			<input type="hidden" name="buyer_addr" value="${addr[1]} ${addr[2]} ${addr[3]}">
			<input type="hidden" name="buyer_postcode" value="${addr[0]}">
			<input type="hidden" name="addPoint" id="addPoint">
			<input type="hidden" name="usePoint" id="usePoint">
			<input type="hidden" name="couponIdx" id="couponIdx">
		</form>
  </div>
  <div id="modalOverlay" class="modal-overlay" onclick="closeCouponSelectForm()"></div>
		<div id="couponSelectForm" class="couponSelectForm">
	</div>
</body>
</html>