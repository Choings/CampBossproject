<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <title>CampBoss - 판매리스트</title>
  <link href="${path}/resources/css/editpro.css" rel="stylesheet">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <c:import url="/WEB-INF/views/member/mainMenu.jsp"></c:import>
</head>
<body>

<h3>상품 수정</h3>

<form action="${pageContext.request.contextPath}/product/edit" method="post" id="f1">
  <input type="hidden" name="num" class="form-control" value="${p.num }">

  <div class="in">
    <label for="name">제품이름</label><br><br>
    <input type="text" name="name" class="form-control" id="exampleFormControlInput1" placeholder="제품이름" value="${p.name }"><br><br>
  </div></br></br>

  <div class="in">
    <label for="img">제품이미지</label><br><br>

    <c:if test="${empty file0 }">
      <div class="txt">
        등록된 이미지가 없습니다.
      </div></br></br>
    </c:if> 

    <c:if test="${not empty file0 }">
      <div class="img1">
        <img id="bigImg" src="${pageContext.request.contextPath }/img?fname=${file0 }&num=${p.num }" style="width:300px;height:300px"><br><br>
      </div>

      <div class="img2">  
        <img src="${pageContext.request.contextPath }/img?fname=${file0 }&num=${p.num }" class="img" width="80" height="80">
        <img src="${pageContext.request.contextPath }/img?fname=${file1 }&num=${p.num }" class="img" width="80" height="80">
        <img src="${pageContext.request.contextPath }/img?fname=${file2 }&num=${p.num }" class="img" width="80" height="80">
      </div>
    </c:if>
  </div></br></br>

  <div class="in">
    <label for="content">내용</label><br><br>
    <textarea name="info" class="form-control" id="myTextarea">${p.info }</textarea>
  </div></br></br>

  <div class="in">
    <label for="price">제품가격</label><br><br>
    <input type="text" name="price" class="form-control" id="exampleFormControlInput1" placeholder="제품가격" value="${p.price }">
  </div></br></br>

  <div class="in">
    <label for="seller_id">판매자</label><br><br>
    <input type="text" name="seller_id" class="form-control" class="form-control" id="exampleFormControlInput1" value="${p.seller_id }" readonly>
  </div></br></br>

  <div class="in">
    <input type="submit" value="수정" class="form-control2">
    <input type="reset" value="삭제" id="del" class="form-control3">
  </div></br></br>
  
</form>
</body>
</html>
