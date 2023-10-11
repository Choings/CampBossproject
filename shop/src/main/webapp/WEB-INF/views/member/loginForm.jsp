<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CampBoss - �α���</title>


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
			alert("ID�ߺ�üũ ���� ���ּ���");
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
	          <input type="button" id="idCheck" class="button2" style="color: black;" value="ID�ߺ�üũ">
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
		<input type="button" onclick="sample5_execDaumPostcode()" value="�ּ� �˻�"><br>
		<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
		
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f77ab4323888c99a1ffb18bd492e20cc&libraries=services"></script>
		<script>
		    var mapContainer = document.getElementById('map'), // ������ ǥ���� div
		        mapOption = {
		            center: new daum.maps.LatLng(37.537187, 127.005476), // ������ �߽���ǥ
		            level: 5 // ������ Ȯ�� ����
		        };
		
		    //������ �̸� ����
		    var map = new daum.maps.Map(mapContainer, mapOption);
		    //�ּ�-��ǥ ��ȯ ��ü�� ����
		    var geocoder = new daum.maps.services.Geocoder();
		    //��Ŀ�� �̸� ����
		    var marker = new daum.maps.Marker({
		        position: new daum.maps.LatLng(37.537187, 127.005476),
		        map: map
		    });
		
		
		    function sample5_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                var addr = data.address; // ���� �ּ� ����
		
		                // �ּ� ������ �ش� �ʵ忡 �ִ´�.
		                document.getElementById("sample5_address").value = addr;
		                // �ּҷ� �� ������ �˻�
		                geocoder.addressSearch(data.address, function(results, status) {
		                    // ���������� �˻��� �Ϸ������
		                    if (status === daum.maps.services.Status.OK) {
		
		                        var result = results[0]; //ù��° ����� ���� Ȱ��
		
		                        // �ش� �ּҿ� ���� ��ǥ�� �޾Ƽ�
		                        var coords = new daum.maps.LatLng(result.y, result.x);
		                        // ������ �����ش�.
		                        mapContainer.style.display = "block";
		                        map.relayout();
		                        // ���� �߽��� �����Ѵ�.
		                        map.setCenter(coords);
		                        // ��Ŀ�� ��������� ���� ��ġ�� �ű��.
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
	         	<input type="radio" name="user_type" class="ra" value="1"><a style="color: black;" >�Ϲ�ȸ��</a>
				<input type="radio" name="user_type" class="ra" value="2"><a style="color: black;" >������</a>
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