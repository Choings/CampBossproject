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
<link href="${path}/resources/productcss/productview.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>


// ��ȸ��

let cbproduct_hit = ${p.cbproduct_hit};

function increaseHit() {
	cbproduct_hit++;
	
	document.getElementById("hitDisplay").innerText = cbproduct_hit;
}

window.onload = function () {
	increaseHit();
}





$(document).ready(function() {
	$(".img").click(function() {
		$("#bigImg").attr('src', this.src);
	});
	$("#del").click(function() {
		$("#f1").attr('action', '/seller/del');
		$("#f1").submit();
	});
});
</script>

<c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>
</head>
<body>
	<form id="f1" action="${pageContext.request.contextPath }/product/view" 
	method="post" >
	<input type="hidden" name="pro_num" value="${p.num }">
	
	<div class="product-view">
		<h2>${p.name }</h2>
		<h5>��ȸ�� : ${p.cbproduct_hit }</h5>
		
	<div>
		<table>
			<colgroup>
				<col style="width : px;"><col>
			</colgroup>
		
			<tbody>
			<tr>
				<th>�ۼ���¥</th>
				<td>${p.cb_date }</td>
			</tr>
				<tr>
				<th>����</th>
				<td  class="pricecolor"><b>${p.price}</b>��</td>
			</tr>
			<tr>
				<th>�Ǹ���</th>
				<td>${p.seller_id }</td>
			</tr>
			<tr>
				<th>����</th>
				<td>�ϴ� ����</td>
			</tr>
			<tr>
				<th>���</th>
				<td>
				${p.addr }
				<div id="map" style="width:300px;height:150px; margin-top: 20px"class="name" ></div>
				</td>
			</tr>
			
			</tbody>
		</table>
	</div>	
		<c:if test="${not empty file0 }">
		<div  class="img_head">
			<img id="bigImg" src="${pageContext.request.contextPath }/img?fname=${file0 }&num=${p.num }" > 
		<ul >
			<li >
				<img class="img" src="${pageContext.request.contextPath }/img?fname=${file0 }&num=${p.num }">
			</li>
			<li >
				<img class="img" src="${pageContext.request.contextPath }/img?fname=${file1 }&num=${p.num }"  >
			</li>
			<li >
				<img class="img" src="${pageContext.request.contextPath }/img?fname=${file2 }&num=${p.num }"  >
			</li>
		</ul>
	</div>
	
	</c:if>
	</div>

	
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
	</form>
	<div class="line1">
		<textarea class="info" >${p.info }</textarea>
	</div>
	
	
	
	
</body>
</html>

