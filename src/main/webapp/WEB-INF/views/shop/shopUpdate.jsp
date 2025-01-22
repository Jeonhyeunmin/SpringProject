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
      color: #333;
      margin: 0;
      padding: 0;
    }

    .container {
      padding: 40px;
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

    .price-group {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .price-group input[type="text"],
    .price-group input[type="number"] {
      flex: 1;
    }

    .price-group input[type="text"]:last-child {
      flex: 0 0 60px;
      text-align: center;
    }
    
    .add-option-btn {
	    display: inline-block;
	    padding: 10px 20px;
	    font-size: 14px;
	    font-weight: 600;
	    color: #fff;
	    background-color: #f2d8b1;
	    border: none;
	    border-radius: 5px;
	    cursor: pointer;
	    transition: background-color 0.3s ease, transform 0.2s ease;
	    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	    margin-bottom: 10px;
	  }

	  .add-option-btn:hover {
	    background-color: #e1c699;
	    transform: translateY(-2px);
	  }
	
	  .option-item {
	    margin-bottom: 15px;
	    display: flex;
	    gap: 15px;
	    align-items: center;
	  }
	
	  .option-item input[type="text"],
	  .option-item input[type="number"] {
	    flex: 1;
	    padding: 12px;
	    font-size: 16px;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
	  }
	
	  .option-item input[type="number"] {
	    flex: 0 0 120px;
	    text-align: right;
	  }
	
	  .remove-option-btn {
	    padding: 10px;
	    font-size: 14px;
	    font-weight: 600;
	    color: #fff;
	    background-color: #e74c3c;
	    border: none;
	    border-radius: 5px;
	    cursor: pointer;
	    transition: background-color 0.3s ease;
	    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	  }
	
	  .remove-option-btn:hover {
	    background-color: #c0392b;
	    transform: translateY(-2px);
	  }
  </style>
  <script>
  	let removedOptions = [];
    document.addEventListener("DOMContentLoaded", function () {
    	document.getElementById("file").addEventListener("change", showUploadedFile);
      finalPrice();
      mainCategoryLoad();
    });

    function finalPrice() {
      const price = Number(document.getElementById("price").value);
      const discount = Number(document.getElementById("discount").value);

      let pay = price - (price * (discount / 100));
      pay = pay < 0 ? 0 : Math.round(pay);

      document.getElementById("pay").value = numberWithCommas(pay);
    }

    function numberWithCommas(num) {
      return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
    
    function mainCategoryLoad() {
			let category = myform.category.value;
			
			$.ajax({
				type : "post",
				url : "${ctp}/shop/mainCategoryLoad",
				data : {
					category : category
				},
				success: function(res) {
					let str = '';
					for(let i = 0; i < res.length; i++){
						if (res[i].mainCategory === '${vo.mainCategory}') {
		          str += '<option value="' + res[i].mainCategory + '" selected>' + res[i].mainCategory + '</option>';
		        } else {
		          str += '<option value="' + res[i].mainCategory + '">' + res[i].mainCategory + '</option>';
		        }
						$("#mainCategory").html(str);
						subCategoryLoad();
					}
				},
				error: function() {
					alert("전송오류");
				}
			});
		}
    
    function subCategoryLoad() {
    	let category = myform.category.value;
			let mainCategory = myform.mainCategory.value;
			
			$.ajax({
				type : "post",
				url : "${ctp}/shop/subCategoryLoad",
				data : {
					category : category,
					mainCategory : mainCategory
				},
				success: function(res) {
					let str = '';
					for(let i = 0; i < res.length; i++){
						if (res[i].subCategory === '${vo.subCategory}') {
		          str += '<option value="' + res[i].subCategory + '" selected>' + res[i].subCategory + '</option>';
		        } else {
		          str += '<option value="' + res[i].subCategory + '">' + res[i].subCategory + '</option>';
		        }
						$("#subCategory").html(str);
					}
				},
				error: function() {
					alert("전송오류");
				}
			});
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
    	            img.style.maxWidth = "200px";
    	            img.style.maxHeight = "200px";
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

    	
    	function fCheck() {
				let category = $("#category").val();
				let mainCategory = $("#mainCategory").val();
				let subCategory = $("#subCategory").val();
				let title = $("#title").val();
				let price = $("#price").val();
				let discount = $("#discount").val();
				let pay = $("#pay").val();
				let optionNames = document.getElementsByName("optName[]");
				let optionPrices = document.getElementsByName("optPrice[]");
				
		    let optionName = "";
		    let optionPrice = "";
				for (let i = 0; i < optionNames.length; i++) {
					if(optionPrices[i].value.trim() === "" || isNaN(optionPrices[i].value.trim())){
						optionPrices[i] = "0";
					}
					
			  	optionName += optionNames[i].value.trim() + "/";
			  	optionPrice += optionPrices[i].value.trim() + "/";
				}
				
				if(category.trim() == ""){
					alert("카테고리를 선택해주세요");
					document.getElementById("category").focus();
					return false;
				}
				else if(mainCategory.trim() == ""){
					alert("메인 카테고리를 선택해주세요");
					document.getElementById("mainCategory").focus();
					return false;
				}
				else if(subCategory.trim() == ""){
					alert("서브 카테고리를 선택해주세요");
					document.getElementById("subCategory").focus();
					return false;
				}
				else if(title.trim() == ""){
					alert("제목을 입력해주세요");
					document.getElementById("title").focus();
					return false;
				}
				else if(price.trim() == ""){
					alert("가격을 입력해주세요");
					document.getElementById("price").focus();
					return false;
				}
				else if(discount.trim() == ""){
					alert("할인율을 입력해주세요 \n할인을 원하지 않으시면 0을 입력해주세요.");
					document.getElementById("discount").focus();
					return false;
				}
				else if(pay.trim() == ""){
					alert("가격을 다시 한번 확인해주세요");
					document.getElementById("price").focus();
					return false;
				}
				else{
					myform.optionName.value = optionName;
					myform.optionPrice.value = optionPrice;
					myform.submit();
				}
				
			}
    	
    	function addOption() {
			  const container = document.getElementById("options-container");
	
			  const optionItem = document.createElement("div");
			  optionItem.classList.add("option-item");
	
			  const optionName = document.createElement("input");
			  optionName.type = "text";
			  optionName.name = "optName[]";
			  optionName.placeholder = "옵션명을 입력해주세요";
			  optionName.classList.add("form-control");
	
			  const optionPrice = document.createElement("input");
			  optionPrice.type = "number";
			  optionPrice.name = "optPrice[]";
			  optionPrice.placeholder = "옵션 가격";
			  optionPrice.value = "0";
			  optionPrice.classList.add("form-control");
			  
			  const removeBtn = document.createElement("button");
			  removeBtn.type = "button";
			  removeBtn.textContent = "삭제";
			  removeBtn.classList.add("remove-option-btn");
			  removeBtn.tabIndex = -1;
			  removeBtn.onclick = function () {
			    container.removeChild(optionItem);
			  };
	
			  optionItem.appendChild(optionName);
			  optionItem.appendChild(optionPrice);
			  optionItem.appendChild(removeBtn);
	
			  container.appendChild(optionItem);
			}
    	
    	function removeOption(button, index) {
  	    const optionItem = button.closest(".option-item");
  	    const container = document.getElementById("options-container");

  	    // 삭제된 옵션의 인덱스를 추가
  	    removedOptions.push(index);

  	    // DOM에서 해당 옵션 제거
  	    container.removeChild(optionItem);
  	  }
  </script>
</head>
<body>
  <div class="container">
    <h1>상품 수정</h1>
    <form name="myform" enctype="multipart/form-data" method="post" action="${ctp}/shop/shopUpdate">
      <div class="form-group">
        <div class="section-title">업체명</div>
        <input type="text" name="company" id="company" class="form-control" value="${sCompany}">
      </div>

      <div class="form-group">
        <div class="section-title">카테고리</div>
        <div class="input-group">
		      <select name="category" id="category" class="form-control" onchange="mainCategoryLoad()">
		      		<option>카테고리를 선택해주세요.</option>
		      	<c:forEach var="cate" items="${vos}">
		      		<option ${cate.category == vo.category ? 'selected' : ''}>${fn: toUpperCase(cate.category)}</option>
		      	</c:forEach>
		      </select>
		      <select name="mainCategory" id="mainCategory" class="form-control" onchange="subCategoryLoad()">
		    		<option>주 카테고리를 선택해주세요.</option>
		      </select>
		      <select name="subCategory" id="subCategory" class="form-control">
		    		<option>메인 카테고리를 선택해주세요.</option>
		      </select>
        </div>
      </div>

      <div class="form-group">
        <div class="section-title">상품명</div>
        <input type="text" name="title" id="title" class="form-control" value="${vo.title}" required>
      </div>

      <div class="form-group">
        <div class="section-title">판매가</div>
        <div class="price-group">
          <input type="number" name="price" id="price" class="form-control" value="${vo.price}" oninput="finalPrice()" required>
          <input type="text" value="원" tabindex="-1"  readonly class="form-control trash">
        </div>
      </div>

      <div class="form-group">
        <div class="section-title">할인</div>
        <div class="price-group">
          <input type="number" name="discount" id="discount" class="form-control" value="${vo.discount}" oninput="finalPrice()" required>
          <input type="text" value="%" readonly tabindex="-1" class="form-control trash">
        </div>
      </div>

      <div class="form-group">
        <div class="section-title">최종 판매가</div>
        <div class="price-group">
          <input type="text" name="pay" id="pay" class="form-control" readonly>
          <input type="text" value="원" tabindex="-1"  readonly class="form-control">
        </div>
      </div>
      
      <div class="form-group">
		    <span class="section-title">옵션</span>
		    <button type="button" class="add-option-btn" onclick="addOption()" tabindex="-1">+ 옵션 추가</button>
			  <div id="options-container">
			  	<c:if test="${!empty vo.optionName}">
				  	<c:set var="optionName" value="${fn: split(vo.optionName, '/')}"/>
				  	<c:set var="optionPrice" value="${fn: split(vo.optionPrice, '/')}"/>
				  	<c:forEach var="i" begin="0" end="${fn: length(optionName) -1}">
				  		<div class="option-item">
					  		<input type="text" class="form-control" value="${optionName[i]}">
					  		<input type="number" class="form-control" value="${optionPrice[i]}">
					  		<button type="button" class="remove-option-btn" tabindex="-1" onclick="removeOption(this, '${i}')">삭제</button>
				  		</div>
				  	</c:forEach>
			  	</c:if>
			  </div>
			</div>
			<input type="hidden" name="optionName" id="optionName">
			<input type="hidden" name="optionPrice" id="optionPrice">
      
      <div class="form-group nowImg">
        <div class="section-title">현재 적용 이미지</div>
        <c:set var="titleImg" value="${fn: split(vo.titleImg,'/')}" />
        <c:forEach var="i" begin="0" end="${fn:length(titleImg)-1}" >
        	<img src="${ctp}/category/${titleImg[i]}" alt="이미지 미리보기" style="max-width: 200px; max-height: 200px;">
        </c:forEach>
    	</div>
    	
      <div class="form-group">
			  <div class="section-title">타이틀 사진</div>
			  <div class="file-upload">
			    <input type="file" name="file" id="file" multiple>
			    <label for="file">+ 파일 선택</label>
			    <div id="uploadedFileName" class="uploaded-file">업로드된 파일이 없습니다.</div>
			  </div>
			</div>


      <div class="form-group">
        <div class="section-title">본문</div>
        <textarea rows="6" name="content" id="content" class="form-control" required>${vo.content}</textarea>
        <script>
          CKEDITOR.replace("content", {
            height: 300,
            filebrowserUploadUrl: "${ctp}/imageUpload",
            uploadUrl: "${ctp}/imageUpload"
          });
        </script>
      </div>

      <button type="button" class="submit" onclick="fCheck()">수정하기</button>
			<input type="hidden" name="idx" value="${vo.idx}">      
    </form>
  </div>
</body>
</html>
