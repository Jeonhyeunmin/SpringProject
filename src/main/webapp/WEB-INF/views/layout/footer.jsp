<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <style type="text/css">
  	@font-face { /*눈누 기초고딕 - 두꺼운 네모 딱딱 고딕*/
	    font-family: 'NoonnuBasicGothicRegular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
		}
  	footer {
  		font-family: 'NoonnuBasicGothicRegular';
	    position: relative;
	    background-color: transparent;
	  }
	
	  #fireCanvas {
	    width: 100%;
	    height: 220px;
	    position: absolute;
	    bottom: 0;
	    left: 0;
	    margin: 0;
	  }
	
	  .cnv {
	    position: relative;
	    width: 100%;
	    height: 100%;
	    z-index: -1;
	  }
  </style>
  <script type="text/javascript">
  	document.addEventListener('DOMContentLoaded', function () {
	    const fireCanvas = document.getElementById('fireCanvas');
	    const ctx = fireCanvas.getContext('2d');

	    // Canvas 크기 조정
	    fireCanvas.width = window.innerWidth;
	    fireCanvas.height = 220;

	    const amount = 200; // Number of sparks
	    const sizeRate = 0.99; // Rate at which sparks shrink
	    const speedRate = 1.5; // Speed of sparks
	    const windSpeed = 0.1; // Wind speed

	    const sparks = [];

	    class Spark {
	      constructor(x, y) {
	        this.x = x;
	        this.y = y;
	        this.size = Math.random() * 5 + 2;
	        this.speedX = (Math.random() - 0.5) * speedRate;
	        this.speedY = Math.random() * -speedRate;
	        this.opacity = 1;
	      }

	      update() {
	        this.x += this.speedX + (Math.random() - 0.5) * windSpeed;
	        this.y += this.speedY;
	        this.size *= sizeRate;
	        this.opacity *= sizeRate;

	        // Randomly change direction
	        if (Math.random() < 0.05) {
	          this.speedX = (Math.random() - 0.5) * speedRate;
	        }
	      }

	      draw() {
	        ctx.fillStyle = "rgba(255, 165, 0, " + this.opacity + ")";
	        ctx.beginPath();
	        ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
	        ctx.fill();
	      }
	    }

	    function init() {
	      for (let i = 0; i < amount; i++) {
	        const x = Math.random() * fireCanvas.width;
	        const y = fireCanvas.height;
	        sparks.push(new Spark(x, y));
	      }
	    }

	    function animate() {
	      ctx.clearRect(0, 0, fireCanvas.width, fireCanvas.height);
	      sparks.forEach((spark, index) => {
	        spark.update();
	        spark.draw();
	        if (spark.size < 0.5 || spark.opacity < 0.1) {
	          sparks.splice(index, 1);
	          const x = Math.random() * fireCanvas.width;
	          const y = fireCanvas.height;
	          sparks.push(new Spark(x, y));
	        }
	      });
	      requestAnimationFrame(animate);
	    }

	    init();
	    animate();
	  });
  </script>
</head>
<body id="footer">
	<footer style="background-color: transparent; padding: 20px 0; font-size: 12px; color: #666; border-top: 1px solid #ddd;">
	  <div style="max-width: 1200px; margin: 0 auto; padding: 0 15px;">
	    <div class="logo" style="text-align: center; margin-bottom: 20px;">
	      Min's
	    </div>
	
	    <div style="text-align: center; margin-bottom: 20px;">
	      <a href="${ctp}/common/info" style="margin: 0 10px; color: #666; text-decoration: none;">회사소개</a>
	      <a href="#" style="margin: 0 10px; color: #666; text-decoration: none;">공지사항</a>
	      <a href="#" style="margin: 0 10px; color: #666; text-decoration: none;">윤리경영</a>
	      <a href="#" style="margin: 0 10px; color: #666; text-decoration: none;">이용약관</a>
	      <a href="#" style="margin: 0 10px; color: #666; text-decoration: none;">개인정보 처리방침</a>
	    </div>
	
	    <div style="text-align: center; margin-bottom: 20px;">
	      <p style="margin: 5px 0;">주소: 충청북도 청주시 서원구 사직대로 109 4층</p>
	      <p style="margin: 5px 0;">사업자등록번호: 123-45-67890</p>
	      <p style="margin: 5px 0;">고객센터: 1800-1234</p>
	    </div>
	
	    <div style="text-align: center; margin-bottom: 20px;">
	      <p style="margin: 5px 0;">Copyright © 2025 Min's. All rights reserved.</p>
	    </div>
	
	    <div style="text-align: center;">
			  <a href="htttps://www,facebook.com/" target="_blank" style="margin: 0 10px;"><i class="fab fa-facebook" style="font-size: 20px; color: #666;"></i></a>
			  <a href="https://www.twitter.com/" target="_blank" style="margin: 0 10px;"><i class="fab fa-twitter" style="font-size: 20px; color: #666;"></i></a>
			  <a href="https://www.instagram.com/" target="_blank" style="margin: 0 10px;"><i class="fab fa-instagram" style="font-size: 20px; color: #666;"></i></a>
			  <a href="https://www.youtube.com/" target="_blank" style="margin: 0 10px;"><i class="fab fa-youtube" style="font-size: 20px; color: #666;"></i></a>
			</div>
	    <div class="cnv">    
				<canvas id="fireCanvas"></canvas>
			</div>
	  </div>
	</footer>
</body>
</html>
