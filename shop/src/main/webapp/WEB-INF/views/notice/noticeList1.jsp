<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CampBoss - 공지사항</title>

<link href="${path}/resources/css/prolist.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
   $(document).ready(function() {
      $(".img").mouseover(function() {
         $("#bigImg").attr('src', this.src);
      });
      $("#del").click(function() {
         $("#f1").attr('action', '/seller/del');
         $("#f1").submit();
      });
   });
</script>


<c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>

</head>
<body>
<div class="over" ></div>
<h2>공지사항</h2>

<form action="${pageContext.request.contextPath }/notice/noticeList1">
<table class="table">
   <c:choose>
   <c:when test="${empty list }">
   <thead class="thead">
      <tr>
         <th>글번호</th>
         <th>제목</th>
         <th>내용</th>
      </tr>
   </thead>
   
<tbody class="tbody">
   <tr >
      <td colspan="4">공지사항이 없습니다.</td>
   </tr>
</tbody>   
   </c:when>




<c:when test="${not empty list }">
   
<thead class="thead">
   <tr>
      <th scope="col">글번호</th>
      <th scope="col">제목</th>
      <th scope="col">내용</th>
   </tr>
</thead>      


<c:forEach var="n" items="${list }">

<tbody class="tbody">
   <tr>
      <td >${n.notice_num }</td>
      <td>
         <a href="${pageContext.request.contextPath}/notice/noticeView?notice_num=${n.notice_num}">
         ${n.notice_name } </a></td>
      <td>${n.notice_info }</td>

   </tr>
</tbody>
   </c:forEach>
   </c:when>
   </c:choose>
   
   </table>
   </form>
</body>
</html>