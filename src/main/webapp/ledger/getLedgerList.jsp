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
@keyframes move_wave {
    0% {
        transform: translateX(0) translateZ(0) scaleY(1)
    }
    50% {
        transform: translateX(-25%) translateZ(0) scaleY(0.55)
    }
    100% {
        transform: translateX(-50%) translateZ(0) scaleY(1)
    }
}
.waveWrapper {
    overflow: hidden;
    position: absolute;
    left: 0;
    right: 0;
    bottom: 0;
    top: 0;
    margin: auto;
}
.waveWrapperInner {
    position: absolute;
    width: 100%;
    overflow: hidden;
    height: 100%;
    bottom: -1px;
    background-image: linear-gradient(to top, #86377b 20%, #27273c 80%);
}
.bgTop {
    z-index: 15;
    opacity: 0.8;
}
.bgMiddle {
    z-index: 10;
    opacity: 0.75;
}
.bgBottom {
    z-index: 5;
}
.wave {
    position: absolute;
    left: 0;
    width: 200%;
    height: 100%;
    background-repeat: repeat no-repeat;
    background-position: 0 bottom;
    transform-origin: center bottom;
}
.waveTop {
    background-size: 50% 100px;
}
.waveAnimation .waveTop {
  animation: move-wave 3s;
   -webkit-animation: move-wave 3s;
   -webkit-animation-delay: 1s;
   animation-delay: 1s;
}
.waveMiddle {
    background-size: 50% 120px;
}
.waveAnimation .waveMiddle {
    animation: move_wave 10s linear infinite;
}
.waveBottom {
    background-size: 50% 100px;
}
.waveAnimation .waveBottom {
    animation: move_wave 15s linear infinite;
}
</style>
</head>
<body>
	<div class="waveWrapper waveAnimation">
		<div class="waveWrapperInner bgTop">
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
									<div class="collapse navbar-collapse"
										id="navbarSupportedContent">
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
												value="${searchVO.getCurPage()}"> <input
												type="hidden" id="rowSizePerPage" name="rowSizePerPage"
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
			<table>
    <thead class="table-light text-center">
        <tr class="text-white">
            <th>Content</th>
            <th>Amount</th>
            <th>Date</th>
            <th>Category</th>
        </tr>
    </thead>
    <tbody>
<c:forEach var="ledger" items="${ledgerList}">
  <tr class="text-white">
    <td>${ledger.content}</td>
    <td>${ledger.amount}</td>
    <td>${ledger.date}</td>
    <td>
      <c:choose>
        <c:when test="${not empty ledger.category}">
          ${ledger.category.name}
        </c:when>
        <c:otherwise>          <span>Unknown</span>
        </c:otherwise>
      </c:choose>

    </td>
  </tr>
</c:forEach>
    </tbody>
</table>

			<div class="wave waveTop"
				style="background-image: url('http://front-end-noobs.com/jecko/img/wave-top.png')"></div>
		</div>
		<div class="waveWrapperInner bgMiddle">
			<div class="wave waveMiddle"
				style="background-image: url('http://front-end-noobs.com/jecko/img/wave-mid.png')"></div>

		</div>
		<div class="waveWrapperInner bgBottom">
			<div class="wave waveBottom"
				style="background-image: url('http://front-end-noobs.com/jecko/img/wave-bot.png')"></div>

		</div>
	</div>



</body>
</html>