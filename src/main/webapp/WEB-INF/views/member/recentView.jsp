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
  	@font-face { /*눈누 기초고딕 - 두꺼운 네모 딱딱 고딕*/
	    font-family: 'NoonnuBasicGothicRegular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
		}
		
    body {
      background-color: #f9f9f9;
      margin: 0;
      padding: 20px;
    }

    .container {
    	font-family: 'NoonnuBasicGothicRegular';
      max-width: 1200px;
      margin: 0 auto;
    }

    .header {
      margin-bottom: 20px;
    }

    .product-card {
      display: flex;
      align-items: center;
      justify-content: space-between;
      background: #fff;
      margin-bottom: 15px;
      padding: 15px;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .product-card img {
      width: 80px;
      height: 80px;
      object-fit: cover;
      border-radius: 8px;
      margin-right: 15px;
    }

    .product-details {
      display: flex;
      flex: 1;
      align-items: center;
    }

    .product-info {
      flex: 1;
    }

    .product-info h5 {
      margin: 0 0 5px;
      font-size: 16px;
      font-weight: bold;
    }

    .product-info p {
      margin: 0;
      font-size: 14px;
      color: #666;
    }

    .product-actions {
      display: flex;
      align-items: center;
    }

    .btn {
      padding: 8px 12px;
      font-size: 14px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      margin-left: 10px;
    }

    .btn-primary {
      background-color: #007bff;
      color: white;
    }

    .btn-primary:hover {
      background-color: #0056b3;
    }

    .btn-danger {
      background-color: #dc3545;
      color: white;
    }

    .btn-danger:hover {
      background-color: #bd2130;
    }

    .checkbox {
      margin-right: 15px;
    }
    
    .selectDelete {
      background-color: transparent;
      border: 1px solid #ddd;
      font-size: 15px;
      padding: 5px 15px;
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
		
		.cart-list-check{
			margin-bottom: 15px;
		}
  </style>
  <script type="text/javascript">
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
  	
  	function stopPropagation(event) {
	    event.stopPropagation(); // 이벤트 버블링을 중단
	  }
  	
  	function cookieShopDelete(idx) {
			$.ajax({
				type : "post",
			url  : "${ctp}/member/cookieShopDelete",
			data : {idx : idx},
			success:function() { location.reload(); },
			error : function() { alert("전송오류!"); }
			});
		}
  	
  	function selectCookieDelete() {
  		let idxArr = "";
  	  let checkboxes = document.getElementsByName("check");
  	  
  	  for (let i = 0; i < checkboxes.length; i++) {
  	    if (checkboxes[i].checked) {
  	      idxArr += checkboxes[i].value + "/";
  	    }
  	  }
    	idxArr = idxArr.substring(0,idxArr.length-1);
    	
    	if(idxArr == ""){
    		alert("체크된 게시물이 없습니다.");
    		return false;
    	}
    	
    	$.ajax({
    		type : "post",
    		url : "${ctp}/member/selectCookitDelete",
    		data : {
    			idxArr : idxArr
    		},
    		success: function(res) {
    			if(res != "0"){
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
  <div class="header">
    <h4>최근 본 상품</h4>
  </div>
  <div class="cart-list-check">
    <input type="checkbox" id="allcheck" onclick="allCheck()" class="allCheckBox">
    <button type="button" class="selectDelete" onclick="selectCookieDelete()">선택삭제</button>
  </div>

  <div class="product-list">
  	<c:if test="${empty cookieVOS}">
  		<div class="empty-cart">
		    <h3>최근 본 상품이 없습니다.</h3>
		  </div>
  	</c:if>
    <c:forEach var="vo" items="${cookieVOS}">
      <div class="product-card">
        <div class="checkbox">
          <input type="checkbox" id="check${vo.idx}" name="check" value="${vo.idx}">
        </div>
        <div class="product-details">
          <img src="${ctp}/category/${vo.thumbnail}" alt="상품 이미지">
          <div class="product-info">
            <h5>${vo.title}</h5>
            <p>${vo.company}</p>
            <p><strong><fmt:formatNumber pattern="#,##0" value="${vo.price}"/>원</strong></p>
            <p>
              <span>⭐ ${vo.star}점</span> | <span>${vo.reviewCnt}개 </span>
            </p>
          </div>
        </div>
        <div class="product-actions">
          <button class="btn btn-primary" onclick="window.open('${ctp}/shop/shopContent?idx=${vo.idx}')">상품 바로가기</button>
          <button class="btn btn-danger" onclick="cookieShopDelete(${vo.idx})">삭제</button>
        </div>
      </div>
    </c:forEach>
  </div>
  <c:set var="maxIdx" value="${cookieVOS[0].idx}"/>
  <c:set var="maxSize" value="${fn:length(cookieVOS)-1}"/>
  <c:set var="minIdx" value="${cookieVOS[maxSize].idx}"/>
  <input type="hidden" id="minIdx" name="minIdx" value="${minIdx}"/>
  <input type="hidden" id="maxIdx" name="maxIdx" value="${maxIdx}"/>
</body>
</html>
