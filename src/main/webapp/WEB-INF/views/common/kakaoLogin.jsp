<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>카카오 로그인 | Min's</title>
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <script type="text/javascript">	
  'use strict';
	
		window.Kakao.init("41b76d7b84daeebbb95cced817199ddc");
		
		document.addEventListener("DOMContentLoaded", function () {
			window.Kakao.Auth.login({
  			scope: 'profile_nickname, account_email',
  			success: function(autoObj) {
					console.log(Kakao.Auth.getAccessToken(), "정상적으로 토큰이 발급됨");
					window.Kakao.API.request({
						url : '/v2/user/me',
						success: function(res) {
							const kakao_account = res.kakao_account;
							/* console.log("전송된 정보", kakao_account); */
							location.href="${ctp}/common/KakaoLogin?nickName=" + kakao_account.profile.nickname + "&email=" + kakao_account.email + "&accessToken=" + Kakao.Auth.getAccessToken();
						}
					});
				}
  		});
		});
  
  </script>
</head>
<body>
<div class="container">
  
</div>
</body>
</html>