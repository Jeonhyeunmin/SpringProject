<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>파트너 신청</title>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
  <script type="text/javascript">
  	'use strict';
  	
  	let idCheckSw = 0;
  	let companyCheckSw = 0;
  	
  	let regex1 = /^[a-zA-Z0-9]{4,20}$/; //(아이디) 영문자 또는 숫자 4~20자
	  let regex2 = /^(?=.*?[0-9])(?=.*?[a-zA-Z])[a-zA-Z0-9!@#$%^&*()._-]{4,20}$/;  //(비밀번호)4자 이상 20자 이하, 영어/숫자 1개 이상 필수, 특수문자 허용
	  let regex3 = /^[가-힣a-zA-Z]{1,10}$/;  // (성명)한글,영문만 적어도 1자이상 
		let regex4 = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/; // 이메일 
		let regex5 = /\d{2,3}-\d{3,4}-\d{4}$/; //(전화번호)
		let regex6 = /\d{10}$/;
		
		function idCheck() {
			//let mid = joinForm.mid.value;
			let mid = document.getElementById("mid").value.trim();
			
			if(mid == "") {
				alert("아이디를 입력하세요");
				joinForm.mid.focus();
			}
			else if(!regex1.test(mid)) {
				document.getElementById("midError").innerHTML="아이디 형식에 맞춰주세요.(영어/숫자만 4~20자)";
		    joinForm.mid.focus();
			}
			else {
			  document.getElementById("midError").innerHTML="";
				let url = "${ctp}/common/memberIdCheck?mid="+mid;
				joinForm.mid.readOnly = true;
				window.open(url, "idCheckWindow", "width=900px, height=800px, top=150px, left=500px;");
				idCheckSw = 1;
			}
		}
		function companyCheck() {
			//let mid = joinForm.mid.value;
			let company = document.getElementById("company").value.trim();
			
			if(company == "") {
				alert("회사명을 입력하세요");
				joinForm.company.focus();
			}
			else {
			  document.getElementById("midError").innerHTML="";
				let url = "${ctp}/common/companyCheck?company="+company;
				joinForm.company.readOnly = true;
				window.open(url, "companyCheckWindow", "width=900px, height=800px, top=150px, left=500px;");
				companyCheckSw = 1;
			}
		}
		
		function midCheck() {
			//let regex1 = /^[a-zA-Z0-9]{4,20}$/; //(아이디) 영문자 또는 숫자 4~20자 
			let mid = document.getElementById("mid").value.trim();
			document.getElementById("midError").innerHTML="";
			
		  // 아이디 확인
		  if(!regex1.test(mid)) {
		    document.getElementById("midError").innerHTML="아이디 형식에 맞춰주세요.(영어/숫자만 4~20자)";
		  } 
		  else {
			   document.getElementById("midError").innerHTML="";
		  }			
		}
		function pwd1Check() {
			let pwd1 = joinForm.pwd.value.trim();
			let pwd2 = document.getElementById("pwd2").value.trim();
			
			document.getElementById("pwdError").innerHTML="";
		  // 비밀번호 확인
		  if(!regex2.test(pwd1)) {
		    document.getElementById("pwdError").innerHTML="비밀번호가 올바르지 않습니다.(영어/숫자 필수, 특수문자 가능 4~20자)";
		  }
		  else if(pwd1 !== pwd2) {
		    document.getElementById("pwdError").innerHTML="비밀번호가 동일하지 않습니다.";
		  }
		  else {
		    document.getElementById("pwdError").innerHTML="";
	  	}	
		}
		function nameCheck() {
			//let regex3 = /^[가-힣a-zA-Z]{1,10}$/;  // (성명)한글,영문만 적어도 1자이상 
			let ceoName = document.getElementById("ceoName").value.trim();
			document.getElementById("nameError").innerHTML="";
			
		  // 성명 확인
		  if(!regex3.test(ceoName)){
		    document.getElementById("nameError").innerHTML="성명이 올바르지 않습니다.(한글/영문만 10자 이하)";
		  }
		  else {
			  document.getElementById("nameError").innerHTML="";
		  }			
		}
		function businessNumberCheck() {
			let businessNumber = document.getElementById("businessNumber").value.trim();
			document.getElementById("businessNumberError").innerHTML="";
			
		  // 사업자번호 확인
		  if(!regex6.test(businessNumber)){
		    document.getElementById("businessNumberError").innerHTML="사업자등록번호가 올바르지 않습니다.(사업자등록번호 10자리)";
		   return false;;
		  }
		  else {
			  document.getElementById("businessNumberError").innerHTML="";
		  }			
		}
		
		function telCheck() {
			//let regex5 = /\d{2,3}-\d{3,4}-\d{4}$/g; //(전화번호)
		  let tel1 = joinForm.tel1.value;
		  let tel2 = joinForm.tel2.value;
		  let tel3 = joinForm.tel3.value;
		  let tel = tel1 + "-" + tel2 + "-" + tel3;
		  
		  // 전화번호 확인
		  if (document.getElementById("tel2").value.length >= 4 ) {
			  joinForm.tel3.focus();
      }
		  if(tel2===""){
		    document.getElementById("telError").innerHTML="전화번호를 입력해주세요.";
		  }
		  else if(tel3===""){
		    document.getElementById("telError").innerHTML="전화번호를 입력해주세요.";
		  }
		  else if(!regex5.test(tel)){
		    document.getElementById("telError").innerHTML="전화번호 형식에 맞게 입력해주세요.";
		  }
		  else {
		    document.getElementById("telError").innerHTML="";
		  }
		}
		
		// 회원가입 버튼 클릭시 체크
		function fCheck(){
		  let ceoName = document.getElementById("ceoName").value.trim();
		  let mid = joinForm.mid.value.trim();
		  let pwd1 = joinForm.pwd.value.trim();
		  let pwd2 = document.getElementById("pwd2").value.trim();
			let businessNumber = document.getElementById("businessNumber").value.trim();
	  	 
		  let tel1 = joinForm.tel1.value;
		  let tel2 = joinForm.tel2.value;
		  let tel3 = joinForm.tel3.value;
		  let tel = tel1 + "-" + tel2 + "-" + tel3;
	  	
		  
			
		  // 코스라이브러리 받아주는 서블릿쪽이 멀티파츠로 받아야 합니다 (사진을 넘길때- 업체에서 멀티파츠 갯 파라멬타)
		  
		  // 성명 확인
		  if(!regex3.test(ceoName)){
		    document.getElementById("nameError").innerHTML="성명이 올바르지 않습니다.(한글/영문만 10자 이내)";
		    document.getElementById("ceoName").focus();
		    return false;
		  }
		  else {
			  document.getElementById("nameError").innerHTML="";
		  }
		  
		  // 아이디 확인
		  if(!regex1.test(mid)) {
		    document.getElementById("midError").innerHTML="아이디 형식에 맞춰주세요.(영어/숫자만 4~20자)";
		    joinForm.mid.focus();
		    return false;
		  } 
		  else {
			   document.getElementById("midError").innerHTML="";
		  }
		  
		  // 비밀번호 확인
		  if(!regex2.test(pwd1)) {
		    document.getElementById("pwdError").innerHTML="비밀번호가 올바르지 않습니다.(영어/숫자 필수, 특수문자 가능 4~20자)";
		    joinForm.pwd.focus();
		    return false;
		  }
		  else {
		    document.getElementById("pwdError").innerHTML="";
		    
			  if(pwd2=== "") {
			    document.getElementById("pwdError").innerHTML="비밀번호를 다시 입력해주세요.";
			    document.getElementById("pwd2").focus();
			    return false;
			  }
			  else if(pwd1 !== pwd2) {
			    document.getElementById("pwdError").innerHTML="비밀번호가 동일하지 않습니다.";
			    document.getElementById("pwd2").focus();
			    return false;
			  }
			  else {
		  	  document.getElementById("pwdError").innerHTML="";
			  }
		  }
				  
		  // 전화번호 확인
		  if(tel2==="" || tel3===""){
		    document.getElementById("telError").innerHTML="전화번호를 입력해주세요.";
		    document.getElementById("tel2").focus();
		    return false;
		  }
		  else if(!regex5.test(tel)){
		    document.getElementById("telError").innerHTML="전화번호 형식에 맞게 입력해주세요.";
		    document.getElementById("tel2").focus();
		    return false;
		  }
		  else {
		    document.getElementById("telError").innerHTML="";
		  }
		  
		  if(!regex6.test(businessNumber)){
			    document.getElementById("businessNumberError").innerHTML="사업자등록번호가 올바르지 않습니다.(사업자등록번호 10자리)";
			    document.getElementById("businessNumber").focus();
			    return false;
			  }
		  else {
			  document.getElementById("businessNumberError").innerHTML="";
		  }
		  
	     if(idCheckSw == 0) {
				alert("아이디 중복확인을 해주세요.");
				document.getElementById("mid").focus();
			}
	    else if(companyCheckSw == 0) {
				alert("이메일 인증을 진행해주세요 해주세요.");
				document.getElementById("company").focus();
			}
			else {
		    joinForm.tel.value = tel;
		   	joinForm.submit();
			} 
		}
		
		
  </script>
  <style>
    body {
      font-family: 'Open Sans', Helvetica, Arial, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .container {
      width: 1000px;
      height: 820px;
      background: #fff;
      border-radius: 15px;
      padding: 30px 20px;
      overflow-y: auto;
    }

    h2 {
      font-size: 26px;
      text-align: center;
      margin-bottom: 30px;
      color: #5e0000;
      text-transform: uppercase;
      letter-spacing: 1px;
    }

    .form-group {
      display: flex;
      flex-direction: column;
      margin-bottom: 20px;
    }

    .form-group label {
      font-size: 14px;
      font-weight: bold;
      margin-bottom: 8px;
      color: #333;
    }

    .form-group input,
    .form-group select,
    .form-group textarea {
      padding: 12px 15px;
      font-size: 14px;
      border: 1px solid #ddd;
      border-radius: 5px;
      background: #f9f9f9;
      transition: all 0.3s ease;
    }

    .form-group input:focus,
    .form-group select:focus,
    .form-group textarea:focus {
      border-color: #5e0000;
      background: #fff;
      box-shadow: 0 0 5px rgba(94, 0, 0, 0.2);
    }

    .row {
      display: flex;
      justify-content: space-between;
      gap: 10px;
    }

    .row .form-group {
      flex: 1;
    }

    .btn {
      width: 48%;
      padding: 12px;
      font-size: 14px;
      font-weight: bold;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s, color 0.3s;
    }

    .btn-submit {
      background: #5e0000;
      color: #fff;
    }

    .btn-submit:hover {
      background: #7f1a1a;
    }

    .btn-cancel {
      background: #ddd;
      color: #333;
    }

    .btn-cancel:hover {
      background: #bbb;
    }

    .address-group {
      display: flex;
      flex-direction: column;
      gap: 10px;
    }

    .address-group input[type="text"] {
      cursor: pointer;
      background: #f9f9f9;
    }

    .address-group input[type="text"]:focus {
      cursor: auto;
    }

    .postcode-button {
      background: linear-gradient(135deg, #ff7e5f, #feb47b); /* 그라데이션 색상 */
      color: #fff;
      padding: 10px 15px;
      border-radius: 5px;
      cursor: pointer;
      border: none;
      font-weight: bold;
      transition: all 0.3s ease;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .postcode-button:hover {
      background: linear-gradient(135deg, #ff6a3d, #fd916c); /* 호버 시 더 진한 색상 */
      transform: translateY(-2px);
      box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
    }
    
    .phone-group {
	    display: flex; /* Flexbox를 사용하여 가로 정렬 */
	    align-items: center; /* 세로 정렬 */
	    gap: 10px; /* 요소 간 간격 */
	    width: 100%; /* 그룹 전체를 컨테이너에 맞춤 */
	  }
	
	  .phone-group select {
	    flex: 1; /* 선택 박스가 균등히 확장 */
	    padding: 12px;
	    font-size: 16px;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    background: #f9f9f9;
	  }
	
	  .phone-group input {
	    flex: 1; /* 입력 필드가 균등히 확장 */
	    padding: 12px;
	    font-size: 16px;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    background: #f9f9f9;
	  }
	
	  .phone-group span {
	    flex: 0; /* 구분 기호는 고정 크기 */
	    font-size: 18px;
	    font-weight: bold;
	    color: #333;
	    text-align: center;
	  }
	
	  .phone-group input:focus,
	  .phone-group select:focus {
	    border-color: #5e0000;
	    background: #fff;
	    box-shadow: 0 0 5px rgba(94, 0, 0, 0.2);
	  }
	  .btn-check {
	    background: #5e0000;
	    color: #fff;
	    border: none;
	    border-radius: 5px;
	    padding: 10px 15px;
	    font-size: 14px;
	    cursor: pointer;
	    transition: background-color 0.3s;
	  }
	
	  .btn-check:hover {
	    background: #7f1a1a;
	  }
	
	  .btn-check:disabled {
	    background: #ddd;
	    color: #aaa;
	    cursor: not-allowed;
	  }
	  
    .relative-container {
	    position: relative;
	    width: 100%;
	  }
	
	  .relative-container input {
	    width: 100%;
	    padding-right: 90px; /* 버튼 공간 확보 */
	    box-sizing: border-box;
	  }
	
	  .btn-inside {
	    position: absolute;
	    right: 10px;
	    top: 50%;
	    transform: translateY(-50%);
	    padding: 5px 10px;
	    font-size: 12px;
	    color: white;
	    background: #5e0000;
	    border: none;
	    border-radius: 5px;
	    cursor: pointer;
	    transition: background-color 0.3s ease;
	  }
	
	  .btn-inside:hover {
	    background: #7f1a1a;
	  }
  </style>
</head>
<body>
  <div class="container">
    <form name="joinForm" method="post" enctype="multipart/form-data">
      <h2>파트너 신청</h2>

      <!-- 회사 로고 -->
      <div class="form-group">
        <label>로고</label>
        <input type="file" id="logo" name="logo" accept=".jpg,.jpeg,.png,.pdf" required>
      </div>
      
			<!-- 아이디 -->
			<div class="form-group">
			  <label for="mid">아이디</label>
			  <div class="relative-container">
			    <input type="text" id="mid" name="mid" oninput="midCheck()" placeholder="Min's" required>
			    <button type="button" class="btn-inside" onclick="idCheck()">중복체크</button>
			  </div>
			  <span id="midError" style="font-size: 13px; color: #5e0000;"></span>
			</div>

      <!-- 비밀번호 -->
      <div class="row">
        <div class="form-group">
          <label for="pwd">비밀번호</label>
          <input type="password" id="pwd" name="pwd" oninput="pwd1Check()" placeholder="비밀번호를 입력하세요" required>
        </div>
        <div class="form-group">
          <label for="pwd2">비밀번호 확인</label>
          <input type="password" id="pwd2" name="pwd2" oninput="pwd1Check()" placeholder="비밀번호를 다시 한번 입력하세요" required>
        </div>
	      <span id="pwdError" style="font-size: 12px; color: #5e0000; margin-top: 0; padding-top: 0; margin-bottom: 20px;"></span>
      </div>
      
      <div class="row">
        <!-- 업체명 -->
				<div class="form-group">
				  <label for="company">업체명</label>
				  <div class="relative-container">
				    <input type="text" id="company" name="company" placeholder="업체명을 입력하세요." required>
				    <button type="button" class="btn-inside" onclick="companyCheck()">중복체크</button>
				  </div>
				</div>
        <div class="form-group">
          <label for="ceoName">대표자명</label>
          <input type="text" id="ceoName" name="ceoName" placeholder="대표자명을 입력하세요." oninput="nameCheck()" required>
		      <span id="nameError" style="font-size: 13px; color: #5e0000;"></span>
        </div>
      </div>

      <!-- 사업자 등록번호 -->
      <div class="form-group">
        <label for="businessNumber">사업자 등록번호</label>
        <input type="text" id="businessNumber" name="businessNumber" oninput="businessNumberCheck()" maxlength="10" placeholder="-없이 입력해주세요" required>
	      <span id="businessNumberError" style="font-size: 12px; color: #5e0000; margin: 2px 15%;"></span>
      </div>

			<!-- 이메일 -->
			<div class="form-group">
			  <label for="email">이메일</label>
			  <div class="relative-container">
			    <input type="email" id="email" name="email" placeholder="example@domain.com" required>
			  </div>
			</div>

      <!-- 전화번호 -->
      <div class="row">
        <div class="form-group">
				  <label for="phone">전화번호</label>
				  <div class="phone-group">
				    <select class="form-select" id="tel1" name="tel1">
				      <option value="010" selected>010</option>
				      <option value="02">02</option>
				      <option value="032">032</option>
				      <option value="033">033</option>
				      <option value="041">041</option>
				      <option value="042">042</option>
				      <option value="043">043</option>
				    </select>
				    <span>-</span>
				    <input type="text" id="tel2" name="tel2" onkeyup="telCheck()" maxlength="4" placeholder="XXXX" required>
				    <span>-</span>
				    <input type="text" id="tel3" name="tel3" onkeyup="telCheck()" maxlength="4" placeholder="XXXX" required>
				  </div>
					<span id="telError" style="font-size: 13px; color: #5e0000; margin: 2px 8%;"></span>
				</div>
      </div>

      <!-- 주소 -->
			<div id="homeAddressInput" class="form-group">
		    <label>주소</label>
		    <div class="address-group">
	        <div>
            <input type="text" id="sample6_postcode" name="postcode" onclick="sample6_execDaumPostcode()" placeholder="우편번호" readonly required/>
            <button type="button" class="postcode-button" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
	        </div>
	        <input type="text" id="sample6_address" name="address" onclick="sample6_execDaumPostcode()" placeholder="주소" readonly>
	        <input type="text" id="sample6_extraAddress" onclick="sample6_execDaumPostcode()" name="extraAddress" placeholder="참고항목" readonly>
	        <input type="text" id="sample6_detailAddress" name="detailAddress" placeholder="상세주소">
		    </div>
			</div>

      <!-- 소개 -->
      <div class="form-group">
        <label for="description">업체 소개</label>
        <textarea id="description" name="description" rows="3" placeholder="업체를 소개해주세요."></textarea>
      </div>

      <!-- 제출 버튼 -->
      <div class="form-actions">
        <button type="button" class="btn btn-cancel" onclick="location.href='${ctp}/'">취소</button>
        <button type="button" onclick="fCheck()" class="btn btn-submit">신청하기</button>
      </div>
    </form>
  </div>
</body>
</html>
