<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style type="text/css">
  	@font-face {
	    font-family: 'NoonnuBasicGothicRegular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
		}
		body {
	    margin: 0;
	    padding: 0;
	    background-color: #fafafa;
	    color: #333;
		}
		
		.event-container {
	    font-family: 'NoonnuBasicGothicRegular', Arial, sans-serif;
	    width: 90%;
	    max-width: 1200px;
	    margin: 0 auto;
	    padding: 20px;
	    min-height: 51vh;
	    margin-top: 50px;
		}
		
		h1 {
	    text-align: left;
	    font-weight: bold;
	    margin-bottom: 20px;
	    font-size: 1.8em;
		}
		
		.card-container {
	    display: flex;
	    gap: 20px;
	    flex-wrap: wrap;
	    justify-content: space-between;
		}
		
		.card {
	    background-color: #ffffff;
	    border-radius: 15px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    overflow: hidden;
	    transition: transform 0.2s, box-shadow 0.2s;
	    width: calc(33% - 20px);
	    min-width: 280px;
	    cursor: pointer;
	    text-align: left;
	    position: relative;
		}
		
		.card:hover {
	    transform: translateY(-10px);
	    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
		}
		
		.card img {
	    width: 100%;
	    height: 150px;
	    object-fit: cover;
		}
		
		.card-content {
	    padding: 20px;
		}
		
		.card h3 {
	    font-size: 1.4em;
	    margin-bottom: 10px;
	    font-weight: bold;
	    color: #222;
		}
		
		.card p {
	    font-size: 1em;
	    margin-bottom: 15px;
	    color: #555;
		}
		
		.card span {
	    font-size: 0.9em;
	    color: #888;
		}
		
		@media screen and (max-width: 768px) {
	    .card {
	      width: calc(48% - 20px);
	    }
		}
		
		@media screen and (max-width: 576px) {
	    .card {
	      width: 100%;
	    }
		}
  </style>
</head>
<body>
  <div class="event-container">
    <h1>진행중인 이벤트</h1>
    <div class="card-container">
      <c:forEach var="vo" items="${vos}">
        <div class="card" onclick="location.href='${ctp}/event/eventContent?idx=${vo.idx}'">
          <img alt="event" src="${ctp}/event/${vo.thumbnail}">
          <div class="card-content">
            <h3>${vo.title}</h3>
            <p>${vo.subTitle}</p>
            <span>${fn: substring(vo.startDate, 0, 10)} ~ ${fn: substring(vo.endDate, 0, 10)}</span>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</body>
</html>
