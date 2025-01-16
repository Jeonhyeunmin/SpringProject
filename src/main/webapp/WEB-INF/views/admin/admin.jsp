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
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
	  google.charts.load('current', {'packages':['corechart']});
	  google.charts.setOnLoadCallback(drawChart);
	
	  function drawChart() {
	    var data = new google.visualization.DataTable();
	    data.addColumn('string', '이름');
	    data.addColumn('number', '구매수');
	
	    // 데이터 추가
	    data.addRows([
	      <c:forEach var="i" begin="0" end="6" varStatus="st">
	        ['${buyName[i]}', ${buyCnt[i]}],
	      </c:forEach>
	    ]);
	
	    var options = {
	      title: 'VIP 고객 구매 분석',
	      chartArea: { width: '70%', height: '70%' },
	      hAxis: {
	        title: '고객 이름',
	        textStyle: { fontSize: 12 },
	        titleTextStyle: { fontSize: 14, color: '#333', bold: true }
	      },
	      vAxis: {
	        title: '구매 횟수',
	        textStyle: { fontSize: 12 },
	        titleTextStyle: { fontSize: 14, color: '#333', bold: true }
	      },
	      legend: { position: 'none' },
	      colors: ['#4caf50', '#ff9800', '#2196f3', '#9c27b0', '#f44336'], // 각 막대의 색상
	      backgroundColor: '#f9f9f9'
	    };
	
	    var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
	    chart.draw(data, options);
	  }
  </script>
	<style type="text/css">
		.grey-bg{
			margin: 0 auto;
			margin-top: 5%;
		}
		.card {
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    border-radius: 8px;
	    transition: transform 0.2s, box-shadow 0.2s;
	  }
	
	  .card:hover {
	    transform: scale(1.02);
	    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
	  }
	
	  .card h4 {
	    font-size: 18px;
	    font-weight: 600;
	    color: #333;
	  }
	
	  .card h1 {
	    font-size: 28px;
	    font-weight: bold;
	    color: #4caf50; /* 강조 색상 */
	  }
	
	  .card i {
	    color: #4caf50; /* 아이콘 색상 */
	  }
	
	  .card .media {
	    align-items: center;
	  }
	
	  #chart_div {
	    border: 1px solid #ecf0f1;
	    background: linear-gradient(135deg, #ffffff, #f9f9f9);
	    border-radius: 8px;
	    padding: 20px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    margin: 30px auto;
	  }
	</style>
</head>
<body>
	<div id="chart_div" style="width: 100%; height: 500px; margin: 30px auto;"></div>
	<div class="grey-bg container-fluid">
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
		  
		  <div class="row">
		    <div class="col-xl-6 col-md-12">
		      <div class="card overflow-hidden">
		        <div class="card-content">
		          <div class="card-body cleartfix">
		            <div class="media align-items-stretch">
		              <div class="align-self-center">
		                <i class="icon-pencil primary font-large-2 mr-2"></i>
		              </div>
		              <div class="media-body align-self-center">
		                <h4 class="m-0">게시물</h4>
		              </div>
		              <div class="align-self-center">
		                <h1><fmt:formatNumber pattern="#,##0" value="${fn: length(shopVOS)}"/>건</h1>
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
		                <i class="icon-speech warning font-large-2 mr-2"></i>
		              </div>
		              <div class="media-body align-self-center">
		                <h4 class="m-0">리뷰</h4>
		              </div>
		              <div class="align-self-center"> 
		                <h1><fmt:formatNumber pattern="#,##0" value="${fn: length(reviewVOS)}"/>건</h1>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		  
		  <div class="row">
		    <div class="col-xl-6 col-md-12">
		      <div class="card">
		        <div class="card-content">
		          <div class="card-body cleartfix">
		            <div class="media align-items-stretch">
		              <div class="align-self-center">
		                <i class="fa-solid fa-exclamation-triangle warning font-large-2 mr-2"></i>
		              </div>
		              <div class="media-body align-self-center">
		                <h4 class="m-0">신고 게시물</h4>
		              </div>
		              <div class="align-self-center">
		                <h1>${claim}건</h1>
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
		                <i class="fas fa-exclamation-circle danger font-large-2 mr-2"></i>
		              </div>
		              <div class="media-body align-self-center">
		                <h4 class="m-0">신고 리뷰</h4>
		              </div>
		              <div class="align-self-center">
		                <h1>${reviewClaim}건</h1>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		  
		  <div class="row">
		    <div class="col-xl-6 col-md-12">
		      <div class="card overflow-hidden">
		        <div class="card-content">
		          <div class="card-body cleartfix">
		            <div class="media align-items-stretch">
		              <div class="align-self-center">
		                <i class="fas fa-shopping-cart success font-large-2 mr-2"></i>
		              </div>
		              <div class="media-body align-self-center">
		                <h4 class="m-0">게시물 승인</h4>
		              </div>
		              <div class="align-self-center">
		                <h1>${acceptPost}건</h1>
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
		                <i class="icon-heart danger font-large-2 mr-2"></i>
		              </div>
		              <div class="media-body align-self-center">
		                <h4 class="m-0">판매</h4>
		              </div>
		              <div class="align-self-center"> 
		                <h1><fmt:formatNumber pattern="#,##0" value="${fn: length(orderVOS)}"/>건</h1>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		  
		  <div class="row">
		    <div class="col-xl-6 col-md-12">
		      <div class="card">
		        <div class="card-content">
		          <div class="card-body cleartfix">
		            <div class="media align-items-stretch">
		              <div class="align-self-center">
		                <i class="icon-wallet success font-large-2 mr-2"></i>
		              </div>
		              <div class="media-body align-self-center">
		                <h4 class="m-0">정산 대기</h4>
		              </div>
		              <div class="align-self-center">
		                <h1>${adjustment}건</h1>
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
		                <i class="icon-wallet success font-large-2 mr-2"></i>
		              </div>
		              <div class="media-body align-self-center">
		                <h4 class="m-0">판매액</h4>
		              </div>
		              <div class="align-self-center">
		                <h1><fmt:formatNumber pattern="#,##0" value="${totalSell}"/>원</h1>
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