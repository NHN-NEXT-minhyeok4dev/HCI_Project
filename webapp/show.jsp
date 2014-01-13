<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${board.title}</h1>
	<div>${board.contents}<br> <img
			src="/images/${board.fileName}">
	</div>
	<br>
	<div>
		<form action="/board/${board.id}/comment/upload" method="post">
			<input type="text" name="name" size=20 value="user">
			<input type="text" name="contents" size=40>
			<input type="submit" value="comment">
		</form>
	</div>

	<c:if test="${not empty comments}">
		<c:forEach items="${comments}" var="comment">

			<c:if test="${board.id == comment.board.id}">
		
				 ${comment.name}  ${comment.contents }<br />
				<hr />
			</c:if>
			
		</c:forEach>
	</c:if>
	<a href="/board/list"><button>show list</button></a>
</body>
</html>