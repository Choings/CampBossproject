<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>내 정보 수정</h3>
<form action="${pageContext.request.contextPath }/member/edit"
method="post">
id:<input type="text" name="user_id" value="${m.user_id }" readonly><br/>
pwd:<input type="text" name="user_pwd" value="${m.user_pwd }" ><br/>
name:<input type="text" name="user_name" value="${m.user_name }" ><br/>
email : <input type="text" name="user_email" value="${m.user_email }"><br>
tel:<input type="text" name="user_tel" value="${m.user_tel }" ><br/>
address:<input type="text" name="user_addr" value="${m.user_addr }" ><br/>
birth : <input type="text" name="user_birth" value="${m.user_birth }"><br>
type:
<c:choose>
	<c:when test="${m.user_type==1 }">일반회원</c:when>
	<c:when test="${m.user_type==2 }">관리자</c:when>
	<c:otherwise>잘못된 type</c:otherwise>
</c:choose>
<br>
<input type="reset" value="취소"/>
<input type="submit" value="수정"/>
</form>
</body>
</html>