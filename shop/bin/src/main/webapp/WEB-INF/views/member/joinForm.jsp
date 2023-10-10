<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {
		$("#idCheck").click(function() {
			$.post( "/member/idCheck", { user_id: $("#user_id").val()} )
		    .done(function( data ) {
		    	$("#idResult").text(data);
		  });
		});
		$("#join").click(function() {		
			if($("#idResult").text().trim()=="사용가능"){
				$("form").submit();
			}else{
				alert("id 중복체크 먼저");
			}
		});
	});
</script>
</head>
<body>
	<h3>회원가입</h3>
	<form action="${pageContext.request.contextPath }/member/join" method="post">
		id: <input type="text" name="user_id" id="user_id"> 
			<input type="button" id="idCheck" value="id 중복체크"> 
			<span id="idResult"></span> <br>
		pwd:<input type="password" name="user_pwd"><br /> 
		name:<input	type="text" name="user_name"><br />
		nickname : <input type="text" name="user_nickname"><br> 
		email : <input type="text" name="user_email"><br> 
		tel:<input type="text"name="user_tel"><br /> 
		address:<input type="text"name="user_addr"><br /> 
		birth : <input type="text" name="user_birth"><br>
		type:<input type="radio" name="user_type" value="1">일반회원
				<input type="radio" name="user_type" value="2">관리자<br/> 
		<input type="button" value="가입" id="join"> <br />
	</form>
</body>
</html>



