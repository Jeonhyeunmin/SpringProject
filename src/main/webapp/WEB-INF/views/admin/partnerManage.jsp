<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap-extended.min.css">
	<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/fonts/simple-line-icons/style.min.css">
	<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/colors.min.css">
	<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<style type="text/css">
		.grey-bg{
			margin: 0 auto;
			margin-top: 5%;
		}
	</style>
	<script>
	  document.addEventListener("DOMContentLoaded", function () {
	    // 고객 이름 및 구매 수량 데이터를 서버에서 JSP로 전달
	    const customerNames = ${customerNames};
	    const purchaseCounts = ${purchaseCounts};
	
	    const ctx = document.getElementById('topCustomerChart').getContext('2d');
	    const topCustomerChart = new Chart(ctx, {
	      type: 'bar',
	      data: {
	        labels: customerNames,
	        datasets: [{
	          label: '구매 수량',
	          data: purchaseCounts,
	          backgroundColor: 'rgba(75, 192, 192, 0.5)',
	          borderColor: 'rgba(75, 192, 192, 1)',
	          borderWidth: 1
	        }]
	      },
	      options: {
	        responsive: true,
	        scales: {
	          y: {
	            beginAtZero: true
	          }
	        },
	        plugins: {
	          legend: {
	            display: true,
	            position: 'top'
	          },
	          title: {
	            display: true,
	            text: '구매 상위 고객'
	          }
	        }
	      }
	    });
	  });
	</script>

</head>
<body>
	<div class="grey-bg container-fluid">
		<div class="card">
		  <div class="card-header">
		    <h4>구매 상위 고객</h4>
		  </div>
		  <div class="card-body">
		    <canvas id="topCustomerChart" width="400" height="200"></canvas>
		  </div>
		</div>
	  <section id="stats-subtitle">
		  <div class="row">
		    <div class="col-xl-6 col-md-12">
		      <div class="card overflow-hidden">
		        <div class="card-content">
		          <div class="card-body cleartfix">
		            <div class="media align-items-stretch">
		              <div class="align-self-center">
		                <i class="fa-solid fa-user primary font-large-2 mr-2"></i>
		              </div>
		              <div class="media-body align-self-center">
		                <h4 class="m-0">고객</h4>
		              </div>
		              <div class="align-self-center">
		                <h1><fmt:formatNumber pattern="#,##0" value="${fn: length(customerVOS)}"/>명</h1>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		
		    <div class="col-xl-6 col-md-12">
		      <div class="card">
		        <div class="card-content">
		          <div class="card-body cleartfix">
		            <div class="media align-items-stretch">
		              <div class="align-self-center">
		                <i class="fa-regular fa-building warning font-large-2 mr-2"></i>
		              </div>
		              <div class="media-body align-self-center">
		                <h4 class="m-0">업체</h4>
		              </div>
		              <div class="align-self-center"> 
		                <h1><fmt:formatNumber pattern="#,##0" value="${fn: length(partnerVOS)}"/>개</h1>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
	  </section>
  </div>
</body>
</html>