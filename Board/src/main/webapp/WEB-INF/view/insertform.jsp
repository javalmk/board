<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js -->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
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

		<form method="post" class="form-group" action="insert.do">
			<table align="center">
				<thead>
					<tr>
						<th><h1>게시판 글쓰기</h1><hr /></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>
						<label for="title">제목</label>
						<input class="form-control" name="title" type="text" placeholder="제목을 입력하세요" />
						</th>
					</tr>
					<tr>
						<th>
							<label for="writer">작성자</label>
							<input class="form-control" name="writer" type="text" placeholder="작성자를 입력하세요" />
						</th>
					</tr>
					<tr>
						<td>
						<label for="content">내용</label>
						<textarea id="summernote" name="content"></textarea>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td>
							<a type="button" class="btn btn-warning" href="${pageContext.request.contextPath }/">목록</a>
							<div class="pull-right">
								<button type="submit" class="btn btn-success">저장</button>
								<button type="reset" id="resetBtn" class="btn btn-danger">취소</button>
								

							</div>
						</td>
					</tr>
				</tfoot>
			</table>



		</form>
	</div>
	<script>
		$('#summernote').summernote({
			placeholder: "내용을 입력하세요",
			tabsize : 2,
			height : 500
		});

	</script>
</body>
</html>