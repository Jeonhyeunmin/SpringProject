<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <link rel="icon" href="${ctp}/main/favicon.png">
  <title>${title} | Min's</title>
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <style>
    body {
      margin: 0;
      padding: 0;
      display: flex;
      flex-direction: column;
      min-height: 100vh; /* 전체 높이를 채우도록 설정 */
      font-family: Arial, sans-serif;
    }
    header {
      flex-shrink: 0;
      width: 100%;
      background-color: #f8f9fa;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    footer {
      flex-shrink: 0;
      width: 100%;
      background-color: #343a40;
      color: #fff;
      text-align: center;
      padding: 10px 0;
      box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
    }
      
      		/* 위로가기 버튼 */
		#topBtn {
		  position: fixed;
			right: 1rem;
			bottom: -50px;
			transition: 0.7s ease;
		}
		
		#topBtn.on {
		  opacity: 0.8;
			cursor: pointer;
			bottom: 0;
		}
		
		.fixed-sidebar {
	    position: fixed;
	    top: 40%;
	    right: 0px;
	    width: 150px;
	    min-height: 250px; /* 높이를 늘림 */
	    background-color: #fff;
	    border: 1px solid #ddd;
	    border-radius: 8px;
	    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
	    z-index: 1000;
	    text-align: center;
	    transition: 0.7s ease;
	    padding: 15px; /* 내부 여백 추가 */
		}
		
		.sidebar-item {
	    padding: 15px 10px; /* 텍스트 패딩 */
	    border-bottom: 1px solid #eee;
		}
		
		.sidebar-item:last-child {
	    border-bottom: none;
		}
		
		.sidebar-item h4 {
	    font-size: 16px;
	    font-weight: bold;
	    color: #333;
	    margin: 10px 0;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    gap: 5px;
	    margin-bottom: 30px;
		}
		
		.sidebar-item p {
	    font-size: 14px;
	    color: #888;
	    margin: 5px 0;
	    text-align: center;
		}
		
		.sidebar-item p.no-items {
	    font-size: 12px;
	    color: #ff6347;
	    font-style: italic;
	    font-weight: bold;
	    text-shadow: 0px 1px 3px rgba(255, 99, 71, 0.5);
	    margin-top: 10px; /* 추가 여백 */
	    text-align: center;
		}


  </style>
  
  <script type="text/javascript">
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
	  
  </script>
</head>
<body>
  <!-- Header -->
  <header>
      <tiles:insertAttribute name="header" />
  </header>

  <!-- Main Body -->
<tiles:insertAttribute name="body" />

	<div class="fixed-sidebar" id="mainSidevar">
	  <div class="sidebar-item">
	    <h4>
	      최근 본 물품
	    </h4>
	    <p>최근에 보신</p>
	    <p class="no-items">물품이 없습니다.</p>
	  </div>
	</div>


	<!-- 위로가기 버튼 -->
	<h6 id="topBtn" class="text-right">
		<img src="${ctp}/login/top.png" title="위로이동" width="50px" />
	</h6>
	
  <!-- Footer -->
  <footer>
      <tiles:insertAttribute name="footer" />
  </footer>
  
</body>
</html>
