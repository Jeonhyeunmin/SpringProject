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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap-extended.min.css">
	<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/fonts/simple-line-icons/style.min.css">
	<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/colors.min.css">
	<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
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
    }

    .container-fluid {
      margin-top: 20px;
    }

    .table {
      width: 100%;
      border-collapse: collapse;
      background-color: #fff;
      border-radius: 8px;
      overflow: hidden;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .table thead th {
      background-color: #f8f9fa;
      color: #333;
      font-weight: bold;
      padding: 15px;
      border-bottom: 2px solid #dee2e6;
      text-align: center;
    }

    .table tbody tr:hover {
      background-color: #f1f3f5;
      transition: background-color 0.3s;
    }

    .table td {
      padding: 12px;
      text-align: center;
      vertical-align: middle;
    }

    .review-item {
      padding: 15px;
      margin-bottom: 10px;
      border: 1px solid #ddd;
      border-radius: 5px;
      background-color: #f9f9f9;
    }

    .review-header {
      font-size: 16px;
      color: #555;
      font-weight: bold;
      margin-bottom: 10px;
    }

    .review-content {
      font-size: 14px;
      color: #777;
      line-height: 1.6;
    }

    .review-actions button {
      font-size: 14px;
      padding: 8px 16px;
      border-radius: 4px;
      margin: 5px;
    }

    .btn-edit {
      background-color: #007bff;
      color: white;
    }

    .btn-edit:hover {
      background-color: #0056b3;
    }

    .btn-delete {
      background-color: #dc3545;
      color: white;
    }

    .btn-delete:hover {
      background-color: #a71d2a;
    }
    
		.modal-overlay {
		  position: fixed;
		  top: 0;
		  left: 0;
		  width: 100%;
		  height: 100%;
		  background: rgba(0, 0, 0, 0.6); /* 반투명 배경 */
		  display: none; /* 기본적으로 숨김 */
		  opacity: 0;
		  z-index: 999;
		  transition: opacity 0.3s ease-in-out;
		}
		
		/* 모달 활성화 */
		.modal-overlay.show {
		  display: block;
		  opacity: 1;
		}
		
		/* 수정 폼 */
		.review {
		  position: fixed;
		  bottom: -100%;
		  left: 50%;
		  transform: translateX(-50%);
		  width: 90%;
		  max-width: 500px;
		  background: #fff;
		  border-radius: 15px;
		  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
		  padding: 20px;
		  z-index: 1000;
		  transition: bottom 0.5s ease-in-out, opacity 0.3s ease-in-out;
		  opacity: 0;
		}
		
		/* 수정 폼 활성화 */
		.review.show {
		  bottom: 40%;
		  opacity: 1;
		}
  </style>
  <script type="text/javascript">
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
  	
  	function loadReviews(idx, shopIdx) {
  	  $.ajax({
  	    type: "post",
  	    url: "${ctp}/member/loadReviews",
  	    data: {
  	      shopIdx: shopIdx,
  	      reviewIdx: idx,
  	    },
  	    success: function (res) {
  	      const overlay = document.getElementById("modalOverlay");
  	      const updateForm = document.getElementById("review");

  	      updateForm.innerHTML = res;

  	      // 모달 활성화
  	      overlay.classList.add("show");
  	      updateForm.classList.add("show");
  	    },
  	    error: function () {
  	      alert("전송오류");
  	    },
  	  });
  	}
  	
  	function closeReview() {
  	  const overlay = document.getElementById("modalOverlay");
  	  const updateForm = document.getElementById("review");

  	  overlay.classList.remove("show");
  	  updateForm.classList.remove("show");
  	}
  	
  	function reviewCheck() {
  		let star = reviewForm.star.value;
    	let review = reviewForm.reviewContent.value;
    	let reviewIdx = reviewForm.reviewIdx.value;
    	
    	query = {
    		idx : reviewIdx,
    		content : review,
    		star : star
    	}
    	
    	if(star == ""){
    		alert("별점을 선택해주세요.");
    		return false;
    	}
    	if(review == ""){
    		alert("상세 리뷰를 입력해주세요");
    		return false;
    	}
    	
    	$.ajax({
    		type : "post",
    		url : "${ctp}/shop/reviewUpdate",
    		data : query,
    		success: function(res) {
					if(res != "0"){
						alert("리뷰가 수정되었습니다.");
						closeReview();
						location.reload();
					}
					else{
						alert("수정 실패");
					}
				},
				error: function() {
					alert("전송오류");
				}    		
    	});
		}
  	
  </script>
</head>
<body>
	<div class="grey-bg container-fluid">
	  <table class="table table-bordered">
	    <thead>
	      <tr>
	        <th>게시물 사진</th>
	        <th>업체명</th>
	        <th>상품명[옵션명]</th>
	        <th>별점</th>
	        <th>내용</th>
	        <th>올린 날짜</th>
	        <th>작업</th>
	      </tr>
	    </thead>
	    <tbody>
	      <c:forEach var="vo" items="${reviewVOS}" varStatus="st">
				  <tr>
				    <td><img src="${ctp}/category/${vo.thumbnail}" width="50px"></td>
				    <td>${vo.company}</td>
				    <td>
				    	${vo.shopTitle}<c:if test="${vo.claim == 'YES'}"><font color="red" size="2px"> * 신고된 리뷰입니다.</font></c:if><br>
				    	<c:if test="${empty vo.optionSelect}">
				        옵션 : X
				      </c:if>
				      <c:if test="${!empty vo.optionSelect}">
			          옵션 : ${vo.optionSelect}
				      </c:if>
				    </td>
				    <td>${vo.star}</td>
				    <td>${vo.content}</td>
				    <td>${fn: substring(vo.reviewDate, 0, 10)}</td>
				    <td>
				    	<button class="btn btn-edit" onclick="loadReviews(${vo.idx}, ${vo.shopIdx})">수정</button>
              <button class="btn btn-delete" onclick="reviewDelete(${vo.idx})">삭제</button>
						</td>
				  </tr>
				</c:forEach>
	    </tbody>
	  </table>
  </div>
  <div id="modalOverlay" class="modal-overlay" onclick="closeReview()"></div>
		<div id="review" class="review">
	</div>
</body>
</html>
