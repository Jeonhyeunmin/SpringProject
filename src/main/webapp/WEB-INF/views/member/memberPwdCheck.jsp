<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>회원정보 확인</title>
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <style>
    body {
      background-color: #f9f9f9;
      font-family: 'Arial', sans-serif;
    }
    .container {
      max-width: 600px;
      margin: 50px auto;
      background: #fff;
      padding: 20px;
      height: 575px;
    }
    h2 {
      font-size: 24px;
      margin-bottom: 20px;
      text-align: center;
      color: #333;
    }
    hr {
      margin: 20px 0;
    }
    .form-group {
      margin-bottom: 15px;
    }
    .form-group label {
      font-weight: bold;
      display: block;
      margin-bottom: 5px;
    }
    .form-group input {
      width: 100%;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 5px;
    }
    .btn {
      display: block;
      width: 100%;
      padding: 10px;
      background-color: #007bff !important;
      color: #fff !important;
      text-align: center;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
      margin-top: 10px;
    }
    .btn:hover {
      background-color: #0056b3 !important;
    }
    .text-danger {
      color: #e74c3c;
      font-size: 14px;
    }
  </style>
  <script type="text/javascript">
  	function fCheck() {
	  	let pwd = document.getElementById("pwd").value;
	  	if(pwd == ""){
	  		$(".text-danger").html("* 비밀번호를 입력해 주세요.");
	  		return false;
	  	}
			myform.submit();
		}
				  
  </script>
</head>
<body>
  <div class="container">
    <h2>회원정보 확인</h2>
  	<form name="myform" method="post" action="${ctp}/member/pwdCheck">
	    <div class="form-group">
	      <label for="mid">Min's 아이디</label>
	      <input type="text" id="mid" name="mid" value="${vo.mid}" readonly>
	    </div>
	    <div class="form-group">
	      <label for="pwd">Min's 비밀번호</label>
	      <input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요">
	      <p class="text-danger"></p>
	    </div>
	    <button type="submit" onclick="fCheck()" class="btn">확인</button>
	    <hr>
	    <p class="text-muted" style="font-size: 14px;">
	      * 고객님의 개인정보 보호를 위해 비밀번호를 다시 확인합니다.<br>
	      * 비밀번호가 타인에게 노출되지 않도록 항상 주의해 주세요.
	    </p>
    </form>
  </div>
</body>
</html>
