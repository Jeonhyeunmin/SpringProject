<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    .cart-container {
    	font-family: 'NoonnuBasicGothicRegular';
      margin: 0 auto;
      max-width: 1180px;
    }
    
    .cart-body {
      margin-top: 30px;
      display: flex;
      gap: 30px;
    }

    .cart-list {
      flex: 2;
    }
    
    .cart-header {
      margin-top: 4%;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .cart-header h2 {
      font-size: 30px;
      font-weight: bold;
    }
    
    .cart-item {
      display: flex;
      align-items: center;
      border-bottom: 1px solid #ddd;
      padding: 15px 0;
      margin-top: 30px;
    }

    .cart-item .cart-image img {
      width: 100px;
      height: auto;
      margin-right: 20px;
      cursor: pointer; 
    }

    .cart-item .cart-info {
      flex: 1;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }

    .cart-item .cart-info h4 {
      font-size: 18px;
      font-weight: bold;
      margin-bottom: 5px;
      cursor: pointer;
    }

    .cart-item .cart-info p {
      font-size: 14px;
      color: #666;
    }

    .cart-item .cart-quantity {
      display: flex;
      align-items: center;
    }

    .cart-item .cart-quantity input {
      width: 30px;
      text-align: center;
      border-radius: 0px;
      border: 1px solid #ddd;
      height: 30px;
    }

    .cart-item .cart-quantity button {
      width: 30px;
		  height: 30px;
		  background-color: white;
		  border: 1px solid #ddd;
		  text-align: center;
		  font-size: 10px;
		  line-height: 28px;
		  cursor: pointer;
		  transition: all 0.3s ease;
    }
    
    .cart-item .cart-quantity button:hover {
      background-color: gray;
		  color: #fff;
		  transform: scale(1.1);
    }

    .cart-item .cart-price {
      font-size: 18px;
      font-weight: bold;
    }

    .cart-aside {
      flex: 1;
      border: 1px solid #ddd;
      padding: 20px;
      background-color: #f9f9f9;
    }

    .cart-aside h3 {
      font-size: 24px;
      margin-bottom: 80px;
      text-align: center;
    }

    .cart-aside ul {
      list-style: none;
      padding: 0;
    }

    .cart-aside li {
      display: flex;
      justify-content: space-between;
      margin-bottom: 10px;
      font-size: 16px;
    }

    .cart-aside .total {
      border-top: 2px solid #ddd;
      padding-top: 15px;
      font-weight: bold;
      font-size: 18px;
    }

    .cart-aside button {
      width: 100%;
      padding: 10px;
      background-color: #333;
      color: #fff;
      border: none;
      font-size: 18px;
      cursor: pointer;
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
    
    .cart-body {
      margin-top: 50px;
    }
    
    .cart-list-check {
      display: flex;
      align-items: center;
      gap: 10px;
      margin-left: 2%;
    }
    
    .cart-list-check label {
      font-size: 20px;
    }
    
    .allCheckBox {
      width: 20px;
      height: 20px;
      margin: 0;
      border-radius: 0;
      vertical-align: middle  !important;
    }
    
    .selectDelete {
      background-color: transparent;
      border: 1px solid #ddd;
      font-size: 15px;
      padding: 5px 15px;
    }
    
    .cart-image img{
    	width: 10%;
    }
    .check-group{
    	align-items: flex-start;
    	top: 0;
    	padding: 20px;
    }
    
    .check-group p{
    	cursor: pointer;
    }
    
    .check-group input{
    	width: 14px;
    	height: 14px;
    	justify-content: center;
    }
    
    .check-group i{
    	color: gray;
    	padding-top: 10px;
    }
    .optionSelect{
    	margin-left: 20px;
    }
    
    .empty-cart {
		  text-align: center;
		  padding: 50px 20px;
		  color: #555;
		  border: 1px solid #ddd;
		  border-radius: 10px;
		  background-color: #f9f9f9;
		  margin: 50px auto;
		  max-width: 600px;
		}
		
		.empty-cart h3 {
		  font-size: 24px;
		  margin-bottom: 20px;
		}
		
		.empty-cart p {
		  font-size: 16px;
		  margin-bottom: 30px;
		}
		
		.empty-cart .shopping {
		  padding: 10px 20px;
		  background-color: #333;
		  color: white;
		  text-decoration: none;
		  border-radius: 5px;
		  font-size: 16px;
		}
		
		.empty-cart .shopping:hover {
		  background-color: #555;
		}
		
		@font-face { /*눈누 기초고딕 - 두꺼운 네모 딱딱 고딕*/
	    font-family: 'NoonnuBasicGothicRegular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
		}

    
    
  </style>
  <script type="text/javascript">
  	'use strict';
  	document.addEventListener("DOMContentLoaded", function () {
  		allCheck();
  	});
  	
  	function count(button, targetId, delta) {
    	  const input = document.getElementById(targetId);
    	  const itemIdx = targetId.replace("quantityInput", ""); // 상품 idx 추출
    	  const priceElement = document.getElementById("price" + itemIdx); // 개별 상품의 단가
    	  const selectedOption = document.getElementById("option" + itemIdx).value;
    	  const shopIdx = document.getElementById("shopIdx" + itemIdx).value;
    	  const cartPriceElement = document.querySelector("#cartCheck" + itemIdx).closest('.cart-item').querySelector('.cart-price'); // 금액 표시 요소

    	  let currentValue = parseInt(input.value) || 1;
    	  currentValue += delta;
    	  if (currentValue < 1) currentValue = 1; // 최소 1개
    	  if (currentValue > 5) { // 최대 5개 제한
    	    alert("5개까지 구매가능한 상품입니다.");
    	    return false;
    	  }
    	  let totalPrice =  priceElement.value / input.value * currentValue;
     		if(currentValue < 1){
     			alert("장바구니 삭제 버튼을 눌러주세요");
     			return false;
     		}
    		
    		$.ajax({
          type: "post",
          url: "${ctp}/shop/shopCart",
          data: {
            shopIdx: shopIdx,
            quantityMinus : delta,
            totalPrice: totalPrice,
            optionSelect: selectedOption
          },
          success: function (res) {
          	location.reload();
          }
  	    });
    	}


    // 전체선택 체크박스
    function allCheck(){
    	let minIdx = parseInt(document.getElementById("minIdx").value);
      let maxIdx = parseInt(document.getElementById("maxIdx").value);
      if(document.getElementById("allcheck").checked){
        for(let i=minIdx;i<=maxIdx;i++){
          if($("#cartCheck"+i).length != 0){
            document.getElementById("cartCheck"+i).checked=true;
          }
        }
      }
      else {
        for(let i=minIdx;i<=maxIdx;i++){
          if($("#cartCheck"+i).length != 0){
            document.getElementById("cartCheck"+i).checked=false;
          }
        }
      }
      updateTotal();
    }
    
    function onCheck() {
      let minIdx = parseInt(document.getElementById("minIdx").value);
      let maxIdx = parseInt(document.getElementById("maxIdx").value);
      
      let emptyCnt=0;
      for(let i=minIdx;i<=maxIdx;i++){
        if($("#cartCheck"+i).length != 0 && document.getElementById("cartCheck"+i).checked==false){
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
      updateTotal();
    }
    
    // 체크박스 클릭 시 총 금액 업데이트
    function updateTotal() {
    	let minIdx = parseInt(document.getElementById("minIdx").value);
      let maxIdx = parseInt(document.getElementById("maxIdx").value);
    	let checkIdx = document.getElementsByName("cartCheck");
    	let totalPrice = 0; 
    	let idxArr = "";
    	let quantityArr = "";
    	let totalPriceArr = "";
    	
    	for(let i=minIdx;i<=maxIdx;i++){
	    	let checkbox = document.getElementById("cartCheck" + i);
  			if (checkbox && checkbox.checked) {
	  			totalPrice += parseInt(document.getElementById("price" + i).value);
	  			totalPriceArr += document.getElementById("price" + i).value + "/";
	  			idxArr += i + "/";
	  			quantityArr += document.getElementById("quantityInput" + i).value + "/";
	  		}
    	}
			
      // 결제 예정 금액 계산
      const finalPrice = parseInt(totalPrice);
      // 금액 업데이트
      document.getElementById('total-order-price').textContent = totalPrice.toLocaleString() + '원';
      document.getElementById('final-price').textContent = finalPrice.toLocaleString() + '원';
      document.getElementById('totalPriceArr').value = totalPriceArr;
      document.getElementById('quantityArr').value = quantityArr;
      document.getElementById('idxArr').value = idxArr;
    }
    
    function numberWithCommas(x) {
      return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
    
    function order() {
			let finalPrice = document.getElementById('final-price').textContent;
			
			if(finalPrice == "" || finalPrice == 0){
				alert("장바구니에서 주문처리할 상품을 선택해주세요!");
        return false;
			}
			else {
        document.myform.submit();
      }
		}
    
    function cartDelete(idx) {
			let ans = confirm("해당 항목을 삭제하시겠습니까?");
			
			if(!ans){
				return false;
			}
			$.ajax({
				type: "post",
				url : "${ctp}/shop/cartDelete",
				data : {
					idx : idx
				},
				success: function(res) {
					location.reload();
				},
				error: function() {
					alert("전송오류");
				}
			});
		}
    
    function selectDelete() {
    	let idxArr = "";
    	for(let i = 0; i < myform.cartCheck.length; i++){
				if(myform.cartCheck[i].checked){
					idxArr += myform.cartCheck[i].value + "/";
				}
			}
    	idxArr = idxArr.substring(0,idxArr.length-1);
    	
    	let ans = confirm("선택된 항목들을 삭제하시겠습니까?");
    	
    	if(!ans){
    		return false;
    	}
    	$.ajax({
    		type : "post",
    		url : "${ctp}/shop/cartSelectDelete",
    		data : {
    			idxArr : idxArr
    		},
    		success: function(res) {
					location.reload();
				},
				error: function() {
					alert("전송오류");
				}
    	});
		}
  	
  </script>
</head>
<body>
  <form name="myform" method="post" action="${ctp}/shop/shopOrder">
    <div class="cart-container">
      <div class="cart-header">
        <h2>장바구니</h2>
        <ul class="step-navigation">
          <li style="font-weight: bold;">
            <span><i class="fa-solid fa-lock"></i></span>
            <div>
              <p>STEP 01</p>
              <p>장바구니</p>
            </div>
          </li>
          <li>
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
      <div class="cart-body">
	      <c:if test="${!empty vos}">
	        <div class="cart-list">
		        <div class="cart-list-check">
	            <input type="checkbox" id="allcheck" onclick="allCheck()" class="allCheckBox" checked>
	            <label for="allcheck">전체선택</label>
	            <button type="button" class="selectDelete" onclick="selectDelete()">선택삭제</button>
	          </div>
	          <c:forEach var="vo" items="${vos}">
	            <div class="cart-item">
							  <div class="check-group">
							    <input type="checkbox" id="cartCheck${vo.idx}" name="cartCheck" value="${vo.idx}" onClick="onCheck()">
							    <p onclick="cartDelete(${vo.idx})"><i class="fa-regular fa-trash-can"></i></p>
							  </div>
							  <div class="cart-image">
							    <a href="${ctp}/shop/shopContent?idx=${vo.shopIdx}"><img src="${ctp}/category/${vo.thumbnail}" alt="상품 이미지"></a>
							  </div>
							  <div class="cart-info">
							    <h4 onclick="location.href='${ctp}/shop/shopContent?idx=${vo.shopIdx}'">${vo.shopTitle}</h4>
							    <p>${vo.company}</p>
							    <div class="cart-quantity">
							      <button type="button" onclick="count(this, 'quantityInput${vo.idx}', -1)"><i class="fa-solid fa-minus"></i></button>
							      <input type="number" id="quantityInput${vo.idx}" name="quantity" min="1" value="${vo.quantity}" readonly>
							      <button type="button" onclick="count(this, 'quantityInput${vo.idx}', 1)"><i class="fa-solid fa-plus"></i></button>
							      <div class="optionSelect">${vo.optionSelect}</div>
							    </div>
							  </div>
							  <div class="cart-price"><fmt:formatNumber pattern="#,##0" value="${vo.totalPrice}"/> 원</div>
							  <input type="hidden" id="price${vo.idx}" name="price" value="${vo.totalPrice}">
							  <input type="hidden" id="option${vo.idx}" name="option" value="${vo.optionSelect}">
							  <input type="hidden" id="shopIdx${vo.idx}" name="shopIdx" value="${vo.shopIdx}">
							</div>
	          </c:forEach>
        	</div>
	        <!-- Right: Summary -->
	        <div class="cart-aside">
					  <h3>결제금액</h3>
					  <ul>
					    <li>
					      <span>총 주문금액</span>
					      <span id="total-order-price">0원</span>
					    </li>
					    <li>
					      <span>배송비</span>
					      <span id="shipping-cost">무료</span>
					    </li>
					    <li class="total">
					      <span>결제 예정 금액</span>
					      <span id="final-price">0원</span>
					    </li>
					  </ul>
					  <button type="button" onclick="order()">주문하기</button>
	        </div>
	      </c:if>
	      <c:if test="${empty vos}">
				  <div class="empty-cart">
				    <h3>장바구니가 비어 있습니다.</h3>
				    <p>원하시는 상품을 장바구니에 담아보세요!</p>
				    <a href="${ctp}" class="shopping">쇼핑 계속하기</a>
				  </div>
		      <div style="height: 405px;"></div>
				</c:if>
      </div>
      <div style="height: 110px;"></div>
    </div>
		<c:set var="minIdx" value="${vos[0].idx}"/>						<!-- 구매한 첫번째 상품의 idx -->
	  <c:set var="maxSize" value="${fn:length(vos)-1}"/>		
	  <c:set var="maxIdx" value="${vos[maxSize].idx}"/>			<!-- 구매한 마지막 상품의 idx -->
	  <input type="hidden" id="minIdx" name="minIdx" value="${minIdx}"/>
	  <input type="hidden" id="maxIdx" name="maxIdx" value="${maxIdx}"/>
	  <input type="hidden" id="totalPriceArr" name="totalPriceArr"/>
	  <input type="hidden" id="quantityArr" name="quantityArr"/>
	  <input type="hidden" id="idxArr" name="idxArr"/>
  </form>
</body>
</html>
