<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <style type="text/css">
  	footer {
		  font-family: 'GmarketSansMedium';
		  overflow-x: hidden;
		  padding: 1.5%;
		}
		
		hr.footer-hr {
		    border: 0;
		    height: 1.5px;
		    margin: 0;
		    margin-bottom: 10px;
		}
		
		.left-col {
		    text-align: left;
		    margin-left: 4.5%;
		}
		
		.middle-col {
		    padding-left: 4.5%;
		}
		
		.title-link {
		    color: white;
		    font-size: 25px;
		}
		
		.input-group.contact-info {
		    margin-top: 10px;
		}
		.phone-number {
		    color: white;
		    font-size: 16px;
		    font-weight: bold;
		}
		
		.business-hours {
		    color: white;
		    font-size: 14px;
		    padding-top: 2px;
		}
		
		.input-group-append.text-white.pt-2.info-list {
		    font-size: 12px;
		    padding-left: 20px;
		}
		
		.info-list ul {
		    padding-left: 4.5%;
		    padding-top: 10px;
		    color: white;
		    font-size: 13px;
		}
		
		a {
		    text-decoration: none; /* 기본 밑줄 제거 */
		    color: inherit; /* 부모의 색상 상속 */
		    transition: color 0.3s ease-in-out; /* 색상 변화에 부드러운 전환 효과 */
		}
		
		a:hover {
		    text-decoration: none; /* 마우스를 올려도 밑줄 제거 유지 */
		    color: inherit; /* 부모 색상 유지 */
		}
		
		.menu-link {
		    color: white; /* 링크의 기본 색상 */
		    text-decoration: none; /* 밑줄 제거 */
		    font-weight: light;
		    font-size: 15px;
		}
		
		.menu-link:hover {
		    text-decoration: none; /* 호버 시 밑줄 제거 */
		    color: white; /* 색상 유지 */
		}
		.foot {
		    text-align: left;
		    font-size: 12px;
		    padding-left: 4%;
		}
		
		.foot div {
		    font-size: 12px;
		}
  </style>
</head>
<body>
	<footer	>
		<div class="row">
			<div class="col left-col">
				<div class="title-link">고객센터</div>
				<div class="input-group contact-info">
					<div class="input-group-append"><font size="3px" class="phone-number"><b>1234-1234</b></font></div>
					<div class="input-group-append pl-2"><font size="3px" class="business-hours">09:00 ~ 18:00</font></div>
				</div>
				<div class="input-group-append info-list">
					<ul>
						<li>평일 : 전체 문의 상담</li>
						<li>토요일, 공휴일 : 그린테리어 직접배송 주문 건 상담</li>
						<li>일요일 : 휴무</li>
					</ul>
				</div>
			</div>
			<div class="col text-left middle-col">
				<div class="title-link">회사정보</div>
				<div><a href="${ctp}/comnmon/info" class="menu-link">회사소개</a></div>
				<div><a href="" class="menu-link">이용약관</a></div>
				<div><a href="" class="menu-link">공지사항</a></div>
				<div><a href="" class="menu-link">개인정보처리방침</a></div>
			</div>
			<div class="col text-left">
				<div class="title-link">이용안내</div>
				<div><a href="" class="menu-link">자주 묻는 질문</a></div>
				<div><a href="" class="menu-link">입점신청</a></div>
				<div><a href="" class="menu-link">제휴/광고문의</a></div>
				<div><a href="" class="menu-link">고객의 소리</a></div>
			</div>
		</div>
		<div class="row foot">
			<div class="col text-left text-white">
				<hr class="footer-hr" width="200%">
				<div>주식회사 그린테리어 | 대표이사 : hm & sy | 주소: 충청북도 청주시 서원구 사직대로 109 4층 | 사업자등록번호 : 123-45-67890 | 이메일: info.grinterior.com</div>	
				<div>&copy; 2024 grinterior. All Rights Reserved.</div>
			</div>
		</div>
	</footer>
</body>
</html>
