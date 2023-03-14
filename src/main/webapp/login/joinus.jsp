<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>villi join</title>
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
					<a href="../index.jsp"><img src="/img/test.png"
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


<form action="insertUser.do" method="post" enctype="multipart/form-data">

	<div class="container col-5 mt-4">
		<h3 class="fw-bold">회원가입</h3>
			<hr/>
			<br/>
			
						<div class="input-group mb-2">
							<div class="input-group-text"><i class="fas fa-envelope"></i></div>
							<input type="text" name="email" class="form-control" id="email" required placeholder="이메일" onchange="checkEmail();"  >
						</div> 
						<div class="input-group mb-3">
						<span id="confirmEmail"></span>
						</div>
	
					<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>	
				
		  <script>
            // 이메일 중복체크
            function checkEmail() {
               var email = $('#email').val();
               var confirmEmail = document.getElementById('confirmEmail');
               var correctColor = "#000" ;   //맞았을 때 출력되는 색깔.
               var wrongColor ="#d92742";   //틀렸을 때 출력되는 색깔
               $.ajax({
                     url:'../emailCheck.do', //Controller에서 요청 받을 주소
                     type:'post', //POST 방식으로 전달
                     data:{email:email},
                     success:function(result){ //컨트롤러에서 넘어온 값을 받는다 
                         if(result != "success"){
                            confirmEmail.style.color = correctColor;
                            confirmEmail.innerHTML = "사용 가능한 이메일입니다.";
                            $('#email').attr("check_email", "success");
                         } else { // cnt가 1일 경우 -> 이미 존재하는 이메일
                            confirmEmail.style.color = wrongColor;
                            confirmEmail.innerHTML = "이미 존재하는 이메일입니다.";
                            $('#email').attr("check_email", "fail");
                         }
                     },
                     error:function(){
                         alert("에러입니다.");
                     }
                 });
                 
            };
            </script>
								
					<div class="pwok">
						<div class="input-group mb-2">
							<div class="input-group-text"><i class="fas fa-lock"></i></div>
						    <input type="password" id="password_1" name="password"  class="form-control" class="pw" required placeholder="비밀번호"  ><br>
						</div>
						
							<div class="input-group mb-3">
							<div class="input-group-text"><i class="fas fa-check-square"></i></div>
							<input type="password" id="password_2" class="form-control"  class="pw"  required placeholder="비밀번호 확인">
						</div>
						 
						  <span id="success" style="display: none; " >비밀번호가 일치합니다.</span>
						    <span id="danger" style="display: none; color: #d92742; ">비밀번호가 일치하지 않습니다.</span>
						
						
						</div>
						
					
						<script src="http://code.jquery.com/jquery-latest.min.js"></script>
						<script>
						    $('.pwok').focusout(function () {
						        var pwd1 = $("#password_1").val();
						        var pwd2 = $("#password_2").val();
						        if ( pwd1 != '' && pwd2 == '' ) {
						            null;s
						        } else if (pwd1 != "" || pwd2 != "") {
						            if (pwd1 == pwd2) {
						                $("#success").css('display', 'inline-block');
						                $("#danger").css('display', 'none');
						            } else {
						                $("#success").css('display', 'none');
						                $("#danger").css('display', 'inline-block');
						            }
				 		        }
						    });
						</script>
					
						
						<div class="input-group mb-3 mt-4">
							<div class="input-group-text"><i class="fas fa-user-circle"></i></div>
							<input type="text" name="nickname" class="form-control" id="nickname" required placeholder="닉네임">
						</div>
						<div class="input-group mb-4 mt-4" >
							<div class="input-group-text"><i class="fas fa-user"></i></div>
							<input type="text" name="name" class="form-control" id="name" required placeholder="이름">
						</div>
						
						
						<!--  우편번호 -->
						
						<div class="input-group mb-4">
						<div class="input-group-text"><i class="fas fa-map-marker-alt"></i></div>
							<input type="text" name="address" id="sample4_postcode" class="form-control" placeholder="우편번호">
							
							<input type="button" onclick="sample4_execDaumPostcode()"  class="form-control" value="우편번호 찾기"><br>
							<input type="text" id="sample4_roadAddress" class="form-control"name="address"  placeholder="도로명주소">
							<input type="text" id="sample4_jibunAddress" class="form-control" placeholder="지번주소">
							
							<input type="text" id="sample4_detailAddress" class="form-control" placeholder="상세주소">
							<input type="text" id="sample4_extraAddress" class="form-control" placeholder="참고항목">
							
							<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
							<script>
							    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
							    function sample4_execDaumPostcode() {
							        new daum.Postcode({
							            oncomplete: function(data) {
							                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							
							                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							                var roadAddr = data.roadAddress; // 도로명 주소 변수
							                var extraRoadAddr = ''; // 참고 항목 변수
							
							                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
							                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							                    extraRoadAddr += data.bname;
							                }
							                // 건물명이 있고, 공동주택일 경우 추가한다.
							                if(data.buildingName !== '' && data.apartment === 'Y'){
							                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							                }
							                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							                if(extraRoadAddr !== ''){
							                    extraRoadAddr = ' (' + extraRoadAddr + ')';
							                }
							
							                // 우편번호와 주소 정보를 해당 필드에 넣는다.
							                document.getElementById('sample4_postcode').value = data.zonecode;
							                document.getElementById("sample4_roadAddress").value = roadAddr;
							                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
							                
							                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							                if(roadAddr !== ''){
							                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
							                } else {
							                    document.getElementById("sample4_extraAddress").value = '';
							                }
							
							                var guideTextBox = document.getElementById("guide");
							                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							                if(data.autoRoadAddress) {
							                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
							                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
							                    guideTextBox.style.display = 'block';
							
							                } else if(data.autoJibunAddress) {
							                    var expJibunAddr = data.autoJibunAddress;
							                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
							                    guideTextBox.style.display = 'block';
							                } else {
							                    guideTextBox.innerHTML = '';
							                    guideTextBox.style.display = 'none';
							                }
							            }
							        }).open();
							    }
							</script>
						</div> <!-- 우편번호 끝 -->

					</div>
 					
					<div class="container  mt-5" align="center">
						<button type="submit" class="btn btn-dark mx-4 ">가입하기</button>
					</div>	
					
			
			</form>


</body>
</html>   