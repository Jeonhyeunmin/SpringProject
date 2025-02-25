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
	<link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<style type="text/css">
		.grey-bg{
			margin: 0 auto;
			margin-top: 5%;
		}
		
		table {
	    margin: 20px auto; /* 테이블을 중앙에 배치 */
	    width: 95%; /* 테이블 너비를 95%로 설정 */
		}
		
		thead th {
	    font-size: 16px;
	    text-transform: uppercase; /* 헤더 텍스트를 대문자로 표시 */
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
  	
  	function allAccept() {
			let ans = confirm("업체를 전부 승인하시겠습니까?");
			if(ans){
				$.ajax({
					type:"post",
					url:"${ctp}/admin/partnerAllAccpet",
					success: function(res) {
						if(res != "0"){
							alert(res + "개의 업체를 모두 승인하였습니다.");
							location.reload();
						}
					},
					error: function() {
						alert("전송오류")
					}
				});
			}
		}
  	
  	function selectAccept() {
  		let idxArr = "";
  	  let checkboxes = document.getElementsByName("check");
  	  
  	  for (let i = 0; i < checkboxes.length; i++) {
  	    if (checkboxes[i].checked) {
  	      idxArr += checkboxes[i].value + "/";
  	    }
  	  }
    	idxArr = idxArr.substring(0,idxArr.length-1);
    	
    	if(idxArr == ""){
    		alert("체크된 업체가 없습니다.");
    		return false;
    	}
    	
			let ans = confirm("선택된 파트너들을 승인 하시겠습니까?");
    	
    	if(ans){
	    	$.ajax({
	    		type : "post",
	    		url : "${ctp}/admin/selectAccept",
	    		data : {
	    			idxArr : idxArr
	    		},
	    		success: function(res) {
	    			if(res != "0"){
		    			alert("업체를 승인하였습니다.");
							location.reload();
	    			}
					},
					error: function() {
						alert("전송오류");
					}
	    	});
    	}
		}
  	
  	function PartnerYes(idx) {
  		let ans = confirm("파트너를 승인하시겠습니까?");
			if(ans){
				$.ajax({
					type:"post",
					url : "${ctp}/admin/partnerYes",
					data : {
						idx : idx
					},
					success: function(res) {
						if(res != "0"){
							alert("파트너가 승인되었습니다.");
							location.reload();
						}
					},
					error: function() {
						alert("전송오류");
					}
				});
			}
		}
  	
  	function SelectPartnerNo() {
  		let idxArr = "";
  	  let checkboxes = document.getElementsByName("check");
  	  
  	  for (let i = 0; i < checkboxes.length; i++) {
  	    if (checkboxes[i].checked) {
  	      idxArr += checkboxes[i].value + "/";
  	    }
  	  }
    	idxArr = idxArr.substring(0,idxArr.length-1);
    	
    	if(idxArr == ""){
    		alert("체크된 업체가 없습니다.");
    		return false;
    	}
    	
			let ans = confirm("선택된 파트너들을 파트너 해지 하시겠습니까?");
    	
    	if(ans){
	    	$.ajax({
	    		type : "post",
	    		url : "${ctp}/admin/selectNoPartner",
	    		data : {
	    			idxArr : idxArr
	    		},
	    		success: function(res) {
	    			if(res != "0"){
		    			alert("파트너가 해지되었습니다.");
							location.reload();
	    			}
					},
					error: function() {
						alert("전송오류");
					}
	    	});
    	}
		}
  	
  	function PartnerNo(idx) {
			let ans = confirm("파트너 해지하시겠습니까?");
			if(ans){
				$.ajax({
					type:"post",
					url : "${ctp}/admin/partnerNo",
					data : {
						idx : idx
					},
					success: function(res) {
						if(res != "0"){
							alert("파트너가 해지되었습니다.");
							location.reload();
						}
					},
					error: function() {
						alert("전송오류");
					}
				});
			}
		}
  	
  	function partnerSerch() {
  	  const keyword = document.getElementById('searchKeyword').value.trim(); // 검색어 가져오기

  	  if (keyword === '') {
  	    alert('검색어를 입력해주세요.');
  	    return;
  	  }

  	  $.ajax({
  	    url: '${ctp}/admin/searchPartners', // 서버에서 검색 결과를 처리할 엔드포인트
  	    type: 'GET', // GET 요청
  	    data: { keyword: keyword }, // 검색어 전달
  	    success: function (response) {
  	      updatePartnerTable(response); // 응답 데이터를 테이블에 업데이트
  	    },
  	    error: function (error) {
  	      alert('검색 중 오류가 발생했습니다.');
  	      console.error('Error:', error);
  	    },
  	  });
  	}

  	// 검색 결과로 테이블 업데이트
  	function updatePartnerTable(partners) {
  	  const tbody = document.querySelector('table tbody');
  	  tbody.innerHTML = ''; // 기존 테이블 내용 제거

  	  partners.forEach((partner) => {
  	    const row =
  	      '<tr onclick="location.href=\'${ctp}/admin/partnerDetail?idx=' + partner.idx + '\'">' +
  	      '<td><input type="checkbox" id="check' + partner.idx + '" name="check" value="' + partner.idx + '" onClick="stopPropagation(event); onCheck()"></td>' +
  	      '<td><img src="${ctp}/logo/' + partner.logo + '" class="img-thumbnail" width="50px"></td>' +
  	      '<td>' + partner.mid + '</td>' +
  	      '<td>' + partner.company + '</td>' +
  	      '<td>' + partner.ceoName + '</td>' +
  	      '<td>' + partner.businessNumber.substring(0, 3) + '-' + partner.businessNumber.substring(3, 5) + '-' + partner.businessNumber.substring(5) + '</td>' +
  	      '<td>' + partner.tel + '</td>' +
  	      '<td class="text-truncate" style="max-width: 150px;" title="' + partner.address + '">' + partner.address.replace('/', ' ') + '</td>' +
  	      '<td class="text-truncate" style="max-width: 150px;" title="' + partner.email + '">' + partner.email + '</td>' +
  	      '<td>' + (partner.accept === 'NO' ? '승인대기' : 'PARTNER') + '</td>' +
  	      '<td>' +
  	        (partner.accept === 'YES'
  	          ? '<button onclick="stopPropagation(event); PartnerNo(' + partner.idx + ')" class="btn btn-danger btn-sm">파트너 해제</button>'
  	          : '<button onclick="stopPropagation(event); PartnerYes(' + partner.idx + ')" class="btn btn-info btn-sm">파트너 승인</button>') +
  	      '</td>' +
  	      '</tr>';

  	    tbody.insertAdjacentHTML('beforeend', row);
  	  });
  	}

	</script>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
	<div class="grey-bg container-fluid">
	  <section id="stats-subtitle">
		  <div class="row">
		    <div class="col-xl-12 col-md-12">
		      <div class="card">
		        <div class="card-content">
		          <div class="card-body cleartfix">
		            <div class="media align-items-stretch">
		              <div class="align-self-center">
		                <i class="fa-regular fa-building warning font-large-2 mr-2"></i>
		              </div>
		              <div class="media-body align-self-center">
		                <h4 class="m-0">${param.userDel == 'YES' ? '탈퇴신청 파트너' : '파트너'}</h4>
		              </div>
		              <div class="align-self-center"> 
		                <h1><fmt:formatNumber pattern="#,##0" value="${partnerCnt}"/>개</h1>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
	  </section>
		<input type="checkbox" id="leaveUser" onclick="location.href='${ctp}/admin/partnerManage${param.accept == 'NO' ? '' : '?accept=NO'}'" style="width: 20px; height: 20px;" ${param.accept == 'NO' ? 'checked' : ''}>
		<label for="leaveUser" style="margin-left: 5px; vertical-align: middle !important;">미승인 업체 보기</label>
	  <div class="action-buttons">
		  <button type="button" onclick="allAccept()" class="btn-delivery-all">전체 승인</button>
		  <button type="button" class="btn-delivery-finish" onclick="selectAccept()">선택 승인</button>
		  <button type="button" class="btn-delivery-selected" onclick="SelectPartnerNo()">선택 파트너 해제</button>
		</div>
	  <div class="row">
		  <div class="col-md-4">
		    <input type="text" id="searchKeyword" class="form-control" placeholder="업체명, 아이디 검색">
		  </div>
		  <div class="col-md-3">
		    <button class="btn btn-primary w-100" onclick="partnerSerch()">검색</button>
		  </div>
	  </div>
	  <table class="table table-bordered table-hover table-striped text-center align-middle">
	    <thead class="thead-dark">
        <tr>
          <th><input type="checkbox" id="allcheck" onclick="allCheck()" class="allCheckBox"></th>
          <th>프로필</th>
          <th>ID</th>
          <th>업체명</th>
          <th>대표자명</th>
          <th>사업자번호</th>
          <th>대표번호</th>
          <th>주소</th>
          <th>이메일</th>
          <th>승인여부</th>
          <th>작업</th>
        </tr>
	    </thead>
	    <tbody>
        <c:forEach var="vo" items="${vos}">
          <c:if test="${vo.level != 0}">
            <tr onclick="location.href='${ctp}/admin/partnerDetail?idx=${vo.idx}'">
              <td><input type="checkbox" id="check${vo.idx}" name="check" value="${vo.idx}" onClick="stopPropagation(event); onCheck()"></td>
              <td><img src="${ctp}/logo/${vo.logo}" class="img-thumbnail" width="50px"></td>
              <td>${vo.mid}</td>
              <td>${vo.company}</td>
              <td>${vo.ceoName}</td>
              <td>${fn: substring(vo.businessNumber, 0, 3)}-${fn: substring(vo.businessNumber, 3, 5)}-${fn: substring(vo.businessNumber, 5, 10)}</td>
              <td>${vo.tel}</td>
              <td class="text-truncate" style="max-width: 150px;" title="${vo.address}">
                ${fn:replace(vo.address, '/', ' ')}
              </td>
              <td class="text-truncate" style="max-width: 150px;" title="${vo.email}">
                ${vo.email}
              </td>
              <td>${vo.accept == 'NO' ? '승인대기' : 'PARTNER'}</td>
              <td>
                <c:if test="${vo.accept == 'YES'}"><button onclick='stopPropagation(event); PartnerNo(${vo.idx})' class="btn btn-danger btn-sm">파트너 해제</button></c:if>
                <c:if test="${vo.accept == 'NO'}"><button onclick='stopPropagation(event); PartnerYes(${vo.idx})' class="btn btn-info btn-sm">파트너 승인</button></c:if>
              </td>
            </tr>
          </c:if>
        </c:forEach>
	    </tbody>
		</table>
  </div>
  <!-- 블록페이지 시작 -->
	<div class="text-center">
	  <ul class="pagination justify-content-center">
		  <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/partnerManage?part=${part}&pag=1&pageSize=${pageSize}">첫페이지</a></li></c:if>
		  <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/partnerManage?part=${part}&pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}">이전블록</a></li></c:if>
		  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize) + blockSize}" varStatus="st">
		    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/admin/partnerManage?part=${part}&pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
		    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/partnerManage?part=${part}&pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
		  </c:forEach>
		  <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/partnerManage?part=${part}&pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a></li></c:if>
		  <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/partnerManage?part=${part}&pag=${totPage}&pageSize=${pageSize}">마지막페이지</a></li></c:if>
	  </ul>
	</div>
	<!-- 블록페이지 끝 -->
  <c:set var="minIdx" value="${vos[0].idx}"/>
  <c:set var="maxSize" value="${fn:length(vos)-1}"/>
  <c:set var="maxIdx" value="${vos[maxSize].idx}"/>
  <input type="hidden" id="minIdx" name="minIdx" value="${minIdx}"/>
  <input type="hidden" id="maxIdx" name="maxIdx" value="${maxIdx}"/>
</body>
</html>