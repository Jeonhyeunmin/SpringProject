<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>userInput.jsp</title>
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
		  width: 400px;
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
		  padding-top: 400px;
		}
		
		.img:before {
		  content: '';
		  position: absolute;
		  right: 0;
		  top: 0;
		  width: 900px;
		  height: 100%;
		  background-image: url('${ctp}/login/login.jpg');
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
		
		.back {
	    margin-top: 40px;
	    margin-bottom: 20px;
	    background: #e0e0e0;
	    color: #333333;
	    border-radius: 30px;
	    font-size: 15px;
	    font-weight: bold;
	    text-transform: uppercase;
	    transition: background-color 0.3s ease, color 0.3s ease;
	    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		}
		
		.back:hover {
		    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
		}

		
		.sign-in {
		  transition-timing-function: ease-out;
		  margin-top: 15%;
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
	    width: 400px;
	    height: 40px;
	    background-color: #FEE500;
	    color: #000000;
	    border-radius: 20px;
	    font-size: 15px;
	    font-weight: bold;
	    cursor: pointer;
	    transition: background-color 0.3s;
	    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		}
		
		.kakao-btn:hover {
	    background-color: #fddb00;
		}
		
		.kakao-btn svg {
	    margin-right: 10px;
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
		
		. button {
	    flex: 1;
	    background-color: #d4af7a;
	    color: white;
	    border-radius: 5px;
	    padding: 8px 10px;
	    cursor: pointer;
	    transition: all 0.3s ease;
		}
		
		.submit, .kakao-btn {
	    margin-top: 20px;
		}
		
		.disable {
		  pointer-events: none; /* 커서와 입력 비활성화 */
		  cursor: default; /* 기본 커서 */
		}
		.checkButton{
			background-color: lightgray;
			height: 25px;
			width: 100px;
			margin-right: 0;
			font-size: 12px;
			color: black;
			margin-left: 0;
			pointer-events: none;
			pointer-events: auto;
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
		.relative-container {
		  position: relative;
		  width: 69%;
		  margin: auto;
		}
		
		.relative-container input {
		  width: 100%; /* input 필드의 너비 */
		  padding-right: 90px; /* 버튼 공간 확보 */
		  box-sizing: border-box; /* 테두리를 포함한 너비 계산 */
		}
		
		.btn-inside {
		  position: absolute;
		  right: 5px;
		  top: 40%;
		  transform: translateY(-50%); /* 세로 중앙 정렬 보정 */
		  padding: 5px 10px;
		  font-size: 12px;
		  color: white;
		  background: #5e0000;
		  border: none;
		  cursor: pointer;
		  transition: background-color 0.3s ease;
		  width: 70px;
		  height: 30px;
		  border-radius: 0px;
		}
		
		.btn-inside:hover {
		  background: #7f1a1a; /* 버튼 호버 효과 */
		}
		
		.email-container {
		  display: flex;
		  align-items: center;
		  gap: 10px; /* 각 요소 간격 */
		  margin-top: 10px;
		}
		
		.email-container select {
		  flex: 1;
		  padding: 8px;
		  border-bottom: 1px solid rgba(0, 0, 0, 0.4);
		  border-radius: 5px;
		  font-size: 14px;
		}
		
		.email-container input{
		  flex: 1;
		  padding: 8px;
		  border: none;
		  border-radius: 0px;
		  font-size: 14px;
		  border-bottom: 1px solid #ccc;
		}
		
		.email-container .disable {
		  flex: 0 0 auto;
		  text-align: center;
		  color: #888;
		}
		
		.email-check-btn {
		  padding: 10px 15px;
		  font-size: 14px;
		  color: white;
		  background-color: #5e0000;
		  border: none;
		  border-radius: 5px;
		  cursor: pointer;
		  transition: background-color 0.3s ease;
		  width: 80px;
		}
		
		.email-check-btn:hover {
		  background-color: #7f1a1a;
		}
				

  </style>
  <script type="text/javascript">
  	let idCheckSw = 0;
  	let emailCheckSw = 0;
  	
  	let regex1 = /^[a-zA-Z0-9]{4,20}$/; //(아이디) 영문자 또는 숫자 4~20자
	  let regex2 = /^(?=.*?[0-9])(?=.*?[a-zA-Z])[a-zA-Z0-9!@#$%^&*()._-]{4,20}$/;  //(비밀번호)4자 이상 20자 이하, 영어/숫자 1개 이상 필수, 특수문자 허용
	  let regex3 = /^[가-힣a-zA-Z]{1,10}$/;  // (성명)한글,영문만 적어도 1자이상 
		let regex4 = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/; // 이메일 
		let regex5 = /\d{2,3}-\d{3,4}-\d{4}$/; //(전화번호)
		let regex6 = /^(0[0-9]|[1-9][0-9])(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/; //(birthday)
		
		 
  	
  	//158c673636c9a17a27b67c95f2c6be5c
		
  	function kakaoLogin() {
 			location.href = "${ctp}/common/kakaoLoginForm";
		}
  
	 // 아이디 중복 검사 
		function idCheck() {
			//let mid = joinForm.mid.value;
			let mid = joinForm.mid.value;
			
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
		function midCheck() {
			//let regex1 = /^[a-zA-Z0-9]{4,20}$/; //(아이디) 영문자 또는 숫자 4~20자 
			let mid = joinForm.mid.value.trim();
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
		function genderCheck() {
		    let gender = document.getElementById("gender").value.trim();
		    document.getElementById("residentError").innerHTML = "";

		    // 성별 값이 1~4 사이에 있는지 확인
		    if (gender < 1 || gender > 4 || isNaN(gender)) {
		        document.getElementById("residentError").innerHTML = "주민등록번호가 올바르지 않습니다.";
		    }
		    else {
	        document.getElementById("residentError").innerHTML = "";
		    }
			}
  
	  document.querySelector('.img__btn').addEventListener('click', function() {
		  document.querySelector('.cont').classList.toggle('s--signup');
		});
	  
	  $(function(){
	    //직접입력 인풋박스 기존에는 숨어있다가
	    $("#email2").hide();

	    $("#selbox").change(function() {
        //직접입력을 누를 때 나타남
        if($("#selbox").val() == "") {
       		$("#email2").show();
       		$("#selbox").hide();
        }  else {
        	$("#email2").hide();
        }
	    }) 
		});
	  
		function nameCheck() {
			//let regex3 = /^[가-힣a-zA-Z]{1,10}$/;  // (성명)한글,영문만 적어도 1자이상 
			let name = document.getElementById("name").value.trim();
			document.getElementById("nameError").innerHTML="";
			
		  // 성명 확인
		  if(!regex3.test(name)){
		    document.getElementById("nameError").innerHTML="성명이 올바르지 않습니다.(한글/영문만 10자 이하)";
		  }
		  else {
			  document.getElementById("nameError").innerHTML="";
		  }			
		}
		
		function residentCheck() {
			//let regex6 = /\d{6}$/; //(resident-고객)
			let resident = document.getElementById("resident").value.trim();
			document.getElementById("residentError").innerHTML="";
			
		  if (document.getElementById("resident").value.length >= 6 ) {
			  joinForm.gender.focus();
      }
			
		  // 주민번호 확인
		  if(!regex6.test(resident)){
		    document.getElementById("residentError").innerHTML="주민등록번호가 올바르지 않습니다.(생년월일 + 성별(1~4))";
		  }
		  else {
			  document.getElementById("residentError").innerHTML="";
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
		
//	이메일 인증체크		
    function emailCheck() {
    	$("#demoSpin").html('<div style="width: 100px; height: 100px; z-index: 999; position: absolute; top: 40%; left: 40%;" class="spinner-border text-dark"></div>');
			// 필수 입력란의 체크를 모두 마친 후 인증번호를 메일로 발송한다.
			let email = joinForm.email1.value + "@" + joinForm.email2.value;
 			$.ajax({
				type : "post",
				url : "${ctp}/common/memberEmailCheck",
				data : {
					email : email
				},
				success: function(res) {
					if(res != "0"){
						alert("인증번호가 발송되었습니다. \n 메일 확인 후 인증번호를 입력해주세요.");
						let str = '<div class="relative-container" style="margin: 0; margin-top: 20px; width: 100%;">';
						str += '<input type="text" name="checkKey" id="checkKey" style="width: 400px; margin: auto; padding-right: 0;"/>';
						str += '<button type="button" onclick="emailCheckOk()" class="btn-inside" style="width: 100px; right: 0;">인증번호 확인</button>';
						str += '</div>';
						$("#demoSpin").html(str);
					}
					else{
						alert("인증 번호 받기 버튼을 눌러주세요.");
					}
				},
				error : function() {
					$("#demoSpin").hide();
					alert("이메일을 확인해주세요.");
				}
			});
		}
		
    function emailCheckOk() {
    	let checkKey = $("#checkKey").val();
    	if(checkKey == "") {
    		alert("전송받은 메일에서 인증받은 인증키를 입력해주세요");
    		$("#checkKey").focus();
    		return false;
    	}
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/common/memberEmailCheckOk",
    		data : {checkKey : checkKey},
    		success:function(res) {
    			if(res == "1") {
		    		alert("인증 확인되었습니다.");
		    		emailCheckSw = 1;
		    		$("#demoSpin").hide();
		    	}
    			else alert("인증실패~\n메일주소를 확인하시고 다시 인증메일을 전송해 주세요.");
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
	 // 회원가입 버튼 클릭시 체크
		function joinCheck(){
		  let name = document.getElementById("name").value.trim();
		  let mid = joinForm.mid.value.trim();
		  let pwd1 = joinForm.pwd.value.trim();
		  let pwd2 = document.getElementById("pwd2").value.trim();
			let resident = document.getElementById("resident").value.trim();
			let gender = document.getElementById("gender").value.trim();
			let email = joinForm.email1.value + "@" + joinForm.email2.value;
	  	 
		  let tel1 = joinForm.tel1.value;
		  let tel2 = joinForm.tel2.value;
		  let tel3 = joinForm.tel3.value;
		  let tel = tel1 + "-" + tel2 + "-" + tel3;
	  	
		  
			
		  // 코스라이브러리 받아주는 서블릿쪽이 멀티파츠로 받아야 합니다 (사진을 넘길때- 업체에서 멀티파츠 갯 파라멬타)
		  
		  // 성명 확인
		  if(!regex3.test(name)){
		    document.getElementById("nameError").innerHTML="성명이 올바르지 않습니다.(한글/영문만 10자 이내)";
		    document.getElementById("name").focus();
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
			    document.getElementById("pwdError2").innerHTML="비밀번호가 동일하지 않습니다.";
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
		  
		  if(!regex6.test(resident)|| gender < 1 || gender > 4){
			    document.getElementById("residentError").innerHTML="주민등록번호가 올바르지 않습니다.(생년월일 + 성별(1~4))";
			    document.getElementById("resident").focus();
			    resident = resident + "-" + gender;
			    return false;
			  }
		  else {
			  document.getElementById("residentError").innerHTML="";
		  }
		  
	     if(idCheckSw == 0) {
				alert("아이디 중복확인을 해주세요.");
				document.getElementById("mid").focus();
			}
	    else if(emailCheckSw == 0) {
				alert("이메일 인증을 진행해주세요 해주세요.");
				document.getElementById("email1").focus();
			}
			else {
		    joinForm.tel.value = tel;
		    joinForm.resident.value = resident;
		    joinForm.email.value = email;
		   	joinForm.submit();
			} 
		}

  </script>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
<div class="cont">
	<a class="back-arrow" href="${ctp}/">
    <i class="fa-solid fa-arrow-left"></i>
	</a>
	<form method="post" action="${ctp}/common/login">
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

	    <button type="submit" class="submit">Sign In</button>
			<button type="button" class="kakao-btn" onclick="kakaoLogin()">
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
    <form method="post" action="${ctp}/common/join" name="joinForm">
	    <div class="form sign-up">
	      <h2>JOIN</h2>
	      <label>
	        <span>이름</span>
	        <input type="text" id="name" name="name" oninput="nameCheck()"/>
	        <span id="nameError" style="font-size: 13px; color: #5e0000;"></span>
	      </label>
				<div class="form-group">
				  <label for="mid">아이디</label>
				  <div class="relative-container">
					  <input type="text" id="mid" name="mid" placeholder="Min's" required>
					  <button type="button" class="btn-inside" onclick="idCheck()">중복체크</button>
					  <span id="midError" style="font-size: 13px; color: #5e0000; text-align: center; margin: 0 auto;"></span>
					</div>
				</div>
				<div class="input-group">
		      <label style="width: 30%; margin-right: 0;">
		        <span>비밀번호</span>
		        <input type="password" name="pwd" id="pwd" oninput="pwd1Check()"/>
		      </label>
		      <label style="width: 30%; margin-left: 5%;">
		        <span>비밀번호 확인</span>
		        <input type="password" name="pwd2" id="pwd2" oninput="pwd1Check()"/>
		      </label>
	      </div>
        <span id="pwdError" style="font-size: 12px; color: #5e0000; margin: 2px 15%;"></span>
				<label>
				  <span>이메일</span>
				  <span class="email-container">
				    <input type="text" id="email1" name="email1" placeholder="이메일" />
				    <span class="disable">@</span>
				    <select id="selbox" name="selbox" class="form-select" onchange="document.getElementById('email2').value = this.value;">
				      <option value="" selected>직접입력</option>
				      <option value="gmail.com">gmail.com</option>
				      <option value="naver.com">naver.com</option>
				      <option value="daum.net">daum.net</option>
				      <option value="yahoo.com">yahoo.com</option>
				    </select>
				    <input type="text" id="email2" name="email2" placeholder="도메인" />
				    <button type="button" class="email-check-btn" onclick="emailCheck()">인증</button>
				    <input type="hidden" id="email" name="email" />
				  </span>
				  <span class="form-group">
				  	<span id="demoSpin"></span>
				  </span>
				</label>
				<label>
				  <span>전화번호</span>
				  <span class="input-group">
				    <select class="form-select" id="tel1" name="tel1" style="width: 20%;">
				      <option value="010" selected>010</option>
				      <option value="02">02</option>
				      <option value="032">032</option>
				      <option value="033">033</option>
				      <option value="041">041</option>
				      <option value="042">042</option>
				      <option value="043">043</option>
				    </select>
				    <span style="width: 5%; text-align: center;" class="disable">-</span>
				    <input type="text" style="width: 20%;" id="tel2" name="tel2" onkeyup="telCheck()" maxlength="4"/>
				    <span style="width: 5%; text-align: center;" class="disable">-</span>
				    <input type="text" style="width: 20%;" id="tel3" name="tel3" onkeyup="telCheck()" maxlength="4"/>
				    <span id="telError" style="font-size: 13px; color: #5e0000; margin: 2px 8%;"></span>
				    <input type="hidden" id="tel" name="tel"/>
				  </span>
				</label>
				
				<label>
				  <span>주민등록번호</span>
				  <span class="input-group">
				    <input type="text" style="width: 40%;" id="resident" name="resident" maxlength="6" oninput="residentCheck()"/>
				    <span class="disable" style="width: 5%; text-align: center;">-</span>
				    <input type="text" style="width: 40%;" id="gender" name="gender" maxlength="1" oninput="genderCheck()"/>
				  </span>
				  <span id="residentError" style="font-size: 13px; color: #5e0000;"></span>
				</label>

	      <button type="button" onclick="joinCheck()" class="submit">Sign Up</button>
	  		<button type="button" class="kakao-btn" onclick="kakaoLogin()">
			    <!-- SVG 카카오톡 로고 -->
			    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" style="margin-right: 10px;">
			        <path fill="#000000" d="M12.001 2C6.477 2 2 5.862 2 10.5c0 2.808 1.68 5.29 4.315 6.822-.193.703-.693 2.524-.793 2.866 0 0-.015.137.073.186s.177.018.177.018c.234 0 .344-.137.344-.137 0-.015 1.416-.958 2.445-1.545.47.073.95.11 1.438.11 5.524 0 10.001-3.863 10.001-8.5S17.525 2 12.001 2z"/>
			    </svg>
			    카카오로 회원가입
				</button>
      	<button type="button" class="back" onclick="location.href='${ctp}/'" style="margin-top: 18px;"><span>돌아가기</span></button>
	    </div>
    </form>
  </div>
</div>
</body>
</html>