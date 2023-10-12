<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CAMPBOSS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link href="${path}/resources/css/membermainPage.css" rel="stylesheet">
</head>
<body>
<div class="main1">
<div>
	<div class="first" onclick="location.href = '/product/productPage';">
	</div>
	<div class="second" onclick="location.href = '/board/boardPage';"></div>
</div>

<div>
	<div class="a1">
		<p>상품거래</p>
	</div>
	<div class="a2">
		<p>정보게시판</p>
	</div>
</div>
</div>
</body>
</html>