<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${vo.name} 고객님의 아이디 | Min's</title>
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.js"></script>  
  <style type="text/css">
	  .con {
      width: 100%;
      max-width: 500px;
      padding: 30px;
      background: #fff;
      border-radius: 12px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
      z-index: 3 !important;
      position: absolute;
      margin-left: 40%;
      margin-top: 3%;
	  }
    .logo {
      font-size: 28px !important;
      font-weight: bold !important;
      color: #e1c699 !important;
      text-decoration: none !important;
      font-family: 'Playfair Display', serif !important;
      width: 1000px;
      margin: auto;
      margin-top: 25%;
      z-index: 1;
      position: fixed;
      margin-left: 16%;
    }
    svg {
		  overflow: visible;
		  margin-right: 10%;
		}
	  .tabs {
	      display: flex;
	      justify-content: space-around;
	      margin-bottom: 20px;
	      border-bottom: 2px solid #ddd;
	  }
	  .tabs button {
	      background: none;
	      border: none;
	      font-size: 16px;
	      font-weight: bold;
	      color: #555;
	      padding: 10px;
	      cursor: pointer;
	      transition: color 0.3s ease, border-bottom 0.3s ease;
	  }
	  .form-group {
	      margin-bottom: 20px;
	  }
	  label {
	      font-size: 14px;
	      color: #555;
	  }
	  .control {
	      width: 100%;
	      height: 45px;
	      border-radius: 8px;
	      border: 1px solid #ddd;
	      padding: 10px;
	      font-size: 16px;
	      transition: border-color 0.3s ease;
	  }
	  .nextBtn {
	      background: #a67d3f;
	      color: #fff;
	      border: none;
	      width: 100%;
	      height: 50px;
	      font-size: 18px;
	      font-weight: bold;
	      border-radius: 8px;
	      cursor: pointer;
	      transition: background-color 0.3s ease, transform 0.2s ease;
	  }
	  .nextBtn:hover {
	      background: #a67d3e;
	      transform: translateY(-2px);
	      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	  }
	  .nextBtn:active {
	      transform: translateY(0);
	      box-shadow: none;
	  }
  </style>
</head>
<body>
	<div class="line-drawing-demo logo">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 600 300" xmlns:xlink="http://www.w3.org/1999/xlink" style="width: 100%;">
		  <g class="lines" fill="none" stroke="#f2d8b1" stroke-width="7">
				<path d="M28.78,19.23q29.31-.36,33.65,17,13,44.15,31.48,93.71T127.56,207q16.63-27.48,36.18-77.06t30.39-93.71q4.34-17.35,33.65-17t27.13,17a511.51,511.51,0,0,0-3.62,52.46q-.72,30-.72,60.42,0,33.3.72,62.6t3.62,53.18q2.18,15.93-26.77,15.92t-26.78-15.92Q205,241,205.71,199.41t-1.45-70.56q-18.1,39.81-33.29,78.51t-21.71,57.53q-4.33,15.19-21.7,14.47t-21.71-14.47Q99.34,247.52,86,209.17t-32.2-81.76q-2.89,35.46-2.17,76t3.62,61.51q3.6,15.93-25.33,15.92T1.65,264.89q3.61-31.83,4.7-60.78t1.09-55q0-26-1.09-57.52a485.26,485.26,0,0,0-4.7-55.36Q-.52,19.6,28.78,19.23Z"/>
				<path d="M316.42,78.93q28.21,0,26.05,16.64a773.32,773.32,0,0,0-4.35,83.94,813.94,813.94,0,0,0,4.35,85.38q2.16,15.93-25.33,15.92t-26.77-15.92a636.11,636.11,0,0,0,5.79-85.38,604.72,604.72,0,0,0-5.79-83.94Q288.2,78.94,316.42,78.93ZM335.59,8.69q8.31,7.19,8.32,18.83,0,10.27-8.32,17.45a28.43,28.43,0,0,1-19.17,7.18A25.85,25.85,0,0,1,298,45a23.12,23.12,0,0,1-7.59-17.45q0-11.64,7.59-18.83A25.9,25.9,0,0,1,316.42,1.5,28.48,28.48,0,0,1,335.59,8.69Z"/>
				<path d="M527,90.86q15.91,15.57,12.31,45.23-2.91,35.46-2.54,66.21t2.54,66.93q1.44,13-24.24,12.3t-25-12.3q3.62-30.39,3.26-52.82t-1.81-52.82q0-21-4.71-32.93t-19.89-11.94q-19.55,0-28.59,15.56a80.66,80.66,0,0,0-10.49,35.1q-.74,29-.72,49.56t2.17,50.29q1.44,13-23.88,12.3t-25.33-12.3q3.62-49.92,3.62-90.45t-3.62-89q0-12.3,24.61-12.66t24.6,14.11A55.51,55.51,0,0,1,451,79.29q13-4,30.39-4Q511.06,75.31,527,90.86Z"/>
				<path d="M612.53,43.47q9,9.41,9.05,27.5,0,16.65-12.66,32.56T573.1,128.85q-10.86,4.35-12.66,2.17t9-8.68a67.74,67.74,0,0,0,16.64-14.47q7.23-8.69,8-15.92-17.37.73-25.69-8t-8.32-22.43A26,26,0,0,1,568.39,42q8.31-8,21.35-8Q603.48,34.06,612.53,43.47Z"/>
				<path d="M771.59,90.5q21.33,15.19,22.07,47,1.44,11.58-23.16,11.57t-24.6-11.57a21,21,0,0,0-7.6-16.65q-7.6-6.51-24.24-6.51-9.42,0-15.56,5.43t-6.15,11.94q0,9.41,8.68,17t30.4,13.39q36.17,8.69,49.2,23.88t13,36.9q0,23.88-17,42.33T718.4,283.7q-36.9,0-55.72-15.55t-21-46.68q0-10.84,23.88-11.57T689.46,220q0,11.58,8,18.81t21,7.24q16.64,0,23.52-8t6.87-15.2q0-6.51-7.23-14.47T708.27,194q-32.57-7.95-48.12-21.71t-15.56-36.18q0-26.06,18.09-43.42t52.83-17.36Q750.23,75.31,771.59,90.5Z"/>
			</g>
		</svg>
  </div>
  <script>
	  anime({
		  targets: '.line-drawing-demo .lines path',
		  strokeDashoffset: [anime.setDashoffset, 0],
		  easing: 'easeInOutSine',
		  duration: 3000,
		  delay: function(el, i) { return i * 250 },
		  direction: 'alternate',
		  loop: true
		});
	</script>
  <div class="con">
    <div class="tabs">
        <button class="active" >아이디</button>
    </div>
    <div id="findIdForm">
      <form method="post" action="${ctp}">
          <div class="form-group">
            <label for="name">아이디</label>
            <input type="text" class="control" id="mid" name="mid" value="${vo.mid}" readonly>
          </div>
          <button type="submit" class="nextBtn" style="margin-bottom: 5px;">홈으로</button>
          <input type="button" style="background: gray;" onclick="location.href='${ctp}/common/idAccount'" class="nextBtn" value="비밀번호 찾기"/>
      </form>
    </div>
  </div>
</body>
</html>