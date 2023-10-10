<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
	<table border="1" cellspacing="0">
		<tr>
			<th>제품이름</th>
			<td><input type="text" value="${p.name }" readonly></td>
		</tr>
		<tr>
			<th>제품이미지</th>
			<td><c:if test="${empty file0 }">
					등록된 이미지가 없습니다.
					</c:if> 
					<c:if test="${not empty file0 }">
					<table>
						<tr>
							<td colspan="3">
							<img id="bigImg" src="${pageContext.request.contextPath }/img?fname=${file0 }&num=${p.num }" 
							style="width:150px;height:150px"></td>
						</tr>
						<tr>
							<td><img src="${pageContext.request.contextPath }/img?fname=${file0 }&num=${p.num }" class="img" width="50" height="50"></td>
							<td><img src="${pageContext.request.contextPath }/img?fname=${file1 }&num=${p.num }" class="img" width="50" height="50"></td>
							<td><img src="${pageContext.request.contextPath }/img?fname=${file2 }&num=${p.num }" class="img" width="50" height="50"></td>
					</table>
				</c:if></td>
		</tr>
		<tr>
			<th>제품내용</th>
			<td><input type="text"  value="${p.info }" readonly></td>
		</tr>
		<tr>
			<th>제품가격</th>
			<td><input type="text" value="${p.price }" readonly></td>
		</tr>
		
	</table>
	</form>
	
	<form action="">
	<h3>댓글</h3>
	
	
	</form>
</body>
</html>

