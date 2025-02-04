<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
	<style type="text/css">
		.event-container {
	    margin: 50px 20%;
	    align-content: center;
	    align-items: center;
	    text-align: center;
	    position: relative;
	    min-height: 80vh; /* 페이지의 최소 높이를 설정해 버튼이 아래에 위치하도록 */
		}
		
		.page-header .breadcrumb {
	    font-size: 14px;
	    color: #555;
	    margin-top: 2%;
	    margin-left: 14%;
	    background-color: #fff;
		}
		
		.breadcrumb a {
	    text-decoration: none;
	    padding: 0 5px;
	    color: #3498db;
	    transition: color 0.3s ease;
		}
		
		.breadcrumb a:hover {
	    color: #2c3e50;
		}
		
		.event-content {
	    margin-top: 100px;
		}
		
		/* 쿠폰 다운로드 버튼 */
		.downCoupon {
	    position: absolute;
	    bottom: 50px;
	    left: 50%;
	    transform: translateX(-50%);
	    font-size: 18px;
	    padding: 25px 60px;
	    border-radius: 10px;
	    border: none;
	    background: linear-gradient(45deg, #3498db, #2980b9);
	    color: white;
	    font-weight: bold;
	    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	    transition: all 0.3s ease;
	    cursor: pointer;
		}
		
		.downCoupon:hover {
	    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
	    transform: translate(-50%, -5px);
		}
		
		.downCoupon:active {
	    box-shadow: 0 3px 8px rgba(0, 0, 0, 0.2);
	    transform: translate(-50%, 2px);
		}
		
		.loading-overlay {
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background-color: rgba(0, 0, 0, 0.5); /* 반투명 회색 */
	    z-index: 1000; /* 다른 요소 위에 표시 */
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    visibility: hidden; /* 기본적으로 숨김 처리 */
	    opacity: 0; /* 초기 투명 */
	    transition: opacity 0.3s ease; /* 부드러운 전환 효과 */
	  }
	
	  .loading-overlay.active {
	    visibility: visible; /* 보이도록 설정 */
	    opacity: 1; /* 불투명하게 변경 */
	  }
	
	  .spinner {
	    width: 100px;
	    height: 100px;
	    border: 8px solid rgba(255, 255, 255, 0.3);
	    border-top: 8px solid white;
	    border-radius: 50%;
	    animation: spin 1s linear infinite;
	  }
	
	  @keyframes spin {
	    0% {
	      transform: rotate(0deg);
	    }
	    100% {
	      transform: rotate(360deg);
	    }
	  }

	</style>
	<script type="text/javascript">
	  function couponDown() {
	    // 로딩 오버레이 활성화
	    const loadingOverlay = document.getElementById("loadingOverlay");
	    loadingOverlay.classList.add("active");

	    $.ajax({
	      type: "post",
	      url: "${ctp}/event/downCoupon",
	      data: {
	        idx: ${vo.idx},
	      },
	      success: function (res) {
	        // 결과에 따른 알림 표시
	        if (res == "3") {
	          alert("쿠폰은 중복 발행이 불가능합니다.");
	        } else if (res == "2") {
	          alert("이메일 등록 후 쿠폰 발행이 가능합니다.");
	        } else if (res == "1") {
	          alert("쿠폰이 발행되었습니다.\n메일을 확인해주세요");
	        } else {
	          alert("잠시 후 다시 시도해주세요.");
	        }
	      },
	      error: function () {
	        alert("로그인 후 이용 가능한 서비스 입니다.");
	        location.href="${ctp}";
	      },
	      complete: function () {
	        // 로딩 오버레이 비활성화
	        loadingOverlay.classList.remove("active");
	      },
	    });
	  }
	</script>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
	<div class="event-container">
    <div class="breadcrumb">HOME > 쿠폰/혜택</div>
    <div class="event-content">
      ${vo.content}
    </div>
    <!-- 쿠폰 다운로드 버튼 -->
    <button class="downCoupon" onclick="couponDown()">쿠폰 다운로드</button>
    <div class="loading-overlay" id="loadingOverlay">
		  <div class="spinner"></div>
		</div>
	</div>
</body>
</html>