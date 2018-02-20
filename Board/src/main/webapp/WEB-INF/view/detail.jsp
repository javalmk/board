<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<!-- include libraries(jQuery, bootstrap) -->
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
		<script	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
		<script	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

</head>
<body>
	<nav class="navbar navbar-default navbar-static-top">
	<div class="container-fluid">
    	<!-- Brand and toggle get grouped for better mobile display -->
   		 <div class="navbar-header">
     	 <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
       		<span class="icon-bar"></span>
       	 	<span class="icon-bar"></span>
      	 	<span class="icon-bar"></span>
      	</button>
      	<a class="navbar-brand" href="${pageContext.request.contextPath }/">Board</a>
    	</div>
    </div>
	</nav>
	<div class="container">
	<table class="table">
	<colgroup>
		<col width="20%"/>
		<col width="80%"/>
	</colgroup>
	<tbody>
	<tr><th>글번호</th><td>${dto.num }</td></tr>
	<tr><th>작성자</th><td>${dto.writer }</td></tr>
	<tr><th>작성날짜</th><td>${dto.regdate }</td></tr>
	<tr><th>조회수</th><td>${dto.viewCount }</td></tr>
	<tr><th>제목</th><td>${dto.title }</td></tr>
	<tr height="300px"><th>내용</th><td>${dto.content }</td></tr>
	</tbody>
	</table>

	<a href="javascript:delConfirm(${dto.num })" class="btn btn-default">글 삭제</a>
	<a href="updateform.do?num=${dto.num }" class="btn btn-default">글 수정</a>
	</div>
	
	<script>
	function delConfirm(num){
		var isOk=confirm("게시물을 삭제하시겠습니까?");
		if(isOk){
			location.href="delete.do?num="+num;
		}
	}
	</script>
</body>
</html>