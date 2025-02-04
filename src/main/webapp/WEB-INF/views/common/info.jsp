<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Min's 소개 | Min's</title>
  <link rel="icon" href="${ctp}/main/favicon.png">
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <style type="text/css">
  	@font-face { /*눈누 기초고딕 - 두꺼운 네모 딱딱 고딕*/
	    font-family: 'NoonnuBasicGothicRegular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
		}
    body {
      font-family: Arial, sans-serif;
      line-height: 1.6;
      margin: 0;
      padding: 0;
    }

    .video-container {
      width: 100%;
      position: relative;
    }
    
    .video-container video {
      object-fit: cover;
      width: 100%;
      height: 100%;
      clip-path: inset(50px 0 100px 0);
    }
    
    .info-container {
    	font-family: 'NoonnuBasicGothicRegular';
		  padding: 50px;
		  background-color: #f9f9f9;
		  text-align: center;
		}
		
		.info-container h1 {
		  font-size: 2.8rem;
		  margin-bottom: 30px;
		  color: #333;
		  font-weight: bold;
		}
		
		.info-container p {
		  font-size: 1.2rem;
		  color: #555;
		  margin: 10px 0;
		  line-height: 1.8;
		}
		
		.info-container .highlight {
		  font-weight: bold;
		  color: #ff6347;
		}
		
		.info-container hr {
		  border: 0;
		  height: 1px;
		  background: #ddd;
		  margin: 40px auto;
		  width: 80%;
		}
		
		.features {
		  display: flex;
		  justify-content: space-around;
		  flex-wrap: wrap;
		  gap: 20px;
		  margin: 30px 0;
		}
		
		.feature-item {
		  background-color: #fff;
		  padding: 20px;
		  border-radius: 10px;
		  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		  text-align: left;
		  flex: 1;
		  max-width: 400px;
		  margin: 10px;
		}
		
		.feature-item h2 {
		  font-size: 1.5rem;
		  color: #333;
		  margin-bottom: 15px;
		}
		
		.feature-item p {
		  font-size: 1rem;
		  color: #555;
		  line-height: 1.6;
		}
		
		@media (max-width: 768px) {
		  .info-container {
		    padding: 20px;
		  }
		
		  .info-container h1 {
		    font-size: 2rem;
		  }
		
		  .features {
		    flex-direction: column;
		    align-items: center;
		  }
		
		  .feature-item {
		    max-width: 100%;
		  }
		}
  </style>
  <script type="text/javascript">
	  document.addEventListener("DOMContentLoaded", function () {
		  $("#blank").hide();
	  });
  </script>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
  <jsp:include page="/WEB-INF/views/include/mainHeader.jsp" />
  <div class="video-container">
    <video autoplay loop muted playsinline loading="lazy">
      <source src="${ctp}/main/Min.mp4" type="video/mp4">
    </video>
  </div>
  <div class="info-container fade-in" id="infoContainer">
	  <h1>Welcome to <span class="highlight">Min's</span></h1>
	  <p>
	    <span class="highlight">Min's</span>는 개발자 전현민의 '민'을 따서 Min's라는 이름으로 탄생한 쇼핑몰 프로젝트입니다.
	  </p>
	  <p>
	    이 웹사이트는 <span class="highlight">스프링 프레임워크</span>를 활용하여 만들어졌으며, 
	    현대백화점, 롯데백화점, 신세계백화점과 같은 선도적인 쇼핑몰을 참고하여 
	    현대적인 사용자 경험을 제공하도록 설계되었습니다.
	  </p>
	  <hr>
	  <div class="features">
	    <div class="feature-item">
	      <h2>🌟 프로젝트 목표</h2>
	      <p>고객의 쇼핑 경험을 극대화하고 누구나 쉽게 사용할 수 있는 플랫폼을 제공하는 것입니다.</p>
	    </div>
	    <div class="feature-item">
	      <h2>📌 주요 기술</h2>
	      <p>
	        <span class="highlight">Spring Framework</span>, <span class="highlight">JSP</span>, <span class="highlight">MySQL</span>, <span class="highlight">HTML/CSS</span>와 같은 기술을 적극 활용하였습니다.
	      </p>
	    </div>
	    <div class="feature-item">
	      <h2>🚀 끊임없는 발전</h2>
	      <p>Min's는 최상의 서비스를 제공하기 위해 지속적으로 성장하고 개선해 나가고 있습니다.</p>
	    </div>
	    <div class="feature-item">
	      <h2>📅 기간</h2>
	      <p>
	      	Min's는 2025년 01월 09일 부터 2025년 02월 04일까지 제작한 프로젝트입니다.
      	</p>
	    </div>
	  </div>
	  <hr>
	  <p>앞으로도 많은 관심과 성원 부탁드립니다!</p>
	</div>
	
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>

</html>
