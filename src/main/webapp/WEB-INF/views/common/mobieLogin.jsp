<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="icon" href="${ctp}/main/favicon.png">
  <title>로그인 | Min's</title>
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
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
		  height: 100vh;
		  overflow: hidden; 
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
		  height: 800px;
		  margin: 0 auto 100px;
		  background: #fff;
		}
		
		.form {
		  position: relative;
		  width: 640px;
		  height: 100%;
		  transition: transform 1.2s ease-in-out;
		  padding: 20px 30px 0;
		}
		
		button {
		  display: block;
		  margin: 0 auto;
		  width: 400px;
		  height: 36px;
		  border-radius: 30px;
		  color: #fff;
		  font-size: 15px;
		  cursor: pointer;
		}
		
		h2 {
		  width: 100%;
		  font-size: 26px;
		  text-align: center;
		}
		
		label {
		  display: block;
		  width: 400px;
		  margin: 15px auto 0;
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
		}
		
		.input-group {
	    display: flex;
	    justify-content: center;
	    gap: 20px;
	    margin-top: 10px;
		}
		
		.forgot-pass {
	    color: #a1a1a1;
	    font-size: 17px;
	    text-decoration: none;
	    transition: color 0.3s ease;
	    padding: 10px;
		}
		
		.forgot-pass:hover {
		    color: #000;
		}

		.submit {
		  margin-top: 40px;
		  margin-bottom: 20px;
		  background: #5e0000;
		  text-transform: uppercase;
		}
		
		.sign-in {
		  transition-timing-function: ease-out;
		  margin-top: 15%;
		}
		
		.form-container {
	    background: #fff;
	    padding: 30px;
	    border-radius: 15px;
	    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
	    margin: 10px auto;
	    width: 400px;
		}
		
		.form-container h2 {
	    font-size: 28px;
	    margin-bottom: 20px;
	    color: #333;
		}
		
		.submit, .kakao-btn {
	    margin-top: 20px;
		}
		
		/* ID 저장 스타일 */
		.idSave-group {
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    margin: 10px 0 20px 0;
		}
		
		.idSave-label {
	    font-size: 14px;
	    font-weight: 500;
	    color: #555;
	    margin-right: 10px;
	    cursor: pointer;
	    margin-left: 10px;
		}
		
		.idSave-checkbox {
	    -webkit-appearance: none;
	    -moz-appearance: none;
	    appearance: none;
	    width: 18px;
	    height: 18px;
	    border: 2px solid #5e0000;
	    border-radius: 4px;
	    outline: none;
	    cursor: pointer;
	    transition: all 0.3s ease;
	    display: inline-block;
	    position: relative;
	    margin-left: 30px;
	    margin-top: 10px;
		}
		
		.idSave-checkbox:checked {
	    background-color: #5e0000;
	    border-color: #5e0000;
		}
		
		.idSave-checkbox:checked::after {
	    content: "";
	    position: absolute;
	    top: 2px;
	    left: 5px;
	    width: 6px;
	    height: 10px;
	    border: solid white;
	    border-width: 0 2px 2px 0;
	    transform: rotate(45deg);
		}
		
		
  </style>
  <script type="text/javascript">
  	function kakaoLogin() {
 			location.href = "${ctp}/common/kakaoLoginForm";
		}
  	
  	function login() {
			let mid = myform.mid.value;
			let pwd = myform.pwd.value;
			let idSave = myform.idSave.value;
			$.ajax({
				type : "post",
				url : "${ctp}/common/windowLogin",
				data : {
					mid : mid,
					pwd : pwd,
					idSave : idSave
				},
				success: function(res) {
					if(res != "0"){
						if (opener && !opener.closed) {
							if (typeof opener.onLoginSuccess === "function") {
                opener.onLoginSuccess();
              }
            }
						window.close();
					}
				},
				error: function() {
					alert("전송오류");
				}
			});
		}
  

  </script>
</head>
<body>
<div class="cont">
	<form method="post" name="myform">
	  <div class="form sign-in align-middle">
	    <h2>LOGIN</h2>
	    <label>
	      <span>ID</span>
	      <input type="text" id="mid" name="mid" value="${cMid}" />
	    </label>
	    <label>
	      <span>Password</span>
	      <input type="password" id="pwd" name="pwd" />
	    </label>
	    <div class="idSave-group">
		    <input type="checkbox" id="idSave" name="idSave" class="idSave-checkbox" ${!empty cMid ? 'checked' : ''}>
		    <label for="idSave" class="idSave-label">아이디 저장</label>
			</div>
	    <div class="input-group">
		    <a href="${ctp}/common/idAccount" class="forgot-pass">아이디 찾기</a>
		    <a href="#" class="forgot-pass">비밀번호 찾기</a>
	    </div>

	    <button type="button" onclick="login()" class="submit">Sign In</button>
	  </div>
  </form>
</div>
</body>
</html>