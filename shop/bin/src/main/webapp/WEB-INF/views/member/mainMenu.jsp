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

<h1><a href="${pageContext.request.contextPath }/member/main" > CAMPBOSS </a></h1>

<c:if test="${sessionScope.user_type==1 }"> 
	<a>내정보</a>
	<a href="${pageContext.request.contextPath }/member/editForm">내정보수정</a>
	<a href="${pageContext.request.contextPath }/member/logout">로그아웃</a>
	<a href="${pageContext.request.contextPath }/member/out">탈퇴하기</a>
	
	<br>	
	
	<a>판매리스트</a>
	<a>구매리스트</a>


</c:if>



<c:if test="${sessionScope.user_type==2 }"> 
	<a>관리</a>
	<a href="${pageContext.request.contextPath }/admin/memberList">회원관리</a>
	<a href="${pageContext.request.contextPath }/member/main">카테고리관리</a>
	
	<br>
	<a>내정보</a>
	<a href="${pageContext.request.contextPath }/member/editForm">내정보수정</a>
    <a href="${pageContext.request.contextPath }/member/logout">로그아웃</a>
    <a href="${pageContext.request.contextPath }/member/out">탈퇴하기</a>
	
</c:if>


</body>
</html>