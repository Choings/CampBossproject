<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CampBoss - �Խñ۸���Ʈ����</title>

    <link href="${path}/resources/css/adminList.css" rel="stylesheet">
    
    <c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>
    
</head>
<body>

	</br></br></br></br></br>
	<h2>�Խñ۸���Ʈ</h2>
	</br></br>

   <form action="${pageContext.request.contextPath}/admin/boardList" method="post">
        <table>
            <c:choose>
                <c:when test="${empty list}">
                    <tr>
                        <td colspan="4" align="center">�����Ͱ� �����ϴ�.</td>
                    </tr>
                </c:when>
                <c:when test="${not empty list}">
                    <thead>
                        <tr>
                            <th>��ȣ</th>
                            <th>����</th>
                            <th>�Ǹ���</th>
                            <th></th>
                        </tr>
                    </thead>
                    <c:forEach var="p" items="${list}">
                        <tbody>
                            <tr>
                                <td>${p.board_num}</td>
                                <td><a href="${pageContext.request.contextPath }
									/board/boardView?board_num=${p.board_num }&type=1">${p.board_name}</a></td>
                                <td>${p.board_id}</td>
                                <td><a href="${pageContext.request.contextPath}/board/bodel?num=${p.board_num}">����</a></td>
                            </tr>
                        </tbody>
                    </c:forEach>
                </c:when>
            </c:choose>
        </table>
    </form>


</body>
</html>