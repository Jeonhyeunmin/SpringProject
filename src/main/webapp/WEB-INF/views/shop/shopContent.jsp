<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<title>${vo.title} | Min's</title>
  <meta charset="UTF-8">
  <style type="text/css">
		body {
		  font-family: 'Arial', sans-serif;
		  margin: 0;
		  padding: 0;
		  background-color: #f4f4f9;
		  color: #333;
		}
		#content-form {
			display: flex;
		  flex-direction: row;
		  margin: 0 15%;
		  gap: 30px;
		}
		
		/* 이미지 전환 효과 */
		.image-container {
		  position: relative;
		  width: 100%;
		  overflow: hidden;
		  border-radius: 10px;
		  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
		}
			
		.image-container img {
		  width: 100%;
		  height: 100%;
		  object-fit: cover;
		  transition: transform 0.3s ease;
		}
		
		.image-container img:hover {
		  transform: scale(1.05); /* 살짝 확대 효과 */
		}
			
		/* 보조 이미지 */
		.sub-img {
		  display: flex;
		  gap: 10px;
		  margin-top: 10px;
		  padding-bottom: 10px;
		}
		
		.sub-img img {
		  width: 80px;
		  height: 80px;
		  border-radius: 5px;
		  cursor: pointer;
		  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
		  transition: transform 0.3s ease, box-shadow 0.3s ease;
		}
		
		.sub-img img:hover,
		.sub-img img.active {
		  transform: scale(1.1);
		  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
		  border: 2px solid #3498db;
		}
		
		
		.grid-container {
		  display: grid;
		  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
		  gap: 20px;
		}
		
		.grid-item {
		  text-align: center;
		}
		
		.grid-item img {
		  width: 100%;
		  height: auto;
		  border-radius: 8px;
		}
		
			
		.fixed-sidebar {
		  position: fixed;
		  top: 20%;
		  right: -120px;
		  width: 120px;
		  flex-direction: column;
		  align-items: center;
		  background: none;
		  z-index: 50;
		  gap: 20px;
		  opacity: 0;
		  transition: 0.5s ease-in-out;
		}
		
		.fixed-sidebar.on {
		  right: 10px;
		  opacity: 1;
		}
		
		
		.sidebar-item {
		  text-align: center;
		  cursor: pointer;
		}
			
		.icon-circle {
		  width: 60px;
		  height: 60px;
		  border-radius: 50%;
		  background-color: #ffffff;
		  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
		  display: flex;
		  align-items: center;
		  justify-content: center;
		  transition: transform 0.3s ease, box-shadow 0.3s ease;
		  margin-bottom: 20px;
		}
			
		.icon-circle i {
		    font-size: 25px;
		    color: #333;
		}
		
		.icon-circle:hover {
		  transform: scale(1.1);
		  box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.3);
		}
		.content{
			text-align: center;
		}
		.sub-img {
		  display: flex; /* 썸네일 이미지를 한 줄로 정렬 */
		  gap: 10px; /* 이미지 간격 */
		  margin-top: 10px;
		  justify-content: start; /* 왼쪽 정렬 (필요 시 변경 가능) */
		}
			
			
		.breadcrumb {
		  font-size: 14px;
		  color: #555;
		  margin-top: 3%;
		  margin-left: 19.5%;
		  background-color: #fff;
		  padding: 5px 10px;
		  border-radius: 5px;
		}
		
		.breadcrumb a {
		  text-decoration: none;
		  padding: 0 5px;
		}
		
		.breadcrumb a:hover {
		  text-decoration: none;
		}
		
		.product-info h2 {
		  font-size: 24px;
		  font-weight: bold;
		  color: #2c3e50;
		  margin-bottom: 10px;
		  margin-top: 45px;
		}
		
		.product-info .price {
		  font-size: 20px;
		  font-weight: bold;
		  color: #e74c3c;
		}
		
		.product-info .btn {
		  padding: 10px 20px;
		  font-size: 16px;
		  border-radius: 5px;
		  transition: background-color 0.3s ease, color 0.3s ease;
		}
		
		.product-info .btn:hover {
		  background-color: gray;
		  color: #fff;
		}
		
		/* 추가 정보 스타일 */
		.additional-info {
		  background-color: #fff;
		  border-radius: 10px;
		  margin-left: 1%;
		  margin-top: 70px;
		}
		
		.additional-info h3 {
		  font-size: 18px;
		  font-weight: bold;
		  color: #34495e;
		  margin-bottom: 10px;
		  margin-top: 10px;
		}
		
		.additional-info span{
			margin-top: 20px;
		}
		
		.author-info {
		  display: flex;
		  align-items: center;
		  cursor: pointer;
		}
		
		.author-logo {
		  width: 50px;
		  height: 50px;
		  border-radius: 50%;
		  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
		  object-fit: cover;
		  margin-right: 15px;
		}
		
		.author-details {
		  display: flex;
		  flex-direction: column;
		  gap: 5px;
		}
		
		.author-details .company {
		  font-size: 16px;
		  font-weight: bold;
		  color: #2c3e50;
		  text-decoration: none;
		}
		
		.author-details .post-count {
		  font-size: 14px;
		  color: #555;
		}
		
		.discount-badge {
		  display: inline-block;
		  padding: 5px 10px;
		  background-color: #e74c3c;
		  color: #fff;
		  font-size: 14px;
		  font-weight: bold;
		  border-radius: 5px;
		  margin-bottom: 10px;
		}
		
		.original-price {
		  font-size: 18px;
		  color: #888;
		  text-decoration: line-through;
		  margin: 10px 0;
		}
		
		.final-price {
		  font-size: 22px;
		  font-weight: bold;
		  color: #e74c3c;
		  margin-bottom: 20px;
		}
		
		/* 수량 입력 컨테이너 스타일 */
		.counter-container {
		  display: flex;
		  align-items: center;
		  justify-content: space-between;
		  gap: 20px; /* 요소 간 간격 */
		  padding: 10px;
		  font-size: 16px;
		  margin-top: 10px;
		}
		
		.counter-container p {
		  margin: 0;
		  font-size: 16px;
		  font-weight: bold;
		  color: #333;
		}
		
		.counter-container .counter {
		  display: flex;
		  align-items: center;
		  gap: 5px;
		}
		
		.counter-container .counter-btn {
		  width: 30px;
		  height: 30px;
		  background-color: #f8f9fa;
		  border: 1px solid #ddd;
		  border-radius: 5px;
		  text-align: center;
		  font-size: 18px;
		  line-height: 28px;
		  cursor: pointer;
		  transition: all 0.3s ease;
		}
		
		.counter-container .counter-btn:hover {
		  background-color: gray;
		  color: #fff;
		  transform: scale(1.1);
		}
		
		.counter-container .counter-input {
		  width: 50px;
		  height: 30px;
		  text-align: center;
		  font-size: 16px;
		  border: 1px solid #ddd;
		  border-radius: 5px;
		}
		
		.counter-container .counter-input:focus {
		  outline: none;
		  border-color: #3498db;
		}
		
		.counter-container .price {
		  font-size: 18px;
		  font-weight: bold;
		  color: #e74c3c;
		  min-width: 100px;
		  text-align: right;
		}
		
		.counter-container {
		  display: none;
		  transition: opacity 0.3s ease, visibility 0.3s ease;
		}
		
		.counter-container.show {
		  display: flex;
		}
  </style>
  <script type="text/javascript">
	  function toggleLike(idx, btn) {
	    const icon = btn.querySelector('i');
      $.ajax({
      	type : "post",
      	url : "interestCheck.fu",
      	data : {idx : idx},
      	success: function(res) {
					if(res == "1"){
						icon.classList.remove('fa-regular');
		        icon.classList.add('fa-solid');
					}
					else if(res == "2"){
		        icon.classList.remove('fa-solid');
		        icon.classList.add('fa-regular');
			    }
				},
				error: function() {
					alert("안됨");
				}
    	});
	  }
	  
		
		$(window).scroll(function(){
		  if($(this).scrollTop() > 300){
		     $("#mainSidebar").addClass("on");
		  }
		  else{
		     $("#mainSidebar").removeClass("on");
		  }
		});
		
			function shareContent() {
		    const shareData = {
		        title: '그린테리어',
		        text: '이 멋진 인테리어를 확인해보세요!',
		        url: window.location.href // 현재 페이지 URL
		    };

		    if (navigator.share) {
		        navigator.share(shareData)
		            .then(() => console.log('공유 성공'))
		            .catch((error) => console.error('공유 실패:', error));
		    } else {
		        alert('공유 기능이 지원되지 않는 브라우저입니다.');
		    }
		}
		
		function DeleteCheck() {
			let ans = confirm("삭제하시겠습니까?");
			if(ans){
				location.href = "FurnitureDelete.fu?idx=${vo.idx}";
			}
		}
		
  	function cartCheck() {
  		
			$.ajax({
				type : 'post',
				url  : 'FurnitureCart.fu',
				data :  {idx : ${vo.idx}},
				success: function(res) {
					let ans = confirm("장바구니로 이동하시겠습니까?");
					if(ans){
						location.href='FurnitureShoppingList.fu';
					}
					else{
						location.reload();
					}
				},
				error: function() {
					alert("전송오류");
				}
			});	  		
		}
  	
  	function buy() {
			idxSelectArray = ${vo.idx} + ",";
			alert("결제페이지로 이동합니다.");
			location.href = "FurnitureBuy.fu?idxArray=" + idxSelectArray;
		}
		
  	function complaint() {
  		let ans = confirm("이 게시물을 신고하시겠습니까?");
  		if(ans){
				$.ajax({
					type : "post",
					url : "Complaint.fu",
					data : {
						idx : ${vo.idx},
						mid : '${vo.mid}'
					},
					success: function(res) {
						if(res == "1"){
							alert("게시물이 신고되었습니다.");
							location.reload();
						}
						else if(res == "2"){
							alert("이미 신고한 글입니다.");
							location.reload();
						}
						else{
							alert("응 오류야 다시 봐");
						}
					},
					error: function() {
						alert("error");
					}
				});
  		}
  		else{
  			return;
  		}
		}
  	document.addEventListener("DOMContentLoaded", function () {
  	  const thumbnails = document.querySelectorAll(".sub-img img");
  	  const mainImage = document.querySelector(".image-container img");

  	  thumbnails.forEach((thumbnail) => {
  	    thumbnail.addEventListener("click", function () {
  	      // 클릭한 썸네일 이미지를 메인 이미지로 설정
  	      mainImage.src = thumbnail.src;
  	    });
  	  });
  	});
  	
  	function count(button, targetId, delta) {
  	  const input = document.getElementById(targetId);
  	  const totalPriceDisplay = document.getElementById("totalPrice");

  	  const basePrice = parseInt(totalPriceDisplay.getAttribute("data-base-price")) || ${vo.price}; // 저장된 기본 가격
  	  let currentValue = parseInt(input.value) || 1;
  	  currentValue += delta;

  	  if (currentValue < 1) currentValue = 1; // 최소 1개
  	  if (currentValue > 5) { // 최대 5개 제한
  	    alert("5개까지 구매가능한 상품입니다.");
  	    currentValue = 5;
  	  }
  	  input.value = currentValue;

  	  const totalPrice = basePrice * currentValue; // 기본 가격 * 수량
  	  totalPriceDisplay.textContent = totalPrice.toLocaleString() + '원';
  		document.getElementById("totalPrice").value =  totalPrice.toLocaleString();
  	}

  	
  	function shopDelete() {
			let ans = confirm("${vo.title}을 삭제하시겠습니까?");
			if(!ans) return false;
			
			location.href="${ctp}/shop/shopDelete?idx=${vo.idx}";
		}
  	
  	function selectOption() {
  	  const select = document.getElementById("optionSelect");
  	  if (!select) return; // 옵션이 없는 경우 함수 종료

  	  const selectedOption = select.options[select.selectedIndex];
  	  const optionPrice = parseInt(selectedOption.dataset.price) || 0; // 옵션 가격 가져오기

  	  const counterContainer = document.getElementById("counter-container");
  	  const selectedOptionDisplay = document.getElementById("selectedOption");
  	  const quantityInput = document.getElementById("quantityInput");
  	  const totalPriceDisplay = document.getElementById("totalPrice");

  	  const basePrice = parseInt(${vo.price}) || 0; // 기본 상품 가격

  	  if (selectedOption.value !== "") {
  	    // 옵션이 선택된 경우
  	    counterContainer.classList.add("show"); // counter-container 표시
  	    selectedOptionDisplay.textContent = '선택된 옵션 : ' + selectedOption.value;
  	    const totalPrice = (basePrice + optionPrice) * parseInt(quantityInput.value || 1);

  	    totalPriceDisplay.textContent = totalPrice.toLocaleString() + '원';
  	    totalPriceDisplay.setAttribute("data-base-price", basePrice + optionPrice); // 새로운 기본 가격 저장
  	  } else {
  	    // 기본 상태 (옵션 선택 없음)
  	    counterContainer.classList.remove("show");
  	    selectedOptionDisplay.textContent = "옵션을 선택하세요";
  	    totalPriceDisplay.textContent = "0 원";
  	    totalPriceDisplay.setAttribute("data-base-price", basePrice); // 기본 가격 설정
  	  }
  	}
  	
  	function buy() {
  	  const quantity = document.getElementById("quantityInput").value; // 수량 가져오기
  	  const totalPrice = document.getElementById("totalPrice").textContent.replace("원", "").replace(/,/g, ""); // 최종 가격 가져오기
  	  const idx = document.getElementById("idx").value; // idx 가져오기

  	  // 선택한 옵션 가져오기
  	  const optionSelect = document.getElementById("optionSelect");
  	  const selectedOption = optionSelect ? optionSelect.options[optionSelect.selectedIndex].value : "";

  	  if (!quantity || (optionSelect && !selectedOption)) {
  	    alert("옵션을 선택해주세요");
  	    return;
  	  }

  	  document.getElementById("quantity").value = quantity;
  	  buyForm.totalPrice.value = totalPrice;
  	  document.getElementById("optionSelectValue").value = selectedOption;
  	  

  	  document.getElementById("buyForm").submit();
  	}
  </script>
