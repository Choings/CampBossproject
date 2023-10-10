<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link href="${path}/resources/css/productView.css" rel="stylesheet">
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
	<h3>제품 상세정보</h3>
	<form id="f1" action="${pageContext.request.contextPath }/product/view" 
	method="post">
	<input type="hidden" name="pro_num" value="${p.num }">
	
		<div class="div1">
			제품명 : 
			<input type="text" value="${p.name }" class="form-controe"  id="exampleFormControlInput1" readonly >
		</div>
			
		<div>
			제품이미지 : 
			
			<c:if test="${empty file0 }">
					등록된 이미지가 없습니다.
					</c:if> 
					<c:if test="${not empty file0 }">
			
						
						
							<img  class="card-img-top" id="bigImg" src="${pageContext.request.contextPath }/img?fname=${file0 }&num=${p.num }" 
							style="width:150px;height:150px">
						
							<img  class="card-img-top" src="${pageContext.request.contextPath }/img?fname=${file0 }&num=${p.num }" class="img" width="50" height="50">
							<img   class="card-img-top" src="${pageContext.request.contextPath }/img?fname=${file1 }&num=${p.num }" class="img" width="50" height="50">
							<img   class="card-img-top" src="${pageContext.request.contextPath }/img?fname=${file2 }&num=${p.num }" class="img" width="50" height="50">
					
				</c:if>
		</div>
		
			<div>
			제품내용 : 
			<input type="text"  value="${p.info }" class="form-controe" readonly>
			</div>
		
			<div>
			제품가격 : 
			<input type="text" value="${p.price }" class="form-controe"  readonly>
			</div>
		
		
			
	</form>
	
	<form action="">
	<h3>댓글</h3>
	
	
	</form>
</body>
</html>

