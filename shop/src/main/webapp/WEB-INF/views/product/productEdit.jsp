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
<h3>CAMPBOSS - 상품 수정 및 삭제</h3>

<form action="${pageContext.request.contextPath }/product/edit" method="post"  id="f1">
<input type="hidden" name="num" value="${p.num }">

<div>
	<p class="name-title">제품이름</p>
	<input type="text" name="name" value="${p.name }" class="name">
</div>


<div>
	<p class="info-title">제품내용</p>
</div>

<div>
	<textarea name="info" class="info" >${p.info }</textarea>
</div>


</br>
		<p class="name-title" >장소</p>
		<input type="text" id="sample5_address" class="name" name="addr" value="${p.addr }">
		<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" class="submit" style="text-align: center;"><br>
			<div id="map" style="width:300px;height:300px; display:none" class="name"></div>
				
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
	</br>



<div>
 	
 	<c:if test="${empty file0 }">
		<div>
			<p class="not-img">등록된 이미지가 없습니다.</p>
		</div>
	</c:if>
	
	<c:if test="${not empty file0 }">
		<div>
			<div>
			<img id="bigImg" src="${pageContext.request.contextPath }/img?fname=${file0 }&num=${p.num }" 
							 class="img-head">
			</div>
			
			<div>
				<img src="${pageContext.request.contextPath }/img?fname=${file0 }&num=${p.num }" class="img img-body1">
				<img src="${pageContext.request.contextPath }/img?fname=${file1 }&num=${p.num }" class="img  img-body2">
				<img src="${pageContext.request.contextPath }/img?fname=${file2 }&num=${p.num }" class="img  img-body3">
			</div>
		</div>
	</c:if>




<div>
	<p class="price-title">제품가격	</p>
	<input type = "text" name="price" value="${p.price }" class="price">
</div>

<div>
	<p class="seller-title">판매자</p>
	<input type="text" name="seller_id" value="${p.seller_id }" class="seller" readonly>
</div>
	<input type="submit" value="수정" class="submit">
	<input type="reset" value="삭제" id="del" class="reset">
<div>

</div>





</form>
</body>
</html>