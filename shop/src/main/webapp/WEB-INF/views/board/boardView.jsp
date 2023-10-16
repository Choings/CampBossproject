<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%   
 response.setHeader("Cache-Control","no-store");   
 response.setHeader("Pragma","no-cache");   
 response.setDateHeader("Expires",0);   
 if (request.getProtocol().equals("HTTP/1.1")) 
 response.setHeader("Cache-Control", "no-cache"); %>   
 
 
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



$(document).ready(function() {
    $("#btn1").click(function() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/board/uplike?board_num=${b.board_num}&type=1",
            data: { },
            success: function(response) {
                
                location.reload(); 
            }
        });
    });
});


$(document).ready(function() {
    $("#btn2").click(function() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/board/uphate?board_num=${b.board_num}&type=1",
            data: { },
            success: function(response) {
                
                location.reload(); 
            }
        });
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

<div>
	���ƿ� : ${b.board_like} <input type="button" id="btn1" class="btn" value="���ƿ�">
</div>

<div>
	�Ⱦ�� : ${b.board_hate} <input type="button" id="btn2" class="btn" value="�Ⱦ��">
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
	
	
	<div class="" style="margin-left: 400px;">
	<h3>���</h3>
	
		<div class="">
		<form action="" method="post">
		<input type="text" id="content${b.board_num }">
		
		<input type="hidden" id="re_num${b.board_num }" value="${b.board_num }">
		<input type="hidden" id="writer_id${b.board_num }" value="${sessionScope.user_id }">
		
		<input type="button" class="btn" value="�ۼ�" 
					onclick="writeComment(${b.board_num})">
		</form>
		</div>
	
			<div id="div_${b.board_num }" class="">
			<c:forEach var="r" items="${i.reps }">
			${r.content }(�ۼ���:${r.writer_id })<br>
			</c:forEach>
			</div>
	</div>
	
<script>
$(document).ready(function() {
    // ������ �ε� �� ��� ����Ʈ ��������
    loadComments(${b.board_num});
    
    $(".btn").click(function() {
        writeComment(${b.board_num});
    });
});

var num = 0;

function writeComment(boardNum) {
    // ����ڰ� �Է��� ������ ��������
    var reNum = $("#re_num" + boardNum).val();
    var writerId = $("#writer_id" + boardNum).val();
    var content = $("#content" + boardNum).val();

    $.post("/rep/write", {
        re_num: reNum,
        writer_id: writerId,
        content: content
    }).done(function (data) {
        var items = eval("(" + data + ")"); // JSON ������ ��ü�� ��ȯ 
        var str = "";
        for (var i = 0; i < items.length; i++) {
            str += items[i].content + "(�ۼ���:" + items[i].writer_id + ")<br>";
        }

        $("#div_" + items[0].re_num).html(str);
    });
}
</script>

</body>
</html>