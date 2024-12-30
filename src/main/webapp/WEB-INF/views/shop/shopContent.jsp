<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <style type="text/css">
   body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f9;
  }
	#content-form {
		display: flex;
    flex-direction: row;
    max-width: 85%;
    margin: 0 auto;
    padding-top: 8%;
    gap: 30px;
	}
	
	/* 이미지 전환 효과 */
		.image-container {
		  position: relative; /* 이미지를 겹칠 컨테이너 설정 */
		  width: 100%;
		  height: 100%; /* 이미지 높이 */
		  overflow: hidden; /* 이미지가 영역을 넘지 않도록 설정 */
		}
		
		.image-container img {
		  width: 100%;
		  height: 100%;
		  object-fit: cover; /* 이미지를 컨테이너에 맞게 조정 */
		}
		
  /* 보조 이미지 */
  .sub-img {
    margin-top: 20px;
  }

  .sub-img img {
    width: 100%;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  }

  /* 포트폴리오 */
  .see-more {
    margin-top: 30px;
  }

  .grid-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
  }

  .grid-item {
    text-align: center;
  }

  .grid-item img {
    width: 100%;
    height: auto;
    border-radius: 8px;
  }
  
  		h6 {
			position: fixed;
			right: 1rem;
			bottom: -100px;
			transition: 0.7s ease;
		}
		h6.on {
			opacity: 0.8;
			cursor: pointer;
			bottom: 15px;
			z-index: 10;
		}
		
			
		
		.fixed-sidebar {
	    position: fixed;
	    top: 20%;
	    right: -120px;
	    width: 120px;
	    flex-direction: column;
	    align-items: center;
	    background: none;
	    z-index: 50;
	    gap: 20px;
	    opacity: 0;
	    transition: 0.5s ease-in-out;
		}
		
		.fixed-sidebar.on {
	    right: 10px;
	    opacity: 1;
		}
	
		
		.sidebar-item {
	    text-align: center;
	    cursor: pointer;
		}
		
		.icon-circle {
	    width: 60px;
	    height: 60px;
	    border-radius: 50%;
	    background-color: #ffffff;
	    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    transition: transform 0.3s ease, box-shadow 0.3s ease;
	    margin-bottom: 20px;
		}
		
		.icon-circle i {
		    font-size: 25px;
		    color: #333;
		}
		
		.icon-circle:hover {
	    transform: scale(1.1);
	    box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.3);
		}
  </style>
  <script type="text/javascript">
	  function toggleLike(idx, btn) {
	    const icon = btn.querySelector('i');
	        $.ajax({
	        	type : "post",
	        	url : "interestCheck.fu",
	        	data : {idx : idx},
	        	success: function(res) {
							if(res == "1"){
								icon.classList.remove('fa-regular');
				        icon.classList.add('fa-solid');
							}
							else if(res == "2"){
				        icon.classList.remove('fa-solid');
				        icon.classList.add('fa-regular');
					    }
						},
						error: function() {
							alert("안됨");
						}
        });
	  }
	  
		$(window).scroll(function(){
	  if($(this).scrollTop() > 100){
	     $("#topBtn").addClass("on");
	  }
	  else{
	     $("#topBtn").removeClass("on");
	  }
	  $("#topBtn").click(function() {
				window.scrollTo({top:0, behavior: "smooth"});	
			});
		});
		
			$(window).scroll(function(){
			  if($(this).scrollTop() > 300){
			     $("#mainSidebar").addClass("on");
			  }
			  else{
			     $("#mainSidebar").removeClass("on");
			  }
			});
		
			function shareContent() {
			    const shareData = {
			        title: '그린테리어',
			        text: '이 멋진 인테리어를 확인해보세요!',
			        url: window.location.href // 현재 페이지 URL
			    };

			    if (navigator.share) {
			        navigator.share(shareData)
			            .then(() => console.log('공유 성공'))
			            .catch((error) => console.error('공유 실패:', error));
			    } else {
			        alert('공유 기능이 지원되지 않는 브라우저입니다.');
			    }
			}
			
			function DeleteCheck() {
				let ans = confirm("삭제하시겠습니까?");
				if(ans){
					location.href = "FurnitureDelete.fu?idx=${vo.idx}";
				}
			}
			function showHoverImage(container) {
	  	  const defaultImg = container.querySelector('.default-img');
	  	  const hoverImg = container.querySelector('.hover-img');
	  	  
	  	  defaultImg.style.display = 'none'; // 기본 이미지 숨기기
	  	  hoverImg.style.display = 'block'; // Hover 이미지 표시
	  	}

	  	function showDefaultImage(container) {
	  	  const defaultImg = container.querySelector('.default-img');
	  	  const hoverImg = container.querySelector('.hover-img');
	  	  
	  	  defaultImg.style.display = 'block'; // 기본 이미지 표시
	  	  hoverImg.style.display = 'none'; // Hover 이미지 숨기기
	  	}
			
	  	function cartCheck() {
	  		
				$.ajax({
					type : 'post',
					url  : 'FurnitureCart.fu',
					data :  {idx : ${vo.idx}},
					success: function(res) {
						let ans = confirm("장바구니로 이동하시겠습니까?");
						if(ans){
							location.href='FurnitureShoppingList.fu';
						}
						else{
							location.reload();
						}
					},
					error: function() {
						alert("전송오류");
					}
				});	  		
			}
	  	
	  	function buy() {
				idxSelectArray = ${vo.idx} + ",";
				alert("결제페이지로 이동합니다.");
				location.href = "FurnitureBuy.fu?idxArray=" + idxSelectArray;
			}
			
	  	function complaint() {
	  		let ans = confirm("이 게시물을 신고하시겠습니까?");
	  		if(ans){
					$.ajax({
						type : "post",
						url : "Complaint.fu",
						data : {
							idx : ${vo.idx},
							mid : '${vo.mid}'
						},
						success: function(res) {
							if(res == "1"){
								alert("게시물이 신고되었습니다.");
								location.reload();
							}
							else if(res == "2"){
								alert("이미 신고한 글입니다.");
								location.reload();
							}
							else{
								alert("응 오류야 다시 봐");
							}
						},
						error: function() {
							alert("error");
						}
					});
	  		}
	  		else{
	  			return;
	  		}
			}
  </script>
