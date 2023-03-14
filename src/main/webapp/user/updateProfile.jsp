<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
   <title>Spring Framework</title>
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
 	<!-- 비밀번호 확인 스크립트 -->
	<script type="text/javascript">
		
	function passConfirm(){
		
		var password = document.getElementById("password");  // 비밀번호
		var passwordConfirm = document.getElementById("passwordCheck"); //비밀번호 확인값
		var confirmMsg = document.getElementById('confirmMsg'); //확인메세지
		var correctColor = "#23dbc9"; // 일치할 때 출력되는 색
		var wrongColor = "#F0614B";    // 틀렸을 때 출력되는 색
		
		if(password.value == passwordConfirm.value){
			confirmMsg.style.color = correctColor; 
			confirmMsg.innerHTML = "비밀번호가 일치합니다";
			$('#passwordCheck').attr("check_pw", "success");
			
		}else{
			confirmMsg.style.color = wrongColor;
			confirmMsg.innerHTML = "비밀번호가 일치하지 않습니다.";
		}
	};	
	</script>
	<!-- ===========header================ -->
	<header class="border-bottom border-white">
		<div class="container">
			<div class="row align-items-start p-3">
		
				
				<div class="col mb-4">
					<a href="getBoardList.do"><img src="/img/test.png"
						alt="logo" width=70px height=70px></a>
				</div>
				
					<c:if test="${ sessionScope.user.getNickname() == null }">
					   <div class="col mt-3 text-end r_menu">
						 <span class=mx-2><a href="index.jsp" style="text-decoration:none" class="text-dark">로그인</a> </span> 
					   </div>
					</c:if> 
										
					<c:if test="${ sessionScope.user.getNickname() != null }">			
					 <div class="col mt-3 text-end r_menu">
					 
					   <c:if test="${ !sessionScope.isAdmin }">
						<span class=mx-2><a href="getUserList.do" style="text-decoration:none" class="text-dark">마이페이지</a></span>
						</c:if>
						<c:if test="${sessionScope.isAdmin }">
						<span class=mx-2><a href="user/adminpage.jsp" style="text-decoration:none" class="text-dark">관리자페이지</a></span>
						</c:if>
						
						<span class=mx-1><a href="location/infoVilli.jsp" style="text-decoration:none" class="text-dark">동네정보</a></span>  
						<span class="mx-2">${ sessionScope.user.getNickname() }님</span>
				     </div>							
				   </c:if>
			</div>
		</div>
	</header>
	
	
	<!-- =================== 프로필 수정 시작 =======================-->
	
   <form action="updatePro.do" method="post" enctype="multipart/form-data">
	<div class="container col-5 mt-4">
	<h3 class="fw-bold">프로필 수정</h3>
	<hr/>
	
	<!-- 프로필 사진 수정 -->   
 	<label for="inputProfile" class="mt-3">* 프로필 사진</label>
		  <div class="col-2 input-group mb-3 mt-2">  
		  
		  <c:if test="${ !empty  user.getFileName()}">
			<div class="select_img"><img src="/img/${ user.getFileName() }" class="rounded-circle border border-dark" width="80" height="80" alt="img"></div>
		  </c:if>
		  
		  <c:if test="${ empty user.getFileName()}">
		  	<div class="select_img">
				<img src="/img/noimg.png" class="rounded-circle border border-dark" width="80" height="80" alt="img">
		  	</div>
		  </c:if>
		  
		  </div>
		  <input type="file" class="form-control mb-3" name="uploadFile"
					id="uploadFile" aria-describedby="uploadFile" aria-label="Upload">
		 <input type="hidden" name="fileName" value="${user.getFileName() }" />
		 
    <!-- 이메일 수정(불가) -->	
   <label for="inputEmail" class="mt-2">* 이메일 주소</label>
   <div class="col-2 input-group mb-3 mt-2">
    <input type="text" name="email" class="form-control" value="${ sessionScope.user.getEmail() }"  readonly>
   </div>
   
  	<!-- 이름 수정(불가) -->
   <label for="Name" class="mt-2">* 이름</label>
	  <div class="col-2 input-group mb-3 mt-2 form-control" >${ user.getName() }</div>
	
	<!-- 닉네임 수정 -->
	<label for="inputNickName" class="mt-2">* 닉네임</label>
	<div class="col-2 input-group mb-3 mt-2">
	 <input type="text" name="nickname" class="form-control" value="${ sessionScope.user.getNickname() }"  >
   	</div>
   
   <!-- 비밀번호 수정 -->
   	<label for="inputPassword" class="mt-2">* 비밀번호</label>
   	<div class="col-2 input-group mb-3 mt-2">
   	 <input type="password" name="password" id="password"  class="form-control" placeholder="비밀번호" required>
    </div>
     
   <!-- 비밀번호 확인 -->  
   <label for="inputPassword" class="mt-2">* 비밀번호 확인</label>
     <div class="col-2 input-group mb-3 mt-2">
		<input type="password"  id="passwordCheck" class="form-control" placeholder="비밀번호 확인" onkeyup="passConfirm();" required >
	 </div>
	
   <span id="confirmMsg"></span>
	
	<div class="container btn_box mt-5" align="center">		
		<input type="submit" class="btn btn-dark mx-4 mt-2 btn_radius"  value="수정하기" />
	</div>	
	 </div>     
 </form>
    
      	
</body>
</html>