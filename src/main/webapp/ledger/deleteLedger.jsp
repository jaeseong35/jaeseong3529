<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>내역삭제</title>
<link rel="icon" href="/img/favicon.png">
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" 
		integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" 
		crossorigin="anonymous">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>	
	
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
	
	</style>



</head>
<body>
	<div class="container col-5 mt-5" align="center">
			<h4>가계부 내역 삭제하기</h4>
			
			<hr/>
		
		<form action="deleteLedger.do" method="post">
			<input type="hidden" name="id" value="${ ledger.getId()}">
			<button type="submit" class="btn btn-danger text-white mt-4 rounded-pill" ><b>"${ledger.getContent()}"</b> 삭제하기</button>
			<a href="getLedgerList.do" class="btn btn-dark text-white ms-3 mt-4 rounded-pill">뒤로가기</a>
		</form>
	</div>		
</body>
</html>			