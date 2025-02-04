<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <style>
    	@font-face { /*눈누 기초고딕 - 두꺼운 네모 딱딱 고딕*/
		    font-family: 'NoonnuBasicGothicRegular';
		    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
			}
      body {
		    font-family: 'NoonnuBasicGothicRegular';
		    margin: 0;
		    padding: 0;
			}
			.grid-container {
		    display: grid;
		    grid-template-columns: repeat(5, 1fr);
		    gap: 20px;
		    padding: 10px;
		  }
		
		  .grid-item {
		    position: relative;
		    overflow: hidden;
		    text-align: center;
		  }
		  
		  .grid-item:hover {
		    cursor: pointer;
		  }
		
		
		  .grid-item img {
		    width: 100%;
		    height: auto;
		    object-fit: cover;
		  }
		  
	    .grid-item:hover img {
		    opacity: 0.3;
		  }
		  
		  .grid-item .overlay-buttons {
		    position: absolute;
		    top: 50%;
		    left: 50%;
		    transform: translate(-50%, -50%);
		    display: none;
		    gap: 10px;
		    z-index: 2;
		  }
		
		  .grid-item:hover .overlay-buttons {
		    display: flex;
		  }
		
		  .overlay-buttons a {
		    background-color: #fff;
		    color: #333;
		    border: 1px solid #ddd;
		    padding: 10px 15px;
		    font-size: 14px;
		    border-radius: 5px;
		    cursor: pointer;
		    transition: background-color 0.3s, transform 0.3s;
		    text-decoration: none;
		  }
		
		  .overlay-buttons a:hover {
		    background-color: #e74c3c;
		    color: #fff;
		    transform: scale(1.1);
		  }
		
		  .discount-badge {
		    position: absolute;
		    top: 10px;
		    left: 10px;
		    background-color: #e1c699;
		    color: #fff;
		    font-size: 12px;
		    padding: 5px 8px;
		    border-radius: 5px;
		  }
		
		  .grid-item .info {
		    padding: 15px;
		  }
		
		  .grid-item .title {
		    font-size: 16px;
		    font-weight: bold;
		    color: #333;
		    margin-bottom: 10px;
		    white-space: nowrap;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    cursor: pointer;
		  }
		
		  .grid-item .price {
		    font-size: 18px;
		    font-weight: bold;
		    color: #e74c3c;
		    margin: 5px 0;
		  }
		
		  .grid-item .company-category {
		    font-size: 14px;
		    color: #555;
		    margin-top: 5px;
		  }
		
		  .grid-item .rating {
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    gap: 5px;
		    font-size: 14px;
		    margin-top: 10px;
		    color: #777;
		  }
		
		  .grid-item .rating i {
		    color: #f1c40f;
		  }
    </style>
    <script type="text/javascript">
	  	function shopDelete(idx) {
				let ans = confirm("해당 게시물을 삭제하시겠습니까?");
				if(!ans) return false;
				
				$.ajax({
					type:"post",
					url:"${ctp}/shop/shopDelete",
					data : {
						idx : idx
					},
					success: function(res) {
						if(res != "0"){
							alert("게시물을 삭제하였습니다.");
							location.reload();
						}
					},
					error: function() {
						alert("전송오류");
					}
				});
			}
	  	
	  	function stopPropagation(event) {
		    event.stopPropagation(); // 이벤트 버블링을 중단
		  }
    </script>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
	<h3 class="text-start mt-4" style="font-weight: bold;">게시물 리스트 (${shopCnt}건)</h3>
	<div class="grid-container">
	  <c:forEach var="vo" items="${vos}" varStatus="st">
	    <div class="grid-item">
	      <c:if test="${vo.discount != 0}">
	      	<div class="discount-badge">${vo.company} ${vo.discount}%</div>
	      </c:if>
	      <div class="moveContent">
	        <img src="${ctp}/category/${vo.thumbnail}" alt="Thumbnail">
	        <div class="overlay-buttons">
	          <a href="${ctp}/shop/shopUpdate?idx=${vo.idx}" target="partner" ><i class="fa-solid fa-pencil-alt"></i>수정</a>
	          <a href="javascript:shopDelete(${vo.idx})"><i class="fa-regular fa-trash-can"></i>삭제</a>
        	</div>
	      </div>
	      <div class="info">
	        <div class="title" onclick="window.open('${ctp}/shop/shopContent?idx=${vo.idx}')">${vo.title}</div>
	        <div class="price"><fmt:formatNumber value="${vo.price}" pattern="#,##0"/>원</div>
	        <div class="company-category">${vo.company} | ${fn:toUpperCase(vo.category)}</div>
	      </div>
	    </div>
	  </c:forEach>
	</div>
	<!-- 블록페이지 시작 -->
	<div class="text-center">
	  <ul class="pagination justify-content-center">
		  <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/partner/shopList?part=${part}&pag=1&pageSize=${pageSize}">첫페이지</a></li></c:if>
		  <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/partner/shopList?part=${part}&pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}">이전블록</a></li></c:if>
		  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize) + blockSize}" varStatus="st">
		    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/partner/shopList?part=${part}&pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
		    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/partner/shopList?part=${part}&pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
		  </c:forEach>
		  <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/partner/shopList?part=${part}&pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a></li></c:if>
		  <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/partner/shopList?part=${part}&pag=${totPage}&pageSize=${pageSize}">마지막페이지</a></li></c:if>
	  </ul>
	</div>
	<!-- 블록페이지 끝 -->
  
  
  
</body>
</html>