<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CampBoss - �� �ۼ��� ����Ʈ</title>

<link href="${path}/resources/css/prolist.css" rel="stylesheet">

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

</head>
<body>
<div class="over" ></div>
<h2>�� �ۼ��� ����Ʈ</h2>

<form action="${pageContext.request.contextPath }/board/boardList">
<table class="table">
	<c:choose>
	<c:when test="${empty list }">
	<thead class="thead">
		<tr>
			<th>�۹�ȣ</th>
			<th>����</th>
			<th>����</th>
		</tr>
	</thead>
	
<tbody class="tbody">
	<tr >
		<td colspan="4">��ǰ�� �����ϴ�.</td>
	</tr>
</tbody>	
	</c:when>




<c:when test="${not empty list }">
	
<thead class="thead">
	<tr>
		<th scope="col">�۹�ȣ</th>
		<th scope="col">����</th>
		<th scope="col">����</th>
	</tr>
</thead>		


<c:forEach var="b" items="${list }">

<tbody class="tbody">
	<tr>
		<td >${b.board_num }</td>
		<td><a href="${pageContext.request.contextPath }/board/boardEdit?board_num=${b.board_num}">${b.board_name }</a></td>
		<td>${b.board_info }</td>

	</tr>
</tbody>
	</c:forEach>
	</c:when>
	</c:choose>
	
	</table>
	</form>
</body>
</html>