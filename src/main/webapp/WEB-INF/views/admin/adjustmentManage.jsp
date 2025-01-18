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
	<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap-extended.min.css">
	<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/fonts/simple-line-icons/style.min.css">
	<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap.min.css">  
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <style>
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
    }
    
    .grey-bg{
			margin: 0 auto;
			margin-top: 9.5%;
		}
		.card {
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    border-radius: 8px;
	    transition: transform 0.2s, box-shadow 0.2s;
	  }
	
	  .card:hover {
	    transform: scale(1.02);
	    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
	  }
	
	  .card h4 {
	    font-size: 18px;
	    font-weight: 600;
	    color: #333;
	  }
	
	  .card h1 {
	    font-size: 28px;
	    font-weight: bold;
	    color: #4caf50; /* 강조 색상 */
	  }
	
	  .card i {
	    color: #4caf50; /* 아이콘 색상 */
	  }
	
	  .card .media {
	    align-items: center;
	  }
	  .card .media:hover {
	    cursor: pointer; 
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
	    margin-right: 30px;
    }

    table {
	    width: 100%;
	    border-collapse: collapse;
	    background-color: #fff;
	    margin-bottom: 20px;
	  }
	
	  thead th {
	    background-color: #4caf50; /* 헤더 배경색 */
	    color: #fff; /* 텍스트 색상 */
	    font-size: 14px;
	    padding: 12px;
	    text-align: center;
	    cursor: pointer; /* 정렬 가능하도록 표시 */
	  }
	
	  tbody td {
	    font-size: 13px;
	    padding: 10px;
	    text-align: center;
	    vertical-align: middle !important;
	    border-bottom: 1px solid #e0e0e0; /* 행 구분 */
	  }
	
	  tbody tr:hover {
	    background-color: #f9f9f9; /* 마우스 올릴 때 배경색 */
	  }
	
	  tbody tr:nth-child(even) {
	    background-color: #f8f9fa; /* 짝수 행 배경 */
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
	
	  .sort-icon {
	    margin-left: 5px;
	    font-size: 12px;
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
  	

	  function processAllAdjustments() {
	    if (confirm('모든 항목을 정산 처리하시겠습니까?')) {
	      // AJAX로 전체 정산 요청
	    }
	  }

	  function processSelectedAdjustments() {
	    const selected = Array.from(document.querySelectorAll('input[name="orderCheck"]:checked')).map(
	      (checkbox) => checkbox.value
	    );

	    if (selected.length === 0) {
	      alert('선택된 항목이 없습니다.');
	      return;
	    }

	    if (confirm('선택된 항목을 정산 처리하시겠습니까?')) {
	      // AJAX로 선택된 항목 정산 요청
	    }
	  }

	  function filterByStatus() {
	    const status = document.getElementById('statusFilter').value;
	    const rows = document.querySelectorAll('#orderList tr');

	    rows.forEach((row) => {
	      const rowStatus = row.querySelector('td:last-child button, span')?.innerText;
	      row.style.display =
	        status === 'all' || rowStatus.includes(status === 'YES' ? '정산 완료' : status === 'NO' ? '정산 신청' : '진행')
	          ? ''
	          : 'none';
	    });
	  }
	  
	  function sortTable(columnIndex, type) {
	    const table = document.querySelector('table');
	    const rows = Array.from(table.querySelectorAll('tbody tr'));
	    const isAscending = table.dataset.sortDirection !== 'asc';

	    rows.sort((rowA, rowB) => {
	      const cellA = rowA.cells[columnIndex].innerText.trim();
	      const cellB = rowB.cells[columnIndex].innerText.trim();

	      if (type === 'number') {
	        return isAscending
	          ? parseFloat(cellA.replace(/,/g, '')) - parseFloat(cellB.replace(/,/g, ''))
	          : parseFloat(cellB.replace(/,/g, '')) - parseFloat(cellA.replace(/,/g, ''));
	      } else {
	        return isAscending
	          ? cellA.localeCompare(cellB, 'ko')
	          : cellB.localeCompare(cellA, 'ko');
	      }
	    });

	    rows.forEach(row => table.querySelector('tbody').appendChild(row));
	    table.dataset.sortDirection = isAscending ? 'asc' : 'desc';
	  }
  </script>
</head>
<body>
	<div class="grey-bg pe-3">
	  <section id="stats-subtitle">
			<div class="row mb-4">
		    <div class="col-xl-4 col-md-12">
		      <div class="card">
		        <div class="card-content">
		          <div class="card-body cleartfix">
		            <div class="media align-items-stretch">
		              <div class="align-self-center">
		                <i class="icon-wallet success font-large-2 me-2"></i>
		              </div>
		              <div class="media-body align-self-center">
		                <h4 class="m-0">정산 대기</h4>
		              </div>
		              <div class="align-self-center">
		                <h1>${adjustment}건</h1>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		
		    <div class="col-xl-4 col-md-12">
		      <div class="card">
		        <div class="card-content">
		          <div class="card-body cleartfix">
		            <div class="media align-items-stretch">
		              <div class="align-self-center">
		                <i class="icon-wallet success font-large-2 mr-2"></i>
		              </div>
		              <div class="media-body align-self-center">
		                <h4 class="m-0">총 수수료</h4>
		              </div>
		              <div class="align-self-center">
		                <h1><fmt:formatNumber pattern="#,##0" value="${totalSell * 0.05}"/>원</h1>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		
		    <div class="col-xl-4 col-md-12">
		      <div class="card">
		        <div class="card-content">
		          <div class="card-body cleartfix">
		            <div class="media align-items-stretch">
		              <div class="align-self-center">
		                <i class="icon-wallet success font-large-2 mr-2"></i>
		              </div>
		              <div class="media-body align-self-center">
		                <h4 class="m-0">판매액</h4>
		              </div>
		              <div class="align-self-center">
		                <h1><fmt:formatNumber pattern="#,##0" value="${totalSell - totalSell * 0.05}"/>원</h1>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
	  </section>
  </div>

  <!-- 액션 버튼 -->
  <div class="action-buttons">
    <button type="button" class="btn btn-success" onclick="processAllAdjustments()">전체 정산</button>
    <button type="button" class="btn btn-warning" onclick="processSelectedAdjustments()">선택 정산</button>
  </div>

	<div class="row mb-2">
    <div class="col-md-3">
      <select id="statusFilter" class="form-control" onchange="filterByStatus()">
        <option value="all">모든 상태</option>
        <option value="NO">정산 대기</option>
        <option value="ING">정산 진행 중</option>
        <option value="YES">정산 완료</option>
      </select>
    </div>
    <div class="col-md-3">
      <input type="text" id="searchKeyword" class="form-control" placeholder="업체명 또는 상품명 검색">
    </div>
    <div class="col-md-2">
      <button class="btn btn-primary w-100" onclick="searchItems()">검색</button>
    </div>
  </div>
  <!-- 정산 상태 테이블 -->
  <div class="table-responsive pe-3">
    <table class="table table-striped">
      <thead>
			  <tr>
			  	<th><input type="checkbox" id="allcheck" onclick="allCheck()" class="allCheckBox"></th>
			    <th onclick="sortTable(1, 'text')">업체명 <i class="fas fa-sort sort-icon"></i></th>
			    <th onclick="sortTable(2, 'text')">상품명[옵션명] <i class="fas fa-sort sort-icon"></i></th>
			    <th onclick="sortTable(3, 'number')">가격 <i class="fas fa-sort sort-icon"></i></th>
			    <th onclick="sortTable(4, 'number')">수량 <i class="fas fa-sort sort-icon"></i></th>
			    <th onclick="sortTable(5, 'number')">수수료 <i class="fas fa-sort sort-icon"></i></th>
			    <th onclick="sortTable(6, 'number')">정산 금액 <i class="fas fa-sort sort-icon"></i></th>
			    <th onclick="sortTable(7, 'text')">주문일 <i class="fas fa-sort sort-icon"></i></th>
			    <th>정산 상태</th>
			  </tr>
			</thead>
      <tbody id="orderList">
        <c:forEach var="vo" items="${orderVOS}">
          <tr>
            <td><input type="checkbox" id="check${vo.idx}" name="check" value="${vo.idx}" onClick="stopPropagation(event); onCheck()"></td>
            <td>${vo.company}</td>
            <td>${vo.shopTitle}<c:if test="${!empty vo.optionSelect}">[${vo.optionSelect}]</c:if></td>
            <td><fmt:formatNumber value="${vo.price}" />원</td>
            <td>${vo.quantity}개</td>
            <td><fmt:formatNumber value="${vo.pay * 0.05 * vo.quantity}" />원</td>
            <td><fmt:formatNumber value="${(vo.pay * vo.quantity) - (vo.pay * 0.05 * vo.quantity)}" />원</td>
            <td>${fn:substring(vo.orderDate, 0, 10)}</td>
            <td>
						  <c:choose>
						    <c:when test="${vo.adjustment == 'NO'}">
						      <button class="btn btn-outline-primary btn-sm" onclick="adjustment(${vo.idx})">정산</button>
						    </c:when>
						    <c:when test="${vo.adjustment == 'ING'}">
						      <button class="btn btn-outline-warning btn-sm" disabled>정산 진행 중</button>
						    </c:when>
						    <c:when test="${vo.adjustment == 'YES'}">
						      <span class="text-success">정산 완료</span>
						    </c:when>
						  </c:choose>
						</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <c:set var="minIdx" value="${orderVOS[0].idx}"/>
	  <c:set var="maxSize" value="${fn:length(orderVOS)-1}"/>
	  <c:set var="maxIdx" value="${orderVOS[maxSize].idx}"/>
	  <input type="hidden" id="minIdx" name="minIdx" value="${minIdx}"/>
	  <input type="hidden" id="maxIdx" name="maxIdx" value="${maxIdx}"/>
  </div>
</body>
</html>
