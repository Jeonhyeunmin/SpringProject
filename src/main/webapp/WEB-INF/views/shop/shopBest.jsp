<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
	<style>
		@font-face { /*눈누 기초고딕 - 두꺼운 네모 딱딱 고딕*/
	    font-family: 'NoonnuBasicGothicRegular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
		}
	
	  .best-container {
	    font-family: 'NoonnuBasicGothicRegular';
	    max-width: 1500px;
	    margin: 80px 19.5%;
	  }
	
	  .best-container > div:first-child {
	    font-size: 28px;
	    font-weight: bold;
	    margin-bottom: 30px;
	    color: #333;
	  }
	
		.button-group {
		  display: flex;
		  gap: 10px;
		  font-family: 'ChosunGu';
		  font-weight: bold;
		  text-align: center;
		  border-top: 1px solid black;
		  border-bottom: 1px solid #ddd;
			width: 100%;
			justify-content: flex-start;
			padding-left: 30px;
			margin-bottom: 30px;
			font-size: 15px;
		}
		.button-group button{
			background-color: transparent;
			padding: 20px;
			border: none;
			transition: all 0.3s;
		}
		.button-group button:hover{
			background-color: #eee;
			transform: scale(1.05);
			
		}
		.button-group-ul{
			list-style: none;
			padding: 0;
			margin: 0;
			text-align: left;
		}
		.button-group-ul li{
			display: inline;
			width: 100px;
		}
	
	  .goods-wrap ul {
	    list-style: none;
	    padding: 0;
	    display: grid;
	    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	    gap: 30px;
	    margin: 0 auto;
	  }
	
	  .goods-wrap li {
	    border: 1px solid #e0e0e0;
	    overflow: hidden;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    background-color: #fff;
	    transition: transform 0.3s ease, box-shadow 0.3s ease;
	  }
	
		.rank {
	    display: flex;
	    align-items: center;
	    font-size: 20px;
	    font-weight: bold;
	    color: white;
	    padding: 5px 5px;
	    background-color: #009d76; /* 초록색 배경 */
	    width: 50px;
	    text-align: center;
	    justify-content: center;
	  }
	
	  /* Rank-status 스타일 */
	  .rank-status {
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    font-size: 20px;
	    color: white;
	    font-weight: bold;
	    padding: 5px 10px;
	    background-color: #454545; /* 어두운 배경 */
	    gap: 5px;
	  }
	
	  /* Rank-status 방향 아이콘 */
	  .rank-status i {
	    font-size: 12px;
	    display: inline-block;
	    vertical-align: middle;
	  }
	
	  /* Rank와 Rank-status를 수평으로 배치 */
	  .rank-container {
	    display: flex;
	    align-items: center;
	    border: 1px solid #ddd;
	    overflow: hidden;
	    margin-bottom: 10px;
	    width: fit-content; /* 내용 크기에 맞게 조정 */
	  }
	  .img-box {
	    position: relative;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    background-color: #fff;
	  }
	
	  .img-box img {
	    max-width: 100%;
	    height: auto;
	    border-bottom: 1px solid #e0e0e0;
	  }
	
	  .info-box {
	    display: block;
	    padding: 20px;
	    text-decoration: none;
	    background-color: #f8f9fa;
	    font-size: 16px;
	    font-weight: bold;
	    color: #333;
	    transition: background-color 0.3s ease, color 0.3s ease;
	    width: 250px;
      white-space: nowrap;       /* 줄바꿈 방지 */
      overflow: hidden;          /* 넘치는 텍스트 숨김 */
      text-overflow: ellipsis;   /* 말줄임표(...) 표시 */
	  }
	
	</style>
	<script type="text/javascript">
    function filterItems(idx) {
      idx = idx.toString().padStart(2, "0");

      // AJAX 요청
      $.ajax({
        type: "POST",
        url: "${ctp}/shop/filterItem",
        data: {
            category: idx
        },
        dataType: "json",
        success: function(vos) {
          var categoryBox = document.getElementById("categoryBox");

          categoryBox.innerHTML = "";

          vos.forEach(function(vo) {
      	    var itemHtml = 
    	        '<li>' +
  	            '<div class="rank-container">' +
	                '<div class="rank">' +
                    vo.item1 +
	                '</div>' +
	                (vo.item2 ? 
                    '<div class="rank-status ' + vo.item3 + '">' +
                      (vo.item3 === 'rank-status up' ? 
                        '<i class="fa-solid fa-caret-up"></i>' : vo.item3 === 'rank-status new' ? '' : 
                        '<i class="fa-solid fa-sort-down"></i>'
                      ) +
                      vo.item2 +
                    '</div>'
	                : '') +
  	            '</div>' +
  	            '<div class="img-box">' +
	                '<img src="' + vo.item6 + '" alt="' + vo.item6 + '" />' +
  	            '</div>' +
  	            '<div class="info-box">' +
  	                '<div>' + vo.item4 + '</div>' +
	                '<div>' + vo.item5 + '</div>' +
  	            '</div>' +
    	        '</li>';
      	    categoryBox.innerHTML += itemHtml;
        	});
        },
        error: function(error) {
          console.error("Error during AJAX request:", error);
          alert("필터링에 실패했습니다. 다시 시도해 주세요.");
        }
      });
    }

	</script>
</head>
<body>
  <div class="best-container">
  	<div style="margin-bottom: 50px; font-size: 40px; font-weight: bold;">Best <span style="font-size: 20px; margin-left: 5px; font-weight: light;">Min's의 베스트 상품을 만나보세요.</span></div>
		<p style="color: red; font-size: 12px;">* 본 페이지는 현대백화점의 BEST 페이지를 크롤링해온 페이지입니다.</p>  	
	  <div class="button-group">
	  	<ul class="button-group-ul">
				<c:forEach var="button" items="${buttonVOS}" varStatus="st">
	  			<li><button onclick="filterItems(${st.index})">${button}</button></li>
	  		</c:forEach>
	  	</ul>
		</div>
  	
  	<div class="goods-wrap">
		  <ul id="categoryBox">
		    <c:forEach var="vo" items="${vos}">
		      <li>
		        <div class="rank-container">
						  <div class="rank">
						    ${vo.item1} <!-- 순위 -->
						  </div>
						  <c:if test="${!empty vo.item2}">
						    <div class="rank-status ${vo.item3}">
						      <c:choose>
						        <c:when test="${vo.item3 == 'rank-status up'}">
						          <i class="fa-solid fa-caret-up"></i> ${vo.item2} <!-- 상승 -->
						        </c:when>
						        <c:when test="${vo.item3 == 'rank-status new'}">
						          ${vo.item2} <!-- 하락 -->
						        </c:when>
						        <c:when test="${vo.item3 == 'rank-status down'}">
						          <i class="fa-solid fa-sort-down"></i> ${vo.item2} <!-- 하락 -->
						        </c:when>
						      </c:choose>
						    </div>
						  </c:if>
						</div>
		        <div class="img-box">
		          <img src="${vo.item6}" alt="${vo.item6}"/>
		        </div>
		        <div class="info-box">
		          <div>${vo.item4}</div>
		          <div>${vo.item5}</div>
		        </div>
		      </li>
		    </c:forEach>
		  </ul>
		</div>
  </div>
</body>
</html>