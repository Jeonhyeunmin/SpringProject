<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>userInput.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <style type="text/css">
		*, *:before, *:after {
		  box-sizing: border-box;
		  margin: 0;
		  padding: 0;
		}
		
		body {
		  font-family: 'Open Sans', Helvetica, Arial, sans-serif;
		  background: #ededed;
		}
		
		input, button {
		  border: none;
		  outline: none;
		  background: none;
		  font-family: 'Open Sans', Helvetica, Arial, sans-serif;
		}
		
		.cont {
		  overflow: hidden;
		  position: relative;
		  width: 900px;
		  height: 550px;
		  margin: 0 auto 100px;
		  background: #fff;
		}
		
		.form {
		  position: relative;
		  width: 640px;
		  height: 100%;
		  transition: transform 1.2s ease-in-out;
		  padding: 50px 30px 0;
		}
		
		.sub-cont {
		  overflow: hidden;
		  position: absolute;
		  left: 640px;
		  top: 0;
		  width: 900px;
		  height: 100%;
		  padding-left: 260px;
		  background: #fff;
		  transition: transform 1.2s ease-in-out;
		}
		
		.cont.s--signup .sub-cont {
		  transform: translate3d(-640px, 0, 0);
		}
		
		button {
		  display: block;
		  margin: 0 auto;
		  width: 260px;
		  height: 36px;
		  border-radius: 30px;
		  color: #fff;
		  font-size: 15px;
		  cursor: pointer;
		}
		
		.img {
		  overflow: hidden;
		  z-index: 2;
		  position: absolute;
		  left: 0;
		  top: 0;
		  width: 260px;
		  height: 100%;
		  padding-top: 250px;	/*	사인업 버튼		*/
		}
		
		.img:before {
		  content: '';
		  position: absolute;
		  right: 0;
		  top: 0;
		  width: 900px;
		  height: 100%;
		  background-image: url('${ctp}/login/login2.jpg');
		  background-size: cover;
		  transition: transform 1.2s ease-in-out;
		}
		
		.img:after {
		  content: '';
		  position: absolute;
		  left: 0;
		  top: 0;
		  width: 100%;
		  height: 100%;
		  background: rgba(0, 0, 0, 0.6);
		}
		
		.cont.s--signup .img:before {
		  transform: translate3d(640px, 0, 0);
		}
		
		.cont.s--signup .img__text.m--in {
		  transform: translateX(0);
		}
		
		.img__btn {
		  overflow: hidden;
		  z-index: 2;
		  position: relative;
		  width: 100px;
		  height: 36px;
		  margin: 0 auto;
		  background: transparent;
		  color: #fff;
		  text-transform: uppercase;
		  font-size: 15px;
		  cursor: pointer;
		}
		
		.img__btn:after {
		  content: '';
		  z-index: 2;
		  position: absolute;
		  left: 0;
		  top: 0;
		  width: 100%;
		  height: 100%;
		  border: 2px solid #fff;
		  border-radius: 30px;
		}
		
		.img__btn span {
		  position: absolute;
		  left: 0;
		  top: 0;
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  width: 100%;
		  height: 100%;
		  transition: transform 1.2s;
		}
		
		.img__btn span.m--in {
		  transform: translateY(-72px);
		}
		
		.cont.s--signup .img__btn span.m--in {
		  transform: translateY(0);
		}
		
		.cont.s--signup .img__btn span.m--up {
		  transform: translateY(72px);
		}
		
		h2 {
		  width: 100%;
		  font-size: 26px;
		  text-align: center;
		}
		
		label {
		  display: block;
		  width: 260px;
		  margin: 25px auto 0;
		}
		
		label span {
		  font-size: 12px;
		  text-transform: uppercase;
		}
		
		input {
		  display: block;
		  width: 100%;
		  margin-top: 5px;
		  padding-bottom: 5px;
		  font-size: 16px;
		  border-bottom: 1px solid rgba(0, 0, 0, 0.4);
		  text-align: center;
		}
		
		.input-group {
		    display: flex;
		    justify-content: center; /* 가운데 정렬 */
		    gap: 20px; /* 두 요소 사이의 간격 */
		    margin-top: 10px; /* 위 요소와의 여백 */
		}
		
		.forgot-pass {
		    color: #a1a1a1;
		    font-size: 12px;
		    text-decoration: none;
		    transition: color 0.3s ease;
		}
		
		.forgot-pass:hover {
		    color: #000; /* 호버 시 색상 변경 */
		}

		
		.submit {
		  margin-top: 40px;
		  margin-bottom: 20px;
		  background: #d4af7a;
		  text-transform: uppercase;
		}
		
		.back {
		    margin-top: 40px;
		    margin-bottom: 20px;
		    background: #e0e0e0; /* 부드러운 회색 배경 */
		    color: #333333; /* 어두운 글자색 */
		    border-radius: 30px;
		    font-size: 15px;
		    font-weight: bold;
		    text-transform: uppercase;
		    transition: background-color 0.3s ease, color 0.3s ease;
		    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		}
		
		.back:hover {
		    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2); /* 호버 시 그림자 강조 */
		}

		
		.fb-btn {
		  border: 2px solid #d3dae9;
		  color: #9faecf;
		}
		
		.fb-btn span {
		  font-weight: bold;
		  color: #5f6e8e;
		}
		
		.sign-in {
		  transition-timing-function: ease-out;
		}
		
		.cont.s--signup .sign-in {
		  transition-timing-function: ease-in-out;
		  transition-duration: 1.2s;
		  transform: translate3d(640px, 0, 0);
		}
		
		.sign-up {
		  transform: translate3d(-900px, 0, 0);
		}
		
		.cont.s--signup .sign-up {
		  transform: translate3d(0, 0, 0);
		}
		
		.kakao-btn {
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    width: 260px;
		    height: 40px;
		    background-color: #FEE500; /* 카카오 브랜드 컬러 */
		    color: #000000; /* 검은색 글자 */
		    border-radius: 20px;
		    font-size: 15px;
		    font-weight: bold;
		    cursor: pointer;
		    transition: background-color 0.3s;
		    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		}
		
		.kakao-btn:hover {
		    background-color: #fddb00; /* 호버 효과 */
		}
		
		.kakao-btn svg {
		    margin-right: 10px; /* 로고와 텍스트 간격 */
		}

				
		
  </style>
  <script type="text/javascript">
	  document.querySelector('.img__btn').addEventListener('click', function() {
		  document.querySelector('.cont').classList.toggle('s--signup');
		});
  </script>
