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
<link href="${path}/resources/css/productEdit.css" rel="stylesheet">
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
	<br><br><br>

</head>
<body>
<h3>게시글 상세정보</h3>
	<form id="f1" action="${pageContext.request.contextPath }/product/view" 
	method="post" class="row g-3">
	<input type="hidden" name="board_num" value="${b.board_num }">

		<div >
			<p class="name-title">제목</p> 
			<input type="text" value="${b.board_name }" class="name"  readonly >
		</div>
		
		<div >
			<p class="seller-title">작성자</p> 
			<input type="text" value="${b.board_id }" class="seller"  readonly >
		</div>
		
		
		<c:if test="${empty file0 }">
			<div>
				<p class="not-img">등록된 이미지가 없습니다.</p>
			</div>
     	 </c:if> 
   		
      	<c:if test="${not empty file0 }">
      
      	<div>
      		<img id="bigImg" src="${pageContext.request.contextPath }/boardimg?fname=${file0 }&board_num=${b.board_num }" 
     		 class="img-head"> 
     		  </div>
      
      	<div>   
      		<img src="${pageContext.request.contextPath }/boardimg?fname=${file0 }&board_num=${b.board_num }"class="img img-body1" >
      		<img src="${pageContext.request.contextPath }/boardimg?fname=${file1 }&board_num=${b.board_num }" class="img img-body2" >
      		<img src="${pageContext.request.contextPath }/boardimg?fname=${file2 }&board_num=${b.board_num }" class="img img-body3" >
        </div>
            </c:if>
		
		
		<div>
			<p class="info-title">내용</p>
		</div>
			<textarea name="info" class="info" readonly>${b.board_info }</textarea>
		<div></div>
		
			
  
      	

			
	</form>
</body>
</html>