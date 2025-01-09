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
		  margin: 0 17%;
		  gap: 30px;
		  align-items: center;
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
      margin-top: 2%;
      margin-left: 22.5%;
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
		.button-group {
		  display: flex;
		  justify-content: space-between;
		  align-items: center;
		  width: 100%;
		  margin: 20px 0;
		  background-color: white; /* 배경색 추가 */
		  z-index: 1000; /* 다른 요소 위에 배치 */
		  transition: top 0.3s ease; /* 스크롤 이동 시 부드러운 효과 */
		}
		
		.button-group.fixed {
		  position: fixed;
		  top: 0;
		  left: 0;
		  right: 0;
		  border-bottom: 1px solid #ddd;
		  box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
		}

		
		.button-group button {
		  flex: 1;
		  background-color: #fff;
		  color: #333;
		  border: 2px solid #ddd;
		  font-size: 18px;
		  padding: 15px 20px;
		  text-align: center;
		  cursor: pointer;
		  transition: all 0.3s ease;
		  border-bottom: 2px solid black;
		}
		
		.button-group button:hover {
		  font-weight: bold;
		}
		
		.button-group button.active {
		  border: 2px solid black;
		  font-weight: bold;
		  border-bottom: none;
		}
		
	  .review {
	    margin: 20px 0;
	    padding: 20px;
	    background-color: #fff;
	    border-radius: 10px;
	    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	    margin-top: 40px;
  	}
		
		.review .review-header {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    border-bottom: 1px solid #ddd;
	    padding-bottom: 10px;
	    margin-bottom: 15px;
	    border-bottom: 2px solid #ddd;
	  }
		
	  .review .review-header .rating {
	    display: flex;
	    align-items: center;
	    gap: 5px;
	  }
		
		.review .review-content {
		  font-size: 16px;
		  line-height: 1.6;
		  color: #555;
		  margin: 10px 0;
		}
		
		.review .review-footer {
		  display: flex;
		  justify-content: space-between;
		  align-items: center;
		  font-size: 14px;
		  color: #888;
		}
		
		.review .review-footer .review-date {
		  font-style: italic;
		}
		
		.review .review-footer .review-user {
		  font-weight: bold;
		  color: #2c3e50;
		}
		
		.review-container {
		  margin-bottom: 20px;
		  padding: 15px;
		  border-bottom: 1px solid #ddd;
		}
		
		.rating {
		  display: flex;
		  align-items: center;
		  font-size: 24px;
		  gap: 5px;
		}
		
		.rating .star {
		  position: relative;
		  width: 50px;
		  height: 50px;
		  color: gray; /* 기본 별 색상 */
		  font-size: 50px;
		  margin-bottom: 5px;
		}
		
		.rating .star::before {
		  content: "★";
		  position: absolute;
		  color: #ffb334; /* 채워진 별 색상 */
		  overflow: hidden;
		  width: 0; /* 기본적으로 채워지지 않음 */
		}
		
		.rating .star[data-filled="true"]::before {
		  width: 100%; /* 완전히 채운 별 */
		}
		
		.rating .star.partial::before {
		  width: var(--fill-percent); /* 부분적으로 채워짐 */
		}
		.score{
			font-size: 40px;
		}
		
		.coment{
			border: 1px solid black;
			padding: 15px 30px;
			font-weight: bold;
		}
		
		.reviewButton{
			text-align: right;
		}
		
		.reviewButton button{
			padding: 10px 25px;
			background-color: transparent;
			border: 1px solid #ddd;
			border-radius: 10px;
		}
		
		.reviewButton .claim:hover{
			background-color: #fa4141;
			color: white;
			border: none;
		}
		
		.reviewButton .good:hover{
			background-color: #4750f9;
			color: white;
			border: none;
		}
		
		.user-score{
			display: flex;
			justify-content: space-between;
		}
				
		.reviewButton .reviewUpdate{
			background-color: #e8ea3d;
			padding: 5px 10px;
		}
				
		.reviewButton .reviewUpdate:hover{
			background-color: #f0f22e;
			border: none;
		}
		
		.reviewButton .reviewDelete{
			background-color: #fa4141;
			padding: 5px 10px;
		}
		
		.reviewButton .reviewDelete:hover{
			background-color: #fc2b2b;
			color: white;
			border: none;
		}
		
		/* 모달 배경 */
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
		
		/* 수정 폼 */
		.reviewUpdateForm {
		  position: fixed;
		  bottom: -100%; /* 초기 위치: 화면 아래 */
		  left: 50%;
		  transform: translateX(-50%);
		  width: 90%;
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
		.reviewUpdateForm.show {
		  bottom: 15%; /* 화면에 보이도록 */
		  opacity: 1;
		}


  </style>
  <script type="text/javascript">
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

  	  const basePrice = parseInt(totalPriceDisplay.getAttribute("data-base-price")) || ${vo.price - (vo.price * vo.discount / 100)}; // 저장된 기본 가격
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
  	  const quantity = document.getElementById("quantityInput").value;
  	  const totalPrice = document.getElementById("totalPrice").textContent.replace("원", "").replace(/,/g, ""); // 최종 가격 가져오기

  	  // 선택한 옵션 가져오기
  	  const optionSelect = document.getElementById("optionSelect");
  	  const selectedOption = optionSelect ? optionSelect.options[optionSelect.selectedIndex].value : "";

  	  if (!quantity || (optionSelect && !selectedOption)) {
  	    alert("옵션을 선택해주세요");
  	    return;
  	  }
  	  
	  	if("${sMid}" == ""){
				let url = "${ctp}/common/mobieLogin";
				window.open(url, "mobieLogin", "width=650px, height=700px, top=150px, left=500px;");
				
				 window.onLoginSuccess = function () {
            document.getElementById("quantity").value = quantity;
            buyForm.totalPrice.value = totalPrice;
            document.getElementById("optionSelectValue").value = selectedOption;
            document.getElementById("buyForm").submit();
        };
				
				return false;
			}

  	  document.getElementById("quantity").value = quantity;
  	  buyForm.totalPrice.value = totalPrice;
  	  document.getElementById("optionSelectValue").value = selectedOption;
  	  
  	  document.getElementById("buyForm").submit();
  	}
  	
  	document.addEventListener("DOMContentLoaded", function () {
  	  const buttons = document.querySelectorAll(".button-group button");

  	  buttons.forEach((button) => {
  	    button.addEventListener("click", function () {
  	      // 모든 버튼에서 active 클래스 제거
  	      buttons.forEach((btn) => btn.classList.remove("active"));

  	      // 클릭한 버튼에 active 클래스 추가
  	      this.classList.add("active");

  	      // 클릭한 버튼에 따라 콘텐츠 변경 (선택 사항)
  	      const content = document.querySelector(".content");
  	      const review = document.querySelector(".review");

  	      if (this.textContent === "상품상세") {
  	        content.style.display = "block";
  	        review.style.display = "none";
  	      } else if (this.textContent === "상품평") {
  	        content.style.display = "none";
  	        review.style.display = "block";
  	      }
  	    });
  	  });
  	});
  	
  	document.addEventListener("DOMContentLoaded", function () {
  	  let rating = document.querySelector(".rating");
  	  let stars = rating.querySelectorAll(".star");
  		let scoreElement = rating.querySelector(".score");

  	   // 서버에서 전달된 평점 값
			let reviewAvg = ${reviewAvg};
			
  	  scoreElement.textContent = reviewAvg.toFixed(1);
  	  
  	  stars.forEach((star, index) => {
  			let fullStars = Math.floor(reviewAvg); // 완전한 별 개수
  			let partialStar = reviewAvg % 1; // 소수점 부분

  	    if (index < fullStars) {
  	      star.setAttribute("data-filled", "true");
  	    } else if (index === fullStars && partialStar > 0) {
  	      star.classList.add("partial");
  	      star.style.setProperty("--fill-percent", (partialStar*100).toString() + "%");
  	    }
  	 		else {
  	      // 채워지지 않은 별
  	      star.setAttribute("data-filled", "false");
  	      star.style.setProperty("--fill-percent", "0%");
  	    }
  	  });
  	});
  	
  	function goodCheck(reviewIdx, mid) {
  		if(mid == "${sMid}"){
				alert("자신의 리뷰에는 좋아요를 누를 수 없습니다.");
				return false;
  		}
			$.ajax({
				type : "post",
				url : "${ctp}/shop/reviewGoodCheck",
				data: {
					idx : ${vo.idx},
					reviewIdx : reviewIdx
				},
				success: function(res) {
					if(res != "0"){
						reloadReviews();
					}
					else{
						alert("이미 추천하신 리뷰입니다");
					}
				},
				error: function() {
					alert("전송 오류");
				}
			});
		}
  	
  	function reloadReviews() {
	    $.ajax({
        type: "post",
        url : "${ctp}/shop/reviewList",
        data: { idx: ${vo.idx} },
        success: function(res) {
          $("#review-section").html(res);
        },
        error: function() {
          alert("리뷰를 불러오는 중 오류가 발생했습니다.");
        }
	    });
  	}
  	
  	function alreadyGoodCheck() {
			alert("이미 추천하신 리뷰입니다");
			return false;
		}
  	
  	function reviewClaim(idx) {
			let ans = confirm("해당 리뷰를 신고하시겠습니까?");
			
			if(ans){
				$.ajax({
					type : "post",
					url : "${ctp}/shop/reviewClaim",
					data : {
						idx : idx
					},
					success: function(res) {
						if(res != "0"){
							alert("해당 리뷰를 신고하였습니다.");
							reloadReviews();
						}
						else{
							alert("이미 신고된 글입니다.");
						}
					},
					error: function() {
						alert("전송오류");
					}
				});
			}
		}
  	
  	function reviewDelete(idx) {
			let ans = confirm("해당 리뷰를 삭제하시겠습니까?");
			
			if(ans){
				$.ajax({
					type : "post",
					url : "${ctp}/shop/reviewDelete",
					data : {
						idx : idx
					},
					success: function(res) {
						if(res != "0"){
							alert("해당 리뷰를 삭제하셨습니다.");
							reloadReviews();
						}
					},
					error: function() {
						alert("전송오류");
					}
				});
			}
  	}
			
 // 폼 열기
  	function reviewUpdateForm(idx) {
  	  $.ajax({
  	    type: "post",
  	    url: "${ctp}/shop/reviewUpdateForm",
  	    data: {
  	      shopIdx: ${vo.idx},
  	      reviewIdx: idx,
  	    },
  	    success: function (res) {
  	      const overlay = document.getElementById("modalOverlay");
  	      const updateForm = document.getElementById("reviewUpdateForm");

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
  	function closeReviewUpdateForm() {
  	  const overlay = document.getElementById("modalOverlay");
  	  const updateForm = document.getElementById("reviewUpdateForm");

  	  overlay.classList.remove("show");
  	  updateForm.classList.remove("show");
  	}
  	
  	function reviewCheck() {
  		let star = reviewForm.star.value;
    	let review = reviewForm.reviewContent.value;
    	let reviewIdx = reviewForm.reviewIdx.value;
    	
    	query = {
    		idx : reviewIdx,
    		content : review,
    		star : star
    	}
    	
    	if(star == ""){
    		alert("별점을 선택해주세요.");
    		return false;
    	}
    	if(review == ""){
    		alert("상세 리뷰를 입력해주세요");
    		return false;
    	}
    	
    	$.ajax({
    		type : "post",
    		url : "${ctp}/shop/reviewUpdate",
    		data : query,
    		success: function(res) {
					if(res != "0"){
						alert("리뷰가 수정되었습니다.");
						closeReviewUpdateForm();
						reloadReviews();
					}
					else{
						alert("수정 실패라요");
					}
				},
				error: function() {
					alert("전송오류");
				}    		
    	});
		}
  	
  	function cartCheck() {
	    const quantity = document.getElementById("quantityInput").value;
	    const totalPrice = document.getElementById("totalPrice").textContent.replace("원", "").replace(/,/g, "");
	    const idx = document.getElementById("idx").value;

	    const optionSelect = document.getElementById("optionSelect");
	    const selectedOption = optionSelect ? optionSelect.options[optionSelect.selectedIndex].value : "";

	    if (!quantity || (optionSelect && !selectedOption)) {
        alert("옵션을 선택해주세요");
        return;
	    }

	    if ("${sMid}" === "") {
        let url = "${ctp}/common/mobieLogin";
        window.open(url, "mobieLogin", "width=650px, height=700px, top=150px, left=500px;");

        window.onLoginSuccess = function () {
          sendAjaxRequest(idx, quantity, totalPrice, selectedOption);
        };
        return false;
	    }

	    sendAjaxRequest(idx, quantity, totalPrice, selectedOption);
  	}

  	function sendAjaxRequest(idx, quantity, totalPrice, selectedOption) {
	    $.ajax({
        type: "post",
        url: "${ctp}/shop/shopCart",
        data: {
          shopIdx: String(idx),
          quantity: String(quantity),
          totalPrice: String(totalPrice),
          optionSelect: String(selectedOption)
        },
        success: function (res) {
          if (res == "1") {
            let ans = confirm("해당 상품을 장바구니에 추가했습니다\n장바구니 페이지로 이동하시겠습니까?");
            if (ans) {
              location.href = "${ctp}/shop/shopCart";
            }
          }
          else if(res == "2"){
        	  alert("같은 제품은 5개까지 구매 가능합니다.");
          }
          else if(res == "3"){
        	  alert("같은 제품은 5개까지 구매 가능하여 장바구니에 5개를 담았습니다.");
          }
          else{
        	  alert("이미 장바구니에 담겨있는 상품입니다");
          }
        },
        error: function () {
          alert("전송오류");
        }
	    });
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
								  <p id="totalPrice" class="price" data-base-price="${vo.price - (vo.price * vo.discount / 100)}">${vo.price - (vo.price * vo.discount / 100)} 원</p>
								</div>
						  </c:when>
						  <c:otherwise>
						    <div id="counter-container" class="counter-container show">
						      <p id="selectedOption" class="option">${vo.title}</p>
						      <div class="counter">
						        <button type="button" class="counter-btn" onclick="count(this, 'quantityInput', -1)"><i class="fa-solid fa-minus"></i></button>
						        <input type="number" id="quantityInput" class="counter-input" value="1" readonly>
						        <button type="button" class="counter-btn" onclick="count(this, 'quantityInput', 1)"><i class="fa-solid fa-plus"></i></button>
						      </div>
						      <p id="totalPrice" class="price"><fmt:formatNumber value="${vo.price - (vo.price * vo.discount / 100)}" pattern="#,##0"/> 원</p>
						    </div>
						  </c:otherwise>
						</c:choose>
						<form id="buyForm" method="post" action="${ctp}/shop/shopOrder">
						  <input type="hidden" id="idx" name="idx" value="${vo.idx}">
						  <input type="hidden" id="quantity" name="quantity">
						  <input type="hidden" id="totalPrice" name="totalPrice">
						  <input type="hidden" id="optionSelectValue" name="optionSelect">
						  <button type="button" onclick="buy()" class="btn btn-outline-secondary mt-3">구매하기</button>
					  	<button type="button" onclick="cartCheck()" class="btn btn-outline-secondary mt-3">장바구니 담기</button>
						</form>
					</div>
				</div>
	    </td>
	  </tr>
	  <tr>
	  	<td colspan="2">
	  		<div class="button-group">
				  <button class="active">상품상세</button>
				  <button>상품평</button>
				  <button>Q & A</button>
				  <button>교환/반품/환불</button>
				</div>
	  		<div class="content">
	  			${vo.content}
	  		</div>
  			<div><button class="reviewButton" onclick="location.href='${ctp}/shop/shopReview?idx=${vo.idx}'">리뷰 작성</button></div>
  			<c:if test="${!empty reviewVOS}">
		  		<div class="review">
					  <div class="review-header">
					    <div class="rating">
							  <div class="star"></div>
							  <div class="star"></div>
							  <div class="star"></div>
							  <div class="star"></div>
							  <div class="star"></div>
							  <div class="score"><fmt:formatNumber value="${reviewAvg}" pattern="#,##0.0" /></div>
							</div>
						  <div class="coment">상품평 작성 후 Min's 포인트 받아가세요!</div>
					  </div>
					  <div id="review-section">
						  <c:forEach var="vo" items="${reviewVOS}">
						    <div class="review-container">
					      	<div class="user-score">
					      		<div>
							      	<c:forEach var="i" begin="1" end="${vo.star}">
												<font color="#ffb334"><i class="fa-solid fa-star"></i></font>
											</c:forEach>
											<c:forEach var="i" begin="1" end="${5 - vo.star}">
												<i class="fa-regular fa-star"></i>
											</c:forEach>
										</div>
							      <div class="reviewButton">
							      	<c:if test="${sMid != vo.mid}">
									      <span><button class="claim" onclick="reviewClaim(${vo.idx})">신고</button></span>
									      <c:if test="${fn: contains(likeVOS, vo.idx)}">
									      	<span><button class="good" style="background-color: #4750f9; color: white;" onclick="alreadyGoodCheck()"><i class="fa-regular fa-thumbs-up"></i>(${vo.good})</button></span>
									      </c:if>
									      <c:if test="${!fn: contains(likeVOS, vo.idx)}">
									      	<span><button class="good" onclick="goodCheck(${vo.idx}, '${vo.mid}')"><i class="fa-regular fa-thumbs-up"></i>(${vo.good})</button></span>
									      </c:if>
								      </c:if>
							      	<c:if test="${sMid == vo.mid}">
									      <span><button class="reviewUpdate" onclick="reviewUpdateForm(${vo.idx})">수정</button></span>
								      	<span><button class="reviewDelete" onclick="reviewDelete(${vo.idx})">삭제</button></span>
								      </c:if>
							      </div>
									</div>
						      <div class="review-content">
						        <span>${vo.content}</span>
						      </div>
						      <div class="review-footer">
						        <div class="review-user">
						        	${fn: substring(vo.mid, 0, 2)}
						        	<c:forEach var="i" begin="2" end="${fn: length(vo.mid)-2}">
						        		*
						        	</c:forEach>
										</div>
						        <div class="review-date">${fn: substring(vo.reviewDate,0 ,10)}</div>
						      </div>
						    </div>
						  </c:forEach>
					  </div>
					</div>
				</c:if>
				<c:if test="${empty reviewVOS}">
					<div class="review">
					  <div class="review-header">
					    <div class="rating">
							  <div class="star"></div>
							  <div class="star"></div>
							  <div class="star"></div>
							  <div class="star"></div>
							  <div class="star"></div>
							  <div class="score"><fmt:formatNumber value="0" pattern="#,##0.0" /></div>
							</div>
					  </div>
					  <div>
			        <p style="font-weight: bold; font-size: 20px; color: red;">등록된 리뷰가 없습니다.</p>
			      </div>
				  </div>
				</c:if>
				<div id="modalOverlay" class="modal-overlay" onclick="closeReviewUpdateForm()"></div>
					<div id="reviewUpdateForm" class="reviewUpdateForm">
				</div>

	  	</td>
	  </tr>
	</table>
</div>
</body>
</html>