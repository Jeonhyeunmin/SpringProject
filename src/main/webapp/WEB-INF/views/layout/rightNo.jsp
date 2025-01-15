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
      color: #fff;
      text-align: center;
      padding: 10px 0;
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
