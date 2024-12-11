<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>userInput.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <script src="https://kit.fontawesome.com/0c69fdf2c0.js" crossorigin="anonymous"></script>
  <style type="text/css">
  th, td{
  	padding: 10px !important;
  }
  th{
  	text-align: center;
  }
  h2{
  	margin-top: 20px;
  }
  </style>
</head>
<body>
<div class="container">
	<form method="post">
	<h2>회 원 가 입</h2>
		<table class="table table-bordered">
		
			<!-- 아이디 -->
	    <tr>
	    	<th class="text-center"><i class="fa-regular fa-address-card fa-2x"></i></th>
	      <td>
		      	<input type="text" name="mid" id="mid" class="form-control" placeholder="아이디를 입력하세요" autofocus required />
	      </td> 
	    </tr>
	    
	    <!-- 비밀번호 -->
	    <tr>
	    	<th class="text-center"><i class="fa-solid fa-key fa-2x"></i></th>
	      <td><input type="password" name="pwd" id="pwd"placeholder="비밀번호를 입력하세요" class="form-control" required></td> 
	    </tr>
	    
	    <!-- 성명 -->
	    <tr>
	    	<th class="text-center"><i class="fa-solid fa-user fa-2x"></i></th>
	      <td><input type="text" name="name" id="name" placeholder="성명을 입력하세요" class="form-control" required /></td> 
	    </tr>
	    
	    <!-- 나이 -->
    	<tr>
    	<th class="text-center"><i class="fa-solid fa-cake-candles fa-2x"></i></th>
	      <td>
	      	<input type="number" name="age" id="age" placeholder="나이를 입력하세요" class="form-control"/>
      	</td> 
	    </tr>
	    
	    <!-- 성별 -->
	    <tr>
	    	<th class="text-center"><i class="fa-solid fa-venus-mars fa-2x"></i></th>
	      <td>
	      	<input type="radio" name="gender" id="male" value="남자"/><label for="male">남자</label>
	      	<input type="radio" name="gender" id="female" value="여자" class="ml-2" checked/><label for="female">여자</label>
      	</td> 
	    </tr>
	    
			<!-- 주소 -->		    
			<tr>
				<th class="text-center" style="padding-top: 15px"><i class="fa-solid fa-map-location fa-2x"></i></th>
				<td>
						<input type="text" name="address" id="address" placeholder="주소를 입력하세요" class="form-control">
				</td> 
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<input type="submit" value="회원가입" class="btn btn-outline-success me-2">
					<input type="reset" value="다시입력" class="btn btn-outline-warning me-2">
					<input type="button" value="돌아가기" onclick="location.href='${ctp}/user/userMain'" class="btn btn-outline-danger me-2">
				</td>
			</tr>
    </table>
    
	</form>
</div>
</body>
</html>