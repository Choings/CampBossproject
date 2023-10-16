<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CampBoss - �Խñ۵��</title>
<link href="${path}/resources/boardcss/boardadd.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(
			function() {
				$.post("/admin/getsub", {
					type : 1,
					p_id : 0
				}).done(
						function(data) {
							var c = eval("(" + data + ")");
							for (i = 0; i < c.length; i++) {
								$("#s1").append(
										"<option value='"+c[i].id+"'>"
												+ c[i].name + "</option>");
							}
						});

				$("#s1").click(
						function() {
							var x = 0;
							x = this.options[this.options.selectedIndex].value
							$.post("/admin/getsub", {
								type : 2,
								p_id : x
							}).done(
									function(data) {
										var c = eval("(" + data + ")");
										$("#s2").empty();
										$("#s3").empty();
										for (i = 0; i < c.length; i++) {
											$("#s2").append(
													"<option value='"+c[i].id+"'>"
															+ c[i].name
															+ "</option>");
										}
									});
						});

				$("#s2").click(
						function() {
							var x = 0;
							x = this.options[this.options.selectedIndex].value
							$.post("/admin/getsub", {
								type : 3,
								p_id : x
							}).done(
									function(data) {
										var c = eval("(" + data + ")");
										$("#s3").empty();
										for (i = 0; i < c.length; i++) {
											$("#s3").append(
													"<option value='"+c[i].id+"'>"
															+ c[i].name
															+ "</option>");
										}
									});
						});

			});
</script>

	<c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>

</head>
<body>
<h3>CampBoss - �Խñ� �ۼ�</h3>

<form action="${pageContext.request.contextPath }/board/add" method="post" enctype="multipart/form-data">
	
	<p>ī�װ� ����</p>
	<select id="s1" name="boardcategory1_id" class="box" >
		<option disabled selected>��з�</option>
	</select>
	<select id="s2" name="boardcategory2_id" class="box">
		<option disabled selected>�ߺз�</option>
	</select>
	<select id="s3" name="boardcategory3_id"class="box">
		<option disabled selected>�Һз�</option>
	</select>	

	<div class="product-view">
		<table>
			<colgroup>
				<col style="width : px;"><col>
			</colgroup>
			
			<tbody>
				<tr>
					<th>����</th>
					<td><input type="text" name="board_name" ></td>
				</tr>
				
				<tr>
					<th>�ۼ���</th>
					<td><input type="text" name="board_id" 
					value="${sessionScope.user_id }" class="seller" readonly>
					</td>
				</tr>
				
				<tr>
					<th>����</th>
					<td>�ϴ� �̿�</td>
				</tr>
			
				<tr>
					<th>���</th>
					<td>
					<input type="text" id="sample5_address" class="name" name="board_addr">
					<input type="button" onclick="sample5_execDaumPostcode()" value="�ּ� �˻�" style="text-align: center;" >
					<div id="map" style="width:300px;height:150px;  margin-top: 20px" class="name"></div>
					</td>
				</tr>
				
				<tr>
					<th></th>
					<td>	
						<input type="submit" value="���" class="btn">
						<input type="reset" value="���" class="btn">
					</td>
			</tr>
			</tbody>
		</table>
	
		<div class="img_head">
			<p>�̹���</p>
			<input type="file" name="file1" class="img"><br>
			<input type="file" name="file2" class="img"><br>
			<input type="file" name="file3" class="img"><br>
		</div>
	</div>

	<div  class="line1">
		<textarea name = "board_info"  class="info" placeholder = "�����Է�"></textarea>
	</div>

</form>

	
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
</body>
</html>