</head>
<body>
<div class="breadcrumb">HOME > <a href="${ctp}/shop/shopList?category=${vo.category}">${fn: toUpperCase(vo.category)}</a> > <a href="${ctp}/shop/shopMainList?mainCategory=${vo.mainCategory}">${fn: toUpperCase(vo.mainCategory)}</a> > <a href="${ctp}/shop/shopSubList?subCategory=${vo.subCategory}">${fn: toUpperCase(vo.subCategory)}</a></div>
<div id="content-form" class="container">
  <table id="content-table" style="width: 85%; margin: 0 auto; border-collapse: collapse;">
	  <!-- 이미지와 제품 정보 -->
	  <tr>
	    <td style="width: 50%; vertical-align: top; padding: 10px;">
	      <div class="main-img">
	        <div class="image-container">
		      	<img src="${ctp}/category/${titleImgs[0]}">
		    	</div>
			    <div class="sub-img" style="width: 100px;">
			    	<c:forEach var="i" begin="0" end="${fn: length(titleImgs)-1}">
			    		<img src="${ctp}/category/${titleImgs[i]}" width="100px">
		    		</c:forEach>
			    </div>
	      </div>
	    </td>
	    <td style="width: 50%; vertical-align: top; padding: 10px;">
	      <div class="product-info">
				  <div class="author-info" onclick="location.href=''">
				    <img src="${ctp}/logo/${logo}" alt="${vo.company}" class="author-logo">
				    <div class="author-details">
				      <div class="company">${vo.company}</div>
				      <p class="post-count">게시물 <fmt:formatNumber value="${postCount}" pattern="#,##0"/>개</p>
				    </div>
				  </div>
				  <h2>${vo.title}</h2>
				  
				  <c:if test="${vo.discount > 0}">
				    <span class="discount-badge">${vo.company}의 ${vo.discount}% 할인</span>
				  
					  <p class="original-price"><fmt:formatNumber value="${vo.price}" pattern="#,##0"/> 원</p>
					  
					  <p class="final-price">
					    <fmt:formatNumber value="${vo.price - (vo.price * vo.discount / 100)}" pattern="#,##0"/> 원
					  </p>
				  </c:if>
				  <c:if test="${vo.discount == 0}">
					  <p class="price"><fmt:formatNumber value="${vo.price}" pattern="#,##0"/> 원</p>
				  </c:if>
				  <div class="additional-info">
					  <h3>제품 사진 관련 안내</h3>
					  <p>위의 사진들은 모니터에 따라 약간의 색상 차이가 발생될 수 있습니다.</p>
					  <p>배송비 : <span style="font-weight: bold;">무료배송</span></p>
					  <p>해당 상품은 5개까지 구매가능합니다.</p>
					
					  <!-- 옵션 선택 -->
					  <c:set var="optionName" value="${fn: split(vo.optionName, '/')}"/>
					  <c:set var="optionPrice" value="${fn: split(vo.optionPrice, '/')}"/>
					  <c:choose>
						  <c:when test="${fn: length(optionName) > 1}">
						    <select id="optionSelect" class="form-control" onchange="selectOption()">
								  <option value="" data-price="0">옵션을 선택하세요</option>
								  <c:forEach var="i" begin="0" end="${fn: length(optionName) -1}">
								    <option value="${optionName[i]}" data-price="${optionPrice[i]}">
								      ${optionName[i]}<c:if test="${optionPrice[i] != 0}"> - <fmt:formatNumber value="${optionPrice[i]}" pattern="#,##0"/> 원</c:if>
								    </option>
								  </c:forEach>
								</select>
						    <div id="counter-container" class="counter-container">
								  <p id="selectedOption" class="option">옵션을 선택하세요</p>
								  <div class="counter">
								    <button type="button" class="counter-btn" onclick="count(this, 'quantityInput', -1)">-</button>
								    <input type="number" id="quantityInput" class="counter-input" value="1" readonly>
								    <button type="button" class="counter-btn" onclick="count(this, 'quantityInput', 1)">+</button>
								  </div>
								  <p id="totalPrice" class="price" data-base-price="${vo.price}">${vo.price} 원</p>
								</div>
						  </c:when>
						  <c:otherwise>
						    <div id="counter-container" class="counter-container show">
						      <p id="selectedOption" class="option">${vo.title}</p>
						      <div class="counter">
						        <button type="button" class="counter-btn" onclick="count(this, 'quantityInput', -1)">-</button>
						        <input type="number" id="quantityInput" class="counter-input" value="1" readonly>
						        <button type="button" class="counter-btn" onclick="count(this, 'quantityInput', 1)">+</button>
						      </div>
						      <p id="totalPrice" class="price"><fmt:formatNumber value="${vo.price}" pattern="#,##0"/> 원</p>
						    </div>
						  </c:otherwise>
						</c:choose>
						<form id="buyForm" method="post" action="${ctp}/shop/shopBuy">
						  <input type="hidden" id="idx" name="idx" value="${vo.idx}">
						  <input type="hidden" id="quantity" name="quantity">
						  <input type="hidden" id="totalPrice" name="totalPrice">
						  <input type="hidden" id="optionSelectValue" name="optionSelect"> <!-- 옵션 추가 -->
						  <button type="button" onclick="buy()" class="btn btn-outline-secondary mt-3">구매하기</button>
					  	<button type="button" onclick="cartCheck()" class="btn btn-outline-secondary mt-3">장바구니 담기</button>
						</form>
				  	<input type="hidden" id="totalPrice" name="totalPrice">
					</div>
				</div>
	    </td>
	  </tr>
	  <tr>
	  	<td colspan="2">
	  		<div class="content">
	  			${vo.content}
	  		</div>
	  	</td>
	  </tr>
	</table>
	<div><input type="button" value="수정" class="btn btn-outline-success" onclick="location.href='${ctp}/shop/shopUpdate?idx=${vo.idx}'" /></div>
	<div><input type="button" value="삭제" class="btn btn-outline-danger" onclick="shopDelete()" /></div>
		
</div>
</body>
</html>