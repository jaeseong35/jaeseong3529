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
	.a{text-decoration: none;}
    .map_wrap {position:relative;width:60%;height:350px;top:100px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border:0.5px solid gray; border-radius:5px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	.loc_btn {
	background-color: black;
	border-radius: 1.5em;
	}
	.btn_box{
	text-align:center;
	padding-top:50px;
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
	
	/* Header */
header {
	background-color: #FFF;
}

.r_menu a{
text-decoration: none;
color:black;
}

.r_menu a:hover{
color:#23dbc9;
}
	
	
	</style>

</head>
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

<!--============ 동네 설정 ===============-->


<div class="map_wrap container">

    <div id="map"  style="width:100%;height:100%;position:relative;overflow:hidden;boarder-radius:5px;"></div>
   
  <form action="updateAddr.do" method="post">
  <input type="hidden" name="email" value="${user.getEmail() }">
  
    <div class="hAddr">
        <span class="title">  ${ sessionScope.user.getNickname() }님의 현재위치</span>
        <input type="text" name="address" value="" id="centerAddr" readonly></input>
    </div>
   
   	<div class="btn_box">
   		<h5><strong>${ sessionScope.user.getNickname() }님</strong>의 변경 전 동네 : ${ user.getAddress() }</h5><br>
    	<input type="submit" class="btn btn-dark mx-4 mt-2 btn_radius"  value="현재위치로 동네설정하기" onClick="location.href='mypage.jsp'"/>
    </div>
   
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9cd8fc62340f0b717e303a629a8b0c3&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 1 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    	infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

	// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
	searchAddrFromCoords(map.getCenter(), displayCenterInfo);

	if (navigator.geolocation) {
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	        
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	        
	        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
	        
	        // 마커와 인포윈도우를 표시합니다
	        displayMarker(locPosition, message);
	            
	      });
	    
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	        message = 'geolocation을 사용할수 없어요..'
	        
	    displayMarker(locPosition, message);
	}

    	
	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {

	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({  
	        map: map, 
	        position: locPosition
	    }); 
	    
	    var iwContent = message, // 인포윈도우에 표시할 내용
	        iwRemoveable = true;

	    // 인포윈도우를 생성합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content : iwContent,
	        removable : iwRemoveable
	    });
	    
	    // 인포윈도우를 마커위에 표시합니다 
	    // infowindow.open(map, marker);
	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);      
	}     	
    	

	// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', function() {
    	searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	});

	function searchAddrFromCoords(coords, callback) {
    	// 좌표로 행정동 주소 정보를 요청합니다
    	geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
	}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');
        
		
        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.value = result[i].address_name;
                break;
            }
    }    
        }
}

</script>

 </form>
    
</div>
</body>
</html>
 