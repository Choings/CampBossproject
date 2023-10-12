<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CAMPBOSS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link href="${path}/resources/css/productEdit.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function() {
	$(".img").mouseover(function() {
		$("#bigImg").attr('src', this.src);
	});
	$("#del").click(function() {
		$("#f1").attr('action', '/seller/del');
		$("#f1").submit();
	});
});
</script>
	<c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>
	<br><br><br>

</head>
<body>
	<h3>��ǰ ������</h3>
	<form id="f1" action="${pageContext.request.contextPath }/product/view" 
	method="post" class="row g-3">
	<input type="hidden" name="pro_num" value="${p.num }">

		<div >
			<p class="name-title">��ǰ�̸�</p> 
			<input type="text" value="${p.name }" class="name" readonly >
		</div>
		
		<div >
			<p class="seller-title">�Ǹ���</p> 
			<input type="text" value="${p.seller_id }" class="seller" readonly >
		</div>
		
		<c:if test="${empty file0 }">
			<div>
				<p class="not-img">��ϵ� �̹����� �����ϴ�.</p>
			</div>
     	 </c:if> 
   		
      	<c:if test="${not empty file0 }">
      
      	<div>
      		<img id="bigImg" src="${pageContext.request.contextPath }/img?fname=${file0 }&num=${p.num }" 
     		 class="img-head"> 
     		  </div>
      
      	<div>   
      		<img src="${pageContext.request.contextPath }/img?fname=${file0 }&num=${p.num }" class="img img-body1" >
      		<img src="${pageContext.request.contextPath }/img?fname=${file1 }&num=${p.num }"  class="img img-body2" >
      		<img src="${pageContext.request.contextPath }/img?fname=${file2 }&num=${p.num }" class="img img-body3" >
        </div>
            </c:if>
		
		
		<div>
			<p class="info-title">��ǰ����</p>
		</div>
			<textarea name="info" class="info" readonly>${p.info }</textarea>
		<div></div>
		
		
		</br>
			<p class="name-title">���</p>
		<input type="text" id="sample5_address" class="name" name="addr" value="${p.addr }" readonly> </br>		
		<div id="map" style="width:350px;height:350px;" class="name"></div>

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
				
				
				 // �������� �ε�� �� �ڵ����� ������ �Լ�
				    function initializeMap() {
				        var sample5_address = document.getElementById("sample5_address");

				        // ����ڰ� ������ �ּҸ� �Է� �ʵ忡�� �����ɴϴ�.
				        var addr = sample5_address.value;

				        // �ּҷ� �� ������ �˻�
				        geocoder.addressSearch(addr, function(results, status) {
				            // ���������� �˻��� �Ϸ������
				            if (status === daum.maps.services.Status.OK) {
				                var result = results[0]; // ù��° ����� ���� Ȱ��

				                // �ش� �ּҿ� ���� ��ǥ�� �޾Ƽ�
				                var coords = new daum.maps.LatLng(result.y, result.x);

				                // ������ �����ݴϴ�.
				                mapContainer.style.display = "block";
				                map.relayout();

				                // ���� �߽��� �����մϴ�.
				                map.setCenter(coords);

				                // ��Ŀ�� ��������� ���� ��ġ�� �ű�ϴ�.
				                marker.setPosition(coords);
				            }
				        });
				    }

				    // �������� �ε�� �� �ڵ����� ����ǵ��� ����
				    window.onload = initializeMap;
				    	
			</script>
		</br>
		
		
		
		<div >
			<p class="price-title">��ǰ����</p> 
			<input type="text" class="price" value="${p.price }"  readonly>
		</div>
			
  
      	

			
	</form>

</body>
</html>