</head>
<body>
<div id="content-form" class="container">
  <table id="content-table" style="width: 85%; margin: 0 auto; border-collapse: collapse;">
	  <!-- 이미지와 제품 정보 -->
	  <tr>
	    <td style="width: 50%; vertical-align: top; padding: 10px;">
	      <div class="main-img">
	        <div class="image-container" onmouseover="showHoverImage(this)" onmouseout="showDefaultImage(this)">
			      <c:forEach var="titleImg" items="${titleImgs}">
			      	<img src="${ctp}/category/${titleImg}">
			      </c:forEach>
			    </div>
	      </div>
	    </td>
	    <td style="width: 50%; vertical-align: top; padding: 10px;">
	      <div class="product-info">
	      	<p><br/></p>
	        <div class="input-group" style="text-align: center;">
	          <div class="company input-group-prepend">${vo.company}</div>
	          <div class="trash company"> / </div>
	          <div class="category input-group-append">${vo.category}</div>
	        </div>
	        <h2>${vo.title}</h2>
	        <p class="price"><fmt:formatNumber value="${vo.price}" pattern="#,##0"/> 원</p>
	        <button type="button" onclick="buy()" class="btn btn-outline-secondary">구매하기</button>
	        <button type="button" onclick="cartCheck()" class="btn btn-outline-secondary">장바구니 담기</button><br/><br/><br/><br/>
		      <div class="additional-info" style="padding: 20px; background-color: #fff; border: 1px solid #ddd;">
		        <h3>배송 안내</h3>
		        <p><font color="blue">* 1인 1개만 구매가 가능합니다. *</font></p>
		        <p>전국 무료 배송 및 설치<br/>(제주도 및 울릉도 등 도서/산간 지역의 경우 택배상품만 온라인 주문 가능)</p>
		        <hr>
		        <h3>제품 사진 관련 안내</h3>
		        <p>위의 사진들은 모니터에 따라 약간의 색상 차이가 발생될 수 있습니다.</p>
		      </div>
	      </div>
	    </td>
	  </tr>
	</table>
	<div><input type="button" value="수정" class="btn btn-outline-success" onclick="location.href='${ctp}/shop/shopUpdate?idx=${vo.idx}'" /></div>
		
		<!-- 위로가기 버튼 -->
	  <h6 id="topBtn" class="text-right mr-3"><font color="#af9e84"><i class="fa-solid fa-circle-chevron-up fa-2x"></i></font></h6>
  </div>
</body>
</html>