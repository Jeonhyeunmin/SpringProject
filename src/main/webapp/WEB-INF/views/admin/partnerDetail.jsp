<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <style type="text/css">
    body {
      font-family: 'Montserrat', Arial, sans-serif;
      background-color: #f8f9fa;
      margin: 0;
      padding: 0;
    }
    .container-fluid {
      max-width: 1200px;
      margin: 30px auto;
      background-color: #fff;
      border-radius: 15px;
      box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
      padding: 20px;
      margin-top: 5%;
    }
    .leftContainer {
      background: #e9ecef;
      padding: 20px;
      border-radius: 15px;
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
    }
    .leftContainer img {
      width: 150px;
      height: 150px;
      border-radius: 50%;
      object-fit: cover;
      margin-bottom: 15px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .leftContainer h1 {
      font-size: 24px;
      margin-bottom: 15px;
      color: #343a40;
    }
    .leftContainer p {
      font-size: 16px;
      color: #495057;
      margin-bottom: 10px;
    }
    .RightContainer {
      padding: 20px;
      background: #ffffff;
      border-radius: 15px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .RightContainer h2 {
      font-size: 22px;
      margin-bottom: 15px;
      color: #343a40;
    }
    .RightContainer hr {
      margin: 10px 0;
      border-top: 1px solid #dee2e6;
    }
    .RightContainer p {
      font-size: 16px;
      color: #495057;
      margin-bottom: 10px;
    }
    .RightContainer textarea {
      margin-bottom: 15px;
      resize: none;
      border: 1px solid #ced4da;
      border-radius: 5px;
      padding: 10px;
      font-size: 14px;
    }
    .btn-danger {
      background-color: #ff6b6b;
      border: none;
      color: #fff;
      padding: 10px 20px;
      font-size: 16px;
      font-weight: bold;
      border-radius: 30px;
      transition: all 0.3s ease-in-out;
      cursor: pointer;
      display: inline-block;
      text-align: center;
      width: 100%;
    }
    .btn-danger:hover {
      background-color: #fa5252;
      box-shadow: 0 4px 8px rgba(255, 107, 107, 0.3);
      transform: translateY(-2px);
    }
    .btn-danger:active {
      box-shadow: 0 2px 4px rgba(255, 107, 107, 0.3);
      transform: translateY(1px);
    }
    .btn-success {
      border: none;
      color: #fff;
      padding: 10px 20px;
      font-size: 16px;
      font-weight: bold;
      border-radius: 30px;
      transition: all 0.3s ease-in-out;
      cursor: pointer;
      display: inline-block;
      text-align: center;
      width: 100%;
    }
    .btn-success:hover {
      box-shadow: 0 4px 8px rgba(255, 107, 107, 0.3);
      transform: translateY(-2px);
    }
    .btn-success:active {
      box-shadow: 0 2px 4px rgba(255, 107, 107, 0.3);
      transform: translateY(1px);
    }
    
    .row {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
    }
    .col {
      flex: 1;
      min-width: 300px;
    }
  </style>
  <script type="text/javascript">
	  function PartnerDelete(idx) {
			let ans = confirm("파트너 정보를 삭제하시겠습니까?");
			if(ans){
				$.ajax({
					type:"post",
					url:"${ctp}/admin/PartnerDelete",
					data:{
						idx : idx
					},
					success: function(res) {
						if(res != "0"){
							alert("회원 정보가 삭제되었습니다.");
							location.reload();
						}
					},
					error: function() {
						alert("전송오류");
					}
				});
			}
		}
	  
	  function PartnerYes(idx) {
	  		let ans = confirm("파트너를 승인하시겠습니까?");
				if(ans){
					$.ajax({
						type:"post",
						url : "${ctp}/admin/partnerYes",
						data : {
							idx : idx
						},
						success: function(res) {
							if(res != "0"){
								alert("파트너가 승인되었습니다.");
								location.reload();
							}
						},
						error: function() {
							alert("전송오류");
						}
					});
				}
			}
	  
  </script>
</head>
<body>
  <div class="container-fluid">
    <div class="row">
      <!-- 좌측 컨테이너 -->
      <div class="leftContainer col">
        <img src="${ctp}/logo/${vo.logo}" alt="${vo.company}님의 사진">
        <h1>개인정보</h1>
        <hr>
        <p><strong>아이디:</strong> ${vo.mid}</p>
        <p><strong>파트너명:</strong> ${vo.company}</p>
        <p><strong>이름:</strong> ${vo.ceoName}</p>
        <p><strong>사업자등록번호:</strong> ${fn: substring(vo.businessNumber, 0, 3)}-${fn: substring(vo.businessNumber, 3, 5)}-${fn: substring(vo.businessNumber, 5, 10)}</p>
        <p><strong>전화:</strong> ${vo.tel}</p>
        <p><strong>메일:</strong> ${vo.email}</p>
        <p><strong>주소:</strong> ${fn: replace(vo.address, "/" , " ")}</p>
      </div>

      <!-- 우측 컨테이너 -->
      <div class="RightContainer col">
        <h2>회원정보</h2>
        <hr>
        <p><strong>파트너명:</strong> ${vo.company}</p>
        <hr>
        <textarea class="form-control" rows="5" placeholder="메모를 입력하세요"></textarea>
        <h2>함께한 정보</h2>
        <hr>
        <p><strong>시작일:</strong> ${fn: substring(vo.startDate, 0, 10)}</p>
        <p><strong>마지막 접속일:</strong> ${fn: substring(vo.lastDate, 0, 10)}</p>
        <p><strong>활동 여부 :</strong> ${vo.accept == 'NO' ? '<font color="red">NO PARTNER</font>' : 'PARTNER'}</p>
        <c:if test="${vo.accept == 'YES'}"><button type="button" onclick='PartnerDelete(${vo.idx})' class="btn btn-danger">파트너 해지</button></c:if>
        <c:if test="${vo.accept == 'NO'}"><button type="button" onclick='PartnerYes(${vo.idx})' class="btn btn-success">파트너 승인</button></c:if>
      </div>
      <button type="button" onclick='location.href="${ctp}/admin/partnerManage"' class="btn btn-secondary">목록으로</button>
    </div>
  </div>
</body>
</html>
