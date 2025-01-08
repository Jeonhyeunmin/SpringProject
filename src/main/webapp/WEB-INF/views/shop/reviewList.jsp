<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:forEach var="vo" items="${reviewVOS}">
  <div class="review-container">
  	<div class="user-score">
  		<div>
      	<c:forEach var="i" begin="1" end="${vo.star}">
					<font color="#ffb334"><i class="fa-solid fa-star"></i></font>
				</c:forEach>
				<c:forEach var="i" begin="1" end="${5 - vo.star}">
					<i class="fa-regular fa-star"></i>
				</c:forEach>
			</div>
      <div class="reviewButton">
      	<c:if test="${sMid != vo.mid}">
		      <span><button class="claim" onclick="reviewClaim(${vo.idx})">신고</button></span>
		      <c:if test="${fn: contains(likeVOS, vo.idx)}">
		      	<span><button class="good" style="background-color: #4750f9; color: white;" onclick="alreadyGoodCheck()"><i class="fa-regular fa-thumbs-up"></i>(${vo.good})</button></span>
		      </c:if>
		      <c:if test="${!fn: contains(likeVOS, vo.idx)}">
		      	<span><button class="good" onclick="goodCheck(${vo.idx}, '${vo.mid}')"><i class="fa-regular fa-thumbs-up"></i>(${vo.good})</button></span>
		      </c:if>
	      </c:if>
      	<c:if test="${sMid == vo.mid}">
		      <span><button class="reviewUpdate" onclick="reviewUpdateForm(${vo.idx})">수정</button></span>
	      	<span><button class="reviewDelete" onclick="reviewDelete(${vo.idx})">삭제</button></span>
	      </c:if>
      </div>
		</div>
    <div class="review-content">
      <span>${vo.content}</span>
    </div>
    <div class="review-footer">
      <div class="review-user">
      	${fn: substring(vo.mid, 0, 2)}
      	<c:forEach var="i" begin="2" end="${fn: length(vo.mid)-2}">
      		*
      	</c:forEach>
			</div>
      <div class="review-date">${fn: substring(vo.reviewDate,0 ,10)}</div>
    </div>
  </div>
</c:forEach>