<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="currentUserId" value="${sessionScope.user.id}" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<title>메인</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
    crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"></script>
    
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    integrity="sha512-b1S6+IgAgKm3Qy8YcQT0XJx2Q+Tsoe0dZjpCdrpyInwqu6J78Uhn+Yvx0W4tnJXH4x52NgpGxdEln+ZS1eAbiw=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
@font-face {
    font-family: 'Pretendard-Regular';
    src:
        url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
        format('woff');
    font-weight: 400;
    font-style: normal;
}

body {
    font-family: 'Pretendard-Regular';
}

header {
    background-color: #ffff;
    height: 80px;
}
</style>
</head>
<body>
	<header class="border-bottom border-dark sticky-top z-index-10">
		<div class="container" align="center">
			<div class="row p-3">
				<div class="col">
					<nav class="navbar navbar-expand-lg navbar-light">
						<div class="container-fluid">
							<a class="navbar-brand" href="">Save24</a>
							<button class="navbar-toggler" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation"></button>
							<div class="collapse navbar-collapse" id="navbarSupportedContent">
								<ul class="navbar-nav me-auto mb-2 mb-lg-0">
									<li class="nav-item">
										<div class="dropdown">
											<button class="btn dropdown-toggle" type="button"
												id="dropdownMenuButton2" data-bs-toggle="dropdown"
												aria-expanded="false">메뉴</button>
											<ul class="dropdown-menu dropdown-menu-dark"
												aria-labelledby="dropdownMenuButton2">
												<li><a class="dropdown-item" href="">소비분석</a></li>
												<li><a class="dropdown-item" href="">예산관리</a></li>
												<li><a class="dropdown-item" href="">게시판</a></li>
											</ul>
										</div>
									<li class="nav-item"><a class="nav-link"
										aria-current="page" href="">마이페이지</a></li>
									<li class="nav-item"><a class="nav-link"
										aria-current="page" href="">공지사항/이벤트</a></li>
								</ul>
								<form action="" method="post" id="ledgerForm">
									<input type="hidden" id="curPage" name="curPage"
										value="${searchVO.getCurPage()}"> <input type="hidden"
										id="rowSizePerPage" name="rowSizePerPage"
										value="${searchVO.getRowSizePerPage()}">
									<div class="container">
										<div class="row justify-content-md">
											<div class="col-md-auto">
												<select class="form-select" id="searchType"
													name="searchType">
													<option value="all">통합검색</option>
													<option value="1"
														${searchVO.getSearchType()=="category" ? "selected" : ""}>지출검색</option>
													<option value="2"
														${searchVO.getSearchType()=="category" ? "selected" : ""}>수입검색</option>
												</select>
											</div>
											<div class="col col-lg-6">
												<input class="form-control" name="searchWord" type="text"
													placeholder="${searchVO.getCurPage()}of ${searchVO.getTotalRowCount()}" />
											</div>
											<div class="col col-lg-2">
												<button class="btn text-white "
													style="background-color: #9999;" type="submit">Search</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<div class="container mt-5">
		<a href="ledger/insertLedger.jsp"><button class="btn btn-primary">가계부
				작성하기</button></a>


		<h3 class="mt-5">나의 소비 카테고리 분석</h3>
		<div>
			<canvas id="myChart"></canvas>
		</div>

		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

		<script>

    const dataArr = [
        <c:forEach var="ledger" items="${ledgerList}">     
            ${ledger.amount},
        </c:forEach>
    ];

    const labelArr = [
        <c:forEach var="ledger" items="${ledgerList}">
            '${ledger.category.name}',
        </c:forEach>
    ];

    const ctx = document.getElementById('myChart');

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labelArr,
            datasets: [{
                label: '# 금액',
                data: dataArr,
                borderWidth: 2,
                fill: false,
                borderColor: 'rgb(75, 192, 192)',
                tension: 0.1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

</script>

		<h3 class="mt-5">나의 최근 월별 소비 분석</h3>
		<div>
			<canvas id="myChartMon"></canvas>
		</div>


		<script>
    const dataArr2 = [
        <c:forEach var="ledger" items="${ledgerMonthly}">
            '${ledger.month}', 
        </c:forEach>
    ];

    const labelArr2 = [
        <c:forEach var="ledger" items="${ledgerMonthly}">
            ${ledger.total_amount},
        </c:forEach>
    ];

    const ctxm = document.getElementById('myChartMon');

    new Chart(ctxm, {
        type: 'line',
        data: {
            labels: dataArr2, // labels와 data의 위치가 바뀌었습니다.
            datasets: [{
                label: '# 총 소비 금액',
                data: labelArr2, // labels와 data의 위치가 바뀌었습니다.
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
	</div>
</body>
</html>