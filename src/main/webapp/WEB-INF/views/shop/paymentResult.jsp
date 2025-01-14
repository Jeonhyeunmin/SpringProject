<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
</head>
<body>
  <table class="table table-bordered">
    <tr style="text-align:center;background-color:#ccc;">
      <th>상품이미지</th>
      <th>주문일시</th>
      <th>주문내역</th>
      <th>비고</th>
    </tr>
    <c:forEach var="vo" items="${orderVos}">
      <tr>
        <td style="text-align:center;">
          <img src="${ctp}/category/${vo.thumbnail}" width="100px"/>
        </td>
        <td style="text-align:center;"><br/>
          <%-- <p>주문번호 : ${vo.orderIdx}</p> --%>
          <p>총 주문액 : <fmt:formatNumber value="${vo.totalPrice}"/>원</p>
          <%-- <p><input type="button" value="배송지정보" onclick="nWin('${vo.orderIdx}')"></p> --%>
        </td>
        <td align="left">
	        <p><br/>모델명 : <span style="color:orange;font-weight:bold;">${vo.shopTitle}</span><br/> &nbsp; &nbsp; <fmt:formatNumber value="${vo.price}"/>원</p><br/>
	        <p>
	          - 주문 내역
	          (옵션 ${vo.optionSelect}개 포함)<br/>
	          <c:forEach var="i" begin="1" end="${fn:length(optionNames)}">
	          </c:forEach> 
	        </p>
	      </td>
        <td style="text-align:center;"><br/><font color="blue">결제완료</font><br/>(배송준비중)</td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>