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
	<a>������</a>
	<a href="${pageContext.request.contextPath }/member/editForm">����������</a>
	<a href="${pageContext.request.contextPath }/member/logout">�α׾ƿ�</a>
	<a href="${pageContext.request.contextPath }/member/out">Ż���ϱ�</a>
	
	<br>	
	
	<a>�ǸŸ���Ʈ</a>
	<a>���Ÿ���Ʈ</a>


</c:if>



<c:if test="${sessionScope.user_type==2 }"> 
	<a>����</a>
	<a href="${pageContext.request.contextPath }/admin/memberList">ȸ������</a>
	<a href="${pageContext.request.contextPath }/member/main">ī�װ�����</a>
	
	<br>
	<a>������</a>
	<a href="${pageContext.request.contextPath }/member/editForm">����������</a>
    <a href="${pageContext.request.contextPath }/member/logout">�α׾ƿ�</a>
    <a href="${pageContext.request.contextPath }/member/out">Ż���ϱ�</a>
	
</c:if>


</body>
</html>