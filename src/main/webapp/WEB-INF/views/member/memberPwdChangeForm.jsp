<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <style>
    #pwdError {
      font-size: 12px;
      color: #e74c3c;
      margin-top: 5px;
    }
  </style>
</head>
<script type="text/javascript">

</script>
<body>
	<form name="" action="">
		<div class="modal-body">
		  <!-- 현재 비밀번호 -->
		  <div class="form-group mb-3">
		    <label for="nowPwd" class="form-label">현재 비밀번호</label>
		    <input type="password" class="form-control" id="nowPwd" name="nowPwd" placeholder="현재 비밀번호를 입력하세요" required>
		  </div>
		  <!-- 새 비밀번호 -->
		  <div class="form-group mb-3">
		    <label for="pwd" class="form-label">새 비밀번호</label>
		    <input type="password" class="form-control" id="pwd" name="pwd" oninput="pwd1Check()" placeholder="새 비밀번호를 입력하세요" required>
		  </div>
		  <!-- 새 비밀번호 확인 -->
		  <div class="form-group mb-3">
		    <label for="pwd2" class="form-label">새 비밀번호 확인</label>
		    <input type="password" class="form-control" id="pwd2" name="pwd2" oninput="pwd1Check()" placeholder="새 비밀번호를 다시 한번 입력하세요" required>
		  </div>
		  <!-- 에러 메시지 -->
		  <span id="pwdError" class="text-danger" style="font-size: 14px;"></span>
		</div>
		<div class="modal-footer">
		  <button type="button" class="btn btn-secondary" style="margin-right: 30px;"	onclick="closePwdChageForm()" >취소</button>
		  <button type="button" class="btn btn-primary" onclick="pwdChange()">비밀번호 변경</button>
		</div>
	</form>

</body>
</html>
