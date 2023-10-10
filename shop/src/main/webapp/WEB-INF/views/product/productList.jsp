<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CampBoss - 판매리스트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
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

<h3>CampBoss - 판매리스트</h3>

<form action="${pageContext.request.contextPath }/product/productList">
<table class = "table">
	<c:choose>
	<c:when test="${empty list }">
	<thead>
		<tr>
			<th>#</th>
			<th>제품이름</th>
			<th>제품내용</th>
			<th>제품 가격</th>
		</tr>
	</thead>
	
<tbody class="table-group-divider">
	<tr >
		<td colspan="4">상품이 없습니다.</td>
	</tr>
</tbody>	
	</c:when>




	<c:when test="${not empty list }">
	
<thead>
	<tr>
		<th scope="col">#</th>
		<th scope="col">제품이름</th>
		<th scope="col">제품내용</th>
		<th scope="col">가격</th>
	</tr>
</thead>		


<c:forEach var="p" items="${list }">

<tbody class="table-group-divider">
	<tr>
		<td >${p.num }</td>
		<td><a href="${pageContext.request.contextPath }/product/productEdit?num=${p.num}">${p.name }</a></td>
		<td>${p.info }</td>
		<td>${p.price }</td>
	</tr>
</tbody>
	</c:forEach>
	</c:when>
	</c:choose>
	
	</table>
	</form>
</body>
</html>