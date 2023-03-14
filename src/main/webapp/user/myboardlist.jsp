<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>Villi : 내가 쓴 글 목록</title>
<link rel="icon" href="../resources/images/favicon.png">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

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
td {
  text-align: center;
  vertical-align : middle;
}



</style>


</head>


<body>
	<!-- ===========header================ -->
<header class="border-bottom border-white">
		<div class="container">
			<div class="row align-items-start p-3">
		
				
				<div class="col mb-3">
					<a href="getBoardList.do"><img src="resources/images/test.png"
						alt="logo" width=70px height=70px></a>
				</div>

				<div class="col mt-3 text-end r_menu">
						<span class=mx-2><a href="#" style="text-decoration:none" class="text-dark">좋아요</a> </span> 
						<span class=mx-1><a href="getUserList.do" style="text-decoration:none" class="text-dark">마이페이지</a></span>
						<span class=mx-1><a href="location/infoVilli.jsp" style="text-decoration:none" class="text-dark">동네정보</a></span>  
						<span class="mx-2">${ sessionScope.user.getNickname() }님</span>
				</div>
			</div>
		</div>
	</header>
	
	
	<!------------------ 본문 --------------------->
<div class="container col-5 mt-4" align="center" >
	 	<h3 class="fw-bold">내가 쓴 글 목록</h3>
	</div>
		<div class="container mt-3">
		<h5 ><strong> ${ user.nickname }</strong> &nbsp;님이 작성하신 게시글 입니다.</h5>
		<span> ${ user.address } </span>
		<hr />
		<br />
		<br />		
			
				
<table class="table  table-bordered table-hover">
			<thead class="table-light text-center">
				<th scope="col" class="col-1 text-center" >No.</th>
				<th scope="col" class="col-2 text-center" >카테고리</th>
				<th scope="col" class="col-1" >사진</th>
				<th scope="col" class="col-3">제목</th>
				
				<th scope="col" class="col-1 text-center">상태</th>
				<th scope="col" class="col-3 text-center">날짜</th>
				</thead>
<tbody>
<c:forEach items="${MyboardList}" var="MyboardList">
					<tr>
						<td ><a href="updateBoard.do?seq=${MyboardList.getSeq()}"style="text-decoration: none; color:#73cec7;">${ MyboardList.seq }</a></td>
									<td>${ MyboardList.cate2 }</td>
									<td><img width="50" height="50"  src="../img/${ MyboardList.fileName1 }" alt="image"> </td>
							<td>	
							
							<c:choose>
							<c:when test="${fn:length(MyboardList.title) > 19}">
							<c:out value="${fn:substring(MyboardList.title,0,18)}" />....
          					</c:when>
							<c:otherwise>
							<c:out value="${MyboardList.title}"  />
							</c:otherwise>
							</c:choose>
							</td>
							<td>
							<c:choose>
											<c:when test="${MyboardList.status eq '대기중'}">
												<span class="badge bg-success text-white rounded-pill">${MyboardList.status}</span>
											</c:when>
											<c:when test="${MyboardList.status eq '예약중'}">
												<span class="badge bg-warning text-white rounded-pill">${MyboardList.status}</span>
											</c:when>
											<c:when test="${MyboardList.status eq '대여중'}">
												<span class="badge bg-danger text-white rounded-pill">${MyboardList.status}</span>
											</c:when>
										</c:choose>
									</td>
									<td><c:if test="${ !empty  MyboardList.usedate}">
											<span>${ MyboardList.usedate } ~ ${ MyboardList.duedate }</span>
										</c:if>
										<c:if test="${ empty  MyboardList.usedate}">
											<span>날짜상의</span>
										</c:if>
										</td>
									
						</tr>
					</c:forEach>
				</tbody>
			</table>

</div>




</body>
</html>