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
      font-family: 'NoonnuBasicGothicRegular';
      margin: 0;
      padding: 0;
    }

    .list-container {
      padding: 20px;
      border-radius: 10px;
    }

    h4 {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 20px;
      color: #333;
      text-align: left;
    }

    .table-responsive {
      overflow-x: auto;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    thead th {
      background-color: #e1c699;
      color: #ffffff;
      font-size: 14px;
      padding: 10px;
      text-align: center;
    }

    tbody td {
      font-size: 13px;
      padding: 10px;
      text-align: center;
      vertical-align: middle !important;
    }

    tbody tr:nth-child(even) {
      background-color: #f8f9fa;
    }

    tbody tr:hover {
      background-color: #f1f1f1;
    }

    .text-success {
      color: #28a745;
      font-weight: bold;
    }

    .text-danger {
      color: #dc3545;
      font-weight: bold;
    }

    .text-warning {
      color: #ffc107;
      font-weight: bold;
    }

    .no-data {
      font-size: 16px;
      font-weight: bold;
      text-align: center;
      color: #999;
      padding: 20px 0;
    }

    a {
      text-decoration: none;
    }
    
    .btn {
      padding: 8px 15px;
      font-size: 12px;
      font-weight: bold;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .btn-apply {
      background-color: #28a745;
      color: #ffffff;
    }

    .btn-apply:hover {
      background-color: #218838;
    }

    .btn-progress {
      background-color: #ffc107;
      color: #ffffff;
      cursor: not-allowed;
    }

    .btn-progress:hover {
      background-color: #ffc107;
    }
    
    .action-buttons {
	    display: flex;
	    gap: 10px;
	    margin-bottom: 20px;
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
	  .action-buttons .btn-accept-all {
	    background-color: #007bff;
	  }
	  .action-buttons .btn-accept-all:hover {
	    background-color: #0056b3;
	  }
	  .action-buttons .btn-accept-select {
	    background-color: #e35c61;
	  }
	  .action-buttons .btn-accept-select:hover {
	    background-color: #ac3f43;
	  }
	  .action-buttons button:active {
	    transform: scale(0.95);
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
	    event.stopPropagation();
	  }
  	function adjustment(idx) {
			$.ajax({
				type:"post",
				url:"${ctp}/partner/adjustment",
				data : {
					idx : idx
				},
				success: function(res) {
					if(res != "0"){
						alert("정산 신청이 완료되었습니다 수수료 5%가 발생할 예정입니다.");
						location.reload();
					}
				},
				error: function() {
					alert("전송오류");
				}
			});
		}
  	
  	function allApplication() {
			if(confirm("전부 정산 신청하시겠습니까?")){
				$.ajax({
					type : "post",
					url :"${ctp}/partner/allApplication",
					success: function(res) {
						if(res != "0"){
							alert("모든 항목을 정산신청 하였습니다");
							location.reload();
						}
					},
					error: function() {
						alert("전송오류");
					}
				});
				
			}
		}
  	
  	
  	function selectApplication() {
  		let idxArr = "";
  	  let checkboxes = document.getElementsByName("check");
  	  
  	  for (let i = 0; i < checkboxes.length; i++) {
  	    if (checkboxes[i].checked) {
  	      idxArr += checkboxes[i].value + "/";
  	    }
  	  }
    	idxArr = idxArr.substring(0,idxArr.length-1);
    	
    	if(idxArr == ""){
    		alert("체크된 주문내역이 없습니다 없습니다.");
    		return false;
    	}
    	
			let ans = confirm("선택된 내역을 정산신청 하시겠습니까?");
    	
    	if(ans){
	    	$.ajax({
	    		type : "post",
	    		url : "${ctp}/partner/selectApplication",
	    		data : {
	    			idxArr : idxArr
	    		},
	    		success: function(res) {
	    			if(res != "0"){
		    			alert("정산신청 완료 하였습니다.");
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
  <div class="list-container">
    <h4>정산 상태</h4>
    <div class="table-responsive">
    	<div class="action-buttons">
			  <button type="button" onclick="allApplication()" class="btn-accept-all">전체 신청</button>
			  <button type="button" class="btn-accept-select" onclick="selectApplication()">선택 신청</button>
			</div>
      <table class="table table-striped table-bordered">
        <thead>
          <tr>
          	<th><input type="checkbox" id="allcheck" onclick="allCheck()" class="allCheckBox"></th>
            <th>업체명</th>
            <th>상품명[옵션명]</th>
            <th>가격</th>
            <th>수량</th>
            <th>업체 할인</th>
            <th>할인 금액</th>
            <th>수수료</th>
            <th>정산 금액</th>
            <th>주문일</th>
            <th>정산 상태</th>
          </tr>
        </thead>
        <tbody>
          <c:choose>
            <c:when test="${fn:length(orderVOS) == 0}">
              <tr>
                <td colspan="10" class="no-data">정산 받을 내역이 없습니다.</td>
              </tr>
            </c:when>
            <c:otherwise>
              <c:forEach var="vo" items="${orderVOS}" varStatus="status">
                <c:if test="${vo.decide == '구매확정' && vo.delivery == '배송완료'}">
                  <tr>
                  	<td><input type="checkbox" id="check${vo.idx}" name="check" value="${vo.idx}" onClick="stopPropagation(event); onCheck()"></td>
                    <td>${vo.company}</td>
                    <td>
                      <a href='${ctp}/partner/orderDetail?idx=${vo.idx}'>
                        ${vo.shopTitle}<c:if test="${!empty vo.optionSelect}">[${vo.optionSelect}]</c:if>
                      </a>
                    </td>
                    <td><fmt:formatNumber value="${vo.price}" />원</td>
                    <td>${vo.quantity}개</td>
                    <td>
                      <c:if test="${vo.discount != 0}">${vo.discount}%</c:if>
                      <c:if test="${vo.discount == 0}">할인 없음</c:if>
                    </td>
                    <td><fmt:formatNumber value="${(vo.price * vo.discount / 100) * vo.quantity}" />원</td>
                    <td><fmt:formatNumber value="${vo.pay * 0.05 * vo.quantity}" />원</td>
                    <td><fmt:formatNumber value="${(vo.pay * vo.quantity) - (vo.pay * 0.05 * vo.quantity)}" />원</td>
                    <td>${fn:substring(vo.orderDate, 0, 10)}</td>
                    <td>
									    <c:if test="${vo.adjustment == 'NO'}">
								        <button class="btn btn-apply" onclick="adjustment(${vo.idx})">정산 신청</button>
									    </c:if>
									    <c:if test="${vo.adjustment == 'ING'}">
								        <button class="btn btn-progress" disabled>${vo.adjustment}</button>
									    </c:if>
									    <c:if test="${vo.adjustment == 'YES'}">
								        <span class="text-success">정산완료</span>
									    </c:if>
										</td>
                  </tr>
                </c:if>
              </c:forEach>
            </c:otherwise>
          </c:choose>
        </tbody>
      </table>
    </div>
  </div>
  <c:set var="maxIdx" value="${orderVOS[0].idx}"/>
  <c:set var="maxSize" value="${fn:length(orderVOS)-1}"/>
  <c:set var="minIdx" value="${orderVOS[maxSize].idx}"/>
  <input type="hidden" id="minIdx" name="minIdx" value="${minIdx}"/>
  <input type="hidden" id="maxIdx" name="maxIdx" value="${maxIdx}"/>
</body>
</html>
