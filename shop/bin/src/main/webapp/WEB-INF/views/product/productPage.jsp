<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="${path}/resources/css/productPage.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/af585378dc.js" crossorigin="anonymous"></script>
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
<h3>Camp Boss - ��ǰ����Ʈ</h3>

<!-- ī�װ� �˻� -->
	<form action="${pageContext.request.contextPath }/seller/cateList"
		method="post">
	
		<select id="s1" name="c1" class="box" >
			<option disabled selected>��з�</option>
		</select>
	
		<select id="s2" name="c2" class="box">
			<option disabled selected>�ߺз�</option>
		</select>
		
		<select id="s3" name="c3" class="box">
			<option disabled selected>�Һз�</option>
		</select> 
	
	<input type="submit" value="�˻�" >	
	</form>
	
	
<!-- ��ǰ������ �˻� -->	
	<form action="${pageContext.request.contextPath }/seller/nameList"
		method="post">
		
		
		<input type="text" name="name" placeholder = "��ǰ������ �˻�">
		<input type="submit" value="�˻�">
		
	</form>
	
<!-- �Ǹ��ڷ� �˻� -->
	<form action="${pageContext.request.contextPath }/seller/sellerList"
		method="post">
		
		<input type="text" name="seller_id"  placeholder = "�Ǹ��� �˻�">
		<input type="submit" value="�˻�">
		
	</form>
	
	
	<!-- �˻��� ��ǰ ����Ʈ ��� -->
	
	<c:if test="${empty list }">
	<table border="1">
	<tr>
	<td>�˻��� ��ǰ�� �����ϴ�.</td>
	</tr>
	</table>
	 </c:if>
	 
	<c:if test="${not empty list }">
	<table border="1" cellspacing="0">
	<tr><th>��ǰ�̸�</th><th>��ǰ����</th><th>��ǰ����</th><th>�Ǹ���</th></tr>
	<c:forEach var="p" items="${list }">
	<tr>
	<td><a href="${pageContext.request.contextPath }
	/product/productView?num=${p.num }&type=1">${p.name }</a></td>
	<td>${p.info }</td><td>${p.price }</td>
	<td>${p.seller_id }</td>
	</tr>
	</c:forEach>

	</table>
	</c:if>


</body>
</html>