</head>
<body>
<div class="cont">
	<a class="back-arrow" href="${ctp}/">
	    <i class="fa-solid fa-arrow-left"></i>
	</a>
	<form method="post" action="${ctp}/member/login">
	  <div class="form sign-in align-middle">
	    <h2>LOGIN</h2>
	    <label>
	      <span>ID</span>
	      <input type="text" id="mid" name="mid" />
	    </label>
	    <label>
	      <span>Password</span>
	      <input type="password" id="pwd" name="pwd" />
	    </label>
	    <div class="input-group">
		    <a href="#" class="forgot-pass">아이디 찾기</a>
		    <a href="#" class="forgot-pass">비밀번호 찾기</a>
	    </div>
	    <button type="submit" class="submit">Sign In</button>
			<button type="button" class="kakao-btn">
			    <!-- SVG 카카오톡 로고 -->
			    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" style="margin-right: 10px;">
			        <path fill="#000000" d="M12.001 2C6.477 2 2 5.862 2 10.5c0 2.808 1.68 5.29 4.315 6.822-.193.703-.693 2.524-.793 2.866 0 0-.015.137.073.186s.177.018.177.018c.234 0 .344-.137.344-.137 0-.015 1.416-.958 2.445-1.545.47.073.95.11 1.438.11 5.524 0 10.001-3.863 10.001-8.5S17.525 2 12.001 2z"/>
			    </svg>
			    카카오로 로그인하기
			</button>
	  </div>
  </form>
  <div class="sub-cont">
    <div class="img">
      <div class="img__btn">
        <span class="m--up">Sign Up</span>
        <span class="m--in">Sign In</span>
      </div>
    </div>
    <div class="form sign-up">
      <h2>JOIN</h2>
      <label>
        <span>이름</span>
        <input type="text" />
      </label>
      <label>
        <span>아이디</span>
        <input type="text" />
        <input type="button" value="아이디 중복체크" />
      </label>
      <label>
        <span>비밀번호</span>
        <input type="password" />
      </label>
      <label>
        <span>Email</span>
        <input type="email" />
        <input type="button" value="이메일 인증" />
      </label>
      <div class="form-group">
		    <font color="red"><b>*&nbsp;</b></font><label>구분</label>
		    <fieldset style="border: 0; padding: 0; display: flex; gap: 20px;">
	        <label for="level1" class="industry-option">
            <input type="radio" name="level" id="level1" value="1">
            <i class="fa-solid fa-brush"></i> 고객
	        </label>
	        <label for="level2" class="industry-option">
            <input type="radio" name="level" id="level2" value="2">
            <i class="fa-solid fa-couch"></i> 파트너
	        </label>
		    </fieldset>
			</div>
      <button type="button" onclick="" class="submit">Sign Up</button>
  		<button type="button" class="kakao-btn">
		    <!-- SVG 카카오톡 로고 -->
		    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" style="margin-right: 10px;">
		        <path fill="#000000" d="M12.001 2C6.477 2 2 5.862 2 10.5c0 2.808 1.68 5.29 4.315 6.822-.193.703-.693 2.524-.793 2.866 0 0-.015.137.073.186s.177.018.177.018c.234 0 .344-.137.344-.137 0-.015 1.416-.958 2.445-1.545.47.073.95.11 1.438.11 5.524 0 10.001-3.863 10.001-8.5S17.525 2 12.001 2z"/>
		    </svg>
		    카카오로 회원가입
		</button>
      <button type="button" class="back" onclick="location.href='${ctp}/'" style="margin-top: 18px;"><span>돌아가기</span></button>
    </div>
  </div>
</div>

</body>
</html>