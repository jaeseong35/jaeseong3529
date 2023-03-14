<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
   <title>Spring Framework</title>
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







*{
  box-sizing: border-box;
}


@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

header {
	background-color: #FFF;
	height: 90px;
}



/* cards css */
body, html {
  font-family: 'Pretendard-Regular';
}

.card_box {
  display: flex;
  display: -webkit-flex;
  -webkit-justify-content: center;
  -webkit-align-items: center;
  justify-content: center;
  align-items: center;
}

.cards {
    width: 100%;
    display: flex;
    display: -webkit-flex;
    justify-content: center;
    -webkit-justify-content: center;
    max-width: 820px;
}

.card--1 .card__img, .card--1 .card__img--hover {
    background-color: #73cec7;
}

.card--2 .card__img, .card--2 .card__img--hover {
    background-color: #fff583;
}

.card__like {
    width: 18px;
}

.card__clock {
    width: 15px;
  vertical-align: middle;
    fill: #AD7D52;
}
.card__time {
    font-size: 12px;
    color: #AD7D52;
    vertical-align: middle;
    margin-left: 5px;
}

.card__clock-info {
    float: right;
}

.card__img {
  visibility: hidden;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    width: 100%;
    height: 235px;
  border-top-left-radius: 12px;
border-top-right-radius: 12px;
  
}

.card__info-hover {
    position: absolute;
    padding: 16px;
  width: 100%;
  opacity: 0;
  top: 0;
}

.card__img--hover {
  transition: 0.2s all ease-out;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    width: 100%;
  position: absolute;
    height: 235px;
  border-top-left-radius: 12px;
border-top-right-radius: 12px;
top: 0;
  
}
.card {
  margin-right: 25px;
  transition: all .4s cubic-bezier(0.175, 0.885, 0, 1);
  background-color: #fff;
    width: 33.3%;
  position: relative;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0px 13px 10px -7px rgba(0, 0, 0,0.1);
}
.card:hover {
  box-shadow: 0px 30px 18px -8px rgba(0, 0, 0,0.1);
    transform: scale(1.10, 1.10);
}

.card__info {
z-index: 2;
  background-color: #fff;
  border-bottom-left-radius: 12px;
border-bottom-right-radius: 12px;
   padding: 16px 24px 24px 24px;
}

.card__category {
   font-family: 'Pretendard-Regular';
    text-transform: uppercase;
    font-size: 13px;
    letter-spacing: 2px;
    font-weight: 500;
  color: #868686;
}

.card__title {
    margin-top: 5px;
    margin-bottom: 10px;
font-family: 'Pretendard-Regular';
	font-size:20px;
	font-weight: 500;
}

.card__by {
    font-size: 12px;
  font-family: 'Pretendard-Regular';
    font-weight: 500;
    
}

.card__author {
    font-weight: 600;
    text-decoration: none;
    color: #AD7D52;
}

.card:hover .card__img--hover {
    height: 100%;
    opacity: 0.3;
}

.card:hover .card__info {
    background-color: transparent;
    position: relative;
}

.card:hover .card__info-hover {
    opacity: 1;
}
</style>

</head>
<body>

<!-- ===========header================ -->
	<header class="border-bottom border-white">
		<div class="container">
			<div class="row align-items-start p-3">
		
				
				<div class="col mb-4">
					<a href="../getBoardList.do"><img src="/img/test.png"
						alt="logo" width=70px height=70px></a>
				</div>

					<c:if test="${ sessionScope.user.getNickname() == null }">
					   <div class="col mt-3 text-end r_menu">
						 <span class=mx-2><a href="../index.jsp" style="text-decoration:none" class="text-dark">로그인</a> </span> 
					   </div>
					</c:if> 
										
					<c:if test="${ sessionScope.user.getNickname() != null }">			
					 <div class="col mt-3 text-end r_menu">
					    
					   <c:if test="${ !sessionScope.isAdmin }">
						<span class=mx-2><a href="../getUserList.do" style="text-decoration:none" class="text-dark">마이페이지</a></span>
						</c:if>
						<c:if test="${sessionScope.isAdmin }">
						<span class=mx-2><a href="../user/adminpage.jsp" style="text-decoration:none" class="text-dark">관리자페이지</a></span>
						</c:if>
						
						<span class=mx-1><a href="location/infoVilli.jsp" style="text-decoration:none" class="text-dark">동네정보</a></span>  
						<span class="mx-2">${ sessionScope.user.getNickname() }님</span>
				     </div>							
				   </c:if>



			</div>
		</div>
	</header>


<!--================ cards ================= -->
  <h3 class="container text-center mt-4 mb-4 fw-bold ">동네정보</h3>

  </hr>
  </br>
  </br>
<div class="card_box mt-4">

  <section class="cards">

<article class="card card--1">

  <div class="card__img"></div>
  <a href="searchInfoVilli.jsp" class="card_link">
     <div class="card__img--hover"></div>
   </a>
  <div class="card__info">
    <span class="card__category"> 동네정보</span>
    <h3 class="card__title">내 근처 정보 찾기</h3>
  </div>
</article>
  
  
<article class="card card--2">

  <div class="card__img"></div>
  <a href="searchRestaurant.jsp" class="card_link">
     <div class="card__img--hover"></div>
   </a>
  <div class="card__info">
    <span class="card__category"> 동네정보</span>
    <h3 class="card__title">동네 맛집 찾기</h3>
  </div>
</article>  
  
  
  
  </section>  
  </div>
</body>
</html>