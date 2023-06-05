</html>   <%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>villi 비번나오기</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" 
		integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" 
		crossorigin="anonymous">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>

@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

.joinbtn{
text-decoration:none;
color:white;
}

body {
	font-family: 'Pretendard-Regular';
}

</style>
</head>


<body>
   <!-- ===========header================ -->
	<header class="border-bottom border-white">
		<div class="container">
			<div class="row align-items-start p-3">
		
				
				<div class="col mb-3">
					<a href="../index.jsp"><img src="../img/test.png"
						alt="logo" width=70px height=70px></a>
				</div>

				<div class="col mt-3 text-end r_menu">
					<span class=mx-2></span> 
						<span class=mx-1></span>
						<span class=mx-1></span>  
						<span class="mx-2"></span>
				</div>
			</div>
		</div>
	</header>


  	<form action="findpw.do" method="post">	


	<div class="container col-5 mt-4">
		<h3 class="fw-bold">비밀번호를 확인해주세요.</h3>
			<hr/>
			<br/>
			
	
				
	
						<div class="input-group mb-3">
							<div class="input-group-text"><i class="fas fa-lock"></i></div>
							
						  <input type="text" name="password" class="form-control" value="${ sessionScope.user.getPassword() }" disabled> 

						</div>
						
						<div class="container  mt-5" align="center">
 		    <button  class="btn btn-dark text-white"  onClick="history.back(-1)"> 이전</button>
 		    <button  class="btn btn-dark text-white" > <a class="joinbtn"  href ="login.do"  >로그인</a></button>
 		    <button  class="btn btn-dark text-white"> <a class="joinbtn"  href ="joinok.jsp" >회원가입</a></button>

       	</div>
						
						
</div>

</form>
   
				
</body>
</html>   
