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

<c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>
	<br><br><br>
</head>
<body>


<h3>CAMPBOSS - 게시글리스트</h3>


<!-- 카테고리 검색 -->

<form action="${pageContext.request.contextPath }/board/cateList"
		method="post">
	
		<select id="s1" name="c1" class="box">
			<option disabled selected>대분류</option>
		</select>
	
		<select id="s2" name="c2" class="box">
			<option disabled selected>중분류</option>
		</select>
		
		<select id="s3" name="c3"class="box">
			<option disabled selected>소분류</option>
		</select> 
	
	<input type="submit" value="검색"  class="boxbtn">	
</form>


<!-- 게시글 제목 검색 -->

<form action="${pageContext.request.contextPath }/board/board_nameList"
		method="post">

		<div>
			<input type="text" name="board_name" placeholder = "게시글 제목 검색" class="name-search">
			<input type="submit" value="검색" class="name-searchbtn">
		</div>

	</form>


<!-- 작성자 검색 -->
	<form action="${pageContext.request.contextPath }/board/board_idList"
		method="post">
	<div>
		<input type="text" name="board_id"  placeholder = "작성자 검색" class="seller-search">
		<input type="submit" value="검색" class="seller-searchbtn">
	</div>
	</form>



<div class="over" ></div>

<!-- 검색된 게시글 리스트 출력 -->

<c:if test="${empty list }">
	<table border="1" class="table">
	<tr>
	<td>검색된 상품이 없습니다.</td>
	</tr>
	</table>
	 </c:if>
	 
	<c:if test="${not empty list }">
	<table border="1" cellspacing="0" class="table">
	 <thead class="thead">
	<tr><th>제목</th><th>내용</th><th>작성자</th></tr>
	 </thead>
	 
	 
	<c:forEach var="b" items="${list }">
	 <tbody class="tbody">
	<tr>
	<td><a href="${pageContext.request.contextPath }
	/board/boardView?board_num=${b.board_num }&type=1">${b.board_name }</a></td>
	<td>${b.board_info }</td><td>${b.board_id }</td>
	</tr>
	 </tbody>
	</c:forEach>

	</table>
	</c:if>



</body>
</html>