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
	<div class="container">
	
		게시판
		<a href="insertform.do">글쓰기</a>
		
		<table class="table table-hover">
	        <colgroup>
				<col width="10%"/>
				<col width="50%"/>
				<col width="20%"/>
				<col width="10%"/>
				<col width="10%"/>
			</colgroup>
			<thead>
			<tr>
				<th>번호</th><th>제목</th><th>작성자</th><th>조회수</th><th>작성날짜</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="tmp" items="${list }">
				<tr><td>${tmp.num }</td><td><a href="detail.do?num=${tmp.num }">${tmp.title }</a></td><td>${tmp.writer}</td><td>${tmp.viewCount}</td><td>${tmp.regdate}</td></tr>
			</c:forEach>
			</tbody>
		</table>
		
			<ul class="pagination">
		<c:choose>
			<c:when test="${startPageNum ne 1 }">
				<li>
					<a href="list.do?pageNum=${startPageNum-1 }&condition=${condition}&keyword=${keyword}">&laquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a href="javascript:">&laquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${startPageNum }" 
				end="${endPageNum }">	
			<c:choose>
				<c:when test="${i eq pageNum }">
					<li class="active"><a href="list.do?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="list.do?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${endPageNum lt totalPageCount }">
				<li>
					<a href="list.do?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${keyword}">&raquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a href="javascript:">&raquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
	<div class="row">
		<div class="col-xs-6">
			<!-- 검색어 관련 form -->
			<form action="list.do" method="post">
				<input type="hidden" id="condition" value="${condition }" name="condition" />
		        <div class="input-group">
		          <div class="input-group-btn">
		            <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
		              <span id="conditionBtn">제목+파일명</span>
		              <span class="caret"></span>
		            </button>
		            <ul class="dropdown-menu">
		              <li><a href="javascript:set('titlecontent')">제목+파일명</a>
		              </li>
		              <li><a href="javascript:set('title')">제목</a>
		              </li>
		              <li><a href="javascript:set('writer')">작성자</a>
		              </li>
		            </ul>
		          </div>
		          <!-- /btn-group -->
		          <input type="text" id="keyword" name="keyword" value="${keyword }" class="form-control"/>
		          	<span class="input-group-btn">
			            <button class="btn btn-default" type="submit">
			              <span class="sr-only">검색</span>
			              <span class="glyphicon glyphicon-search"></span>
			            </button>
          			</span>
		        </div>			
			</form>
		</div>
	</div><!-- /.row -->
	</div>
	<script>
	
	set("${condition}");
	
	function set(condition){
		if(condition=="titlecontent" || condition==""){
			condition="titlecontent";
			$("#conditionBtn").text("제목+파일명");
		}else if(condition=="title"){
			$("#conditionBtn").text("제목");
		}else if(condition=="writer"){
			$("#conditionBtn").text("작성자");
		}
		$("#condition").val(condition);
	}
	
	function deleteConfirm(num){
		var result=confirm(num+" 번 파일을 삭제 하시겠습니까?");
		if(result){
			location.href="delete.do?num="+num;
		}
	}
	</script>
	</body>
</html>
