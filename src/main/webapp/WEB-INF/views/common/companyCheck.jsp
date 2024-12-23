<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
	<style>
		body {
	    font-family: 'Arial', sans-serif;
	    margin: 0;
	    padding: 0;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    height: 100vh;
		}
		.container {
		    width: 100%;
		    max-width: 500px;
		    padding: 30px;
		    background: #fff;
		    border-radius: 12px;
		    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
		    text-align: center;
		}
		h3 {
		    color: #333;
		    font-size: 24px;
		    margin-bottom: 20px;
		}
		hr {
		    border: none;
		    height: 1px;
		    background: #ddd;
		    margin: 20px 0;
		}
		input[type="text"] {
		    width: 100%;
		    height: 40px;
		    border-radius: 8px;
		    border: 1px solid #ddd;
		    padding: 10px;
		    font-size: 16px;
		    margin-bottom: 5px;
		    transition: border-color 0.3s ease, box-shadow 0.3s ease;
		}
		input[type="text"]:focus {
		    border-color: #6C757D;
		    box-shadow: 0 0 8px rgba(108, 117, 125, 0.3);
		}
		.btn {
		    width: 100%;
		    height: 50px;
		    font-size: 16px;
		    border-radius: 8px;
		    cursor: pointer;
		    margin-bottom: 10px;
		    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
		}
		.btn-primary {
		    background: #6C757D;
		    color: #fff;
		    border: none;
		}
		.btn-primary:hover {
		    background: #5A6268;
		    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
		    transform: translateY(-2px);
		}
		.btn-secondary {
		    background: #E9ECEF;
		    color: #333;
		    border: none;
		}
		.btn-secondary:hover {
		    background: #DEE2E6;
		    transform: translateY(-2px);
		}
		.success {
		    color: #28a745;
		    font-size: 16px;
		    font-weight: bold;
		    margin: 15px 0;
		}
		.error {
		    color: #dc3545;
		    font-size: 16px;
		    font-weight: bold;
		    margin: 15px 0;
		}


	</style>
  <script type="text/javascript">
		'use strict';
		
	  function companyCheck() {
			let company = childForm.company.value;
			if(company.trim() == ""){
				alert("아이디를 입력하세요.");
				return false;
			}
			childForm.submit();
		}
	  
	  
	  function wClose() {
			opener.window.joinForm.company.value = '${company}';
			opener.window.joinForm.pwd.focus();
			window.close();
		}
	</script>
</head>
<div class="container">
    <h3>아이디 중복 체크</h3>
    <hr>
    <div>
        <c:if test="${companyCheck == 'Yes'}">
            <div class="success">${company}는 사용 가능합니다.</div>
            <button class="btn btn-primary" onclick="wClose()">창 닫기</button>
        </c:if>
        <c:if test="${companyCheck == 'No'}">
            <div class="error">${company}는 사용 불가능합니다.</div>
            <form name="childForm" method="get" action="${ctp}/common/companyCheck">
                <input type="text" name="company" id="company" placeholder="업체명을 입력하세요">
                <button type="button" class="btn btn-primary" onclick="companyCheck()">업체명 검색</button>
                <button type="button" class="btn btn-secondary" onclick="window.close()">취소</button>
            </form>
        </c:if>
    </div>
</div>
</body>
</html>