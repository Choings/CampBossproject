<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Member All List</title>

	<c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>
	<br><br><br>
	
</head>
<body>
<form action = "${pageContext.request.contextPath}/admin/memberList" method = "post">
<table border="1">
<c:choose>
	<c:when test="${empty list }">
		<tr>
			<td colspan="9" align="center" > 데이터가 없습니다. </td>  
		</tr>
	</c:when>
	
	<c:when test="${not empty list }">
		<tr align="center" >
				<td>ID   </td>
				<td>PWD   </td>
				<td>NAME   </td>
				<td>NICKNAME</td>
				<td>EMAIL  </td>
				<td>TEL   </td>
				<td>ADDR  </td>
				<td>BIRTH </td>
				<td>OPTION </td>
		</tr>
		<c:forEach var="m" items="${list }" >
			
			<tr align="center" >
				<td>${m.user_id } </td>
				<td>${m.user_pwd } </td>
				<td>${m.user_name } </td>
				<td>${m.user_nickname } </td>
				<td>${m.user_email } </td>
				<td>${m.user_tel } </td>
				<td>${m.user_addr } </td>
				<td>${m.user_birth } </td>
				<td> <a  href="${pageContext.request.contextPath}/member/del?user_id=${m.user_id}"  >탈퇴</a> </td>
			</tr>
		</c:forEach>
	</c:when>
</c:choose>
</table>
</form>

</body>
</html>