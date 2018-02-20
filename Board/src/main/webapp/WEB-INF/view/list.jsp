<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<meta charset="utf-8">
		<title>Welcome</title>
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
		게시판
		<a href="insertform.do">글쓰기</a>
		<table class="table table-hober">
		<thead>
		<tr>
		<th>번호</th><th>제목</th><th>작성자</th><th>조회수</th><th>작성날짜</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${list }">
		<tr><td>${tmp.num }</td><td>${tmp.title }</td><td>${tmp.writer}</td><td>${tmp.viewcount}</td><td>${tmp.regdate}</td></tr>
		</c:forEach>
		</tbody>
		</table>
	</body>
</html>