<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
[
<c:forEach var="r" items="${list }" varStatus="status">
<c:if test="${not status.first }">,</c:if>
{num:${r.num }, re_num:${r.re_num }, content:'${r.content }', writer_id:'${r.writer_id }'}
</c:forEach>
]
