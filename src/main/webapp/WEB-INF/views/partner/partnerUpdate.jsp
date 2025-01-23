<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <style>
		@font-face { /*눈누 기초고딕 - 두꺼운 네모 딱딱 고딕*/
	    font-family: 'NoonnuBasicGothicRegular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
		}
    body {
      font-family: 'NoonnuBasicGothicRegular';
      justify-content: center;
      align-items: center;
      margin: 0;
    }

    .container-fluid {
      background: #fff;
      border-radius: 15px;
      padding: 30px 20px;
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
      width: 30%;
      padding: 12px;
      font-size: 14px;
      font-weight: bold;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s, color 0.3s;
      margin: auto;
    }

    .btn-submit {
      background: #5e0000 !important;
      color: #fff !important;
    }

    .btn-submit:hover {
      background: #7f1a1a !important;
    }

    .btn-cancel {
      background: #ddd !important;
      color: #333;
    }

    .btn-cancel:hover {
      background: #bbb !important;
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
	  
	  .file-upload {
		  padding: 20px;
		  background-color: #f8f9fb;
		  border: 2px dashed #ddd;
		  border-radius: 10px;
		  text-align: center;
		  color: #888;
		  transition: background-color 0.3s ease;
		  cursor: pointer;
		}

    .file-upload:hover {
      background-color: #eef2f8;
    }

    .file-upload input[type="file"] {
      display: none;
    }

    .file-upload label {
		  display: inline-block;
		  padding: 10px 20px;
		  color: #3498db;
		  border: 2px solid #3498db;
		  border-radius: 5px;
		  font-weight: 600;
		  cursor: pointer;
		}

		.file-upload label:hover {
		  background-color: #3498db;
		  color: #fff;
		}
		
		.uploaded-file {
		  margin-top: 10px;
		  color: #444;
		  font-size: 14px;
		}
	  
	  .form-actions {
		  display: flex;
		  justify-content: space-between; /* 버튼들을 양쪽 끝으로 배치 */
		  align-items: center; /* 버튼 정렬 */
		}
		
		.userLeave {
		  margin-left: 92%;
		  padding: 5px 10px;
		  background-color: transparent;
		  border: 1px solid #bab1b1;
		  color: #bab1b1;
		  margin-top: 10px;
		}
		
		.userLeave:hover {
			background-color: gray;
			color: white;
		}
		
		.radio-group {
		  display: inline-flex;
		  align-items: center; /* 세로 정렬 */
		  gap: 10px; /* 버튼 간격 */
		}
		
		.radio-group label {
		  font-size: 14px;
		  font-weight: bold;
		  color: #333;
		}
		
		.pwdChangeForm {
		  position: fixed;
		  bottom: -100%; /* 초기 위치: 화면 아래 */
		  left: 50%;
		  transform: translateX(-50%);
		  width: 90%;
		  max-width: 500px;
		  background: #fff;
		  border-radius: 15px;
		  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
		  padding: 20px;
		  z-index: 1000;
		  transition: bottom 0.5s ease-in-out, opacity 0.3s ease-in-out;
		  opacity: 0;
		}
		
		/* 수정 폼 활성화 */
		.pwdChangeForm.show {
		  bottom: 60%; /* 화면에 보이도록 */
		  opacity: 1;
		}
		
		.pwdChangeBtn:hover{
			background-color: #e1c699;
		}
		.modal-overlay {
		  position: fixed;
		  top: 0;
		  left: 0;
		  width: 100%;
		  height: 100%;
		  background: rgba(0, 0, 0, 0.6); /* 반투명 배경 */
		  display: none; /* 기본적으로 숨김 */
		  opacity: 0;
		  z-index: 999;
		  transition: opacity 0.3s ease-in-out;
		}
		
		/* 모달 활성화 */
		.modal-overlay.show {
		  display: block;
		  opacity: 1;
		}
		
  </style>
    <script type="text/javascript">
  	'use strict';
  	
  	let emailCheckSw = 0;
  	
  	let regex1 = /^[a-zA-Z0-9]{4,20}$/; //(아이디) 영문자 또는 숫자 4~20자
	  let regex2 = /^(?=.*?[0-9])(?=.*?[a-zA-Z])[a-zA-Z0-9!@#$%^&*()._-]{4,20}$/;  //(비밀번호)4자 이상 20자 이하, 영어/숫자 1개 이상 필수, 특수문자 허용
	  let regex3 = /^[가-힣a-zA-Z]{1,10}$/;  // (성명)한글,영문만 적어도 1자이상 
		let regex4 = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/; // 이메일 
		let regex5 = /\d{2,3}-\d{3,4}-\d{4}$/; //(전화번호)
		let regex6 = /\d{10}$/;
		
		
		function emailCheck() {
	    	$("#demoSpin").html('<div style="width: 100px; height: 100px; z-index: 999; position: absolute; top: 40%; left: 40%;" class="spinner-border text-dark"></div>');
				// 필수 입력란의 체크를 모두 마친 후 인증번호를 메일로 발송한다.
				let email = joinForm.email.value;
	 			$.ajax({
					type : "post",
					url : "${ctp}/common/memberEmailCheck",
					data : {
						email : email
					},
					success: function(res) {
						if(res != "0"){
							alert("인증번호가 발송되었습니다. \n 메일 확인 후 인증번호를 입력해주세요.");
							let str = '<div class="relative-container" style="margin-top: 10px;">';
							str += '<input type="text" name="checkKey" id="checkKey"/>';
							str += '<button type="button" onclick="emailCheckOk()" class="btn-inside">인증번호 확인</button>';
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
		
		function nameCheck() {
			//let regex3 = /^[가-힣a-zA-Z]{1,10}$/;  // (성명)한글,영문만 적어도 1자이상 
			let name = document.getElementById("ceoName").value.trim();
			document.getElementById("nameError").innerHTML="";
			
		  // 성명 확인
		  if(!regex3.test(name)){
		    document.getElementById("nameError").innerHTML="성명이 올바르지 않습니다.(한글/영문만 10자 이하)";
		  }
		  else {
			  document.getElementById("nameError").innerHTML="";
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
			let businessNumber = document.getElementById("businessNumber").value.trim();
	  	 
		  let tel1 = joinForm.tel1.value;
		  let tel2 = joinForm.tel2.value;
		  let tel3 = joinForm.tel3.value;
		  let tel = tel1 + "-" + tel2 + "-" + tel3;
		  
		  let email = joinForm.email.value;
		  
			
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
		  
		  if(businessNumber == ""){
			  alert("사업자등록번호를 입력해주세요.");
			  return false;
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
		  
		 if(document.getElementById("sample6_postcode").value == ""){
			 alert("주소를 입력해주세요");
			 document.getElementById("sample6_postcode").focus();
			 return false;
		 }
		 if("${vo.email}" != email && emailCheckSw == 0){
			 alert("이메일을 변경하시려면 이메일 인증을 진행해주세요.");
			 return false;
		 }
		 else {
			 joinForm.address.value = document.getElementById("sample6_postcode").value + "/" + document.getElementById("sample6_address").value + "/" + document.getElementById("sample6_extraAddress").value + "/" + document.getElementById("sample6_detailAddress").value
		   joinForm.tel.value = tel;
		   joinForm.submit();
			} 
		}
		
		document.addEventListener("DOMContentLoaded", function () {
	  	document.getElementById("file").addEventListener("change", showUploadedFile);
	  });
  	function showUploadedFile(event) {
      const fileInput = event.target;
      const fileList = fileInput.files;
      const fileNameDisplay = document.getElementById("uploadedFileName");
      if (fileList.length > 0) {
      	if(fileList.length == 1){
	          fileNameDisplay.textContent = '업로드된 파일:' +  fileList[0].name;
      	}
      	else{
	          fileNameDisplay.textContent = '업로드된 파일:' +  fileList[0].name + "외 " + Number(fileList.length-1) + "개";
      	}
      } else {
        fileNameDisplay.textContent = "업로드된 파일이 없습니다.";
      }
    }
	  
  	document.addEventListener("DOMContentLoaded", function () {
  	  const fileInput = document.getElementById("file");
  	  const previewContainer = document.querySelector(".nowImg");

  	  fileInput.addEventListener("change", function () {
  	    const fileList = fileInput.files;
  	    previewContainer.innerHTML = ""; // 기존 이미지를 초기화
  	    
  	    if (fileList.length > 5) {
	         alert("최대 5개의 파일만 업로드할 수 있습니다.");
	         fileInput.value = ""; // 입력 필드 초기화
	         uploadedFileName.textContent = "업로드된 파일이 없습니다.";
	         return;
 	      }

  	    if (fileList.length > 0) {
  	      Array.from(fileList).forEach((file) => {
  	        if (file.type.startsWith("image/")) {
  	          const reader = new FileReader();

  	          reader.onload = function (e) {
  	            const img = document.createElement("img");
  	            img.src = e.target.result;
  	            img.alt = "선택한 이미지 미리보기";
  	            img.style.maxWidth = "100px";
  	            img.style.maxHeight = "100px";
  	            img.style.margin = "10px";
  	            previewContainer.appendChild(img);
  	          };

  	          reader.readAsDataURL(file); // 파일 데이터를 읽어 미리보기로 표시
  	        } else {
  	          alert("이미지 파일만 선택 가능합니다.");
  	        }
  	      });
  	    } else {
  	      previewContainer.innerHTML = "<p>업로드된 파일이 없습니다.</p>"; // 선택 취소 시 메시지 표시
  	    }
  	  });
  	});
  	
  	function emailchange() {
			let str = '<input type="email" id="email" name="email" placeholder="example@domain.com" required><button type="button" class="btn-inside" onclick="emailCheck()">인증</button>';
			$(".emailChangeContainer").html(str);
		}
  	
  	function userLeavel() {
  		let ans = confirm("탈퇴를 진행하시겠습니까?")
  		
  		if(ans){
  			location.href='${ctp}/partner/partnerLeave';
  		}
		}
  	
  	function pwdChangeForm() {
    	  $.ajax({
    	    type: "get",
    	    url: "${ctp}/partner/partnerPwdChangeForm",
    	    success: function (res) {
    	      const overlay = document.getElementById("modalOverlay");
    	      const updateForm = document.getElementById("pwdChangeForm");

    	      updateForm.innerHTML = res;

    	      // 모달 활성화
    	      overlay.classList.add("show");
    	      updateForm.classList.add("show");
    	    },
    	    error: function () {
    	      alert("전송오류");
    	    },
    	  });
    	}

    	// 폼 닫기
    	function closePwdChageForm() {
    	  const overlay = document.getElementById("modalOverlay");
    	  const updateForm = document.getElementById("pwdChangeForm");

    	  overlay.classList.remove("show");
    	  updateForm.classList.remove("show");
    	}
    	
  	  function pwd1Check() {
  	    let pwd1 = document.getElementById("pwd").value.trim();
  	    let pwd2 = document.getElementById("pwd2").value.trim();
  	    
  	    document.getElementById("pwdError").innerHTML = "";
  	    // 비밀번호 확인
  	    if (!regex2.test(pwd1)) {
  	      document.getElementById("pwdError").innerHTML = "비밀번호가 올바르지 않습니다.(영어/숫자 필수, 특수문자 가능 4~20자)";
  	    } else if (pwd1 !== pwd2) {
  	      document.getElementById("pwdError").innerHTML = "비밀번호가 동일하지 않습니다.";
  	    } else {
  	      document.getElementById("pwdError").innerHTML = "";
  	    }
  	  }
    	
    	function pwdChange() {
    		let nowPwd = document.getElementById("nowPwd").value.trim();
    		let pwd = document.getElementById("pwd").value.trim();
    		let pwd2 = document.getElementById("pwd2").value.trim();
    		
    		if(nowPwd == pwd){
    			alert("이전 비밀번호와 동일하게 설정할 수 없습니다.");
    			return false;
    		}
    		if(pwd != pwd2){
    			alert("변경하려는 비밀번호를 동일하게 입력해주세요.");
    			return false;
    		}
    		$.ajax({
    			type:"post",
    			url:"${ctp}/partner/partnerPwdChangeOk",
    			data: {
    				pwd : pwd,
    				nowPwd : nowPwd
    			},
    			success: function(res) {
						if(res == "99"){
							alert("현재 비밀번호가 동일하지 않습니다 다시 확인해주세요");
							return false;
						}
						else if(res == "1"){
							alert("비밀번호가 변경되었습니다.");
							closePwdChageForm();
							alert("다시 로그인해주세요");
							location.href='${ctp}/common/logout';
						}
					},
					error: function() {
						alert("전송오류");
					}
    		});
    		
    		return false;
    	}
    	
  </script>
</head>
<body>
  <div class="container-fluid">
    <form name="joinForm" method="post" enctype="multipart/form-data" action="${ctp}/partner/partnerUpdate">
      <div class="form-group nowImg">
        <div class="section-title">현재 적용 이미지</div>
      	<img src="${ctp}/logo/${vo.logo}" alt="이미지 미리보기" style="max-width: 100px; max-height: 100px;">
    	</div>
      
      <div class="form-group">
			  <div class="section-title">로고</div>
			  <div class="file-upload">
			    <input type="file" name="file" id="file" accept=".jpg,.jpeg,.png,.pdf" required>
			    <label for="file">+ 파일 선택</label>
			    <div id="uploadedFileName" class="uploaded-file">업로드된 파일이 없습니다.</div>
			  </div>
			</div>
			
      <div class="form-group">
        <label for="name"><font color="red">*</font> 업체명</label>
        <input type="text" id="company" name="company" value="${vo.company}" required>
	      <span id="nameError" style="font-size: 13px; color: #5e0000;"></span>
      </div>
      
			<!-- 아이디 -->
			<div class="form-group">
			  <label for="mid">아이디 <font color="red">* 아이디는 변경 불가능합니다.</font></label>
			  <div class="relative-container">
			    <input type="text" style="background-color: #ddd;" id="mid" name="mid" value="${vo.mid}" required>
			  </div>
			</div>

      <!-- 비밀번호 -->
      <div class="row">
        <div class="form-group">
          <label for="pwd">비밀번호</label>
          <input type="button" onclick="pwdChangeForm()" class="pwdChangeBtn" value="비밀번호 변경">
        </div>
      </div>
      
      <div class="form-group">
        <label for="name"><font color="red">*</font> 대표자명</label>
        <input type="text" id="ceoName" name="ceoName" value="${vo.ceoName}" oninput="nameCheck()" required>
	      <span id="nameError" style="font-size: 13px; color: #5e0000;"></span>
      </div>

      <!-- 생년월일 -->
      <div class="form-group">
        <label for="birthday"><font color="red">*</font> 사업자번호</label>
        <input type="number" id="businessNumber" name="businessNumber" value="${vo.businessNumber}" required>
      </div>
      

			<!-- 이메일 -->
			<div class="form-group">
			  <label for="email"><font color="red">*</font> 이메일</label>
			  <div class="relative-container">
			  	<div class="emailChangeContainer">
				    <input type="email" id="email" name="email" style="background-color: #ddd;" placeholder="example@domain.com" value="${vo.email}" required readonly>
				    <button type="button" class="btn-inside" onclick="emailchange()">변경</button>
			    </div>
			  </div>
				<span id="demoSpin"></span>
			</div>
			
      <!-- 전화번호 -->
      <c:set var="tel" value="${fn: split(vo.tel, '-')}"/>
      <div class="row">
        <div class="form-group">
				  <label for="phone"><font color="red">*</font> 전화번호</label>
				  <div class="phone-group">
				    <select class="form-select" id="tel1" name="tel1">
				      <option ${tel[0] == '010' ? 'selected' : ''} value="010" selected>010</option>
				      <option ${tel[0] == '02' ? 'selected' : ''} value="02">02</option>
				      <option ${tel[0] == '032' ? 'selected' : ''} value="032">032</option>
				      <option ${tel[0] == '033' ? 'selected' : ''} value="033">033</option>
				      <option ${tel[0] == '041' ? 'selected' : ''} value="041">041</option>
				      <option ${tel[0] == '042' ? 'selected' : ''} value="042">042</option>
				      <option ${tel[0] == '043' ? 'selected' : ''} value="043">043</option>
				    </select>
				    <span>-</span>
				    <input type="text" id="tel2" name="tel2" onkeyup="telCheck()" maxlength="4" placeholder="XXXX" value="${tel[1]}" required>
				    <span>-</span>
				    <input type="text" id="tel3" name="tel3" onkeyup="telCheck()" maxlength="4" placeholder="XXXX" value="${tel[2]}" required>
				  </div>
					<span id="telError" style="font-size: 13px; color: #5e0000; margin: 2px 8%;"></span>
				</div>
      </div>
      <input type="hidden" id="tel" name="tel">

      <!-- 주소 -->
			<div id="homeAddressInput" class="form-group">
				<c:set var="address" value="${fn: split(vo.address, '/')}"/>
		    <label><font color="red">*</font> 주소</label>
		    <div class="address-group">
	        <div>
            <input type="text" id="sample6_postcode" name="postcode" onclick="sample6_execDaumPostcode()" placeholder="우편번호" value="${address[0]}" readonly required/>
            <button type="button" class="postcode-button" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
	        </div>
	        <input type="text" id="sample6_address" name="address1" onclick="sample6_execDaumPostcode()" value="${address[1]}" placeholder="주소" readonly>
	        <input type="text" id="sample6_extraAddress" onclick="sample6_execDaumPostcode()" value="${address[2]}" name="extraAddress" placeholder="참고항목" readonly>
	        <input type="text" id="sample6_detailAddress" name="detailAddress" value="${address[3]}" placeholder="상세주소">
		    </div>
			</div>
      <input type="hidden" id="address" name="address">
			
      <!-- 제출 버튼 -->
      <div class="form-actions">
        <button type="button" class="btn btn-cancel" onclick="location.href='${ctp}/member/content'">취소</button>
        <button type="button" onclick="fCheck()" class="btn btn-submit">신청하기</button>
      </div>
      <div id="modalOverlay" class="modal-overlay" onclick="closePwdChangeForm()"></div>
				<div id="pwdChangeForm" class="pwdChangeForm">
			</div>
    </form>
  </div>
</body>
</html>
