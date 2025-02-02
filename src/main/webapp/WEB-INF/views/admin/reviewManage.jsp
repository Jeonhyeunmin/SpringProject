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
	
	  .table {
	    width: 100%;
	    border-collapse: collapse;
	    background-color: #fff;
	    border-radius: 8px;
	    overflow: hidden;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	  }
	
	  .table th {
	    background-color: #f8f9fa;
	    color: #495057;
	    text-align: left;
	    padding: 15px;
	    border-bottom: 2px solid #dee2e6;
	  }
	
	  .table td {
	    padding: 12px;
	    border-bottom: 1px solid #dee2e6;
	    vertical-align: middle !important;
	  }
	
	  .table tbody tr:hover {
	    background-color: #f1f3f5;
	    cursor: pointer;
	  }
	
	  .table img {
	    width: 60px;
	    height: 60px;
	    border-radius: 8px;
	    object-fit: cover;
	  }
	
	  .review-container {
	    padding: 20px;
	    background-color: #f8f9fa;
	    border-top: 2px solid #dee2e6;
	    animation: fadeIn 0.3s ease-in-out;
	  }
	
	  .review-item {
	    padding: 10px;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    margin-bottom: 10px;
	    background-color: #f9f9f9;
		}
	
	  .review-container .review-item .review-header {
	    display: flex;
	    align-items: center;
	    font-size: 16px;
	    color: #333;
	    margin-bottom: 8px;
	  }
	
	  .review-container .review-item .review-header i {
	    margin-right: 8px;
	    color: #007bff;
	  }
	
	  .review-container .review-item .review-stars {
	    font-size: 14px;
	    color: #f39c12;
	    margin-bottom: 8px;
	  }
	
	  .review-container .review-item .review-content {
	    font-size: 14px;
	    line-height: 1.5;
	    color: #555;
	  }
	
	  .review-container .no-review {
	    text-align: center;
	    color: #888;
	    padding: 10px;
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
	  
	  .review-actions {
	    text-align: right; /* 버튼을 오른쪽 정렬 */
	    margin-top: 10px; /* 리뷰 내용과 버튼 사이 간격 추가 */
		}
		
		.delete-review-btn {
	    background-color: #ff4d4d;
	    color: white;
	    border: none;
	    padding: 5px 10px;
	    border-radius: 4px;
	    cursor: pointer;
	    font-size: 12px;
	    width: 100%;
		}
		
		.delete-review-btn:hover {
	    background-color: #cc0000;
		}
  </style>
  <script type="text/javascript">
  	let openReviewIdx = null;
  	
  	function reviewLoad(idx) {
  		if (openReviewIdx !== null && openReviewIdx !== idx) {
	      $(".review-container" + openReviewIdx).html(""); // 이전 컨테이너 내용 제거
	    }

	    openReviewIdx = idx;
	    
	    $.ajax({
	      type: "post",
	      url: "${ctp}/admin/reviewLoad",
	      data: { idx: idx },
	      success: function(res) {
	        let container = $(".review-container" + idx);
	        if (!res || res.length === 0) {
	          container.html('<div class="no-review"><i class="fas fa-exclamation-circle"></i> 리뷰가 없습니다.</div>');
	        } else {
	          let str = '';
	          res.forEach(vo => {
	        	  if(vo.claim == 'YES'){
	        		  str += '<div class="review-item">';
	        		  str += '  <div class="review-header">';
	        		  str += '    <i class="fas fa-user"></i> <strong>' + vo.mid + '</strong>';
	        		  str += '    <font color="red" size="2"> * 신고된 리뷰입니다.</font>';
	        		  str += '  </div>';
	        		  str += '  <div class="review-stars">';
	        		  str += '    <i class="fas fa-star"></i>' + vo.star + '점';
	        		  str += '  </div>';
	        		  str += '  <div class="review-content">';
	        		  str += '    <i class="fas fa-comment"></i>' + vo.content;
	        		  str += '  </div>';
	        		  str += '  <div class="review-actions" style="text-align: right; margin-top: 5px;">';
	        		  str += '    <button class="delete-review-btn" onclick="reviewDelete(' + vo.idx + ')">';
	        		  str += '      <i class="fas fa-trash"></i> 리뷰 삭제';
	        		  str += '    </button>';
	        		  str += '  </div>';
	        		  str += '</div>';
	        	  }
	        	  else{
		            str += '<div class="review-item"><div class="review-header"><i class="fas fa-user"></i> <strong>' + vo.mid + '</strong></div>';
		            str += '<div class="review-stars"><i class="fas fa-star"></i>' + vo.star + '점</div>';
		            str += '<div class="review-content"><i class="fas fa-comment"></i>' + vo.content + '</div></div>';
	        	  }
	          });
	          container.html(str);
	        }
	      },
	      error: function() {
	        alert("전송 오류가 발생했습니다.");
	      }
	    });
	  }
  	
  	function reviewDelete(idx) {
  		let ans = confirm("해당 리뷰를 삭제하시겠습니까?");
			if(ans){
				$.ajax({
					type:"post",
					url:"${ctp}/shop/reviewDelete",
					data:{
						idx : idx
					},
					success: function(res) {
						if(res != "0"){
							alert("리뷰를 삭제하였습니다.");
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
		    <div class="col-xl-6 col-md-12">
		      <div class="card overflow-hidden">
		        <div class="card-content">
		          <div class="card-body cleartfix">
		            <div class="media align-items-stretch">
		              <div class="align-self-center">
		                <i class="icon-speech warning font-large-2 mr-2"></i>
		              </div>
		              <div class="media-body align-self-center">
		                <h4 class="m-0">리뷰</h4>
		              </div>
		              <div class="align-self-center"> 
		                <h1><fmt:formatNumber pattern="#,##0" value="${fn: length(reviewVOS)}"/>건</h1>
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
		                <i class="fas fa-exclamation-circle danger font-large-2 mr-2"></i>
		              </div>
		              <div class="media-body align-self-center">
		                <h4 class="m-0">신고 리뷰</h4>
		              </div>
		              <div class="align-self-center">
		                <h1><fmt:formatNumber pattern="#,##0" value="${fn: length(ClaimReviewIdx)}"/>건</h1>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
	  </section>
	  <table class="table table-bordered">
	    <thead>
	      <tr>
	        <th>게시물 사진</th>
	        <th>업체명</th>
	        <th>상품명</th>
	        <th>옵션명</th>
	        <th>가격</th>
	        <th>올린 날짜</th>
	      </tr>
	    </thead>
	    <tbody>
	      <c:forEach var="shopVO" items="${reviewShopVOS}" varStatus="st">
	    		<c:set var="option" value="${fn: split(shopVO.optionName, '/')}"/>
				  <tr onclick="reviewLoad(${shopVO.idx})">
				    <td><img src="${ctp}/category/${shopVO.thumbnail}" width="50px"></td>
				    <td>${shopVO.company}</td>
				    <td>
				    	${shopVO.title}
			      	<c:if test="${fn: contains(ClaimReviewIdx, shopVO.idx)}">
					    	<font color="red" size="2px"> * 신고된 리뷰가 있습니다.</font>
			      	</c:if>
			    	</td>
				    <td>
				      <c:if test="${empty option[0]}">
				        X
				      </c:if>
				      <c:if test="${!empty option[0]}">
				        <c:forEach var="i" begin="0" end="${fn: length(option)-1}">
				          [${option[i]}]
				        </c:forEach>
				      </c:if>
				    </td>
				    <td><fmt:formatNumber pattern="#,##0" value="${shopVO.price}"/></td>
				    <td>${fn: substring(shopVO.WDate, 0, 10)}</td>
				  </tr>
				  <tr>
				    <td colspan="6" class="review-container review-container${shopVO.idx}"></td>
				  </tr>
				</c:forEach>
	    </tbody>
	  </table>
  </div>
</body>
</html>
