<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <title>CampBoss - ȸ������ ����</title>
  <!-- ��� �޴��� �ҷ����� -->
  <link href="${path}/resources/css/editmem.css" rel="stylesheet">
  <c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>
</head>
<body>
</br></br>
  <h2>CampBoss - ȸ������ ����</h2>
</br></br>

  <div class="login-wrap">
    <div class="login-html">
      <div class="login-form">
        <form action="${pageContext.request.contextPath}/member/edit" method="post">
          <!-- ���̵� �Է� -->
          <div class="group">
            <label for="user" class="label">���̵�</label>
            <input type="text" class="input" name="user_id" id="user_id" value="${m.user_id}" readonly>
          </div>
          <!-- ��й�ȣ �Է� -->
          <div class="group">
            <label for="pass" class="label">Password</label>
            <input type="password" class="input" name="user_pwd" value="${m.user_pwd}">
          </div>
          <!-- �̸� �Է� -->
          <div class="group">
            <label for="pass" class="label">Username</label>
            <input type="text" class="input" name="user_name" value="${m.user_name}">
          </div>
          <!-- �г��� �Է� -->
          <div class="group">
            <label for="pass" class="label">NickName</label>
            <input type="text" class="input" name="user_nickname" value="${m.user_nickname}">
          </div>  
                  
          <!-- �̸��� �Է� -->
          <div class="group">
            <label for="pass" class="label">Email</label>
            <input type="text" class="input" value="${m.user_email}" readonly="readonly"></br>
  			
  			<label for="pass" class="label">�̸��ϵ��</label></br>
  			<input type="text" id="emailPrefix" class="input2" placeholder="�̸��� �ּ� �Է�">
			  <a style="font-size: 20px; color: black;" >@</a>
			  <select id="emailSuffix" onchange="combineEmail()" class="input2">
			    <option value="�����Է�" class="input2">�����Է�</option>
			    <option value="naver.com">naver.com</option>
			    <option value="daum.net">daum.net</option>
			    <option value="gmail.com">gmail.com</option>
			  </select>
			  <input id="result" type="hidden" class="input" name="user_email" readonly>
			  
			  <script>
			    function combineEmail() {
			      const emailPrefix = document.getElementById("emailPrefix").value;
			      const emailSuffix = document.getElementById("emailSuffix").value;
			
			      if (emailSuffix === "�����Է�") {
			        alert("�̸��� �ּҸ� ���� �Է��ϼ���.");
			        location.href = "/member/editForm.jsp"; // ���𷺼�
			      } else {
			        const fullEmail = emailPrefix + "@" + emailSuffix;
			        document.getElementById("result").value = fullEmail; // .textContent ��� .value ���
			      }
			    }
			  </script>
   
          </div>
          
          
          
          
          <!-- ��ȭ��ȣ �Է� -->
          <div class="group">
            <label for="pass" class="label">Tel</label>
            <input type="text" class="input" name="user_tel" value="${m.user_tel}">
          </div>
          
          <!-- �ּ� �Է� -->
          <div class="group">
            <label for="pass" class="label">Address</label>
         		<input type="text" id="sample5_address" class="input" name="user_addr" value="${m.user_addr }" style="font-size: 18px; font-weight: bold; ">
				<input type="button" onclick="sample5_execDaumPostcode()" value="�ּ� �˻�" class="mapin" ><br>
				<div id="map" style="width:0.1px;height:0.1px; display:none"></div>
				
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
          
          
          <!-- ������� �Է� -->
          <div class="group">
            <label for="pass" class="label">Birth</label>
            <input type="text" class="input" name="user_birth" value="${m.user_birth}">
          </div>
          <!-- ȸ�� ���� ���� -->
          <div class="group">
            <label for="pass" class="label">Type</label></br>
            <c:choose>
              <c:when test="${m.user_type==1}">
                �Ϲ�ȸ��
              </c:when>
              <c:when test="${m.user_type==2}">
                ������
              </c:when>
              <c:otherwise>�߸��� type</c:otherwise>
            </c:choose>
          </div>
          <!-- ���� �� ��� ��ư -->
          <div class="group">
            <input type="submit" class="button" value="����"/>
            <input type="reset" class="button" value="���"/>
          </div>
        </form>
      </div>
    </div>
  </div>
</body>
</html>
