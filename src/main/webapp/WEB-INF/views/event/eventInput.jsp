<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  <script src="${ctp}/ckeditor/ckeditor.js"></script>
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <style>
    body {
      font-family: 'Roboto', sans-serif;
      background-color: #f5f7fa;
      color: #333;
      margin: 0;
      padding: 0;
    }

    .container {
      width: 90%;
      max-width: 900px;
      margin: 50px auto;
      background-color: #fff;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }

    h1 {
      text-align: center;
      color: #2c3e50;
      font-size: 32px;
      font-weight: 700;
      margin-bottom: 30px;
    }

    .section-title {
      font-size: 18px;
      font-weight: 600;
      color: #34495e;
      margin-bottom: 10px;
    }

    .form-group {
      margin-bottom: 25px;
    }

    .form-control {
      width: 100%;
      padding: 12px 15px;
      border: 1px solid #ddd;
      border-radius: 5px;
      font-size: 16px;
      color: #555;
      box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
    }

    .form-control:focus {
      border-color: #3498db;
      box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
      outline: none;
    }

    .submit {
      display: block;
      width: 100%;
      padding: 15px;
      font-size: 18px;
      font-weight: 600;
      color: #fff;
      background-color: #3498db;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
      box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
    }

    .submit:hover {
      background-color: #217dbb;
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

	  /* styles.css */
		.discount-input {
	    display: flex;
	    align-items: center;
	    gap: 10px;
	    font-size: 1.2em;
	    position: relative;
		}
		
		.discount-label {
	    font-weight: bold;
	    color: #555;
		}
		
		.discount-field {
	    padding: 10px;
	    font-size: 1em;
	    border: 1px solid #ddd;
	    border-radius: 8px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
	    outline: none;
	    transition: border-color 0.3s;
	    width: 100%;
		}
		
		.discount-field:focus {
	    border-color: #007bff;
		}
		
		.discount-unit {
	    font-weight: bold;
	    margin-left: 2px;
	    border: 1px solid #ddd;
	    padding: 10px;
	    border-radius: 5px;
		}
		
		.discount-options {
	    display: flex;
	    justify-content: center;
	    gap: 20px;
	    margin-top: 10px;
		}
		
		.radio-label {
	    font-size: 1em;
	    color: #555;
	    display: flex;
	    align-items: center;
	    gap: 5px;
	    cursor: pointer;
		}
		
		.radio-input {
	    appearance: none;
	    width: 16px;
	    height: 16px;
	    border: 2px solid #ddd;
	    border-radius: 50%;
	    outline: none;
	    cursor: pointer;
	    position: relative;
	    transition: background-color 0.3s, border-color 0.3s;
		}
		
		.radio-input:checked {
	    background-color: #007bff;
	    border-color: #007bff;
		}
		
		.radio-input:checked::after {
	    content: '';
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    width: 8px;
	    height: 8px;
	    background-color: #fff;
	    border-radius: 50%;
	    transform: translate(-50%, -50%);
		}
		
		.date-input-wrapper {
	    position: relative;
	    display: flex;
	    align-items: center;
		}
		
		.date-input {
	    width: 100%;
	    padding: 12px 15px;
	    font-size: 16px;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    background-color: #fff;
	    color: #555;
	    transition: border-color 0.3s ease, box-shadow 0.3s ease;
		}
		
		.date-input:focus {
	    border-color: #3498db;
	    box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
	    outline: none;
		}
		
  </style>
  <script>
  
    document.addEventListener("DOMContentLoaded", function () {
    	document.getElementById("file").addEventListener("change", showUploadedFile);
    });


    function numberWithCommas(num) {
      return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
    
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
    	  const previewContainer = document.querySelector(".nowImg .image-preview");

    	  fileInput.addEventListener("change", function () {
    	    const fileList = fileInput.files;
    	    previewContainer.innerHTML = ""; // 기존 미리보기 이미지만 초기화
    	    
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
    	            img.style.maxWidth = "200px";
    	            img.style.maxHeight = "200px";
    	            img.style.margin = "10px";
    	            img.style.display = "inline-block";
    	            previewContainer.appendChild(img);
    	          };

    	          reader.readAsDataURL(file); // 파일 데이터를 읽어 미리보기로 표시
    	        } else {
    	          alert("이미지 파일만 선택 가능합니다.");
    	        }
    	      });
    	    } else {
    	      // 파일 선택 취소 시 미리보기 이미지를 초기화
    	      previewContainer.innerHTML = "<p>업로드된 파일이 없습니다.</p>";
    	    }
    	  });
    	});
    	
    	function fCheck() {
				let file = $("#file").val();
				let title = $("#title").val();
				let subTitle = $("#subTitle").val();
				let couponName = $("#couponName").val();
				let discount = $("#discount").val();
				let content = $("#content").val();
				
				
				if(file.trim() == ""){
					alert("사진을 등록해주세요");
					document.getElementById("file").focus();
					return false;
				}
				else if(title.trim() == ""){
					alert("이벤트명을 입력해주세요");
					document.getElementById("title").focus();
					return false;
				}
				else if(subTitle.trim() == ""){
					alert("이벤트 간단 설명을 입력해주세요");
					document.getElementById("subTitle").focus();
					return false;
				}
				else if(couponName.trim() == ""){
					alert("쿠폰 이름을 입력해주세요.");
					document.getElementById("couponName").focus();
					return false;
				}
				else if(discount.trim() == "" || discount < 1){
					alert("할인율을 입력해주세요.");
					document.getElementById("discount").focus();
					return false;
				}
				else{
					myform.submit();
				}
			}
    	
    	// script.js
    	document.addEventListener('DOMContentLoaded', () => {
  	    const unitDisplay = document.getElementById('unit');
  	    const radioButtons = document.querySelectorAll('input[name="unit"]');

  	    radioButtons.forEach((radio) => {
	        radio.addEventListener('change', (event) => {
	            unitDisplay.textContent = event.target.value;
	        });
  	    });
    	});
  </script>
