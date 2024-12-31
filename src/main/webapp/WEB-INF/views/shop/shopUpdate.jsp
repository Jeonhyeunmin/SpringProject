<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>상품 등록</title>
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

    button[type="submit"] {
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

    button[type="submit"]:hover {
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
  </style>
  <script>
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
						if (res[i] === '${vo.mainCategory}') {
		          str += '<option value="' + res[i] + '" selected>' + res[i] + '</option>';
		        } else {
		          str += '<option value="' + res[i] + '">' + res[i] + '</option>';
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
			let mainCategory = myform.mainCategory.value;
			
			$.ajax({
				type : "post",
				url : "${ctp}/shop/subCategoryLoad",
				data : {
					mainCategory : mainCategory
				},
				success: function(res) {
					let str = '';
					for(let i = 0; i < res.length; i++){
						if (res[i] === '${vo.subCategory}') {
		          str += '<option value="' + res[i] + '" selected>' + res[i] + '</option>';
		        } else {
		          str += '<option value="' + res[i] + '">' + res[i] + '</option>';
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
  </script>
</head>
<body>
  <div class="container">
    <h1>상품 수정</h1>
    <form name="myform" enctype="multipart/form-data" method="post" action="${ctp}/shop/shopUpdate">
      <div class="form-group">
        <div class="section-title">업체명</div>
        <input type="text" name="company" id="company" class="form-control" value="${sCompany}" readonly>
      </div>

      <div class="form-group">
        <div class="section-title">카테고리</div>
        <div class="input-group">
		      <select name="category" id="category" class="form-control" onchange="mainCategoryLoad()">
		      		<option>카테고리를 선택해주세요.</option>
		      	<c:forEach var="cate" items="${categoryList}">
		      		<option ${cate == vo.category ? 'selected' : ''}>${fn: toUpperCase(cate)}</option>
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
        <input type="text" name="title" id="title" class="form-control" value="${vo.title}">
      </div>

      <div class="form-group">
        <div class="section-title">판매가</div>
        <div class="price-group">
          <input type="number" name="price" id="price" class="form-control" value="${vo.price}" oninput="finalPrice()">
          <input type="text" value="원" readonly class="form-control">
        </div>
      </div>

      <div class="form-group">
        <div class="section-title">할인</div>
        <div class="price-group">
          <input type="number" name="discount" id="discount" class="form-control" value="${vo.discount}" oninput="finalPrice()">
          <input type="text" value="%" readonly class="form-control">
        </div>
      </div>

      <div class="form-group">
        <div class="section-title">최종 판매가</div>
        <div class="price-group">
          <input type="text" name="pay" id="pay" class="form-control" readonly>
          <input type="text" value="원" readonly class="form-control">
        </div>
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

      <button type="submit">수정하기</button>
			<input type="hidden" name="idx" value="${vo.idx}">      
    </form>
  </div>
</body>
</html>
