<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
  <title>Villi : 마이페이지</title>
<link rel="icon" href="/img/favicon.png">
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">   
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" 
      integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" 
      crossorigin="anonymous">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>   
</head>
<style>

   *{margin: 0; padding: 0;}
   hr { margin : 0; }

   .list-group-item { padding-bottom : 20px; padding-top : 20px;}
   
   
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

   /* Header */

header {
	background-color: #FFF;
}

.r_menu a{
text-decoration: none;
color:black;
}
   
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

.logout_btn a:hover{
color:white;

}
  
a:hover{
color:#23dbc9
}
   
</style>
<body>
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
	
        <!------------- 프로필 이미지, oo님 ---------------->
        
  		<div class="container-sm mt-5" align="left" >
     	
     	<div class="row mt-2"> 
     	
     	<div class="col-2">  	
        	<c:if test="${ !empty user.getFileName()}">
     			<img src="/img/${user.getFileName()}" class="rounded-circle border border-dark"" id="admin_img"  width="100px" height="100px" alt="img">
     		</c:if>
     
    		<c:if test="${ empty user.getFileName()}">
    			<img src="/img/noimg.png" class="rounded-circle border border-dark" id="admin_img" width="100px" height="100px" alt="img">
    		</c:if>
		 </div>   
		  
	   <div class="col mt-4">
     	 <h4>${user.getNickname() }님</h4>
       </div>
  
    	</div>
  	</div>	
      <br />
      <br />
      <br />
      <div class="container " align="left">
        <ul class="list-group list-group-flush">			
  	      <a href="updatePro.do" class="list-group-item">프로필 수정</a>
          <a href="updateAddr.do" class="list-group-item">동네설정</a>
          <a href="getChatList.do" class="list-group-item">채팅리스트</a> 
          <a href="#" class="list-group-item">찜리스트</a>
           <a href="myboardlist.do?nickname=${sessionScope.user.getNickname()}" class="list-group-item">내가 쓴 글 목록</a>
       </ul>
       <hr />
       </div>
       <div class="container mt-3" align="left">
       <ul class="list-group list-group-flush">
          <a href="getNoticeList.do" li class="list-group-item">공지사항</a>
          <a href="getCsList.do" li class="list-group-item">고객센터</a>
       </ul>
       </div>
</body>
<footer>
   <div class="container" align="right">
   <br />
   <br />
   <br />
      <a href="logout.do" class="badge rounded-pill bg-secondary logout_btn">로그아웃</a>
   </div>
</footer>
</html>