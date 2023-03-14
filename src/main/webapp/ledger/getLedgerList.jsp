<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>main</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
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
	<!-- ============search=============== -->
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


	<div class="container mt-3">
		<div class="row">
			<c:forEach items="${ledgerList}" var="ledger">
					<div class="col-12 col-md-6 col-lg-3 mt-5">
								<div class="text-muted">날짜 : ${ ledger.date }</div>
								<div class="text-muted">내용 : ${ ledger.content }</div>
								<div class="text-muted">금액 : ${ ledger.amount }</div>
							</div>
							
			</c:forEach>
			
		</div>
		<div class="row align-items-start mt-3 ">
			<ul class="pagination justify-content-center ">

				<c:set var="cp" value="${searchVO.getCurPage()}" />
				<c:set var="rp" value="${searchVO.getRowSizePerPage()}" />
				<c:set var="fp" value="${searchVO.getFirstPage()}" />
				<c:set var="lp" value="${searchVO.getLastPage()}" />
				<c:set var="ps" value="${searchVO.getPageSize()}" />
				<c:set var="tp" value="${searchVO.getTotalPageCount()}" />
				<c:set var="sc" value="${searchVO.getSearchCategory()}" />
				<c:set var="st" value="${searchVO.getSearchType()}" />
				<c:set var="sw" value="${searchVO.getSearchWord()}" />

				<c:if test="${ fp != 1 }">
					<li class="page-item"><a
						href="getLedgerList.do?curPage=1&rowSizePerPage=${rp}&searchType=${st}&searchWord=${sw}"
						class="page-link"><i class="fas fa-fast-backward"></i></a></li>
					<li class="page-item"><a
						href="getLedgerList.do?curPage=${fp-1}&rowSizePerPage=${rp}&searchType=${st}&searchWord=${sw}"
						class="page-link"><i class="fas fa-backward"></i></a></li>
				</c:if>

				<c:forEach var="page" begin="${fp}" end="${lp}">
					<li class="page-item ${cp==page ? 'active' : ''}"><a
						href="getLedgerList.do?curPage=${page}&rowSizePerPage=${rp}&searchType=${st}&searchWord=${sw}"
						class="page-link">${page}</a></li>
				</c:forEach>

				<c:if test="${ lp < tp }">
					<li class="page-item"><a
						href="getLedgerList.do?curPage=${lp+ps}&rowSizePerPage=${rp}&searchType=${st}&searchWord=${sw}"
						class="page-link"><i class="fas fa-forward"></i></a></li>
					<li class="page-item"><a
						href="getLedgerList.do?curPage=${tp}&rowSizePerPage=${rp}&searchType=${st}&searchWord=${sw}"
						class="page-link"><i class="fas fa-fast-forward"></i></a></li>
				</c:if>
			</ul>
			<!-- pagination -->
		</div>
		
	</div>

</body>
</html>