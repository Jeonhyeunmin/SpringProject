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
  
  google.charts.load('current', { packages: ['corechart'] });

  function drawChart(res) {
	  const names = res.names; // 고객 이름 리스트
	  const months = res.months; // 월 리스트
	  const total = res.total;

	  // 데이터를 Google Charts에 맞는 형식으로 변환
	  const uniqueMonths = [...new Set(months)]; // 고유한 월 목록 추출
	  const uniqueNames = [...new Set(names)]; // 고유한 고객 이름 추출

	  // 기본 데이터 배열 (첫 번째 행에 헤더 추가)
	  const chartData = [["Month", ...uniqueNames]];

	  // 월별 데이터 초기화
	  uniqueMonths.forEach((month) => {
	    const row = [month];
	    uniqueNames.forEach(() => row.push(0)); // 고객 수만큼 0으로 초기화
	    chartData.push(row);
	  });

	  months.forEach((month, index) => {
	    const customerName = names[index];
	    const amount = total[index];
	    const monthIndex = uniqueMonths.indexOf(month) + 1;
	    const nameIndex = uniqueNames.indexOf(customerName) + 1;
	    chartData[monthIndex][nameIndex] += amount;
	  });

	  const data = google.visualization.arrayToDataTable(chartData);

	  // 차트 옵션 설정
	  const options = {
	    title: res.title,
	    titleTextStyle: {
	      color: "#333",
	      fontSize: 24,
	      bold: true,
	    },
	    hAxis: {
	      title: res.unit,
	      titleTextStyle: { color: "#666", fontSize: 14, italic: true },
	      slantedText: true,
	      slantedTextAngle: 45,
	      gridlines: { color: "#e8e8e8", count: 6 }, // 밝은 그리드라인
	    },
	    legend: {
	      position: "bottom",
	      textStyle: { fontSize: 12, color: "#444" },
	      alignment: "center",
	    },
	    series: {
	      0: { lineWidth: 3, pointSize: 8 },
	      1: { lineWidth: 3, pointSize: 8 },
	      2: { lineWidth: 3, pointSize: 8 },
	    },
	    backgroundColor: {
	      fill: "linear-gradient(to bottom, #f9f9f9, #ffffff)", // 그라데이션 배경
	    },
	    chartArea: {
	      top: 60,
	      width: "85%",
	      height: "65%",
	    },
	    pointShape: "diamond", // 데이터 포인트 모양
	    annotations: {
	      textStyle: {
	        fontSize: 10,
	        bold: true,
	        color: "#555",
	      },
	    },
	    colors: ["#1b9e77", "#d95f02", "#7570b3", "#e7298a", "#66a61e", "#e6ab02", "#a6761d"],
	    lineWidth: 3,
	    pointSize: 8,
	    dataOpacity: 0.8, // 투명도
	    animation: {
	      duration: 1200,
	      easing: "inAndOut",
	    },
	  };

	  // 차트 생성
	  const chart = new google.visualization.LineChart(
	    document.getElementById("linechart_material")
	  );
	  chart.draw(data, options);
	}

  function mostUser() {
    $.ajax({
      type: "POST",
      url: "${ctp}/admin/mostUser",
      success: function (res) {
        $("#linechart_material").slideDown(500, function () {
          drawChart(res);
        });
      },
      error: function () {
        alert("데이터를 불러오는 중 오류가 발생했습니다.");
      },
    });
  }
  
  function mostCompany() {
    $.ajax({
      type: "POST",
      url: "${ctp}/admin/mostCompany",
      success: function (res) {
        $("#linechart_material").slideDown(500, function () {
          drawChart(res);
        });
      },
      error: function () {
        alert("데이터를 불러오는 중 오류가 발생했습니다.");
      },
    });
  }


  </script>
	<style type="text/css">
		.grey-bg{
			margin: 0 auto;
			margin-top: 9.5%;
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
	  .card .media:hover {
	    cursor: pointer; 
	  }
	
	  #linechart_material {
      display: none; /* 처음에는 숨김 */
      width: 95%;
      height: 500px;
      margin: 30px auto;
    }
	  
	  
	</style>
</head>
<body>
	<div class="grey-bg container-fluid">
		<div id="linechart_material"></div>
	  <section id="stats-subtitle">
		  <div class="row">
		    <div class="col-xl-6 col-md-12">
		      <div class="card overflow-hidden">
		        <div class="card-content">
		          <div class="card-body cleartfix">
		            <div class="media align-items-stretch" onclick="mostUser()">
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
		            <div class="media align-items-stretch" onclick="mostCompany()">
		              <div class="align-self-center">
		                <i class="fa-regular fa-building warning font-large-2 mr-2"></i>
		              </div>
		              <div class="media-body align-self-center">
		                <h4 class="m-0">파트너</h4>
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