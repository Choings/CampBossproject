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


</script>
</head>
<body>
<h3>CampBoss - 로그인</h3>
<form action="${pageContext.request.contextPath }/member/login"
method="post">
ID : <input type="text" name="user_id"><br/>
PWD : <input type="password" name="user_pwd"><br/>

<input type="submit" value="로그인">
<a href="${pageContext.request.contextPath }/member/joinForm">회원가입</a>
<br/>
</form>
</body>
</html>