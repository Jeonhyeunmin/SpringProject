<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Event Page</title>
  <style type="text/css">
  	/* styles.css */
		body {
	    font-family: Arial, sans-serif;
	    margin: 0;
	    padding: 0;
	    background-color: #f9f9f9;
		}
		
		.event-container {
	    width: 90%;
	    max-width: 1200px;
	    margin: 0 auto;
	    padding: 20px;
	    margin-top: 2%;
		}
		
		h1 {
	    text-align: left;
	    margin-bottom: 20px;
		}
		
		.event-section {
	    margin-top: 40px;
	    margin-bottom: 40px;
		}
		
		.event-section h2 {
	    font-size: 1.5em;
	    margin-bottom: 30px;
		}
		
		.card-container {
	    display: flex;
	    gap: 20px;
	    flex-wrap: wrap;
		}
		
		.card {
	    background-color: #ffffff;
	    border-radius: 10px;
	    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	    padding: 20px;
	    flex: 1 1 calc(33.333% - 20px);
	    max-width: calc(33.333% - 20px);
	    box-sizing: border-box;
	    transition: transform 0.2s, box-shadow 0.2s;
		}
		
		.card:hover {
	    transform: translateY(-5px);
	    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
		}
		
		.card h3 {
	    font-size: 1.2em;
	    margin-bottom: 10px;
		}
		
		.card p {
	    font-size: 1em;
	    margin-bottom: 10px;
	    color: #555;
		}
		
		.card span {
	    font-size: 0.9em;
	    color: #888;
		}
		    	
  </style>
</head>
<body>
  <div class="event-container">
    <h1>이벤트</h1>
		<button onclick="location.href='${ctp}/event/eventInput'">등록</button>
    <section class="event-section">
      <h2>쿠폰</h2>
      <div class="card-container">
      	<c:forEach var="vo" items="${vos}">
	        <div class="card" onclick="location.href='${ctp}/event/eventContent?idx=${vo.idx}'">
	        <img alt="event" src="${ctp}/event/${vo.thumbnail}">
	          <h3>${vo.title}</h3>
	          <p>${vo.subTitle}</p>
	          <span>${fn: substring(vo.startDate, 0, 10)} ~ ${fn: substring(vo.endDate, 0, 10)}</span>
	        </div>
	      </c:forEach>
      </div>
    </section>
  </div>
</body>
</html>
