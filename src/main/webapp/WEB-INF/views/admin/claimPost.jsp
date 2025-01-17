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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap-extended.min.css">
	<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/fonts/simple-line-icons/style.min.css">
	<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/colors.min.css">
	<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
  <style>
    body {
	    font-family: Arial, sans-serif;
	  }
	  
	  .grey-bg{
			margin: 0 auto;
			margin-top: 5%;
		}
	
    .table-container {
	    overflow-x: auto;
	    margin-top: 20px;
	    border-radius: 8px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    margin-right: 20px;
	    margin-bottom: 20px;
	  }
	  
	  .table{
	  	text-align: center;
	  }
	
	  .table th {
	    background-color: #343a40;
	    color: #ffffff;
	    text-align: center;
	    padding: 15px;
	    border-bottom: 2px solid #495057;
	    vertical-align: middle !important;
	  }
	  .table td{
	  	vertical-align: middle !important;
	  }
	  
	
	  .table tbody tr:nth-child(odd) {
	    background-color: #f8f9fa;
	  }
	
	  .table tbody tr:nth-child(even) {
	    background-color: #e9ecef;
	  }
	
	  .table img {
	    width: 60px;
	    height: 60px;
	    border-radius: 8px;
	    object-fit: cover;
	  }
	
	  .btn-approve {
	    padding: 8px 10px;
	    font-size: 12px;
	    color: #fff;
	    background-color: #28a745;
	    border: none;
	    border-radius: 5px;
	    cursor: pointer;
	    transition: background-color 0.3s ease, transform 0.2s ease;
	  }
	  .btn-approve, .btn-delete {
	    padding: 8px 12px;
	    font-size: 14px;
	    color: #fff;
	    border: none;
	    border-radius: 5px;
	    cursor: pointer;
	    transition: all 0.3s ease;
	  }
	
	  .btn-approve:hover {
	    background-color: #218838;
	    transform: scale(1.05);
	  }
	  
    .btn-delete {
	    background-color: #dc3545;
	  }
	
	  .btn-delete:hover {
	    background-color: #bd2130;
	    transform: scale(1.05);
	  }
		
		  .btn i {
		    margin-right: 5px;
		  }
	
	  .btn-approve i {
	    margin-right: 5px;
	  }
	
	  @keyframes fadeIn {
	    from {
	      opacity: 0;
	      transform: translateY(10px);
	    }
	    to {
	      opacity: 1;
	      transform: translateY(0);
	    }
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
	  .action-buttons .btn-delete-all {
	    background-color: #e35c61;
	  }
	  .action-buttons .btn-delete-all:hover {
	    background-color: #ac3f43;
	  }
	  .action-buttons .btn-delete-select {
	    background-color: #e35c61;
	  }
	  .action-buttons .btn-delete-select:hover {
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
	    event.stopPropagation(); // 이벤트 버블링을 중단
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
		                <i class="fa-solid fa-exclamation-triangle warning font-large-2 mr-2"></i>
		              </div>
		              <div class="media-body align-self-center">
		                <h4 class="m-0">신고된 게시물</h4>
		              </div>
		              <div class="align-self-center">
		                <h1>${fn: length(shopVOS)}건</h1>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
	  </section>
		<div class="action-buttons">
		  <button type="button" onclick="allAccept()" class="btn-delete-all">전체 삭제</button>
		  <button type="button" onclick="allAccept()" class="btn-delete-select">선택 삭제</button>
		</div>
	  <div class="table-container">
		  <table class="table table-bordered">
		    <thead>
		      <tr>
		        <th><input type="checkbox" id="allcheck" onclick="allCheck()" class="allCheckBox"></th>
		        <th>게시물 사진</th>
		        <th>업체명</th>
		        <th>상품명</th>
		        <th>옵션명 / 옵션 가격</th>
		        <th>가격</th>
		        <th>할인율</th>
		        <th>올린 날짜</th>
		        <th>작업</th>
		      </tr>
		    </thead>
		    <tbody>
		      <c:forEach var="shopVO" items="${shopVOS}" varStatus="st">
		        <c:set var="option" value="${fn: split(shopVO.optionName, '/')}"/>
		        <c:set var="optionPrice" value="${fn: split(shopVO.optionPrice, '/')}"/>
		        <tr onclick="location.href='${ctp}/shop/shopContent?idx=${shopVO.idx}'">
		          <td><input type="checkbox" id="check${shopVO.idx}" name="check" value="${shopVO.idx}" onClick="stopPropagation(event); onCheck()"></td>
		          <td><img src="${ctp}/category/${shopVO.thumbnail}" alt="Thumbnail"></td>
		          <td>${shopVO.company}</td>
		          <td>${shopVO.title}</td>
		          <td>
		            <c:if test="${empty option[0]}">
		              옵션 없음
		            </c:if>
		            <c:if test="${!empty option[0]}">
		              <c:forEach var="i" begin="0" end="${fn: length(option)-1}">
		                [${option[i]} / ${optionPrice[i]}원]
		              </c:forEach>
		            </c:if>
		          </td>
		          <td><fmt:formatNumber pattern="#,##0" value="${shopVO.price}"/></td>
		          <td>
		            <c:if test="${shopVO.discount == 0}">
		              할인 없음
		            </c:if>
		            <c:if test="${shopVO.discount != 0}">
		              ${shopVO.discount}%
		            </c:if>
		          </td>
		          <td>${fn: substring(shopVO.WDate, 0, 10)}</td>
		          <td>
		            <button class="btn-delete" onclick="stopPropagation(event);">
                	<i class="fas fa-trash"></i> 삭제
              	</button>
		          </td>
		        </tr>
		      </c:forEach>
		    </tbody>
		  </table>
		</div>
	  <c:set var="minIdx" value="${shopVOS[0].idx}"/>
	  <c:set var="maxSize" value="${fn:length(shopVOS)-1}"/>
	  <c:set var="maxIdx" value="${shopVOS[maxSize].idx}"/>
	  <input type="hidden" id="minIdx" name="minIdx" value="${minIdx}"/>
	  <input type="hidden" id="maxIdx" name="maxIdx" value="${maxIdx}"/>
  </div>
</body>
</html>
