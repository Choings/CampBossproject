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
<link href="${path}/resources/boardcss/boardview.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
//��ȸ��

let cbboard_hit = ${b.cbboard_hit};

function increaseHit() {
	cbboard_hit++;
	
	document.getElementById("hitDisplay").innnerText - cbboard_hit;
}

window.onload  = function () {
	increaseHit();
}


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

</head>
<body>
	<form id="f1" action="${pageContext.request.contextPath }/product/view" 
	method="post" class="row g-3">
	<input type="hidden" name="board_num" value="${b.board_num }">
	
		<div class="product-view">
			<h2>${b.board_name }</h2>
			<h5>��ȸ�� : ${b.cbboard_hit }</h5>
			
			<table>
				<colgroup>
				<col style="width : px;"><col>
			</colgroup>
			
			<tbody>
				<tr>
				<th>�ۼ���¥</th>
				<td>${b.board_date }</td>
				</tr>
				
				<tr>
				<th>�ۼ���</th>
				<td>${b.board_id }</td>
				</tr>
				
				<tr>
				<th>����</th>
				<td>�ϴ�����</td>
				</tr>
				
				<tr>
					<th>���</th>
					<td>	
						${b.board_addr }
						<div id="map" style="width:350px;height:150px;" class="name"></div>
					</td>
				</tr>
			</tbody>
			</table>
			
	<c:if test="${not empty file0 }">
      
      	<div class="img_head">
      		<img id="bigImg" src="${pageContext.request.contextPath }/boardimg?fname=${file0 }&board_num=${b.board_num }" > 
     		 
     		 <ul>
     	 	<li>
     	 		<img class="img" src="${pageContext.request.contextPath }/boardimg?fname=${file0 }&board_num=${b.board_num }" >
     	 	</li>
     	 	
     	 	<li>
     	 		<img class="img" src="${pageContext.request.contextPath }/boardimg?fname=${file1 }&board_num=${b.board_num }">
     	 	</li>
     	 	
     	 	<li>
     	 		<img class="img" src="${pageContext.request.contextPath }/boardimg?fname=${file2 }&board_num=${b.board_num }">
     	 	</li>
     	 </ul>
     </div>
	</c:if>
</div>
		
<div class="line1">
		<textarea class="info" >${b.board_info }</textarea>
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
</body>
</html>