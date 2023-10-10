<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CampBoss - 회원정보 수정</title>
<!-- 상단 메뉴바 불러오기  -->
	<c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>
	<br><br><br>
</head>
<body>
<h3>CampBoss - 회원정보 수정</h3>
<form action="${pageContext.request.contextPath }/member/edit"
method="post">
<table border="1">
<tr>
	<th>아이디</th>
	<td><input type="text" name="user_id" id="user_id" value="${m.user_id }" readonly> </td>
	</tr>
	
	<tr>
	<th>비밀번호</th>
	<td><input type="password" name="user_pwd" value="${m.user_pwd }"></td>
	</tr>
	
	<tr>
	<th>이름</th>
	<td> <input	type="text" name="user_name" value="${m.user_name }"></td>
	</tr>
	
	<tr>
	<th>닉네임</th>
	<td><input type="text" name="user_nickname"  value="${m.user_nickname }"></td>
	</tr>
	
	<tr>
	<th>이메일</th>
	<td><input type="text" name="user_email"  value="${m.user_email }"></td>
	</tr>
	
	<tr>
	<th>전화번호</th>
	<td> <input type="text"name="user_tel" value="${m.user_tel }" ></td>
	</tr>
	
	<tr>
	<th>주소</th>
	<td><input type="text"name="user_addr"  value="${m.user_addr }"></td>
	</tr>
	
	<tr>
	<th>생년월일</th>
	<td><input type="text" name="user_birth"  value="${m.user_birth }"></td>
	</tr>
	
	<tr>
	<th>type</th>
	<td>
	<c:choose>
	<c:when test="${m.user_type==1 }">일반회원</c:when>
	<c:when test="${m.user_type==2 }">관리자</c:when>
	<c:otherwise>잘못된 type</c:otherwise>
	</c:choose>
	</td>
	</tr>
	</table>

	<input type="submit" value="수정"/>
	<input type="reset" value="취소"/>
</form>
</body>
</html>