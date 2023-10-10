<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function() {
	$.post("/admin/getsub", {
		type : 1,
		p_id : 0
	}).done(function(data) {
		var c = eval("(" + data + ")");
		for (i = 0; i < c.length; i++) {
			$("#s1").append(	"<option value='"+c[i].id+"'>"
										+ c[i].name + "</option>");
		}
	});

	$("#s1").click(function() {
		var x = 0;
		x = this.options[this.options.selectedIndex].value
		$.post("/admin/getsub", {
				type : 2,
				p_id : x
		}).done(function(data) {
			var c = eval("(" + data + ")");
			$("#s2").empty();
			$("#s3").empty();
			for (i = 0; i < c.length; i++) {
				$("#s2").append(	"<option value='"+c[i].id+"'>"
													+ c[i].name + "</option>");
			}
		});
	});

	$("#s2").click(function() {
		var x = 0;
		x = this.options[this.options.selectedIndex].value
		$.post("/admin/getsub", {
			type : 3,
			p_id : x
		}).done(function(data) {
		var c = eval("(" + data + ")");
		$("#s3").empty();
		for (i = 0; i < c.length; i++) {
			$("#s3").append(	"<option value='"+c[i].id+"'>"
													+ c[i].name + "</option>");
		}
	});
});
});
</script>
</head>
<body>
<h3>Camp Boss - 상품리스트</h3>

<a href="${pageContext.request.contextPath }">상품등록</a>
<h3>상품 목록</h3>
	<form action="${pageContext.request.contextPath }/seller/cateList"
		method="post">
		카테고리 검색: 
		대분류<select id="s1" name="c1"></select> 
		중분류<select id="s2" name="c2"></select>
		소분류<select id="s3" name="c3"></select> 
		<input type="submit" value="검색">
	</form>
	<form action="${pageContext.request.contextPath }/seller/nameList"
		method="post">
	제품명으로 검색:	<input type="text" name="name">
	<input type="submit" value="검색">
	</form>
	<form action="${pageContext.request.contextPath }/seller/sellerList"
		method="post">
	판매자로 검색:	<input type="text" name="seller_id">
	<input type="submit" value="검색">
	</form>
	
	<c:if test="${empty list }">검색된 상품이 없다. </c:if>
	<c:if test="${not empty list }">
	<table border="1" cellspacing="0">
	<tr><th>제품명</th><th>설명</th><th>가격</th><th>수량</th></tr>
	<c:forEach var="p" items="${list }">
	<tr>
	<td><a href="${pageContext.request.contextPath }
/seller/itemView?num=${p.num }&type=2">${p.name }</a></td>
	<td>${p.info }</td><td>${p.price }</td>
	<td>${p.quantity }</td>
	</tr>
	</c:forEach>

	</table>
	</c:if>


</body>
</html>