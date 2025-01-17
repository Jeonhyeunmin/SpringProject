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
	</script>
</head>
<body>
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
		                <h1><fmt:formatNumber pattern="#,##0" value="${fn: length(partnerVOS)}"/>개</h1>
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
        <c:forEach var="vo" items="${partnerVOS}">
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
  <c:set var="minIdx" value="${partnerVOS[0].idx}"/>
  <c:set var="maxSize" value="${fn:length(partnerVOS)-1}"/>
  <c:set var="maxIdx" value="${partnerVOS[maxSize].idx}"/>
  <input type="hidden" id="minIdx" name="minIdx" value="${minIdx}"/>
  <input type="hidden" id="maxIdx" name="maxIdx" value="${maxIdx}"/>
</body>
</html>