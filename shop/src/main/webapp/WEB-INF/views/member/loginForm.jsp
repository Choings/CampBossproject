<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CampBoss - 로그인</title>


<link href="${path}/resources/css/loginForm.css" rel="stylesheet" >

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	$("#idCheck").click(function() {
		$.post( "/member/idCheck", { user_id: $("#user_id").val()} )
	    .done(function( data ) {
	    	$("#idResult").text(data);
	  });
	});
	$("#join").click(function() {		
		if($("#idResult").text().trim()=="OK"){
			$("form").submit();
		}else{
			alert("ID중복체크 먼저 해주세요");
		}
	});
});
</script>

</head>
<body>

	<div class="login-wrap">
	  <div class="login-html">
	  </br></br>
	    <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
	    <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
	
	    <div class="login-form">
	 <form action="${pageContext.request.contextPath }/member/login"
				method="post">
	      <div class="sign-in-htm">
	        <div class="group">
	          <label for="user" class="label">ID</label>
	          <input id="user" type="text" class="input" name="user_id">
	        </div>
	        <div class="group">
	          <label for="pass" class="label">Password</label>
	          <input id="pass" type="password" class="input" name="user_pwd">
	        </div>
	        <div class="group">
	          <input type="submit" class="button" value="Sign In">
	        </div>
	      </div>
	  </form>
	 
	<form action="${pageContext.request.contextPath }/member/join" method="post">  		
	      <div class="sign-up-htm">
	
	        <div class="group">
	          <label for="user" class="label">ID</label>
	          <input id="user_id" type="text" class="input2" name="user_id">
	          <input type="button" id="idCheck" class="button2" style="color: black;" value="ID중복체크">
		      <span id="idResult" style="color: black; font-size: 17px; font: bold;"></span>
	        </div>
	        
	        <div class="group">
	          <label for="pass" class="label">Password</label>
	          <input id="pass" type="password" class="input" name="user_pwd">
	        </div>
	        <div class="group">
	          <label for="pass" class="label">Username</label>
	          <input id="pass" type="text" class="input" name="user_name">
	        </div>
	        <div class="group">
	          <label for="pass" class="label">NickName</label>
	          <input id="pass" type="text" class="input" name="user_nickname">
	        </div>        
	        <div class="group">
	          <label for="pass" class="label">Email</label>
	          <input id="pass" type="text" class="input" name="user_email">
	        </div>        
	        <div class="group">
	          <label for="pass" class="label">Tel</label>
	          <input id="pass" type="text" class="input" name="user_tel">
	        </div>       
	        
	        
	        <div class="group">
	          <label for="pass" class="label">Address</label>

	          <input type="text" id="pass" class="input" name="user_addr">
		<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
		<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
		
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f77ab4323888c99a1ffb18bd492e20cc&libraries=services"></script>
		<script>
		    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		        mapOption = {
		            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
		            level: 5 // 지도의 확대 레벨
		        };
		
		    //지도를 미리 생성
		    var map = new daum.maps.Map(mapContainer, mapOption);
		    //주소-좌표 변환 객체를 생성
		    var geocoder = new daum.maps.services.Geocoder();
		    //마커를 미리 생성
		    var marker = new daum.maps.Marker({
		        position: new daum.maps.LatLng(37.537187, 127.005476),
		        map: map
		    });
		
		
		    function sample5_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                var addr = data.address; // 최종 주소 변수
		
		                // 주소 정보를 해당 필드에 넣는다.
		                document.getElementById("sample5_address").value = addr;
		                // 주소로 상세 정보를 검색
		                geocoder.addressSearch(data.address, function(results, status) {
		                    // 정상적으로 검색이 완료됐으면
		                    if (status === daum.maps.services.Status.OK) {
		
		                        var result = results[0]; //첫번째 결과의 값을 활용
		
		                        // 해당 주소에 대한 좌표를 받아서
		                        var coords = new daum.maps.LatLng(result.y, result.x);
		                        // 지도를 보여준다.
		                        mapContainer.style.display = "block";
		                        map.relayout();
		                        // 지도 중심을 변경한다.
		                        map.setCenter(coords);
		                        // 마커를 결과값으로 받은 위치로 옮긴다.
		                        marker.setPosition(coords)
		                    }
		                });
		            }
		        }).open();
		    }
		</script>
			          
			        </div>    
	        
	           
	        <div class="group">
	          <label for="pass" class="label">Birth</label>
	          <input id="pass" type="text" class="input" name="user_birth">
	        </div>        
	        <div class="group">
	          <label for="pass" class="label">Type</label>
	         	<input type="radio" name="user_type" class="ra" value="1"><a style="color: black;" >일반회원</a>
				<input type="radio" name="user_type" class="ra" value="2"><a style="color: black;" >관리자</a>
	        </div>      
	        <div class="group">
	          <input type="submit" class="button" value="Sign Up">
	        </div>
	      </div>
	      </form>
	         
	    </div>
	  </div>
	</div>

</body>
</html>