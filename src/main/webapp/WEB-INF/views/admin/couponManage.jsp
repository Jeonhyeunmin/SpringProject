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
  <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap-extended.min.css">
	<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/fonts/simple-line-icons/style.min.css">
	<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/colors.min.css">
	<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap.min.css">
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <style type="text/css">
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
  	
  	function searchItems() {
	    const startDate = document.getElementById('startDate').value;
	    const endDate = document.getElementById('endDate').value;
	    const keyword = document.getElementById('searchKeyword').value;
	    
	    if (startDate && endDate && new Date(startDate) > new Date(endDate)) {
        alert('시작일이 종료일보다 늦을 수 없습니다.');
        return;
      }
	    
	    $.ajax({
        url: '${ctp}/admin/searchCoupons',
        type: 'GET',
        data: {
          startDate: startDate,
          endDate: endDate,
          keyword: keyword
        },
        dataType: 'json',
        success: function(response) {
        	updateTable(response)
        },
        error: function(xhr, status, error) {
          console.error('검색 요청 실패:', error);
          alert('검색 요청 중 오류가 발생했습니다.');
        }
      });
	  }
  	
  	function updateTable(data) {
  	  const tbody = document.getElementById('orderList');
  	  tbody.innerHTML = ''; // 기존 테이블 내용 초기화

  	  if (data.length === 0) {
  	    const noResultRow = document.createElement('tr');
  	    const noResultCell = document.createElement('td');
  	    noResultCell.colSpan = 7;
  	    noResultCell.textContent = '검색 결과가 없습니다.';
  	    noResultRow.appendChild(noResultCell);
  	    tbody.appendChild(noResultRow);
  	    return;
  	  }

  	  data.forEach(function(vo) {
		    const row = document.createElement('tr');
	
		    const checkboxCell = document.createElement('td');
		    const checkbox = document.createElement('input');
		    checkbox.type = 'checkbox';
		    checkbox.id = 'check' + vo.idx;
		    checkbox.name = 'check';
		    checkbox.value = vo.idx;
		    checkbox.setAttribute('onclick', 'stopPropagation(event); onCheck()');
		    checkboxCell.appendChild(checkbox);
		    row.appendChild(checkboxCell);
	
		    const couponNameCell = document.createElement('td');
		    couponNameCell.textContent = vo.couponName;
		    row.appendChild(couponNameCell);
	
		    const discountCell = document.createElement('td');
		    discountCell.textContent = vo.discount + ' ' + vo.saleUnit;
		    row.appendChild(discountCell);
	
		    const periodCell = document.createElement('td');
		    periodCell.textContent = vo.startDate + ' ~ ' + vo.endDate;
		    row.appendChild(periodCell);
	
		    const statusCell = document.createElement('td');
		    statusCell.textContent = vo.status === 'used' ? '사용' : '미사용';
		    row.appendChild(statusCell);
	
		    const createDateCell = document.createElement('td');
		    createDateCell.textContent = vo.createDate;
		    row.appendChild(createDateCell);
	
		    const useDateCell = document.createElement('td');
		    useDateCell.textContent = vo.useDate ? vo.useDate : '미사용쿠폰';
		    row.appendChild(useDateCell);
	
		    tbody.appendChild(row);
		  });
		}
	</script>
</head>
<body>
  <div class="grey-bg container-fluid">
	  <section id="stats-subtitle">
		  <div class="row">
		    <div class="col-xl-12 col-md-12">
		      <div class="card overflow-hidden">
		        <div class="card-content">
		          <div class="card-body cleartfix">
		            <div class="media align-items-stretch">
		              <div class="align-self-center">
		                <i class="fas fa-ticket-alt font-large-2 mr-2"></i>
		              </div>
		              <div class="media-body align-self-center">
		                <h4 class="m-0">쿠폰 발급 수</h4>
		              </div>
		              <div class="align-self-center">
		                <h1><fmt:formatNumber pattern="#,##0" value="${fn: length(couponVOS)}"/>개</h1>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
	  </section>
	
		<div class="search-container input-group">
		  <input type="datetime-local" id="startDate" class="form-control" placeholder="시작일">
		  <input type="datetime-local" id="endDate" class="form-control" placeholder="종료일">
		  <input type="text" id="searchKeyword" class="form-control" placeholder="쿠폰명 검색">
		  <button class="btn btn-success" onclick="searchItems()">검색</button>
		</div>
		
	  <div class="table-responsive pe-3">
	    <table class="table table-striped">
	      <thead>
				  <tr>
				  	<th><input type="checkbox" id="allcheck" onclick="allCheck()" class="allCheckBox"></th>
				    <th onclick="sortTable(1, 'text')">고객 ID <i class="fas fa-sort sort-icon"></i></th>
				    <th onclick="sortTable(2, 'text')">쿠폰명 <i class="fas fa-sort sort-icon"></i></th>
				    <th onclick="sortTable(3, 'text')">할인률 <i class="fas fa-sort sort-icon"></i></th>
				    <th onclick="sortTable(4, 'text')">기간 <i class="fas fa-sort sort-icon"></i></th>
				    <th onclick="sortTable(5, 'text')">사용여부 <i class="fas fa-sort sort-icon"></i></th>
				    <th onclick="sortTable(6, 'text')">발급일자 <i class="fas fa-sort sort-icon"></i></th>
				    <th onclick="sortTable(7, 'text')">사용일자 <i class="fas fa-sort sort-icon"></i></th>
				  </tr>
				</thead>
	      <tbody id="orderList">
	        <c:forEach var="vo" items="${couponVOS}">
	          <tr>
	            <td><input type="checkbox" id="check${vo.idx}" name="check" value="${vo.idx}" onClick="stopPropagation(event); onCheck()"></td>
	            <td>${vo.mid}</td>
	            <td>${vo.couponName}</td>
	            <td>${vo.discount} ${vo.saleUnit}</td>
	            <td>${fn: substring(vo.startDate, 0, 10)} ~ ${fn: substring(vo.endDate, 0, 10)}</td>
	            <td>${vo.status == 'used' ? '사용' : '미사용'}</td>
	            <td>${fn:substring(vo.createDate, 0, 10)}</td>
	            <td>
	            	<c:if test="${!empty vo.createDate}">${fn:substring(vo.createDate, 0, 10)}</c:if>
	            	<c:if test="${empty vo.createDate}">미사용쿠폰</c:if>
            	</td>
	          </tr>
	        </c:forEach>
	      </tbody>
	    </table>
	    <c:set var="maxIdx" value="${couponVOS[0].idx}"/>
		  <c:set var="maxSize" value="${fn:length(couponVOS)-1}"/>
		  <c:set var="minIdx" value="${couponVOS[maxSize].idx}"/>
		  <input type="hidden" id="minIdx" name="minIdx" value="${minIdx}"/>
		  <input type="hidden" id="maxIdx" name="maxIdx" value="${maxIdx}"/>
	  </div>
  </div>
</body>
</html>