</head>
<body>
  <div class="container">
    <h1>이벤트 등록</h1>
    <form name="myform" enctype="multipart/form-data" method="post" action="${ctp}/event/eventInput">
    
    	<div class="form-group nowImg">
			  <div class="section-title">현재 적용 이미지</div>
			  <div class="image-preview"></div>
			</div>
			
    	<div class="form-group">
			  <div class="section-title">타이틀 사진</div>
			  <div class="file-upload">
			    <input type="file" name="file" id="file">
			    <label for="file">+ 파일 선택</label>
			    <div id="uploadedFileName" class="uploaded-file">업로드된 파일이 없습니다.</div>
			  </div>
			</div>
			
      <div class="form-group">
        <div class="section-title">이벤트명</div>
        <input type="text" name="title" id="title" class="form-control" placeholder="이벤트 제목을 입력해주세요" required>
      </div>
      
      <div class="form-group">
        <div class="section-title">쿠폰 설명</div>
        <input type="text" name="subTitle" id="subTitle" class="form-control" placeholder="이벤트 간단 설명을 입력해주세요" required>
      </div>
      
      <div class="form-group">
        <div class="section-title">쿠폰명</div>
        <input type="text" name="couponName" id="couponName" class="form-control" placeholder="쿠폰명을 입력해주세요" required>
      </div>
      
      <div class="form-group">
		    <div class="section-title">이벤트 시작일</div>
		    <div class="date-input-wrapper">
	        <input type="date" value="" id="startDate" name="startDate" class="date-input" />
		    </div>
			</div>
			
			<div class="form-group">
		    <div class="section-title">이벤트 종료일</div>
		    <div class="date-input-wrapper">
	        <input type="date" value="" id="endDate" name="endDate" class="date-input" />
		    </div>
			</div>

			
      <div class="form-group">
		    <div class="section-title">할인 입력</div>
	        <div class="discount-input">
            <input type="number" name="discount" id="discount" placeholder="값을 입력하세요" class="discount-field from-control" />
            <span id="unit" class="discount-unit">%</span>
	        </div>
	        <div class="discount-options">
            <label class="radio-label">
              <input type="radio" name="saleUnit" value="WON" class="radio-input" />
              WON
            </label>
            <label class="radio-label">
              <input type="radio" name="saleUnit" value="%" checked class="radio-input" />
              %
            </label>
	        </div>
			</div>


      <div class="form-group">
        <div class="section-title">상세페이지</div>
        <textarea rows="6" name="content" id="content" class="form-control" required></textarea>
        <script>
          CKEDITOR.replace("content", {
            height: 300,
            filebrowserUploadUrl: "${ctp}/imageUpload",
            uploadUrl: "${ctp}/imageUpload"
          });
        </script>
      </div>
      <button type="button" class="submit" onclick="fCheck()">등록하기</button>
    </form>
  </div>
</body>
</html>
