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
//조회수

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
			<h5>조회수 : ${b.cbboard_hit }</h5>
			
			<table>
				<colgroup>
				<col style="width : px;"><col>
			</colgroup>
			
			<tbody>
				<tr>
				<th>작성날짜</th>
				<td>${b.board_date }</td>
				</tr>
				
				<tr>
				<th>작성자</th>
				<td>${b.board_id }</td>
				</tr>
				
				<tr>
				<th>내용</th>
				<td>하단참조</td>
				</tr>
				
				<tr>
					<th>장소</th>
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
				
				
				 // 페이지가 로드될 때 자동으로 실행할 함수
				    function initializeMap() {
				        var sample5_address = document.getElementById("sample5_address");

				        // 사용자가 선택한 주소를 입력 필드에서 가져옵니다.
				        var addr = sample5_address.value;

				        // 주소로 상세 정보를 검색
				        geocoder.addressSearch(addr, function(results, status) {
				            // 정상적으로 검색이 완료됐으면
				            if (status === daum.maps.services.Status.OK) {
				                var result = results[0]; // 첫번째 결과의 값을 활용

				                // 해당 주소에 대한 좌표를 받아서
				                var coords = new daum.maps.LatLng(result.y, result.x);

				                // 지도를 보여줍니다.
				                mapContainer.style.display = "block";
				                map.relayout();

				                // 지도 중심을 변경합니다.
				                map.setCenter(coords);

				                // 마커를 결과값으로 받은 위치로 옮깁니다.
				                marker.setPosition(coords);
				            }
				        });
				    }

				    // 페이지가 로드될 때 자동으로 실행되도록 설정
				    window.onload = initializeMap;
				    	
			</script>
	</form>
</body>
</html>