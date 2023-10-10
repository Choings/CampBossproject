<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

	<!-- 상단 메뉴바 불러오기  -->
	<c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>
	<br><br><br>
</head>
<body>




<c:if test="${sessionScope.user_type==1 }">
	${sessionScope.user_id } 님 로그인 상태 <br>
	<c:import url="/WEB-INF/views/cbproduct/cbPage.jsp"></c:import>
	
</c:if>

<c:if test="${sessionScope.user_type==2 }">
	${sessionScope.user_id } 님 로그인 상태 <br>
	<c:import url="/WEB-INF/views/admin/adminPage.jsp"></c:import>
</c:if>



</body>
</html>



