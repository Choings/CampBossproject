<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CampBoss - ȸ������ ����</title>
<!-- ��� �޴��� �ҷ�����  -->
	<c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>
	<br><br><br>
</head>
<body>
<h3>CampBoss - ȸ������ ����</h3>
<form action="${pageContext.request.contextPath }/member/edit"
method="post">
<table border="1">
<tr>
	<th>���̵�</th>
	<td><input type="text" name="user_id" id="user_id" value="${m.user_id }" readonly> </td>
	</tr>
	
	<tr>
	<th>��й�ȣ</th>
	<td><input type="password" name="user_pwd" value="${m.user_pwd }"></td>
	</tr>
	
	<tr>
	<th>�̸�</th>
	<td> <input	type="text" name="user_name" value="${m.user_name }"></td>
	</tr>
	
	<tr>
	<th>�г���</th>
	<td><input type="text" name="user_nickname"  value="${m.user_nickname }"></td>
	</tr>
	
	<tr>
	<th>�̸���</th>
	<td><input type="text" name="user_email"  value="${m.user_email }"></td>
	</tr>
	
	<tr>
	<th>��ȭ��ȣ</th>
	<td> <input type="text"name="user_tel" value="${m.user_tel }" ></td>
	</tr>
	
	<tr>
	<th>�ּ�</th>
	<td><input type="text"name="user_addr"  value="${m.user_addr }"></td>
	</tr>
	
	<tr>
	<th>�������</th>
	<td><input type="text" name="user_birth"  value="${m.user_birth }"></td>
	</tr>
	
	<tr>
	<th>type</th>
	<td>
	<c:choose>
	<c:when test="${m.user_type==1 }">�Ϲ�ȸ��</c:when>
	<c:when test="${m.user_type==2 }">������</c:when>
	<c:otherwise>�߸��� type</c:otherwise>
	</c:choose>
	</td>
	</tr>
	</table>

	<input type="submit" value="����"/>
	<input type="reset" value="���"/>
</form>
</body>
</html>