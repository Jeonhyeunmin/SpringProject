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
	      $.ajax({
	    	  type : "post",
	    	  url : "${ctp}/admin/allAdjustment",
	    	  success: function(res) {
						if(res != "0"){
							alerrt("모든 항목을 정산처리하였습니다.");
						}
						else{
							alert("정산해야 할 내역이 없습니다.");
						}
					},
					error: function() {
						alert("전송오류");
					}
	      });
	    }
	  }

	  function processSelectedAdjustments() {
		  let idxArr = "";
	  	  let checkboxes = document.getElementsByName("check");
	  	  
	  	  for (let i = 0; i < checkboxes.length; i++) {
	  	    if (checkboxes[i].checked) {
	  	      idxArr += checkboxes[i].value + "/";
	  	    }
	  	  }
	    	idxArr = idxArr.substring(0,idxArr.length-1);
	    	
	    	if(idxArr == ""){
	    		alert("체크된 항목이 없습니다.");
	    		return false;
	    	}
	    	
				let ans = confirm("선택하신 항목들을 정산하시겠습니까?");
	    	
	    	if(ans){
		    	$.ajax({
		    		type : "post",
		    		url : "${ctp}/admin/selectAdjustment",
		    		data : {
		    			idxArr : idxArr
		    		},
		    		success: function(res) {
		    			if(res != "0"){
			    			alert("정산이 완료되었습니다.");
								location.reload();
		    			}
						},
						error: function() {
							alert("전송오류");
						}
		    	});
	    	}
	  }

	  function filterByStatus() {
		  const status = document.getElementById('statusFilter').value; // 선택한 상태값
		  const rows = document.querySelectorAll('#orderList tr');

		  rows.forEach((row) => {
		    const rowStatusElement = row.querySelector('td:last-child button, span');
		    const rowStatus = rowStatusElement ? rowStatusElement.innerText.trim() : '';

		    if (status === 'all') {
		      row.style.display = ''; // 모든 상태 표시
		    } else if (status === 'YES' && rowStatus === '정산 완료') {
		      row.style.display = ''; // 정산 완료 상태만 표시
		    } else if (status === 'ING' && row.querySelector('button')?.innerText === '정산') {
		      row.style.display = ''; // 정산 대기 상태만 표시
		    } else {
		      row.style.display = 'none'; // 그 외는 숨김
		    }
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
	  
	  function adjustment(idx) {
			if(confirm("정산처리하시겠습니까?")){
				$.ajax({
					type : "post",
					url : "${ctp}/admin/adjustment",
					data : {
						idx : idx
					},
					success: function(res) {
						if(res != "0"){
							alert("정산이 완료되었습니다.");
							location.reload();
						}
					},
					error: function() {
						alert("전송오류");
					}
				});
			}
		}
	  
	  function searchItems() {
		  const keyword = document.getElementById('searchKeyword').value.trim();

		  if (!keyword) {
		    alert('검색어를 입력하세요.');
		    return;
		  }

		  $.ajax({
		    type: 'GET',
		    url: '${ctp}/admin/searchOrders',
		    data: { keyword },
		    success: function(response) {
		    	updateTable(response);
		    },
		    error: function() {
		      alert('검색 요청 중 오류가 발생했습니다.');
		    }
		  });
		}

	  function updateTable(data) {
		  const tbody = document.getElementById('orderList');
		  tbody.innerHTML = ''; // 기존 내용 제거

		  if (data.length === 0) {
		    // 검색 결과가 없을 경우
		    tbody.innerHTML = '<tr><td colspan="9" class="text-center">검색 결과가 없습니다.</td></tr>';
		    return;
		  }

		  // 데이터 순회하며 테이블 행 생성
		  for (var i = 0; i < data.length; i++) {
		    var vo = data[i];
		    var tr = '<tr>';

		    // 체크박스
		    tr += '<td><input type="checkbox" id="check' + vo.idx + '" name="check" value="' + vo.idx + '" onclick="stopPropagation(event); onCheck()"></td>';

		    // 업체명
		    tr += '<td>' + vo.company + '</td>';

		    // 상품명 및 옵션명
		    tr += '<td>' + vo.shopTitle;
		    if (vo.optionSelect) {
		      tr += ' [' + vo.optionSelect + ']';
		    }
		    tr += '</td>';

		    // 가격
		    tr += '<td>' + vo.price.toLocaleString() + '원</td>';

		    // 수량
		    tr += '<td>' + vo.quantity + '개</td>';

		    // 수수료
		    var fee = vo.pay * 0.05 * vo.quantity;
		    tr += '<td>' + fee.toLocaleString() + '원</td>';

		    // 정산 금액
		    var adjustmentAmount = (vo.pay * vo.quantity) - fee;
		    tr += '<td>' + adjustmentAmount.toLocaleString() + '원</td>';

		    // 주문일
		    tr += '<td>' + vo.orderDate.substring(0, 10) + '</td>';

		    // 정산 상태
		    tr += '<td>';
		    if (vo.adjustment === 'ING') {
		      tr += '<button class="btn btn-outline-primary btn-sm" onclick="adjustment(' + vo.idx + ')">정산</button>';
		    } else if (vo.adjustment === 'YES') {
		      tr += '<span class="text-success">정산 완료</span>';
		    }
		    tr += '</td>';

		    tr += '</tr>';

		    // 생성된 행 추가
		    tbody.innerHTML += tr;
		  }
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
		                <h4 class="m-0">정산 신청 금액</h4>
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
        <option value="ING">정산 대기</option>
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
						    <c:when test="${vo.adjustment == 'ING'}">
						      <button class="btn btn-outline-primary btn-sm" onclick="adjustment(${vo.idx})">정산</button>
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
