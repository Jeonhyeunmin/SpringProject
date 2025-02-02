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

    .btn-activate {
      background-color: #28a745;
    }

    .btn-activate:hover {
      background-color: #1e7e34;
    }

    .btn-deactivate {
      background-color: #dc3545;
    }

    .btn-deactivate:hover {
      background-color: #a71d2a;
    }

    .btn-delete {
      background-color: #007bff;
    }

    .btn-delete:hover {
      background-color: #0056b3;
    }

    .btn-filter {
      background-color: #17a2b8;
    }

    .btn-filter:hover {
      background-color: #117a8b;
    }
	</style>
	<script>
		function stopPropagation(event) {
	    event.stopPropagation(); // 이벤트 버블링을 중단
	  }
		
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
  	
    function applyFilters() {
      const keyword = document.getElementById('searchKeyword').value.trim();
      const status = document.getElementById('eventStatusFilter').value;

      $.ajax({
        url: '${ctp}/admin/filterEvents',
        type: 'POST',
        data: {
          keyword: keyword,
          status: status,
        },
        success: function (response) {
          updateEventTable(response);
        },
        error: function (error) {
          alert('필터 적용 중 오류가 발생했습니다.');
          console.error('Error:', error);
        },
      });
    }

    function updateEventTable(events) {
  	  const tbody = document.querySelector('table tbody');
  	  tbody.innerHTML = ''; // 기존 테이블 내용 초기화

  	  if (events.length === 0) {
  	    // 검색 결과가 없을 경우
  	    tbody.innerHTML = '<tr><td colspan="10">검색 결과가 없습니다.</td></tr>';
  	    return;
  	  }

  	  // 데이터 순회하며 테이블 행 생성
  	  events.forEach(function(event) {
  		  if(event.status != "종료"){
	  	    var row = '<tr>';
	
	  	    // 체크박스 열
	  	    row += '<td><input type="checkbox" id="check' + event.idx + '" class="eventCheck" name="check" value="' + event.idx + '"></td>';
	
	  	    // 이벤트 사진
	  	    row += '<td><img src="${ctp}/event/' + event.thumbnail + '" width="20px"></td>';
	
	  	    // 이벤트 제목
	  	    row += '<td>' + event.title + '</td>';
	
	  	    // 이벤트 설명
	  	    row += '<td>' + event.subTitle + '</td>';
	
	  	    // 쿠폰 이름
	  	    row += '<td>' + event.couponName + '</td>';
	
	  	    // 쿠폰 할인률
	  	    row += '<td>' + event.discount + event.saleUnit + '</td>';
	
	  	    // 이벤트 기간
	  	    row += '<td>' + event.startDate.substring(0, 10) + ' ~ ' + event.endDate.substring(0, 10) + '</td>';
	
	  	    // 업로드 날짜
	  	    row += '<td>' + event.uploadDate.substring(0, 10) + '</td>';
	
	  	    // 상태
	  	    var statusClass = event.status === 'active' ? 'bg-success' : (event.status === '종료' ? 'bg-danger' : 'bg-secondary');
	  	    var statusLabel = event.status === 'active' ? '진행중' : (event.status === '종료' ? '종료' : '비활성화');
	  	    row += '<td><span class="badge ' + statusClass + '">' + statusLabel + '</span></td>';
	
	  	    // 관리 버튼
	  	    row += '<td>';
	  	    if (event.status === 'active') {
	  	      row += '<button class="btn btn-sm btn-warning" onclick="deactiveEvent(' + event.idx + ')">비활성화</button>';
	  	    } else if (event.status === 'deactive') {
	  	      row += '<button class="btn btn-sm btn-activate" onclick="activeEvent(' + event.idx + ')">활성화</button>';
	  	    }
	  	    row += '</td>';
	
	  	    row += '</tr>';

  	    	// 생성된 행 추가
  	    	tbody.innerHTML += row;
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
		
		function activeEvent(idx) {
			if(confirm("이벤트를 활성화 하시겠습니까?")){
				$.ajax({
					type : "post",
					url : "${ctp}/admin/activeEvent",
					data : {
						idx : idx
					},
					success: function(res) {
						if(res != "0"){
							alert("이벤트가 활성화 되었습니다.");
							location.reload();
						}
					},
					error: function() {
						alert("전송오류");
					}
				});
			}
		}
		
		function deactiveEvent(idx) {
			if(confirm("이벤트를 비활성화 하시겠습니까?")){
				$.ajax({
					type : "post",
					url : "${ctp}/admin/deactiveEvent",
					data : {
						idx : idx
					},
					success: function(res) {
						if(res != "0"){
							alert("이벤트가 비활성화 되었습니다.");
							location.reload();
						}
					},
					error: function() {
						alert("전송오류");
					}
				});
			}
		}
		
		function selectActive() {
			let idxArr = "";
  	  let checkboxes = document.getElementsByName("check");
  	  
  	  for (let i = 0; i < checkboxes.length; i++) {
  	    if (checkboxes[i].checked) {
  	      idxArr += checkboxes[i].value + "/";
  	    }
  	  }
    	idxArr = idxArr.substring(0,idxArr.length-1);
    	
    	if(idxArr == ""){
    		alert("체크된 이벤트가 없습니다.");
    		return false;
    	}
    	
			let ans = confirm("선택된 이벤트를 활성화 하시겠습니까?");
    	
    	if(ans){
	    	$.ajax({
	    		type : "post",
	    		url : "${ctp}/admin/selectActiveEvent",
	    		data : {
	    			idxArr : idxArr
	    		},
	    		success: function(res) {
	    			if(res != "0"){
		    			alert("이벤트가 활성화 되었습니다.");
							location.reload();
	    			}
					},
					error: function() {
						alert("전송오류");
					}
	    	});
    	}
		}
		
		function selectDective() {
			let idxArr = "";
  	  let checkboxes = document.getElementsByName("check");
  	  
  	  for (let i = 0; i < checkboxes.length; i++) {
  	    if (checkboxes[i].checked) {
  	      idxArr += checkboxes[i].value + "/";
  	    }
  	  }
    	idxArr = idxArr.substring(0,idxArr.length-1);
    	
    	if(idxArr == ""){
    		alert("체크된 이벤트가 없습니다.");
    		return false;
    	}
    	
			let ans = confirm("선택된 이벤트를 비활성화 하시겠습니까?");
    	
    	if(ans){
	    	$.ajax({
	    		type : "post",
	    		url : "${ctp}/admin/selectDeactiveEvent",
	    		data : {
	    			idxArr : idxArr
	    		},
	    		success: function(res) {
	    			if(res != "0"){
		    			alert("이벤트가 비활성화 되었습니다.");
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
<body>
	<div class="grey-bg container-fluid">
	  <div class="row">
	    <div class="col-xl-12 col-md-12">
	      <div class="card">
	        <div class="card-content">
	          <div class="card-body cleartfix">
	            <div class="media align-items-stretch">
	              <div class="align-self-center">
	                <i class="fas fa-gift warning font-large-2 mr-2"></i>
	              </div>
	              <div class="media-body align-self-center">
	                <h4 class="m-0">등록된 이벤트</h4>
	              </div>
	              <div class="align-self-center"> 
	                <h1><fmt:formatNumber pattern="#,##0" value="${fn: length(eventVOS)}"/>건</h1>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	  
    <div class="action-buttons">
      <button class="btn btn-activate" onclick="selectActive()">선택 활성화</button>
      <button class="btn btn-deactivate" onclick="selectDective()">선택 비활성화</button>
    </div>
		
		<div class="row mb-1">
      <div class="col-md-4">
        <input type="text" id="searchKeyword" class="form-control" placeholder="이벤트명 검색">
      </div>
      <div class="col-md-3">
        <select id="eventStatusFilter" class="form-control">
          <option value="">상태별 필터</option>
          <option value="active">활성화</option>
          <option value="deactive">비활성화</option>
        </select>
      </div>
      <div class="col-md-2">
        <button class="btn btn-filter w-100" onclick="applyFilters()">검색</button>
      </div>
    </div>

    <table class="table table-bordered table-hover table-striped text-center align-middle">
		  <thead class="thead-dark">
		    <tr>
		    	<th><input type="checkbox" id="allcheck" onclick="allCheck()" class="allCheckBox"></th>
		      <th>이벤트사진</th>
		      <th onclick="sortTable(1, 'text')">제목  <i class="fas fa-sort sort-icon"></i></th>
		      <th onclick="sortTable(2, 'text')">설명  <i class="fas fa-sort sort-icon"></i></th>
		      <th onclick="sortTable(3, 'text')">쿠폰이름 <i class="fas fa-sort sort-icon"></i></th>
		      <th onclick="sortTable(4, 'text')">쿠폰 할인률  <i class="fas fa-sort sort-icon"></i></th>
		      <th onclick="sortTable(5, 'text')">기간  <i class="fas fa-sort sort-icon"></i></th>
		      <th onclick="sortTable(6, 'text')">업로드 날짜  <i class="fas fa-sort sort-icon"></i></th>
		      <th onclick="sortTable(7, 'text')">상태  <i class="fas fa-sort sort-icon"></i></th>
		      <th>관리</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach var="vo" items="${eventVOS}">
		      <tr onclick="location.href='${ctp}/event/eventContent?idx=${vo.idx}'">
		      	<td><input type="checkbox" id="check${vo.idx}" name="check" value="${vo.idx}" onClick="stopPropagation(event); onCheck()"></td>
		        <td><img src="${ctp}/event/${vo.thumbnail}" width="20px"></td>
		        <td>${vo.title}</td>
		        <td>${vo.subTitle}</td>
		        <td>${vo.couponName}</td>
		        <td>${vo.discount}${vo.saleUnit}</td>
		        <td>${fn:substring(vo.startDate, 0, 10)} ~ ${fn:substring(vo.endDate, 0, 10)}</td>
		        <td>${fn:substring(vo.uploadDate, 0, 10)}</td>
            <td>
              <span class="badge ${vo.status == 'active' ? 'bg-success' : vo.status == '종료' ? 'bg-danger' : 'bg-secondary'}">
                ${vo.status == 'active' ? '진행중' : vo.status == '종료' ? '종료' : '비활성화'}
              </span>
            </td>
            <td>
              <c:if test="${vo.status == 'active'}"><button class="btn btn-sm btn-warning" onclick="stopPropagation(event); deactiveEvent(${vo.idx})">비활성화</button></c:if>
              <c:if test="${vo.status == 'deactive'}"><button class="btn btn-sm btn-activate" onclick="stopPropagation(event); activeEvent(${vo.idx})">활성화</button></c:if>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
		
		<c:set var="minIdx" value="${eventVOS[0].idx}"/>
	  <c:set var="maxSize" value="${fn:length(eventVOS)-1}"/>
	  <c:set var="maxIdx" value="${eventVOS[maxSize].idx}"/>
	  <input type="hidden" id="minIdx" name="minIdx" value="${minIdx}"/>
	  <input type="hidden" id="maxIdx" name="maxIdx" value="${maxIdx}"/>
  </div>
</body>
</html>