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
  <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap-extended.min.css">
	<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/fonts/simple-line-icons/style.min.css">
	<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/colors.min.css">
	<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap.min.css">
	<style type="text/css">
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
	  
	  table {
	    margin: 20px auto; /* 테이블을 중앙에 배치 */
	    width: 95%; /* 테이블 너비를 95%로 설정 */
		}
		
		thead th {
	    font-size: 16px;
	    text-transform: uppercase;
	    cursor: pointer;
		}
		
		tbody td {
	    vertical-align: middle !important; /* 내용의 세로 정렬을 중앙으로 설정 */
	    font-size: 18px;
		}
		
		.text-truncate {
	    white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
		}
		
		.allCheckBox {
      width: 20px;
      height: 20px;
      margin: 0;
      border-radius: 0;
      vertical-align: middle !important;
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
	</style>
	<script>
		function applyFilters() {
		  // 필터값 가져오기
		  const keyword = document.getElementById('searchKeyword').value.trim(); // 검색 키워드
		  const status = document.getElementById('orderStatusFilter').value; // 상태 필터
		  const date = document.getElementById('dateFilter').value; // 날짜 필터

		  $.ajax({
		    url: '${ctp}/admin/filterOrders', // 필터링된 주문 데이터를 처리할 서버 엔드포인트
		    type: 'POST', // POST 요청
		    data: {
		        keyword: keyword,
		        status: status,
		        date: date,
		      },
		    success: function (response) {
		      // 서버에서 반환된 데이터로 테이블 업데이트
		      updateOrderTable(response);
		    },
		    error: function (error) {
		      alert('필터 적용 중 오류가 발생했습니다.');
		      console.error('Error:', error);
		    },
		  });
		}

		// 테이블 업데이트 함수
		function updateOrderTable(orders) {
		  const tbody = document.querySelector('table tbody');
		  tbody.innerHTML = ''; // 기존 테이블 내용 초기화

		  // 데이터 렌더링
		  orders.forEach((order) => {
			  var row = 
			    '<tr>' +
			        '<td><img src="${ctp}/category/' + order.thumbnail + '" width="20px"></td>' +
			        '<td>' + order.shopTitle + '</td>' +
			        '<td>' + order.company + '</td>' +
			        '<td>' + new Intl.NumberFormat().format(order.price) + ' 원</td>' +
			        '<td>' + order.orderDate.substring(0, 10) + '</td>' +
			        '<td>' +
			            '<span class="badge ' + 
			                (order.delivery === '배송완료' ? 'bg-success' : (order.delivery === '배송중' ? 'bg-warning' : 'bg-secondary')) + 
			            '">' + order.delivery + '</span>' +
			        '</td>' +
			        '<td>' +
			            '<button class="btn btn-sm btn-info" onclick="viewDetails(' + order.idx + ')">' +
			                '<i class="fas fa-eye"></i> 상세' +
			            '</button>' +
			        '</td>' +
			    '</tr>';
		    tbody.insertAdjacentHTML('beforeend', row);
		  });
		}

	
		function viewDetails(idx) {
		  // AJAX로 서버에서 주문 상세 데이터 요청
		  $.ajax({
		    url: '${ctp}/admin/orderDetails',
		    type: 'GET',
		    data: { idx: idx },
		    success: function (response) {
		      var details = 
		        '<p><img src="${ctp}/category/'+ response.thumbnail + '" width="100px"></p>' +
		        '<p><strong>상품명:</strong> ' + response.shopTitle + '</p>' +
		        '<p><strong>업체명:</strong> ' + response.company + '</p>' +
		        '<p><strong>가격:</strong> ' + new Intl.NumberFormat().format(response.price) + ' 원</p>' +
		        '<p><strong>주문일:</strong> ' + response.orderDate + '</p>' +
		        '<p><strong>상태:</strong> ' + response.delivery + '</p>';

		      // 모달의 내용 업데이트
		      document.getElementById('orderDetailsContent').innerHTML = details;

		      // 모달 열기
		      $('#orderDetailsModal').modal('show');
		    },
		    error: function (error) {
		      alert('주문 상세 정보를 불러오는 데 실패했습니다.');
		      console.error('Error:', error);
		    },
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
	<div class="grey-bg container-fluid">
	  <div class="row">
	    <div class="col-xl-6 col-md-12">
	      <div class="card">
	        <div class="card-content">
	          <div class="card-body cleartfix">
	            <div class="media align-items-stretch">
	              <div class="align-self-center">
	                <i class="icon-heart danger font-large-2 mr-2"></i>
	              </div>
	              <div class="media-body align-self-center">
	                <h4 class="m-0">판매</h4>
	              </div>
	              <div class="align-self-center"> 
	                <h1><fmt:formatNumber pattern="#,##0" value="${fn: length(orderVOS)}"/>건</h1>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	    
	    <div class="col-xl-6 col-md-12">
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
	                <h1><fmt:formatNumber pattern="#,##0" value="${totalSell}"/>원</h1>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
		
		<div class="row mb-1">
		  <div class="col-md-4">
		    <input type="text" id="searchKeyword" class="form-control" placeholder="상품명, 업체명 검색">
		  </div>
		  <div class="col-md-3">
		    <select id="orderStatusFilter" class="form-control">
		      <option value="">상태별 필터</option>
		      <option value="배송준비">배송준비</option>
		      <option value="배송중">배송중</option>
		      <option value="배송완료">배송완료</option>
		    </select>
		  </div>
		  <div class="col-md-2">
		    <input type="datetime-local" id="dateFilter" class="form-control">
		  </div>
		  <div class="col-md-3">
		    <button class="btn btn-primary w-100" onclick="applyFilters()">검색</button>
		  </div>
		</div>
		
	  <table class="table table-bordered table-hover table-striped text-center align-middle">
		  <thead class="thead-dark">
		    <tr>
		      <th>제품사진</th>
		      <th onclick="sortTable(1, 'text')">상품명  <i class="fas fa-sort sort-icon"></i></th>
		      <th onclick="sortTable(2, 'text')">업체명  <i class="fas fa-sort sort-icon"></i></th>
		      <th onclick="sortTable(3, 'number')">가격  <i class="fas fa-sort sort-icon"></i></th>
		      <th onclick="sortTable(4, 'text')">주문일  <i class="fas fa-sort sort-icon"></i></th>
		      <th onclick="sortTable(5, 'text')">확정상태  <i class="fas fa-sort sort-icon"></i></th>
		      <th onclick="sortTable(6, 'text')">상태  <i class="fas fa-sort sort-icon"></i></th>
		      <th>작업</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach var="vo" items="${vos}">
		      <tr>
		        <td><img src="${ctp}/category/${vo.thumbnail}" width="20px"></td>
		        <td>${vo.shopTitle}</td>
		        <td>${vo.company}</td>
		        <td><fmt:formatNumber pattern="#,##0" value="${vo.price}"/></td>
		        <td>${fn:substring(vo.orderDate, 0, 10)}</td>
		        <td>
		          <span class="badge ${vo.decide == '구매확정' ? 'bg-success' : vo.decide == '교환 및 환불' ? 'bg-danger' : 'bg-secondary'}">
		            ${vo.decide == 'NO' ? '확정 전' : vo.decide}
		          </span>
		        </td>
		        <td>
		          <span class="badge ${vo.delivery == '배송완료' ? 'bg-success' : vo.delivery == '배송중' ? 'bg-warning' : 'bg-secondary'}">
		            ${vo.delivery}
		          </span>
		        </td>
		        <td>
		          <button class="btn btn-sm btn-info" onclick="viewDetails(${vo.idx})"><i class="fas fa-eye"></i> 상세</button>
		        </td>
		      </tr>
		    </c:forEach>
		  </tbody>
		</table>
		
		<!-- 모달 구현 -->
		<div class="modal fade" id="orderDetailsModal" tabindex="-1" aria-labelledby="orderDetailsModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="orderDetailsModalLabel">주문 상세 정보</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body" id="orderDetailsContent">
		        <!-- 상세 내용은 AJAX로 로드 -->
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- 블록페이지 시작 -->
		<div class="text-center">
		  <ul class="pagination justify-content-center">
			  <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/orderManage?part=${part}&pag=1&pageSize=${pageSize}">첫페이지</a></li></c:if>
			  <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/orderManage?part=${part}&pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}">이전블록</a></li></c:if>
			  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize) + blockSize}" varStatus="st">
			    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/admin/orderManage?part=${part}&pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
			    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/orderManage?part=${part}&pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
			  </c:forEach>
			  <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/orderManage?part=${part}&pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a></li></c:if>
			  <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/orderManage?part=${part}&pag=${totPage}&pageSize=${pageSize}">마지막페이지</a></li></c:if>
		  </ul>
		</div>
		<!-- 블록페이지 끝 -->
		<c:set var="minIdx" value="${vos[0].idx}"/>
	  <c:set var="maxSize" value="${fn:length(vos)-1}"/>
	  <c:set var="maxIdx" value="${vos[maxSize].idx}"/>
	  <input type="hidden" id="minIdx" name="minIdx" value="${minIdx}"/>
	  <input type="hidden" id="maxIdx" name="maxIdx" value="${maxIdx}"/>
  </div>
</body>
</html>